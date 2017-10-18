$(function(){
  $('form').on('change', 'input[type="file"][id="main_file"]', function(e) {
    var file = e.target.files[0],
        reader = new FileReader(),
        $preview = $(".preview_main");

    if(file.type.indexOf("image") < 0){
      return false;
    }

    reader.onload = (function(file) {
      return function(e) {
        $preview.empty();
        $preview.append($('<img>').attr({
                  src: e.target.result,
                  class: "preview",
                  title: file.name
              }));
      };
    })(file);

    reader.readAsDataURL(file);
  });
  $('input[type="file"][id="sub_file"]').on('change', function(e) {
    var file = e.target.files[0],
        reader = new FileReader(),
        t = this;

    if(file.type.indexOf("image") < 0){
      return false;
    }

    reader.onload = (function(file) {
      return function(e) {
        $(t).prev().empty();
        $(t).prev().append($('<img>').attr({
                  src: e.target.result,
                  class: "preview",
                  title: file.name
              }));
      };
    })(file);

    reader.readAsDataURL(file);
  });
});
