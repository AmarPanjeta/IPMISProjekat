app.controller('detailedServiceCtrl', function (servis, $rootScope, $log, $location, $scope, $http, $route, $routeParams) {

    $scope.onInit = function () {
        console.log("tuuuuu");
        $scope.usluge_text = $routeParams.text;
        $scope.naziv = $routeParams.name;
        $scope.opis = $routeParams.about;
        $scope.cijena = $routeParams.price;
        $scope.opcije = $routeParams.options;

        if($scope.opcije==true) $scope.opcije = "Dostupna";
        else $scope.opcije= "Nedostupna";

        console.log($scope.naziv);
        console.log($scope.opcije);
    }
})