<div id='ratings-${resource.id}' data-avg-score=' ${averageScore}' class="rating-divs"
     data-rating-url="${createLink(controller: 'resourceRating', action: 'rateResource', params: [resourceId: resource.id, currentUser: currentUser])} "></div>