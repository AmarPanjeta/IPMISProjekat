app.controller('detailedServiceCtrl', function (servis, $rootScope, $log, $location, $scope, $http, $route, $routeParams) {

    $scope.onInit = function () {

        $scope.usluge_text = $routeParams.text;


        console.log('uslugee tekst',$scope.usluge_text);
    }
})