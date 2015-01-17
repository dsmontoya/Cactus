var app = angular.module('hacktus', []);

// form controller
app.controller("FormController", ['$scope', function($scope) {
    $scope.application;

    $scope.load = function(json) {
        $scope.application = json;
    };

}]);

// dashboard controller
app.controller("DashboardController", ['$scope', function($scope) {

}]);

// profile controller
app.controller("ProfileController", ['$scope', function($scope) {
    $scope.profile;

    $scope.load = function(json) {
        $scope.profile = json;
    };

}]);