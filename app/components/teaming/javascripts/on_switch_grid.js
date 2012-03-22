{

    onSwitchGrid : function () {
            
        var gridchoice=Ext.get('conchoice').dom.lastChild.textContent;
        
        switch (gridchoice)
        {
        case "Contract Teaming":
            Ext.getCmp('southPanel').getLayout().setActiveItem(2);
            
            Ext.getCmp('conchoice').update('Project/Business Teaming');
            calltrick.getChildComponent('fedbizs').store.reload();
            gride="NULL";
            deletedsaveList=[];   
            break;
            
        case "Project/Business Teaming":
            Ext.getCmp('southPanel').getLayout().setActiveItem(3);
            Ext.getCmp('teaming').actions.post.disable();
            Ext.getCmp('teaming').actions.save.disable();
            Ext.getCmp('teaming').actions['delete'].enable();
            Ext.getCmp('conchoice').update('Mylist');    
            deletedsaveList=[];
            gride="NULL";
            break;
            
        case "Mylist":
            Ext.getCmp('southPanel').getLayout().setActiveItem(0);
            Ext.getCmp('teaming').actions.post.enable();
            Ext.getCmp('teaming').actions['delete'].disable();
            Ext.getCmp('teaming').actions.update.disable();
            Ext.getCmp('teaming').actions.reply.disable();
            Ext.getCmp('teaming').actions.save.enable();
            Ext.getCmp('conchoice').update('FedBizOpp');
            deletedsaveList=[];
            gride="NULL";
            break;
            
        default:
            Ext.getCmp('southPanel').getLayout().setActiveItem(1);
            Ext.getCmp('teaming').actions['delete'].disable();
            Ext.getCmp('teaming').actions.update.enable();
            Ext.getCmp('teaming').actions.reply.enable();
            Ext.getCmp('teaming').actions.save.enable();
            Ext.getCmp('conchoice').update('Contract Teaming');
            gride="NULL";
            deletedsaveList=[];
            
            
        }  
    }
}
