{
    initComponent : function() {
        // calling superclass's initComponent
        Netzke.classes.Teaming.superclass.initComponent.call(this);

    
//Global variables
  Netzke.page.helloWorldComponent.hide();
 
        calltrick=this;   
        gridIndex=0;
        naicsg=[]; 
        naicsg1=[];
        clsg=[];
        clsg1=[];
        comsg=[]; 
        setasg=[]; 
        locsg=[];  
        pcop=[]; 
        gride="NULL";
        deletedsaveList=[];
  

   
	this.getChildComponent('fedbizs').on('rowclick', this.onFedbizSelectionChanged, this);  
  
	this.getChildComponent('jps').on('rowclick', this.onTableSelectionChanged, this);  
   
	this.getChildComponent('obvs').on('rowclick', this.onTableSelectionChanged, this);  
	
	this.getChildComponent('mylists').on('rowclick', this.onMylistSelectionChanged, this); 
	
 
	var formPanel =  {
            xtype       : 'form',
            autoScroll  : false,
	    header: false,
	    border:true,
            id          : 'formpanel',
            defaultType : 'field',
            frame       : true,
            title       : 'Contract Teaming',
	    height:450,
	    weight: 300,
	    
	    
            items       : [   
	        
	        { xtype:'label', fieldLabel:'SBTN ID', id:'sbtnid1', iconAlign:"center",anchor: '100%' },	
                { fieldLabel: 'Title',name: 'Title', id:'formText', anchor: '100%'},	  
	        { xtype: 'combo',fieldLabel: 'Interest',store: ['Other','Joint Venture','Prime-Sub','Contracting','Subcontracting'], border:false, id:'formInterest'},	   
                { xtype: 'htmleditor', name: 'description',hideLabel: true, height:226, anchor: '100%',id:'formBody'},
	        { xtype: 'radio',fieldLabel: 'Confidential',name: 'conf',boxLabel: 'Yes', id:'cradio'},{xtype: 'radio',hideLabel: false,labelSeparator: '',name:'conf',boxLabel: 'No'},
	        { xtype: 'combo', id:'formPP', fieldLabel: 'Visibility',store: ['Private', 'Private/wpr', 'Public','Public/wpr']},
	    	{ xtype:'label', fieldLabel:'fedbizopp ID', id:'fedbizopp', labelAlign:"bottom", top:100, right:0, bottom:0, left:0  }
	        
            ],
	    buttons: [  
                {
                    text:"Submit",
	            handler: function() {
	                var c1=Ext.getCmp('sbtnid1');
	                var isbtnid=Ext.getCmp('sbtnid1').getEl().dom.textContent;
                        c1.getEl().update(isbtnid);	
	                
	                var ftext=Ext.getCmp('formText').getValue();	
	                var fbody=Ext.getCmp('formBody').getValue();
	                var fint=Ext.getCmp('formInterest').value;
	                var fpp=visiblity();
	                var gridTeam="n/a";
	                var locs = locsg.join(",");
	                var setas=setasg.join(",");
                        var snas=fnas();
	                var scls=fcls();
	                var mbody=fmbody(fbody, locs, setas, snas, scls);
	                var stoco = pcop.join(",");	
                        // var sbtnid = Ext.getCmp('sbtnid1').getEl().dom.textContent;
                        var confdnt=Ext.getCmp('cradio').getValue();
	                //var sbtnid=randomString();
                        var sbtnid=Ext.getCmp('sbtnid1').getEl().dom.textContent;
	
                        function visiblity() {
                            var vis=Ext.getCmp('formPP').value;
                            if (vis=='Private') vtp="0";
                            if (vis=='Private/wpr') vtp="1";
                            if (vis=='Public') vtp="2";
                            if (vis=='Public/wpr') vtp="3";
                            return vtp; 
                            
                        }
                        
                        
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
	
                        function fnas(){
                            var mynas=[];    
                            Ext.each(naicsg, function (naicsg, index){
	                        mynas.push(naicsg+"--"+naicsg1[index]);
	                    });    
                            return mynas.join("; ");
                        }
	
                        function fcls(){
                            var mycls=[];    
                            Ext.each(clsg, function (clsg, index){
	                        mycls.push(clsg+"--"+clsg1[index]);
	                    });    
                            return mycls.join("; ");
                        }
		        
                        function fmbody(fbody, locs, setas, snas, scls) {
                            var messageBody;
                            messageBody=ftext+ fbody+ snas + scls + locs;
                            return messageBody;
                        }
                        
	                calltrick.postForm({sbtnid:sbtnid,ptitle:ftext, pbody:fbody, pvpost:fpp, ptype:fint, pnas:snas, pcls:scls, pseta:setas, ploc:locs, pco:pcop,conf:confdnt, ctable:gridTeam});
	                
	                
	                
	                Ext.getCmp('popwin').hide();	
	                
	                
	            }},  
                
                { text:"Cancel",handler: function() {Ext.getCmp('popwin').hide(); }}  
            ]
        }; 





    
        var popw=new Ext.Window({
            layout:'fit', id:'popwin', width:600, height:500, header:false, closeAction:'hide', border:false, bodyBorder:false, closable:false,  
	    items:[ {xtype:'tabpanel', activeTab:0, id:'g', items:[formPanel,Netzke.page.helloWorldComponent]}]
        }
	                       );
  
  
    
   
	var bformPanel =  {
            xtype       : 'form',
            autoScroll  : false,
	    header: false,
	    border:true,
            id          : 'bformpanel',
            defaultType : 'field',
            frame       : true,
            title       : 'Project/Business Teaming',
	    height:300,
	    weight: 300,
	    
	
            items       : [   
	        
	        {xtype:'label', fieldLabel:'SBTN ID', id:'bsbtnid1', iconAlign:"center",anchor: '100%' },	
                { fieldLabel: 'Title',name: 'Title', id:'bformText', anchor: '100%'},  	   
                {xtype: 'htmleditor', name: 'description',hideLabel: true, height:270, anchor: '100%',id:'bformBody'},	   
	        {xtype: 'radio',fieldLabel: 'Confidential',name: 'conf',boxLabel: 'Yes', id:'bcradio'},{xtype: 'radio',hideLabel: false,labelSeparator: '',name:'conf',boxLabel: 'No'},
	        {xtype: 'combo', id:'bformPP', fieldLabel: 'Visibility',store: ['Private', 'Private/wpr', 'Public','Public/wpr']}
	        
            ],	
	buttons: [  {text:"Submit",
                     
	             handler: function() {
		         
	                 var bsbtn=Ext.getCmp('bsbtnid1').getEl().dom.textContent;
	                 var bftext=Ext.getCmp('bformText').getValue();	
	                 var bfbody=Ext.getCmp('bformBody').getValue();
	                 var bfpp=visiblity();
                         var bconfdnt=Ext.getCmp('bcradio').getValue();
                         var bgridTeam="Teaming";	
	                 var stoco = pcop.join(",");
                         function visiblity() {
                             var vis=Ext.getCmp('bformPP').value;
                             if (vis=='Private') vtp="0";
                             if (vis=='Private/wpr') vtp="1";
                             if (vis=='Public') vtp="2";
                             if (vis=='Public/wpr') vtp="3";
                             return vtp; 
                             
                         }

                         calltrick.postForm({sbtnid:bsbtn, ptitle:bftext, pbody:bfbody, pvpost:bfpp, conf:bconfdnt, ctable:bgridTeam,pco:pcop});
  
                         Ext.getCmp('bpopwin').hide();	
	

	                 
	             }},  {text:"Cancel",handler: function() {Ext.getCmp('bpopwin').hide(); }}  ]
            
        }; 
        
    
        var bpopw = new Ext.Window(
            {layout:'fit', id:'bpopwin', width:600, height:500, header:false, closeAction:'hide', border:false, bodyBorder:false, closable:false,  
	     items:[ {xtype:'tabpanel', activeTab:0, id:'gv', items:[bformPanel]}]}
	);

	var reformPanel =  {
            xtype       : 'form',
            autoScroll  : false,
	    header: false,
	    border:false,
            id          : 'reformpanel',
            defaultType : 'field',
            frame       : true,
            title       : 'Reply',
	    forceLayout: true,
	    
	    anchor: '100%',
            items       : [
	        {xtype:'label', fieldLabel:'SBTN ID', id:'sbtnid0', iconAlign:"center",anchor: '100%' },
	        
                {  fieldLabel: 'Title',name: 'Title', id:'reformText', anchor: '100%' },
                {xtype: 'htmleditor', name: 'description',hideLabel: true, anchor: '100%',id:'reformBody' },
	        {xtype:'label', fieldLabel:'Reply To', id:'replyto', iconAlign:"center",anchor: '100%' }
                
            ],
	
	    buttons: [  {text:"Reply",
	                 handler: function() {
	                     var reftext=Ext.getCmp('reformText').getValue();	
	                     var refbody=Ext.getCmp('reformBody').getValue();	
	                     var id0rex = Ext.getCmp('sbtnid0').getEl().dom.textContent;
	                     
	                     var stoco = pcop.join(",");
                             calltrick.replyToPost({rebody:refbody, resubject:reftext, sbtnid:id0rex });	
                             
	                     Ext.getCmp('repopwin').hide(); 
	                     
	                 }},  {text:"cancel",handler: function() {Ext.getCmp('repopwin').hide(); }}  ]      	
        }; 
    
  
        var repopw = new Ext.Window(
            { 
                layout:'fit', id:'repopwin', width:600, height:500, header:false, closeAction:'hide', forceLayout:true, 
	        border:false, bodyBorder:false, closable:false, items:[ {xtype:'tabpanel', activeTab:0, id:'gvr', items:[reformPanel]}]
	    }
        ); 
        
 
	var meformPanel =  {
            xtype       : 'form',
            autoScroll  : false,
	    header: false,
	    border:false,
            id : 'meformpanel',
            defaultType : 'field',
            frame: true,
            title : 'form panel',
	    forceLayout: true,
	    
	    anchor: '100%',
            items:[
                {  fieldLabel: 'Subject',name: 'Title', id:'meformText', anchor: '100%' },
	        {xtype: 'htmleditor', name: 'description',hideLabel: true, anchor: '100%',id:'meformBody' }
            ],  
	    
	    buttons: [  
                {text:"Submit",
	         handler: function() {
	             var meftext=Ext.getCmp('meformText').getValue();	
	             var mefbody=Ext.getCmp('meformBody').getValue();	
	             var stoco = pcop.join(",");
   	             
	             var megride0 = Ext.getCmp('sbtnid0').getEl().dom.textContent;
	             
	             calltrick.sendMessage({to:stoco, subject:meftext, body:mefbody});	
	             
	             Ext.getCmp('mepopwin').hide(); 
	             
	         }},  
                {text:"Save",handler: function() {Ext.getCmp('mepopwin').hide(); }}  
            ]   
        };    
    
        var mepopw = new Ext.Window(
            {layout:'fit', id:'mepopwin', width:600, height:500, header:false, closeAction:'hide', forceLayout:true, 
	     border:false, bodyBorder:false, closable:false, items:[meformPanel]}
        ); 
     }
}