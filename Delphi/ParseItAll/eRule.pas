unit eRule;

interface

uses
  System.UITypes,
  API_ORM,
  eRuleLink,
  eRuleRecords,
  eRuleCut,
  eRegExp,
  eNodes,
  eEntities;

type
  TJobRule = class;

  TRuleRuleRel = class(TEntityAbstract)
  // overrides
  public
    class function GetEntityStruct: TEntityStruct; override;
  ////////////////////
  private
  // Getters Setters
    function GetParentRuleID: Integer;
    procedure SetParentRuleID(aValue: Integer);
    function GetChildRuleID: Integer;
    procedure SetChildRuleID(aValue: Integer);
    function GetChildRule: TJobRule;
    procedure SetChildRule(aValue: TJobRule);
  //////////////////
  public
    property ParentRuleID: Integer read GetParentRuleID write SetParentRuleID;
    property ChildRuleID: Integer read GetChildRuleID write SetChildRuleID;
    property ChildRule: TJobRule read GetChildRule write SetChildRule;
  end;

  TRuleRuleRelList = TEntityList<TRuleRuleRel>;

  TJobRule = class(TEntityAbstract)
  // overrides
  public
    class function GetEntityStruct: TEntityStruct; override;
  protected
    procedure SaveLists; override;
  ////////////////////
  private
    FNodes: TNodeList;
    FChildRules: TRuleRuleRelList;
    FRegExps: TJobRegExpList;
  // Getters Setters
    function GetLevelID: Integer;
    procedure SetLevelID(aValue: integer);
    function GetNotes: string;
    procedure SetNotes(aValue: string);
    function GetContainerOffset: integer;
    procedure SetContainerOffset(aValue: integer);
    function GetCriticalType: integer;
    procedure SetCriticalType(aValue: integer);
    function GetVisualColor: TColor;
    procedure SetVisualColor(aValue: TColor);
    function GetOrderNum: Integer;
    procedure SetOrderNum(aValue: Integer);
    function GetNodeList: TNodeList;
    function GetLink: TJobLink;
    procedure SetLink(aValue: TJobLink);
    function GetRec: TJobRecord;
    procedure SetRec(aValue: TJobRecord);
    function GetCut: TJobCut;
    procedure SetCut(aValue: TJobCut);
    function GetChildRules: TRuleRuleRelList;
    function GetRegExps: TJobRegExpList;
  //////////////////
  public
    function GetContainerInsideNodes: TNodeList;
    function IndexOfChildRule(aJobRule: TJobRule): Integer;
    function CanAddNodes: Boolean;
    property LevelID: Integer read GetLevelID write SetLevelID;
    property Notes: string read GetNotes write SetNotes;
    property ContainerOffset: Integer read GetContainerOffset write SetContainerOffset;
    property CriticalType: Integer read GetCriticalType write SetCriticalType;
    property VisualColor: TColor read GetVisualColor write SetVisualColor;
    property OrderNum: Integer read GetOrderNum write SetOrderNum;
    property Link: TJobLink read GetLink write SetLink;
    property Rec: TJobRecord read GetRec write SetRec;
    property Cut: TJobCut read GetCut write SetCut;
    property Nodes: TNodeList read GetNodeList;
    property ChildRules: TRuleRuleRelList read GetChildRules;
    property RegExps: TJobRegExpList read GetRegExps;
  end;

  TRuleList = TEntityList<TJobRule>;

implementation

uses
  Data.DB,
  FireDAC.Comp.Client;

function TJobRule.CanAddNodes: Boolean;
var
  sql: string;
  dsQuery: TFDQuery;
begin
  sql :=
    'select ' +
    'count(rn.Id) as parent_rule_nodes_count, ' +
    'case when l2r.Id is not null then 1 else 0 end as is_parent_level ' +
    'from job_rules r ' +
    'left join job_rule2rule r2r on r2r.child_rule_id = r.Id ' +
    'left join job_nodes rn on rn.job_rule_id = r2r.parent_rule_id ' +
    'left join job_level2rule l2r on l2r.rule_id = r.id ' +
    'where r.id = :id';

  dsQuery := TFDQuery.Create(nil);
  try
    dsQuery.SQL.Text := sql;
    dsQuery.ParamByName('id').AsInteger := ID;
    FDBEngine.OpenQuery(dsQuery);

    if   (dsQuery.FieldByName('parent_rule_nodes_count').AsInteger > 0)
      or (dsQuery.FieldByName('is_parent_level').AsInteger = 1)
    then
      Result := True
    else
      Result := False;
  finally
    dsQuery.Free;
  end;
end;

function TJobRule.IndexOfChildRule(aJobRule: TJobRule): Integer;
var
  RuleRuleRel: TRuleRuleRel;
  i: Integer;
begin
  Result := -1;
  i := 0;

  for RuleRuleRel in Self.ChildRules do
    begin
      if RuleRuleRel.ChildRule = aJobRule then
        Exit(i);

      Inc(i);
    end;
end;

function TJobRule.GetRegExps: TJobRegExpList;
begin
  if not Assigned(FRegExps) then
    FRegExps := TJobRegExpList.Create(Self, 'JOB_RULE_ID', ID);

  Result := FRegExps;
end;

procedure TRuleRuleRel.SetChildRule(aValue: TJobRule);
begin
  FRelations.AddOrSetValue('JOB_RULES', aValue);
end;

function TRuleRuleRel.GetChildRule: TJobRule;
begin
  Result := FRelations.Items['JOB_RULES'] as TJobRule;
