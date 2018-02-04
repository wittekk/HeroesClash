$(document).ready(function() {
	console.log("Document załadowany jquerry");

	// 1. funkcjonalnosc - przy tworzeniu bochatera po kliknieciu w wybrana
	// ikone ona znika
	var img = $(".createimg");
	// img.next().hide();

	img.click(function() {

		$(this).hide();

	});

	// 2. funkcjonalnosc - przy tworzeniu bochatera po kliknieciu w wybrana
	// ikone ona znika

	$(".zdrowie").each(function(index) {
		$(this).css('color', 'green');
		if ($(this).html() < 40) {
			$(this).css('color', 'DarkOrange');
		}
		if ($(this).html() < 20) {
			$(this).css('color', 'red');
			$(this).a
		}
	});
	// var zdrowie = $(".zdrowie");
	// for (var i = 0; i < zdrowie.length; i++) {
	// console.log(zdrowie[i].value());
	// if ($(zdrowie[i]).value() > 60) {
	// $(zdrowie[i]).css('color', 'green');
	// }
	// }
	// if (${zdrowie}.value() > 60) {
	// ${zdrowie}.css('color', 'green');
	// }

});