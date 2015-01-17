var app = angular.module('hacktus', []);

// form controller
app.controller("FormController", ['$scope', function($scope) {
    $scope.application;

    $scope.load = function(json) {
        $scope.application = json;
    };

}]);