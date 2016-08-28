//General
jQuery(document).ready(function($) {
  // Slider
  $('.contentWrap').liteSlider({
    content : '.content',   // The panel selector. Can be a list also. eg:li
    width : 760,      // Width of the slider
    height : 300,     // Height of the slider
    autoplay : true,    // Autoplay the slider. Values, true & false
    delay : 3,      // Transition Delay. Default 3s
    buttonsClass : 'buttons', // Button's class
    activeClass : 'active',   // Active class
    controlBt : '.control',   // Control button selector
    playText : 'Play',    // Play text
    pauseText : 'Stop'    // Stop text
  });

  // collapser
    $('.demo1').collapser({
      target: 'next',
      targetOnly: 'p',
      expandHtml: 'Expandir Texto',
      collapseHtml: 'Colapsar Texto',
      expandClass: 'expArrow',
      collapseClass: 'collArrow'
    });
    
    /** Demo 2 ****************************/
    
    $('.demo2').collapser({
      target: 'prev',
      targetOnly: 'p',
      expandHtml: 'Expandir Texto',
      collapseHtml: 'Colapsar Texto',
      expandClass: 'expArrow',
      collapseClass: 'collArrow'
    });
    
    /** Demo 3 ******************************/
    
    $('.demo3').collapser({
      target: 'next',
      effect: 'fade',
      changeText: 0,
      expandClass: 'expArrow',
      collapseClass: 'collArrow'
    });
    
    /** Demo 4 *******************************/
    
    $('.demo4').collapser({
      target: 'siblings',
      effect: 'fade',
      changeText: 0,
      expandClass: 'expIco',
      collapseClass: 'collIco'
    });

});
// EJEMPLO 1
$(".example1_hide").live("click",function(){
  $(".Ejemplo1").hide()
});
$(".example1_show").live("click",function(){
  $(".Ejemplo1").show()
});

// EJEMPLO 2
$(".example2_fade_in").live("click",function(e){
	e.preventDefault();
  $(".Ejemplo2").fadeIn()
});
$(".example2_fade_out").live("click",function(e){
	e.preventDefault();
  $(".Ejemplo2").fadeOut()
});

// EJEMPLO 3
$(".example3_add_class").live("hover",function(e){
	e.preventDefault();
  $(".Ejemplo3").addClass("example_text_ex3")
  $(".Ejemplo3").removeClass("Ejemplo3")
});

$(".example3_remove_class").live("hover",function(e){
	e.preventDefault();
  $(".example_text_ex3").addClass("Ejemplo3")
  $(".Ejemplo3").removeClass("example_text_ex3")
});

// EJEMPLO 4
$(".example4_callback").live("click",function(e){
  e.preventDefault();
  $(".Ejemplo4").fadeOut(1000, function(){
    $(".Ejemplo4").fadeIn(1000);
  });
});
//EJEMPLO 8 - AJAX
$(".example8_ajax").live("click",function(e){
  e.preventDefault();
  $.ajax({
    url: "http://localhost/jquery/ajax.text",
    type: "get",
    dataType: "html",
    error: function(){
    },
    
    beforeSend: function(){

    },
    
    complete: function(){

    },
    success: function(obj){
      lista = obj.split(",");
      tamano = lista.length;
      var x=0
      for (x=0;x<tamano;x++){
        $("#ajax").append("<li>"+lista[x]+"</li>")
      }
    }
  }); 
});
// EJEMPLO9
$(".button").live("click",function(e){
  e.preventDefault();
  name = $("#name").val()
  lastname = $("#last_name").val()

  if (name === "")
  {
    alert("El Nombre no puede estar Vacio")
  }else if (lastname === "")
  {
    alert("El Apellido no puede estar Vacio")
  }else{
    alert("Hola "+name+" "+lastname)
  }
})
// EJEMPLO 10
$(".example10_wrap").live("click",function(e){
  e.preventDefault();
  $('.inner').wrap('<div class="new" />');
})

// EJEMPLO 11
$(".example11_toggle").live("click",function(e){
  e.preventDefault();
  $(".example11_toggle").toggle(function(){
    alert("Me acabas de activar");
  },function(){
    alert("Me acabas de desactivar");
  });
});
