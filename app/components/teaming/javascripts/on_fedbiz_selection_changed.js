{
    onFedbizSelectionChanged: 
    function(self, rowIndex) {
        this.selectFedbiz({fedbiz_id:self.store.getAt(rowIndex).get('id')}); 
        gride = self.store.getAt(rowIndex).get('sbtnid');
        gridIndex=rowIndex;
    }

}