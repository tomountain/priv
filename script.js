var Color = {
    toNight: function(){
      document.querySelector('body').style.backgroundColor= 'black';
      document.querySelector('body').style.color= 'white';
      var arr = document.querySelectorAll('a');
      var i = 0;
      while (i < arr.length){
        arr[i].style.color = 'white';
        i = i + 1;
      }
    } ,
    toDay: function(){
      document.querySelector('body').style.backgroundColor= 'white';
      document.querySelector('body').style.color= 'black';
      var arr = document.querySelectorAll('a');
      var i = 0;
      while (i < arr.length){
        arr[i].style.color = 'black';
        i = i + 1;   
      }
    }
}