var app = angular.module('hacktus', []);

// form controller
app.controller("FormController", ['$scope', function($scope) {
    $scope.application;

    $scope.load = function(json) {
        $scope.application = json;
    };
    $scope.save = function(form) {
        return $http.post('/api/v1/forms', form).success(function(data) {
            $scope.submitted = 'Form Submitted';
        });
    };

}]);

// dashboard controller
app.controller("DashboardController", ['$scope', function($scope) {

}]);

// profile controller
app.controller("ProfileController", ['$scope', '$http', function($scope, $http) {
    $scope.profile;

    $scope.load = function(json) {
        $scope.profile = json;
    };
    $scope.save = function(profile) {
    	return $http.patch('/api/v1/users', profile).success(function(data) {
            $scope.updated = 'Profile Updated';
        });
    };

}]);