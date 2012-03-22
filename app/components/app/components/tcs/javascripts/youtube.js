{
    onYoutube: function() { 
        this.getVideoId(this.getSelectionModel().getSelected().id)
    },  
    youtubePlay: function(video) {
        if (video) {
            panelContent = new Ext.Panel({
                region: 'center',
                margins: '5 5 5 5',
                autoScroll: false,
                html: '<iframe width="420" height="315" src="http://www.youtube.com/embed/' + 
                    video + 
                    '" frameborder="0" allowfullscreen></iframe>'
            });
            
            var w = new Ext.Window({
                width  : 435,
                height : 350,
                title  : "Company video",
                layout : 'fit',
                items : panelContent
            });
            w.show()
        } 
    },

    youtubeMissing: function () { alert("No company video available") }
}