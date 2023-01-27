

import '../UI/images/dashboard_images.dart';

const String dashboardDataTitle = 'dashboardDataTitle';
const String dashboardDataImg = 'dashboardDataImg';
const String dashboardDataPrice = 'dashboardDataPrice';
const String dashboardDataRating = 'dashboardDataRating';
const String dashboardDataSerialNumber = 'dashboardDataSerialNumber';

/*List dashboardDataTitle = [
  '7 star Hotel Room',
  '5 star Hotel Room',
  '3 star Hotel Room',
];

List dashboardDataImg = [img3, img2, img1];

List dashboardDataPrice = [9999, 5999, 3999];

List dashboardDataRating = [5.0, 4.5, 4.0];

List dashboardDataSerialNumber = [1, 2, 3];

var dashboard_Map = <String,dynamic>{
  dashboardDataImg1 : [img3, img2, img1],

};*/

List<Map<String, dynamic>> dashboardMap = [
  {
    dashboardDataTitle: '7 star Hotel Room',
    dashboardDataImg: img3,
    dashboardDataPrice: 9999,
    dashboardDataRating: 5.0,
    dashboardDataSerialNumber: 1,

  },
  {
    dashboardDataTitle: '5 star Hotel Room',
    dashboardDataImg: img2,
    dashboardDataPrice: 5999,
    dashboardDataRating: 4.5,
    dashboardDataSerialNumber: 2,
  },
  {
    dashboardDataTitle: '3 star Hotel Room',
    dashboardDataImg: img1,
    dashboardDataPrice: 3999,
    dashboardDataRating: 4.0,
    dashboardDataSerialNumber: 3,
  },
];


//print(rooms[1]['roomBeds']);

