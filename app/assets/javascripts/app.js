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

}]);

// profile controller
app.controller("ProfileController", ['$scope', '$http', function($scope, $http) {
    $scope.profile;
    $scope.uni;

    


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
