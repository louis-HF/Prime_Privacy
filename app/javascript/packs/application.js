import "bootstrap";
import { loadDynamicBannerText } from '../components/inputbox';
// todo condition
//loadDynamicBannerText();

import Chartkick from "chartkick";
window.Chartkick = Chartkick;

import Chart from "chart.js";
Chartkick.addAdapter(Chart);
