// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"

Rails.start()
Turbolinks.start()
ActiveStorage.start()

import { Offcanvas } from "bootstrap";
import "../stylesheets/application.scss";
import '@fortawesome/fontawesome-free/js/all'
import toastr from 'toastr'
window.toastr = toastr

require('jquery')
require('slick.js')
require('common.js')
require('smoking.js')
require('calender.js')