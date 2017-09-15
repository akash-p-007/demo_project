$(function(){
  $(".pagination a").click(function(){
    $.getScript(this.href);
    return false;
  });
});