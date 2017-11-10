app.controller("loggedCtrl",function($scope,$rootScope,$http,$log) {

  if(localStorage.hasOwnProperty("username")){
    $rootScope.username=localStorage.getItem("username");
    $scope.username=$rootScope.username;
  }
  else{
  $rootScope.username=null;
  }
  if(localStorage.hasOwnProperty("id")){
    $rootScope.id=localStorage.getItem("id");
  }
  else{
  $rootScope.id=null;
  }
  if(localStorage.hasOwnProperty("type")){
    $rootScope.type=localStorage.getItem("type");
  }
  else{
  $rootScope.type=null;
  }

  $log.log("username je "+$rootScope.username);

  var self = this;


  $scope.logged=function(){
    return $rootScope.username!==null;
  };

  $scope.getUsername=function(){
    return $rootScope.username;
  }

  $scope.getRole=function(){
    types=['','Administrator','Korisnik','RF Menadzer', 'Incident Menadzer'];
    return types[$rootScope.type];
  }


  $scope.logout=function(){

    $rootScope.username=null;
    localStorage.removeItem("username");
    $rootScope.id=null;
    localStorage.removeItem("id");
    $rootScope.type=null;
    localStorage.removeItem("type");
    $location.path("/");
  };
});
