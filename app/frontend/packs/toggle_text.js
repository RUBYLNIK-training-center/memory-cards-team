window.toggleText = function (button_id)  {
     var el = document.getElementById(button_id);
   if (el.firstChild.data == "Show answer") 
   {
       el.firstChild.data = "Hide answer";
       el.className = "btn btn-secondary";
   }
   else 
   {
     el.firstChild.data = "Show answer";
     el.className = "btn btn-dark";  
   }
}
