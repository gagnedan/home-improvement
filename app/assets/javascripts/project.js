$(document).ready(function() {

	$(".alert").fadeTo(1000, 500).slideUp(500, function(){
	    $(".alert").slideUp(500);
	});


	$(".toggle").click(function () {
     $("#toggle_tst").toggle()
  });
});

function toggle_visibility(id) {
	var e = document.getElementById(id);
	if(e.style.display == 'block')
		e.style.display = 'none';
	else
		e.style.display = 'block';
}