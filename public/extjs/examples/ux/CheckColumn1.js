/*!
 * Ext JS Library 3.3.0
 * Copyright(c) 2006-2010 Ext JS, Inc.
 * licensing@extjs.com
 * http://www.extjs.com/license
 */
Ext.ns('Ext.ux.grid');

Ext.ux.grid.CheckColumn = function(config){ 
    Ext.apply(this, config); 
    if(!this.id){ 
        this.id = Ext.id(); 
    } 
    this.renderer = this.renderer.createDelegate(this); 
}; 
  
Ext.ux.grid.CheckColumn.prototype ={ 
    init : function(grid){ 
        this.grid = grid; 
	
        this.grid.on('render', function(){ 
            var view = this.grid.getView(); 
            view.mainBody.on('mousedown', this.onMouseDown, this); 
        }, this); 
    }, 
  
   
  
    renderer : function(v, p, record){ 
        p.css += ' x-grid3-check-col-td';  
        return '<div class="x-grid3-check-col'+(v?'-on':'')+' x-grid3-cc-'+this.id+'"> </div>'; 
    }, 
    
     onMouseDown: function(e,t) {
	  

	   
	 if(t.className && t.className.indexOf('x-grid3-cc-'+this.id) != -1){ 
            e.stopEvent();           
	    var index = this.grid.getView().findRowIndex(t); 
	    var cocall = this.grid.name;
	    var record = this.grid.store.getAt(index);
	    
            //record.set(this.dataIndex, !record.data[this.dataIndex]);
	    if (record.data.tup==true) {
	    pcop.push(record.data.cname);  }             
	   
	     } 
	   
	   

   }	 
    
}; 


// register ptype. Deprecate. Remove in 4.0
Ext.preg('checkcolumn', Ext.ux.grid.CheckColumn);

// backwards compat. Remove in 4.0
Ext.grid.CheckColumn = Ext.ux.grid.CheckColumn;

// register Column xtype
Ext.grid.Column.types.checkcolumn = Ext.ux.grid.CheckColumn;