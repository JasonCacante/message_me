// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"
import "jquery"
import "semantic-ui"
import "./channels"
import "@rails/actioncable" 

function scrollBottom () {
  if ($('#messages').length > 0) {
    $('#messages').scrollTop($('#messages')[0].scrollHeight);
  }
}

function submitMessage(event) {
  $('#message_body').on('keydown', function (e) {
    if (e.key == 'Enter') {
      $('button').click();
      e.target.value = "";
    }
  });
}

$(document).on('turbo:load', function () {
  $('.ui.dropdown').dropdown();
  $('.message .close').on('click', function() {
    $(this).closest('.message').transition('fade');
  });
  submitMessage();
  scrollBottom();
});
