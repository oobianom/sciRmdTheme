$(window).load(function () {
    $('.list-group-item').prepend('<b>listgroupixon&emsp;</b>');


    /*elements with images*/

    $( "p:has(img)" ).each(function(index,item){
      $(this).addClass( "sliderimagep"+index);
      $(this).prepend('<div class="d-flex font-weight-bold">Resize image: &emsp;<input class="sliderimageinput" type="range" min="1" max="100" value="50"></div>');
    });

    $(".sliderimageinput").on('input',function(){
      let newwidth = $(this).val();
      $(this).parent().parent().children("img").each(function(index,val){
        $(this).attr('width',newwidth+"%");
      });
    });



    /*elements with tables*/

    $( "table" ).each(function(index,item){
      $(this).addClass( "slidertable slidertable"+index);
      $('<div class="d-flex font-weight-bold"><div>Resize table size:&emsp;<input class="slidertableinput" data="'+"slidertable"+index+'" type="range" min="1" max="100" value="100"></div>'+
      '<div>Resize table font:&emsp;<input class="slidertablefont" type="range" min="9" data="'+"slidertable"+index+'" max="50" value="12"></div></div>').insertBefore(this);
    });

    $(".slidertableinput").on('input',function(){
      let newwidth = $(this).val();
      $("."+$(this).attr("data")).css("width",$(this).val()+"%");
    });

    $(".slidertablefont").on('input',function(){
      let newwidth = $(this).val();
      $("."+$(this).attr("data")).css("font-size",$(this).val()+"px");
    });



























});


