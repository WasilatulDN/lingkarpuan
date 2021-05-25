$(document).ready(function() {
    var $btns = $('.list-actions').click(function() {
        if (this.id == 'verifikasi') {
          var $el = $('.' + this.id).fadeIn();
          $('#ct > div').not($el).hide();
        } if (this.id == 'konfirmasi') {
          var $el = $('.' + this.id).fadeIn();
          $('#ct > div').not($el).hide();
        } else {
          var $el = $('.' + this.id).fadeIn();
          $('#ct > div').not($el).hide();
        }
        $btns.removeClass('active');
        $(this).addClass('active');  
    })
})