/*
 app.controller("servicesCtrl",function($rootScope,$scope,$log,$http,$location){

 $scope.services=[];
 $http.get("http://localhost:8080/services").then(function(response){
 $scope.services=response.data._embedded.services;
 })

 $scope.showService=function(id){
 $log.log("id je "+id);
 $location.path("/services/"+id);
 }
 })
 */
/**
 * Created by Admira on 07-May-17.
 */
app.controller('servicesCtrl', function (servis, $rootScope, $log, $location, $scope, $http, $route, $window) {


    $scope.onInit = function () {
        $scope.prikaziDodaj = 0;
        $scope.usluga = {};
        var test = false;

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

        $scope.addMode = function () {
            $scope.prikaziDodaj = 1;
        }

        $scope.dodajUslugu = function () {

            $http({
                    method: 'POST',
                    url: '/services',
                    headers: {
                        'Content-Type': 'application/json'
                    },
                    data: angular.toJson($scope.usluga)
                }
            ).then(function (response) {

                $http.get('/incidents/services').then(function (response1) {

                    $scope.services = response1.data;

                });
            })
        }
        $scope.uslugaNedostupna = function (service) {
            var data = {
                headerText: "Promjena dostupnosti usluge",
                bodyText: "Da li ste sigurni da želite promijeniti dostupnost usluge?"
            };
            servis.modal(data).then(function (x) {
                if (x) {
                    $http({
                            method: 'PATCH',
                            url: '/services/' + service.id,
                            headers: {
                                'Content-Type': 'application/json'
                            },
                            data: angular.toJson({available: false})
                        }
                    ).then(function (response) {

                        $http.get('/incidents/services').then(function (response1) {

                                $scope.services = response1.data;
                            }
                        )
                    })
                }
            });
        };
        $scope.uslugaDostupna = function (service) {
            var data = {
                headerText: "Promjena dostupnosti usluge",
                bodyText: "Da li ste sigurni da želite promijeniti dostupnost usluge?"
            };
            servis.modal(data).then(function (x) {
                if (x) {
                    $http({
                            method: 'PATCH',
                            url: '/services/' + service.id,
                            headers: {
                                'Content-Type': 'application/json'
                            },
                            data: angular.toJson({available: true})
                        }
                    ).then(function (response) {

                        /* nelogicna putanja - refactor*/
                        $http.get('/incidents/services').then(function (response1) {

                                $scope.services = response1.data;
                            }
                        );
                    });
                }
            });
        }

        $scope.prijaviUslugu = function (service) {

            data = {
                headerText: "Prijavi uslugu",
                bodyText: "Da li ste sigurni da želite prijaviti uslugu?"
            };
            servis.modal(data).then(function (x) {
                if (x) {
                    var nova = {
                        "user": "http://localhost:8080/users/" + $scope.user.id,
                        "service": "http://localhost:8080/services/" + service.id
                    };

                    $http({
                            method: 'POST',
                            url: '/userservices',
                            headers: {
                                'Content-Type': 'application/json'
                            },
                            data: angular.toJson(nova)
                        }
                    ).then(function (response) {

                    })
                }
            });
        }

        $scope.detaljnije = function (service) {
            $http.get("http://localhost:8080/services/getuserservices?id="+$scope.user.id).then(function(response1){
                $scope.services = response1.data.toArray();
            })
            for(var i = 0; i<$scope.services.length; i++){
                console.log('object', service.id );
                console.log('user', $scope.services[i].id);
                if($scope.services[i].id == service.id){
                    $scope.text = 'Pretplaćeni ste na ovu uslugu.';
                    test= true;
                }
            }
            if(!test) $scope.text = 'Niste pretplaćeni na ovu uslugu.';

            $location.path('/detailed/'+ $scope.text+ '/'+ service.name+ '/'+ service.description + '/'+ service.price + '/'+ service.available);

        }


    }
});
