{
    onReply: function(){
        function randomString() {
	    var chars = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXTZabcdefghiklmnopqrstuvwxyz";
	    var string_length = 8;
	    var randomstring = '';
	    for (var i=0; i<string_length; i++) {
		var rnum = Math.floor(Math.random() * chars.length);
		randomstring += chars.substring(rnum,rnum+1);
	    }
	    return randomstring;
        }
        var ransbtnid=randomString();

        
        Ext.getCmp('repopwin').show();
        var a0=Ext.getCmp('sbtnid0'); 
        a0.getEl().update(ransbtnid);
        var resbtn=Ext.getCmp('replyto');
        resbtn.getEl().update(gride);
           
    }
}