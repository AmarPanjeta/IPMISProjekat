var app = angular.module('PPISDzala',['ngRoute','chart.js','ui.bootstrap']).controller('modalController', function($uibModalInstance, data) {
    modal = this;
    modal.data = angular.copy(data);

    modal.cancel = function() {
        $uibModalInstance.close(false);
    }
    modal.ok = function() {
        $uibModalInstance.close( true);
    };
}).
service('servis',['$uibModal',function($uibModal){
    x=this;
    x.modal=function(data){
        var modalInstance = $uibModal.open({
            controller: 'modalController as modal',
            templateUrl: 'partials/modal.html',
            resolve: {
                data: function() {
                    return data;
            }}
        });
        return modalInstance.result;
    }
}])

app.config(['$qProvider', function ($qProvider) {
    $qProvider.errorOnUnhandledRejections(false);
}]);
