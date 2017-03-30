// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require twitter/bootstrap
//= require turbolinks
//= require_tree .

            
            


$(document).on('turbolinks:load', function() {

 
        doMyStuff();

});

    
    if (window.addEventListener) {
        window.addEventListener("load", loadHandler, true);
    }
         function loadHandler() {

    }       
    
    
            

    function doMyStuff() {
        
                
      
         gruppe1();
         

      
     
  missgeburt();
    }

 

         //FUNKTION ZUM BUTTONS GENERIEREN__________________________________________________________






function missgeburt()

{
    

    
    var x=document.getElementsByClassName('globaltrucknummer')[0].innerHTML;
  

    for(i=1;i<=x;i++){
        




         var r=document.getElementsByClassName('global'+i+'')[0].innerHTML;

        
        for(y=1;y<=r;y++){
            
                         
       

   
      var container = document.getElementById("buttons"+i);
            
           
            
            
            
            p = container.appendChild(document.createElement("a"));
            
            
            var k= i;
            
            p.className=k+''+y;
            
            p.innerHTML="change employee"+y;
      
      
      
            
      
      
      
      
            var j=p.className;
            
            
            
            p.onclick=function(){
         
         
            //EINBLENDEN___________________________________________________________
         
         var element = $('.'+this.className+'');
                            
                            for(var i = 0; i<element.length;i++) {


                             element[i].style.display="-webkit-inline-box";

         
                        }
         
         
            };
       
      
       
        }
        
        
        
        
    }
    
}





/*

function buttonZaehlen(){
    
    
     var b=document.getElementsByClassName('global')[0].innerHTML;
      
       for(i=1;i<b; i++){
           
          
      
      
      
            var container = document.getElementById("buttons1");
            
           
            
            p = container.appendChild(document.createElement("a"));
            p.className=i;
            p.innerHTML="change group"+i;
      
      
      
            
      
      
      
      
            var j=p.className;
            
            
            
            p.onclick=function(){
         
         
            //EINBLENDEN___________________________________________________________
         
         var element = $('.'+this.className+'');
                            
                            for(var i = 0; i<element.length;i++) {


                             element[i].style.display="-webkit-inline-box";

         
                        }
         
         
            };
      
       }
    
}

*/

         //FUNKTION ZUM AUSBLENDEN_________________________________________________________________
                 function gruppe1() {

                    
                    
                        var x=document.getElementsByClassName('globaltrucknummer')[0].innerHTML;
                         
                         
                         for(y=1;y<x; y++){
                             
                        var r=document.getElementsByClassName('global'+y+'')[0].innerHTML;

                                                            

                              
                               for(i=1;i<=r; i++){
                             
                                 
                                    
                               var element = $('.'+i+'');
                            
                                     $('.'+y+''+i+'').hide();
                                     
                                     
                            }
                            
                         }
          
                         };
                            
                      
                      
                      
                      
                      
                      
                      
                      
                      
                      
                      
                      
                      
                      
                      
                      
                      
                      
                      
                      
                      
                      
                      
                      
                      
                      
function printdiv(printpage)
{
var headstr = "<html><head><title></title></head><body>";
var footstr = "</body>";
var newstr = document.all.item(printpage).innerHTML;
var oldstr = document.body.innerHTML;
document.body.innerHTML = headstr+newstr+footstr;
window.print();
document.body.innerHTML = oldstr;
return false;
}






/*
$(document).ready(function() {
    
    
    
      var x=document.getElementsByClassName('globaltrucknummer')[0].innerHTML;
                         
                    
                    
                    for(i=0;i<x;i++){  
    
    $("#truck_order_truck_truck_orders_attributes_"+i+"_truck_attributes_incoming").click(function(event) {
        // this.append wouldn't work
        
          for(j=1;j<x;j++){  
              
              
              
              if(j==i){
              
              
       
         $("#outgoingfeldid"+j).css("display", "none");
        
              }
        
          }
    });
    
                    }
    
    
    
    
    
    
           
                       
                
    
    
   
});



$(document).ready(function() {
    $("#truck_order_truck_truck_orders_attributes_0_truck_attributes_outgoing").click(function(event) {
        // this.append wouldn't work
        $("#incommingfeldid").css("display", "none");
    });
});
*/