app.controller('detailedServiceCtrl', function (servis, $rootScope, $log, $location, $scope, $http, $route, $routeParams) {

    $scope.onInit = function () {
        if (localStorage.hasOwnProperty("username")) {
            $rootScope.username = localStorage.getItem("username");
            $scope.user = {};
            $http.get('/user/find?username=' + $rootScope.username).then(function (response) {

                $scope.user = response.data;
                $http.get('/incidents/services').then(function (response1) {
                    $scope.services = response1.data;
                });
            });

        }

        else {
            $rootScope.username = null;
        }

        console.log("tuuuuu");
        $scope.usluge_text = $routeParams.text;
        $scope.naziv = $routeParams.name;
        $scope.opis = $routeParams.about;
        $scope.cijena = $routeParams.price;
        $scope.opcije = $routeParams.options;
        $scope.id_service = $routeParams.service;

        if ($scope.opcije) $scope.opcije = "Dostupna";
        else $scope.opcije = "Nedostupna";

        console.log($scope.naziv);
        console.log($scope.opcije);
    }

    $scope.Promijeni = function (text, id) {
        console.log('promijeniii mee');
        if (text == 'Pretplaćeni ste na ovu uslugu.') {
            $http.get('http://localhost:8080/userservice/' + $scope.user.id + "/odjaviuslugu/" + id).then(function(response){
                $location.path('/services/');
            })
        }
        else {
            $http.get('http://localhost:8080/userservice/' + $scope.user.id + "/prijaviuslugu/" + id).then(function(response){
                $location.path('/services/');
            })
        }
        }
    }
)