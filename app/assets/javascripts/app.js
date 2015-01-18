var app = angular.module("cactus", ['ngMaterial']).run(['$compile', '$rootScope', '$document', function($compile, $rootScope, $document) {
    return $document.on('page:load', function() {
        var body, compiled;
        body = angular.element('body');
        compiled = $compile(body.html())($rootScope);
        return body.html(compiled);
    });
}]).config(function($mdThemingProvider) {
  $mdThemingProvider.theme('default')
    .primaryColor('teal')
    .accentColor('teal');
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
        $http.get('/api/v1/users', query).success(function(data) {
            $scope.results = data;
        });
    }

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
        $http.get("/uniParsed.json").success(function(data) {
            $scope.uni = data;
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
