app.controller('myRequestsCtrl', function($scope, $http, $rootScope, $log, $location){


	$scope.sideMenu=true;
	$scope.usluge=[];
	$scope.zahtjevi=[];
	$scope.statusIncs=[];
	$scope.incidenti=[];
	$scope.prikaz='svizahtjevi';
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

	$scope.errorMsg = '';
	
	
	$scope.odustani=function(){

		$scope.prikaz='svizahtjevi';
	}
	

	$scope.selectRequest=function(zah,idx){
		if($scope.selectedRequest!=null){
			$scope.selectedRequest=null;
		}

		else{
			$scope.selectedRequest=zah;
			$scope.selectedRequest.odgovor='';
			$scope.dajOdgovoreZahtjev();
			$scope.selIdxZ=idx;
		}
	}

	$scope.isSelReq=function(zah){
		return $scope.selectedRequest===zah;
	}

	$scope.hideZahtjev=function(){
		$scope.selectedRequest=undefined;
	}

	$scope.selectUsluga=function(usl,idx){
		if($scope.selectedUsluga!=null){
			$scope.selectedUsluga=null;
		}

		else{
			$scope.selectedUsluga=usl;
			$scope.selIdxU=idx;
		}
	}

	$scope.isSelUsl=function(usl){
		return $scope.selectedUsluga===usl;
	}



	$scope.prikazi=function(nesto){
		$scope.prikaz=nesto;
		console.log($scope.prikaz);

		if($scope.prikaz=='usluge')
		{
			$http.get("http://localhost:8080/services/getuserservices?id="+$rootScope.id).then(function(response){
				$scope.usluge=response.data;
				$log.log(response.data);
			});
		}

		else if($scope.prikaz=='svizahtjevi')
		{
			$http.get('http://localhost:8080/requests/userRequest?userid='+$rootScope.id).then(function(res)
			{
				$scope.zahtjevi=res.data;
			});
		}

	}

	$scope.rijesiZahtjev=function(){
		$http.get("http://localhost:8080/requests/solve/"+$scope.selectedRequest.id).then(function(response){
			$http.get('http://localhost:8080/requests/usersactive?userid='+$rootScope.id).then(function(res)
			{
				$scope.prikazi('svizahtjevi');
				$scope.selectedRequest=undefined;
			});
		})
	}

	$scope.dajOdgovoreZahtjev=function(){

		$http.get("http://localhost:8080/requestanswer/getanswersbyrequest/"+$scope.selectedRequest.id).then(function(response){
			$scope.answers2=response.data;

			if($scope.answers2.length>0){
				$scope.imaOdgovorZ=true;

				for(i=0;i<$scope.answers2.length;i++){

					timestamp=$scope.answers2[i].created;
					var date = new Date(timestamp);

					var year = date.getUTCFullYear();
					var month = date.getUTCMonth() + 1;
					var day = date.getUTCDate();
					var hours = date.getUTCHours();
					var minutes = date.getUTCMinutes();
					var seconds = date.getUTCSeconds();
					$scope.answers2[i].datumPrijave={year,month,day,hours,minutes,seconds};


				}
			}

			else {
				$scope.imaOdgovorZ=false;
			}
		})
		
	}

	$scope.prikaziDodavanjeZahtjevaZaUslugom=function()
	{
		if($scope.prikaz!='prijavaUsluge')
			{
			$scope.prikaz='prijavaUsluge';
			}

	}

	
	$scope.prijaviZahtjevZaUslugom=function(){
		if($scope.request.contactMethod) $scope.request.contactMethod = ($scope.request.contact_method=="email"? 1:2);
		else $scope.request.contactMethod = -1;
		$scope.request.reportMethod = 1;

		$http.post('http://localhost:8080/requests/reportrequest',{userId:$rootScope.id,title:$scope.request.title,description:$scope.request.description,contactMethod:$scope.request.contactMethod}).then(function(response)
		{
			$scope.prikazi('svizahtjevi');
			$scope.errorMsg = '';
		}).catch((err) => {
			$scope.errorMsg = err.data.message;
		});

	}

	$scope.dodajOdgovorNaZahtjev=function(noviOdgovorText)
	{
		$scope.answerIncident.text=noviOdgovorText;
		$scope.answerIncident.autorId=$rootScope.id;
		$scope.answerIncident.requestId=$scope.selectedRequest.id;

		$log.log($scope.answerIncident);
		$http.post('http://localhost:8080/requestanswer/add',$scope.answerIncident).then(function(response)
		{
			$scope.prikazi('svizahtjevi');
			$scope.selectedRequest=undefined;
			
		});
	}
	

    $scope.filtriraj=function(){
    	$log.log($scope.filterRedoslijed,$scope.filterPrioritet,$scope.filterStatus,$scope.filterOdjel,$scope.filterDatum);
    
		$http.get("http://localhost:8080/incidents/filter?status="+$scope.filterStatus+"&odjel="+$scope.filterOdjel+"&prioritet="+$scope.filterPrioritet+"&datum="+$scope.filterDatum).then(function(response){
			$scope.incidents=response.data;

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
    



});
