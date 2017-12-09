app.controller('myServicesCtrl', function (servis, $rootScope, $log, $location, $scope, $http, $route, $window) {


    $scope.onInit = function () {
        $scope.prikaziDodaj = 0;
        $scope.usluga = {};
        var test = false;

        if (localStorage.hasOwnProperty("username")) {
            $rootScope.username = localStorage.getItem("username");
            $scope.user = {};
            $http.get('/user/find?username=' + $rootScope.username).then(function (response) {

                $scope.user = response.data;
                $http.get("http://localhost:8080/services/getuserservices?id="+$scope.user.id).then(function (response1) {
                    $scope.services = response1.data;
                });
            });

        }

        else {
            $rootScope.username = null;
        }




        $scope.Promijeni = function (id) {
              var data = {
                    headerText: "Odjavi uslugu",
                    bodyText: "Da li ste sigurni da želite odjaviti uslugu?"
                };

               servis.modal(data).then(function (x) {
                    if (x) {
                      $http.get('http://localhost:8080/userservice/' + $scope.user.id + "/odjaviuslugu/" + id).then(function(response){
                            $location.path('/myservices/');
                        })
                    }
                });
        
        }

        $scope.PrijaviIncident=function(serviceId){
            $location.path("/addincident/"+serviceId);
        }



    }
});
