var app = angular.module('hacktus', ['ngMaterial'])
.config(function($mdThemingProvider) {
  $mdThemingProvider.theme('default')
    .primaryColor('purple')
    .accentColor('purple');
});

// form controller
app.controller("FormController", ['$scope', '$http', function($scope, $http) {
    $scope.form;

    $scope.load = function(json) {
        $scope.form = json;
    };
    $scope.save = function(form) {
        return $http.post('/api/v1/forms', form).success(function(data) {
            $scope.submitted = 'Form Submitted';
            $scope.showSuccessToast();

        });
    };
    $scope.showSuccessToast = function() {
        $mdToast.show(
            $mdToast.simple()
                .content('Success!')
                .position($scope.getToastPosition())
                .hideDelay(0)
    )};
    $scope.findUsers = function(query) {

        $http.post('/api/v1/users', JSON.stringify(query)).success(function(data) {
            $scope.results = data;
        }).error(function() {
          alert('error in findUsers');
        });
    };

}]);

// dashboard controller
app.controller("DashboardController", ['$scope', '$timeout', '$mdSidenav', '$log', '$mdToast', '$animate', function($scope, $timeout,
$mdSidenav, $log, $mdToast, $animate) {
    $scope.toggleLeft = function() {
    $mdSidenav('left').toggle()
                      .then(function(){
                          $log.debug("toggle left is done");
                      });
  };
  $scope.toggleRight = function() {
    $mdSidenav('right').toggle()
                        .then(function(){
                          $log.debug("toggle RIGHT is done");
                        });
  };
$scope.toastPosition = {
        bottom: true,
        top: false,
        left: false,
        right: true
    };
    $scope.getToastPosition = function() {
        return Object.keys($scope.toastPosition)
        .filter(function(pos) { return $scope.toastPosition[pos]; })
        .join(' ');
    };
    $scope.showActionToast = function() {
        $mdToast.show(
            $mdToast.simple()
                .content('Simple Toast!')
                .position($scope.getToastPosition())
                .hideDelay(0)
    )};
        var tabs = [
      { title: 'One', content: "Tabs will become paginated if there isn't enough room for them."},
      { title: 'Two', content: "You can swipe left and right on a mobile device to change tabs."},
      { title: 'Three', content: "You can bind the selected tab via the selected attribute on the md-tabs element."},
      { title: 'Four', content: "If you set the selected tab binding to -1, it will leave no tab selected."},
      { title: 'Five', content: "If you remove a tab, it will try to select a new one."},
      { title: 'Six', content: "There's an ink bar that follows the selected tab, you can turn it off if you want."},
      { title: 'Seven', content: "If you set ng-disabled on a tab, it becomes unselectable. If the currently selected tab becomes disabled, it will try to select the next tab."},
      { title: 'Eight', content: "If you look at the source, you're using tabs to look at a demo for tabs. Recursion!"},
      { title: 'Nine', content: "If you set md-theme=\"green\" on the md-tabs element, you'll get green tabs."},
      { title: 'Ten', content: "If you're still reading this, you should just go check out the API docs for tabs!"}
    ];
    $scope.tabs = tabs;
    $scope.selectedIndex = 2;
    $scope.$watch('selectedIndex', function(current, old){
      if ( old && (old != current)) $log.debug('Goodbye ' + tabs[old].title + '!');
      if ( current )                $log.debug('Hello ' + tabs[current].title + '!');
    });
    $scope.addTab = function (title, view) {
      view = view || title + " Content View";
      tabs.push({ title: title, content: view, disabled: false});
    };
    $scope.removeTab = function (tab) {
      for (var j = 0; j < tabs.length; j++) {
        if (tab.title == tabs[j].title) {
          $scope.tabs.splice(j, 1);
          break;
        }
      }
    };
  });

}]);

// profile controller
app.controller("ProfileController", ['$scope', '$http', function($scope, $http) {
    $scope.profile;
    $scope.uni;
    $scope.listIsHidden = false;




    $scope.load = function(json) {
        $scope.profile = json;
    };
    $scope.save = function(profile) {
    	return $http.patch('/api/v1/users', profile).success(function(data) {
            $scope.updated = 'Profile Updated';
        });
    };

    $scope.loadUni = function() {
        $http.get("/uniParsed").success(function(data, status, headers, config) {
            $scope.uni = data;
        }).error(function(data, status, headers, config) {
            alert('fail');
        });
    };

    $scope.setSchool = function(name) {
        $scope.profile.school = name;
        $scope.listIsHidden = true;
    };

    $scope.hideSchool = function() {
        $scope.hideSchools = true;
    };

    $scope.showSchool = function() {
        $scope.listIsHidden = false;
    };
}]);

app.controller('LeftCtrl', ['$scope', '$timeout', '$mdSidenav', '$log', function($scope, $timeout, $mdSidenav, $log) {
  $scope.close = function() {
    $mdSidenav('left').close()
                      .then(function(){
                        $log.debug("close LEFT is done");
                      });
  };
}]);
app.controller('RightCtrl', ['$scope', '$timeout', '$mdSidenav', '$log', function($scope, $timeout, $mdSidenav, $log) {
  $scope.close = function() {
    $mdSidenav('right').close()
                        .then(function(){
                          $log.debug("close RIGHT is done");
                        });
  };
}]);