end;

function TJobRule.GetChildRules: TRuleRuleRelList;
begin
  if not Assigned(FChildRules) then
    FChildRules := TRuleRuleRelList.Create(Self, 'PARENT_RULE_ID', ID);

  Result := FChildRules;
end;

function TRuleRuleRel.GetChildRuleID: Integer;
begin
  Result := FData.Items['CHILD_RULE_ID'];
end;

procedure TRuleRuleRel.SetChildRuleID(aValue: Integer);
begin
  FData.AddOrSetValue('CHILD_RULE_ID', aValue);
end;

function TRuleRuleRel.GetParentRuleID: Integer;
begin
  Result := FData.Items['PARENT_RULE_ID'];
end;

procedure TRuleRuleRel.SetParentRuleID(aValue: Integer);
begin
  FData.AddOrSetValue('PARENT_RULE_ID', aValue);
end;

class function TRuleRuleRel.GetEntityStruct: TEntityStruct;
begin
  Result.TableName := 'JOB_RULE2RULE';

  AddField(Result.FieldList, 'PARENT_RULE_ID', ftInteger);
  AddField(Result.FieldList, 'CHILD_RULE_ID', ftInteger);

  AddRelation(Result.RelatedList, 'ID', 'CHILD_RULE_ID', TJobRule);
end;

procedure TJobRule.SetCut(aValue: TJobCut);
begin
  FRelations.AddOrSetValue('JOB_RULE_CUTS', aValue);
end;

function TJobRule.GetCut: TJobCut;
begin
  Result := FRelations.Items['JOB_RULE_CUTS'] as TJobCut;
end;

function TJobRule.GetRec: TJobRecord;
begin
  Result := FRelations.Items['JOB_RULE_RECORDS'] as TJobRecord;
end;

procedure TJobRule.SetRec(aValue: TJobRecord);
begin
  FRelations.AddOrSetValue('JOB_RULE_RECORDS', aValue);
end;

function TJobRule.GetLink: TJobLink;
begin
  Result := FRelations.Items['JOB_RULE_LINKS'] as TJobLink;
end;

procedure TJobRule.SetLink(aValue: TJobLink);
begin
  FRelations.AddOrSetValue('JOB_RULE_LINKS', aValue);
end;

function TJobRule.GetOrderNum: Integer;
begin
  Result := FData.Items['ORDER_NUM'];
end;

procedure TJobRule.SetOrderNum(aValue: Integer);
begin
  FData.AddOrSetValue('ORDER_NUM', aValue);
end;

function TJobRule.GetVisualColor: TColor;
begin
  Result := FData.Items['VISUAL_COLOR'];
end;

procedure TJobRule.SetVisualColor(aValue: TColor);
begin
  FData.AddOrSetValue('VISUAL_COLOR', aValue);
end;

function TJobRule.GetContainerInsideNodes: TNodeList;
var
  Node: TJobNode;
  i: Integer;
begin
  Result := TNodeList.Create(False);
  i := 0;
  for Node in Self.Nodes do
    begin
      Inc(i);
      if i > Nodes.Count - Self.ContainerOffset then
        Result.Add(Node);
    end;
end;

procedure TJobRule.SaveLists;
begin
  if Assigned(FNodes) then FNodes.SaveList(ID);
  if Assigned(FChildRules) then FChildRules.SaveList(ID);
  if Assigned(FRegExps) then FRegExps.SaveList(ID);
end;

function TJobRule.GetNodeList: TNodeList;
begin
  if not Assigned(FNodes) then
    FNodes := TNodeList.Create(Self, 'JOB_RULE_ID', ID);

  Result := FNodes;
end;

function TJobRule.GetContainerOffset: integer;
begin
  Result := FData.Items['CONTAINER_OFFSET'];
end;

procedure TJobRule.SetContainerOffset(aValue: integer);
begin
  FData.AddOrSetValue('CONTAINER_OFFSET', aValue);
end;

function TJobRule.GetCriticalType: integer;
begin
  Result := FData.Items['CRITICAL_TYPE'];
end;

procedure TJobRule.SetCriticalType(aValue: integer);
begin
  FData.AddOrSetValue('CRITICAL_TYPE', aValue);
end;

class function TJobRule.GetEntityStruct: TEntityStruct;
begin
  Result.TableName := 'JOB_RULES';

  AddField(Result.FieldList, 'NOTES', ftString);
  AddField(Result.FieldList, 'CONTAINER_OFFSET', ftInteger);
  AddField(Result.FieldList, 'CRITICAL_TYPE', ftInteger);
  AddField(Result.FieldList, 'VISUAL_COLOR', ftInteger);
  AddField(Result.FieldList, 'ORDER_NUM', ftInteger);

  AddRelation(Result.RelatedList, 'JOB_RULE_ID', '', TJobLink);
  AddRelation(Result.RelatedList, 'JOB_RULE_ID', '', TJobRecord);
  AddRelation(Result.RelatedList, 'JOB_RULE_ID', '', TJobCut);
end;

function TJobRule.GetLevelID: Integer;
begin
  Result := FData.Items['LEVEL_ID'];
end;

procedure TJobRule.SetLevelID(aValue: integer);
begin
  FData.AddOrSetValue('LEVEL_ID', aValue);
end;

function TJobRule.GetNotes: string;
begin
  Result := FData.Items['NOTES'];
end;

procedure TJobRule.SetNotes(aValue: string);
begin
  FData.AddOrSetValue('NOTES', aValue);
end;

end.