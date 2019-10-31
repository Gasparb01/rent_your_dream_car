import "bootstrap";
import flatpickr from 'flatpickr';
import 'flatpickr/dist/flatpickr.min.css';
import { initMapbox } from '../plugins/init_mapbox';
import 'mapbox-gl/dist/mapbox-gl.css'; // <-- you need to uncomment the stylesheet_pack_tag in the layout!
import '@mapbox/mapbox-gl-geocoder/dist/mapbox-gl-geocoder.css';

import { scrollFunction } from "../plugins/scroll_top";
import { updatePrice } from "../reservations/reservation_cost";



flatpickr(".datepicker", {
 defaultDate: "today",
 altInput: true,
 dateFormat: "d.m.Y",
 minDate: "today",
 maxDate: new Date().fp_incr(30)
});


updatePrice();
initMapbox();

