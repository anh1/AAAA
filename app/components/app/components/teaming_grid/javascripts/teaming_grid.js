{
    // Original state of 'Filter' button
    filterState : false,

    onFilter: function(filter) {
        this.fireEvent("filter_state_change", filter.pressed)
    },
    
    initComponent: function() {
        Netzke.classes.TeamingGrid.superclass.initComponent.call(this); 
        this.selModel.singleSelect = true;
        this.on({
            "filter_state_change" : function(pressed) {
                this.saveFilterState(pressed);
                this.reload() }
        })
    },

    onClear: function() { if (confirm("Are you sure?")) this.clearSelection() },
    
    reload: function() { this.store.reload() }
    
}