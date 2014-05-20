// for angularjs on button dropdowns to show selected items
angular.module('ngToggle', [])
    .controller('AppCtrl',['$scope', function($scope){
        $scope.custom = true;
        $scope.toggleCustom = function() {
            $scope.custom = $scope.custom === false ? true: false;
        };
}]);





var uid = 1;
 
 
function FbController($scope) {
     
    $scope.fbs = [];
    	// { id:0, 'comment': 'for your help'
    	// }
    // ]; 
    // $scope.fbs = [];
    //     { id:0, 'name': 'Viral', 
    //       'email':'hello@gmail.com', 
    //       'phone': '123-2343-44'
    //     }
    // ];
     
        $scope.saveFb = function() {
         
        if($scope.newfb.id == null) {
        //if this is new contact, add it in contacts array
        $scope.newfb.id = uid++;
        // $scope.newfb.comment = "for your help";

        $scope.fbs.push($scope.newfb);
        } else {
        //for existing contact, find this contact using id
        //and update it.
        for(i in $scope.fbs) {
            if($scope.fbs[i].id == $scope.newfb.id) {
            // $scope.newfb.comment = "for your help";
            $scope.fbs[i] = $scope.newfb;
            }
        }                
        }
         
        //clear the add contact form
        $scope.newfb = {};
    }

        $scope.saveButtonFb = function() {
         
        if($scope.newfb.id == null) {
        //if this is new buttonpush, add it in  array
        $scope.newfb.id = uid++;
        $scope.fbs.push("for your help");
        } else {
        //for existing contact, find this contact using id
        //and update it.
        for(i in $scope.fbs) {
            if($scope.fbs[i].id == $scope.newfb.id) {
            $scope.fbs[i] = "for your help";
            }
        }                
        }
         
        //clear the add contact form
        $scope.newfb = {};
    }
 
     
    $scope.delete = function(id) {
         
        //search contact with given id and delete it
        for(i in $scope.fbs) {
            if($scope.fbs[i].id == id) {
                $scope.fbs.splice(i,1);
                $scope.newfb = {};
            }
        }
         
    }
     
     
    $scope.edit = function(id) {
    //search contact with given id and update it
        for(i in $scope.fbs) {
            if($scope.fbs[i].id == id) {
                //we use angular.copy() method to create 
                //copy of original object
                $scope.newfb = angular.copy($scope.fbs[i]);
            }
        }
    }

}


//puts seeded attributes into $scope.jattribs array 
var List = function ($scope) {
	log('in var List definition');
  // $('.attributes_class').data('attributes')[1].attribute_name    gives "is the best at managment"
  var arrayLength = $('.attributes_class').data('attributes').length;
  $scope.jattribs = [];
  for (var i = 0; i < arrayLength; i++) {
    $scope.jattribs.push($('.attributes_class').data('attributes')[i]);
    log('$scope.jattribs');
    log($scope.jattribs);

  }
}

