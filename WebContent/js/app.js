'use strict';

// App Module: the name Angustore matches the ng-app attribute in the main <html> tag
// the route provides parses the URL and injects the appropriate partial page

var storeApp = angular.module('Angustore', ['ngRoute', 'ngAnimate']).
  config(['$routeProvider', function($routeProvider) {
  $routeProvider.
      when('/store', {
        templateUrl: 'partials/store.htm',
        controller: 'storeController' 
      }).
      when('/products/:productCode', {
        templateUrl: 'partials/product.htm',
        controller: 'storeController'
      }).
      when('/cart', {
        templateUrl: 'partials/shoppingCart.htm',
        controller: 'storeController'
    }).
      otherwise({
        redirectTo: '/store'
    });

}]);
//We already have a limitTo filter built-in to angular,
//let's make a startFrom filter
storeApp.filter('startFrom', function () {
    return function (input, start) {
        start = +start; //parse to int
        return input.slice(start);
    }
});
// create a data service that provides a store and a shopping cart that
// will be shared by all views (instead of creating fresh ones for each view).
storeApp.factory("DataService", function () {

    // create store
    var myStore = new store();
    var storeDetails = new detailsprod();
    // create shopping cart
    var myCart = new shoppingCart("AngularStore");

    // enable PayPal checkout
    // note: the second parameter identifies the merchant; in order to use the 
    // shopping cart with PayPal, you have to create a merchant account with 
    // PayPal. You can do that here:
    // https://www.paypal.com/webapps/mpp/merchant
//    myCart.addCheckoutParameters("PayPal", "corsaro22@tiscali.it");
    myCart.addCheckoutParameters("PayPal", "corsaro22-facilitator@tiscali.it");
    
    // return data object with store and cart
    return {
        store: myStore,
        cart: myCart,
        detailsprod: storeDetails
    };
});