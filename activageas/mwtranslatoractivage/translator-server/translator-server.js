module.exports = function(RED) {
    function translatorServerActivage(n) {
        RED.nodes.createNode(this,n);
        this.host = n.host;
        this.port = n.port;
    }
    RED.nodes.registerType("translator-server-activage",translatorServerActivage);
}