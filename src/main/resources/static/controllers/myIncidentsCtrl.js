app.controller('myIncidentsCtrl', function($scope, $http, $rootScope, $log, $location){

	$scope.sideMenu=true;
	$scope.usluge=[];
	$scope.zahtjevi=[];
	$scope.statusIncs=[];
	$scope.incidenti=[];
	$scope.prikaz='mojiincidenti';
	$scope.prijavaIncidentaZaUsluguId;
	$scope.selIdx= -1;
	$scope.selIdxZ= -1;
	$scope.selIdxU= -1;

	$scope.answers1=[];
	$scope.answers2=[];
	$scope.answerIncident={};

	$scope.filterRedoslijed="Redoslijed rješavanja";
	$scope.filterPrioritet="Prioritet";
	$scope.filterStatus="Status";
	$scope.filterOdjel="Odjel";
	$scope.filterDatum="Datum prijave";

	
	//treba provjeriti filtriranje
    $scope.filtriraj=function(){
    	$log.log($scope.filterRedoslijed,$scope.filterPrioritet,$scope.filterStatus,$scope.filterOdjel,$scope.filterDatum);
    
		$http.get("http://localhost:8080/incidents/filter?status="+$scope.filterStatus+"&odjel="+$scope.filterOdjel+"&prioritet="+$scope.filterPrioritet+"&datum="+$scope.filterDatum).then(function(response){
			$scope.incidents=response.data;
			console.log($scope.incidents);

				for(i=0;i<$scope.incidents.length;i++){

				timestamp=$scope.incidents[i].created;
				var date = new Date(timestamp);

				var year = date.getUTCFullYear();
				var month = date.getUTCMonth() + 1;
				var day = date.getUTCDate();
				var hours = date.getUTCHours();
				var minutes = date.getUTCMinutes();
				var seconds = date.getUTCSeconds();
				$scope.incidents[i].datumPrijave={year,month,day,hours,minutes,seconds};

				}
		})
    }
	
	
	//prikaz za tabele redove
	$scope.selectIncident=function(inc,idx){
		if($scope.selectedIncident!=null){
			$scope.selectedIncident=null;
		}

		else{
			$scope.selectedIncident=inc;
			$scope.selectedIncident.odgovor='';
			$scope.dajOdgovoreIncident();
			$scope.selIdx=idx;
		}
		console.log($scope.selectedIncident);
		console.log($scope.selectedIncident.status.status);
	}

	$scope.isSelInc=function(zah){
		return $scope.selectedIncident===zah;
	}

	$scope.prikaziMojeIncidente=function(nesto){
		$scope.prikaz=nesto;
		console.log($scope.prikaz);


		if($scope.prikaz=='mojiincidenti')
		{
			$http.get("http://localhost:8080/incidents/userIncident?userid="+$rootScope.id).then(function(response){
				$scope.incidenti=response.data;

			});
		}
	}

	$scope.dajOdgovoreIncident=function(){

		$http.get("http://localhost:8080/incidents/getanswerbyincident?id="+$scope.selectedIncident.id).then(function(response){
			$scope.answers1=response.data;

			if($scope.answers1.length>0){
				$scope.imaOdgovor=true;

				for(i=0;i<$scope.answers1.length;i++){

					timestamp=$scope.answers1[i].created;
					var date = new Date(timestamp);

					var year = date.getUTCFullYear();
					var month = date.getUTCMonth() + 1;
					var day = date.getUTCDate();
					var hours = date.getUTCHours();
					var minutes = date.getUTCMinutes();
					var seconds = date.getUTCSeconds();
					$scope.answers1[i].datumPrijave={year,month,day,hours,minutes,seconds};


				}
			}

			else {
				$scope.imaOdgovor=false;
			}
		})
	}

	$scope.zatvoriIncident=function(){
		$http.get("http://localhost:8080/incidents/close/"+$scope.selectedIncident.id).then(function(response){
			$http.get("http://localhost:8080/incidents/usersactive?userid="+$rootScope.id).then(function(response){
				$scope.incidenti=response.data;
			});
		})
	}
	$scope.prikaziPrijavuIncidenta=function(uslugaId)
	{
		$scope.prikazi('prijavaIncidenta');
		$scope.prijavaIncidentaZaUsluguId=uslugaId;
	}

	$scope.prikaziDodavanjeZahtjevaZaUslugom=function()
	{
		if($scope.prikaz!='prijavaUsluge') $scope.prikaz='prijavaUsluge';

	}

	$scope.prijaviIncidentUnos=function()
	{
		$scope.incident.contactMethod = ($scope.incident.contact_method=="email"? 1:2);
		$scope.incident.userId=$rootScope.id;
		$scope.incident.serviceId=$scope.prijavaIncidentaZaUsluguId;

		$http.post('http://localhost:8080/incidents/reportincident', $scope.incident).then(function(response){
			$scope.prikazi('incidenti');
		});

	}

	$scope.odjaviUslugu=function(uslugaid)
	{
		$http.get('http://localhost:8080/userservice/'+$rootScope.id+'/odjaviuslugu/'+uslugaid).then(function(response){
			$scope.prikazi('usluge');
		});
	}

	$scope.dodajOdgovorNaIncident=function(noviOdgovorText)
	{
		$scope.answerIncident.text=noviOdgovorText;
		$scope.answerIncident.autorId=$rootScope.id;
		$scope.answerIncident.incId=$scope.selectedIncident.id;

		$log.log($scope.answerIncident);
		$http.post('http://localhost:8080/incidentanswers/add',$scope.answerIncident).then(function(response)
		{
			$log.log(response);
			$scope.prikazi('incidenti');
		});
		location.reload();
	}
	


});
