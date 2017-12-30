app.controller('addIncidentCtrl',function(servis,$http,$log,$rootScope,$scope,$route,$location,$routeParams){
	$scope.user={};
	$scope.incident={};

	$scope.methodR="";
	$scope.methodC="";
	$scope.errorMsg = '';



	$scope.loggedIn = function() {
      return $rootScope.username !== null;
	}

	if($rootScope.username!=null){
		$log.log($rootScope.username);

		$http.get("http://localhost:8080/users/search/findByUsername?username="+$rootScope.username).then(function(response){
			$scope.user=response.data;
			$scope.incident.userId=response.data.id;
		
			$http.get("http://localhost:8080/services/"+$routeParams.id).then(function(response1){
				$scope.service=response1.data;
				$scope.incident.serviceId=$routeParams.id;


				if($scope.incident.contactMethod==1){
					$scope.methodC="Telefon";
				}else if($scope.incident.contactMethod==2){
					$scope.methodC="Email";
				}

				$scope.incident.priority=0;
			
		})

		

			});
		}

$scope.prijaviIncident = function(){

		$http.post("http://localhost:8080/incidents/reportincident",$scope.incident).then(function(response2){
					$scope.errorMsg = '';
					$location.path("/myservices");
				}).catch((err)=> {
			$scope.errorMsg = err.message;
		});

}
	

$scope.odustani=function(){

	var data = {
        headerText: "Odustani od prijave",
        bodyText: "Da li ste sigurni da želite odustati od prijave incidenta?"
    };

    servis.modal(data).then(function (x) {
        if (x) {

		$location.path("/myservices");

    	}
    });

}










})
