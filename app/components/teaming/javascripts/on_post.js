{
    onPost: function() {
        var gnt = Ext.get('conchoice').dom.lastChild.textContent;
        
        var gridchoice = gnt.replace(/^\\s+|\\s+$/g, '');

        var grideid;
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

        grideran=randomString();


        
        if(gridchoice=="Contract Teaming") {
            grideid=gride;
            Ext.getCmp('popwin').show();
            var ctas=Ext.getCmp('sbtnid1');
            ctas.getEl().update(grideran);
            var fedopp=Ext.getCmp('fedbizopp');
            fedopp.getEl().update("N/A");
        }
        
        if (gridchoice=="Project/Business Teaming") {
            grideid=gride; gride="Project/Business Teaming-N/A to fedbizopop"; 
            Ext.getCmp('bpopwin').show(); 
            var bas=Ext.getCmp('bsbtnid1');  
            bas.getEl().update(grideran); }
        

        if (gridchoice== "FedBizOpp") {
            grideid=gride; Ext.getCmp('popwin').show();
            var cftas=Ext.getCmp('sbtnid1');  
            cftas.getEl().update(grideran);
            var fedopp=Ext.getCmp('fedbizopp');
            fedopp.getEl().update(gride);
            
            
        }
        gride=grideid;
    }
}
