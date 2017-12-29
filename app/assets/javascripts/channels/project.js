// self invoke function

(function() {
  // Subscribe
  App.projects = App.cable.subscriptions.create('ProjectsChannel', {
    
    // channel receiver
    received: function(project) {

    var $project = $('[data-project-id="' + project.id + '"]');
      if ($project.length > 0) {
      
        switch (project.response) {

          case 'deleted':
              $project.remove();
              break;
        }
      } 
    }
  });
}).call(this);