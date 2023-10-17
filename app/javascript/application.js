// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"

document.addEventListener("DOMContentLoaded", function() {
  var userTab = document.getElementById('user-tab');
  var userInfo = document.getElementById('user-info');

  userTab.addEventListener('click', function() {
    userInfo.classList.toggle('visible');
  });
});
