// # Place all the behaviors and hooks related to the matching controller here.
// # All this logic will automatically be available in application.js.
// # You can use CoffeeScript in this file: http://coffeescript.org/


<script src="/path/to/masonry.pkgd.min.js"></script>

var $grid = $('.grid').masonry({
});
$grid.imagesLoaded().progress( function() {
  $grid.masonry('layout');
});
