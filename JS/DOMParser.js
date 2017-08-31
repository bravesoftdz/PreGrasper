console.log('domparser');

var level = %s;

function getNormalizeString(str) {
    str = str.replace(/\n/g, "");
    str = str.replace(/ {1,}/g, " ");
    return str.trim(str);
}

function checkNodeMatches(matches, ruleNode, node) {

    matches.IDMatch = false;
    matches.ClassMatch = false;
    matches.NameMatch = false;

    if (node === undefined)
        return false;

    // ID match
    if (ruleNode.tagID === undefined)
        ruleNode.tagID = '';
    if (ruleNode.tagID === node.id)
        matches.IDMatch = true;

    // class match (true even one class name matched)
    if (ruleNode.className === undefined)
        ruleNode.className = '';
    var clName = ruleNode.className.toString();
    var clArr = clName.split(' ');
    clName = getNormalizeString(node.className);
    clArr.forEach(function (item) {
        if (clName.match(item) != null)
            matches.ClassMatch = true;
    });

    // name match
    if (ruleNode.name === undefined)
        ruleNode.name = null;
    if (ruleNode.name === node.getAttribute('name'))
        matches.NameMatch = true;
}

function getNodeByName(ruleNode, tagCollection, matches) {

    if (ruleNode.name !== "") {
        for (var i = 0; i < tagCollection.length; i++) {
            var node = tagCollection[i];
            if (node.getAttribute('name') === ruleNode.name)
                break;
        }
    }

    checkNodeMatches(matches, ruleNode, node);

    return node;
}

function getNodeByClass(ruleNode, tagCollection, matches) {

    if (ruleNode.className !== "") {
        for (var i = 0; i < tagCollection.length; i++) {
            var node = tagCollection[i];
            if (getNormalizeString(node.className) === ruleNode.className)
                break;
        }
    }

    checkNodeMatches(matches, ruleNode, node);

    return node;
}

function getNodeByID(ruleNode, tagCollection, matches) {

    if (ruleNode.tagID !== "") {
        for (var i = 0; i < tagCollection.length; i++) {
            var node = tagCollection[i];
            if (node.id === ruleNode.tagID)
                break;
        }
    }

    checkNodeMatches(matches, ruleNode, node);

    return node;
}

function getNodeByIndex(ruleNode, tagCollection, matches) {

    var node = tagCollection[ruleNode.index - 1];

    checkNodeMatches(matches, ruleNode, node);

    return node;
}

function getNodeByRuleNode(ruleNode, tagCollection, keepSearch) {

    var matches = {};

    // find node by index (default)
    var node = getNodeByIndex(ruleNode, tagCollection, matches);

    if (keepSearch) {
        // find node by ID
        if (node == null || !(matches.IDMatch)) {
            var matchedNode = getNodeByID(ruleNode, tagCollection, matches);
            if (matchedNode != null)
                node = matchedNode;
        }

        // find element by class
        if (node == null || (!(matches.ClassMatch) && (ruleNode.tagID === ""))) {
            matchedNode = getNodeByClass(ruleNode, tagCollection, matches);
            if (matchedNode != null)
                node = matchNode;
        }

        // find element by name
        if (node == null) {
            matchedNode = getNodeByName(ruleNode, tagCollection, matches);
            if (matchedNode != null)
                node = matchedNode;
        }
    }

    return node;
}

function getTagCollection(node, tag) {

    var collection = [];

    for (var i = 0; i < node.children.length; i++) {
        if (node.children[i].tagName === tag)
            collection.push(node.children[i]);
    }

    return collection;
}

function getInsideContainerNodes(containerNode, ruleNodes) {

    var nodes = [containerNode];

    // list each rule node inside container
    ruleNodes.forEach(function (ruleNode) {

        var matchedNodes = [];

        nodes.forEach(function (node) {

            var tagCollection = getTagCollection(node, ruleNode.tag);

            // list each child nodes - search for matching
            tagCollection.forEach(function (node, i) {
                // search element
                ruleNode.index = i + 1;
                node = getNodeByRuleNode(ruleNode, tagCollection, false);
                if (node != null)
                    matchedNodes.push(node);

            });

        });

        nodes = matchedNodes;
    });

    return nodes;
}

function processRule(rule, containerNode) {

    var containerSize = rule.nodes.length - rule.container_offset;
    for (var i = 0; i < containerSize; i++) {
        var ruleNode = rule.nodes[i];
        var tagCollection = getTagCollection(containerNode, ruleNode.tag);
        containerNode = getNodeByRuleNode(ruleNode, tagCollection, true);
    }

    //if (containerNode != null) {
    if (rule.container_offset > 0) {
    
        var insideRuleNodes = [];
        for (i = containerSize; i < rule.nodes.length; i++) {
            insideRuleNodes.push(rule.nodes[i]);
        }

        var resultNodes = getInsideContainerNodes(containerNode, insideRuleNodes);

    } else {
        resultNodes = [containerNode];
    }
    
    resultNodes.forEach(function (node) {
        // paint selected elements
        $(node).addClass('PIAColor');
        $(node).css('background-color', 'red');
        $('.PIAColor').children().css('background-color', 'inherit');    
        
        
        if (rule.rules != null) {
            rule.rules.forEach(function (rule) {
                processRule(rule, node);
            });
        }    
    });       
}

function parseDOMbyLevel(level) {

    level.rules.forEach(function (rule) {
        processRule(rule, document);
    });

}

// clear previous selection
var paintedElements = $('.PIAColor');
paintedElements.css('background-color', '');
paintedElements.removeClass('PIAColor');

app.parsedataback(parseDOMbyLevel(level));

console.log('done');