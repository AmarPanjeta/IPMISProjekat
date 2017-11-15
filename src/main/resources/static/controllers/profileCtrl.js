app.controller('profileCtrl',function(servis,$http,$log,$rootScope,$scope,$route,$location){
	$scope.user={};

	if($rootScope.username!=null){
		$scope.username=$rootScope.username;
		 $http.get("http://localhost:8080/users/search/findByUsername?username="+$scope.username).then(function(response){
			$scope.user=response.data;

			$log.log("ucitao je kontrole:",$scope.user.id);

			})
	}



	 $scope.sacuvaj=function(){
         var data = {
             headerText: "Sačuvaj promjene",
             bodyText: "Da li ste sigurni da želite sačuvati promjene"
         };
         servis.modal(data).then(function (x) {
             if (x) {
             	$log.log($scope.user.id);
             }
		$http.put("http://localhost:8080/users/"+$scope.user.id,$scope.user).then(function(response){
		  $location.path("/incidentmanager");
		})});
	}

	$scope.odustani=function(){
        var data = {
            headerText: "Doustani",
            bodyText: "Da li ste sigurni da želite odustati od promjena?"
        };
        servis.modal(data).then(function (x) {
            if (x) {
		$location.path("/incidentmanager");
	}})};
})
