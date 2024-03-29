# Pin npm packages by running ./bin/importmap

pin "application"
pin "@hotwired/turbo-rails", to: "turbo.min.js", preload: true
pin "@hotwired/stimulus", to: "stimulus.min.js"
pin "@hotwired/stimulus-loading", to: "stimulus-loading.js"
pin_all_from "app/javascript/controllers", under: "controllers"
pin "bootstrap", to: "bootstrap.min.js", preload: true
pin "@popperjs/core", to: "popper.js", preload: true # @2.11.8
pin "flatpickr" # @4.6.13
pin "fullcalendar" # @6.1.10
pin "@rails/actioncable", to: "@rails--actioncable.js" # @7.1.3
pin "@rails/actioncable", to: "@rails--actioncable.js" # @7.1.3
pin_all_from "app/javascript/channels", under: "channels"
