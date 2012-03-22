/*!
 * Ext JS Library 3.3.1
 * Copyright(c) 2006-2010 Sencha Inc.
 * licensing@sencha.com
 * http://www.sencha.com/license
 */
Ext.ns('Ext.ux.grid');

/**
 * @class Ext.ux.grid.CheckColumn
 * @extends Ext.grid.Column
 * <p>A Column subclass which renders a checkbox in each column cell which toggles the truthiness of the associated data field on click.</p>
 * <p><b>Note. As of ExtJS 3.3 this no longer has to be configured as a plugin of the GridPanel.</b></p>
 * <p>Example usage:</p>
 * <pre><code>
var cm = new Ext.grid.ColumnModel([{
       header: 'Foo',
       ...
    },{
       xtype: 'checkcolumn',
       header: 'Indoor?',
       dataIndex: 'indoor',
       width: 55
    }
]);

// create the grid
var grid = new Ext.grid.EditorGridPanel({
    ...
    colModel: cm,
    ...
});
 * </code></pre>
 * In addition to toggling a Boolean value within the record data, this
 * class toggles a css class between <tt>'x-grid3-check-col'</tt> and
 * <tt>'x-grid3-check-col-on'</tt> to alter the background image used for
 * a column.
 */
Ext.ux.grid.CheckColumn = Ext.extend(Ext.grid.Column, {

    /**
     * @private
     * Process and refire events routed from the GridView's processEvent method.
     */
    processEvent : function(name, e, grid, rowIndex, colIndex){
        if (name == 'mousedown') {
		
	   
            var record = grid.store.getAt(rowIndex);
           record.set(this.dataIndex, !record.data[this.dataIndex]);	
		
	   if (this.name=="interest") { 
		var matchrowSelect;			 
		  if(gridIndex==rowIndex) matchrowSelect="match"; else matchrowSelect="nomatch";
		   
		 if(record.fields.keys[2]=="sol_opp") {                   
			 if(record.data['interest']==true) {calltrick.selectFedbiz({fedbiz_id: record.id, i_status:"true", match:matchrowSelect}); calltrick.addToMylist({fedbiz_id:record.id, grid_type:"Fedbiz"})}
				 else {calltrick.selectFedbiz({fedbiz_id:record.id, i_status:"false",match:matchrowSelect}); calltrick.deleteFromIedmylist({record_id:record.id, grid_type:"fedbiz"})}
	     	   		 }		   
		 
		if(record.fields.keys[2]=="jpco") {if(record.data['interest']==true) {calltrick.selectTables({jp_id:record.id, i_status: "true", match:matchrowSelect, grid_type:record.data['grid_type']}); calltrick.addToMylist({jp_id:record.id, grid_type:record.data['grid_type']})} 
			 else {calltrick.selectTables({jp_id:record.id, i_status:"false", match:matchrowSelect, grid_type:record.data['grid_type']});calltrick.deleteFromIedmylist({record_id:record.id, grid_type:record.data['grid_type'] })}
		 }
		
	
		
		 
		 
		 
		if(record.fields.keys[2]=="ctractitle"&& record.data['grid_type']=="Fedbiz" ) { 
			if(record.data['interest']==false ) {calltrick.notiFromMylist({id:record.id});calltrick.selectFedbiz({fedbiz_id:record.data['record_id'], i_status:"false",match:matchrowSelect});} else
				{calltrick.selectFedbiz({fedbiz_id: record.data['record_id'], i_status:"true", match:matchrowSelect}); calltrick.interestFromMylist({id:record.id});}}
		                
		if(record.fields.keys[2]=="ctractitle"&& record.data['grid_type']=="Jp" ) { 
		if(record.data['interest']==false) {calltrick.notiFromMylist({id:record.id});calltrick.selectTables({jp_id:record.data['record_id'], i_status:"false", match:matchrowSelect, grid_type:record.data['grid_type']});} else
				{calltrick.interestFromMylist({id:record.id});calltrick.selectTables({jp_id:record.data['record_id'], i_status:"true", match:matchrowSelect,grid_type:record.data['grid_type'] });}
		 }

		 if(record.fields.keys[2]=="ctractitle"&& record.data['grid_type']=="Privatejp" ) { 
		if(record.data['interest']==false) {calltrick.notiFromMylist({id:record.id});calltrick.selectTables({jp_id:record.data['record_id'], i_status:"false", match:matchrowSelect, grid_type:record.data['grid_type']});} else
				{calltrick.interestFromMylist({id:record.id});calltrick.selectTables({jp_id:record.data['record_id'], i_status:"true", match:matchrowSelect,grid_type:record.data['grid_type'] });}
		 }
				 
		 if(record.fields.keys[2]=="ctractitle"&& record.data['grid_type']=="Obv" ) { 
		if(record.data['interest']==false) {calltrick.notiFromMylist({id:record.id});calltrick.selectTables({jp_id:record.data['record_id'], i_status:"false", match:matchrowSelect, grid_type:record.data['grid_type']});} else
				{calltrick.interestFromMylist({id:record.id});calltrick.selectTables({jp_id:record.data['record_id'], i_status:"true", match:matchrowSelect,grid_type:record.data['grid_type'] });}
		 }
		 
		 
		  if(record.fields.keys[2]=="ctractitle"&& record.data['grid_type']=="Privateobv" ) { 
		if(record.data['interest']==false) {calltrick.notiFromMylist({id:record.id});calltrick.selectTables({jp_id:record.data['record_id'], i_status:"false", match:matchrowSelect, grid_type:record.data['grid_type']});} else
				{calltrick.interestFromMylist({id:record.id});calltrick.selectTables({jp_id:record.data['record_id'], i_status:"true", match:matchrowSelect,grid_type:record.data['grid_type'] });}
		 }
		 
		 
		 
		 }  
		   
	if(this.name=="select") {
		var selectedgrid=record.fields.keys[1];
		
		switch (selectedgrid)
		{
			
			
			case "ncode":
			if(record.data.select==true) {naicsg.push(record.data.ncode); naicsg1.push(record.data.ngroup); } else {naicsg.pop(record.data.ncode); naicsg1.pop(record.data.ngroup); }
		        break;
		        case "ccftcode":
			if(record.data.select==true) {clsg.push(record.data.ccftcode); clsg1.push(record.data.ccft); } else {clsg.pop(record.data.ccftcode); clsg1.pop(record.data.ccft);}
		        break;
			case "abrev":
 			if(record.data.select==true ){locsg.push(record.data.state); } else {locsg.pop(record.data.state);}
			break;
			case "seta":
			if (record.data.select==true){setasg.push(record.data.seta);} else {setasg.pop(record.data.seta);}
			break;
			case "sbtnncode":
			if (record.data.select==true) {ncopsbtn.push(record.data.sbtnncode); ncopsbtn1.push(record.data.sbtngroup);} else {ncopsbtn.pop(record.data.sbtnncode); ncopsbtn1.pop(record.data.sbtngroup);}
			break;
			case "sbtnccftcode":
			if (record.data.select==true) {pcopsbtn.push(record.data.sbtnccft); pcopsbtn1.push(record.data.sbtnccftcode);} else {pcopsbtn.pop(record.data.sbtnccft); pcopsbtn1.pop(record.data.sbtnccftcode);}
			break;
			case "sbtnid":
			if (record.data.select==true) {selectedrecord=record.id; deletedsaveList.push(record.id);} else deletedsaveList.pop(record.id);				
			break;	
			default:
                        if (record.data.select==true){pcop.push(record.data.coname); } else {pcop.pop(record.data.coname);}
			break;
			
		}
			
	//	if (record.data.tup==true) {pcop.push(record.data.cname); }
	
		
			
		
	}
	

		   
		   
		   
     
		   return false; // Cancel row selection.
        } else {
            return Ext.grid.ActionColumn.superclass.processEvent.apply(this, arguments);
        }
	
		
    },

    renderer : function(v, p, record){	
	
	p.css += ' x-grid3-check-col-td'; 
        return String.format('<div class="x-grid3-check-col{0}">&#160;</div>', v ? '-on' : '');
	  
    },

    // Deprecate use as a plugin. Remove in 4.0
    init: Ext.emptyFn
});

// register ptype. Deprecate. Remove in 4.0
Ext.preg('checkcolumn', Ext.ux.grid.CheckColumn);

// backwards compat. Remove in 4.0
Ext.grid.CheckColumn = Ext.ux.grid.CheckColumn;

// register Column xtype
Ext.grid.Column.types.checkcolumn = Ext.ux.grid.CheckColumn;