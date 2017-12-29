(function() {
    // Subscribe to the class name of the channel
    App.projects = App.cable.subscriptions.create('ProjectsChannel', {
        /**
         * Whenever this channel pushes content, it is received here
         */
        received: function(project) {
            
            var $project = $('[data-project-id="' + project.id + '"]');
            if ($project.length > 0) {
                // Existing Task
                switch (project.response) {
                    case 'deleted':
                        $project.remove();
                        break;
                }
            } 
        }
    });
}).call(this);