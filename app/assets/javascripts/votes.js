//# Place all the behaviors and hooks related to the matching controller here.
//# All this logic will automatically be available in application.js.


function VoteCtrl($scope){
  $scope.votes = [
    {vote_id: 1, title:'upvote', like: 0},
    {vote_id: 2, title:'downvote', like: 0},
  ];

  $scope.like = function(vote) {
  	  vote.flag = 1	
      vote.like += 1;
  };

}

// , symbol: (raw("<i class=\"text-color fa fa-chevron-up fa-1x\"></i>")
// , symbol: (raw("<i class=\"text-color fa fa-chevron-down fa-1x\"></i>"))