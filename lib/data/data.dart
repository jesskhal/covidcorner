final String newsApiKey = "615cd7da617a459fa2c6018781602b7c";

final prevention = [
  {'assets/images/wash_hands.png': 'Clean hands\noften'},
  {'assets/images/distance.png': 'Social \ndistance'},
  {'assets/images/mask.png': 'Wear a\nfacemask'},
];
final symptoms = [
  {'assets/images/fever.png': 'High \nfever'},
  {'assets/images/breathing.png': 'Trouble \nbreathing'},
  {'assets/images/taste.png': 'Loss of\ntaste'},
];

final Map<int, String> months = {
  1: "Jan",
  2: "Feb",
  3: "Mar",
  4: "Apr",
  5: "May",
  6: "Jun",
  7: "Jul",
  8: "Aug",
  9: "Sep",
  10: "Oct",
  11: "Nov",
  12: "Dec"
};

//FORMAT- 'REGION NAME': [New Cases, Active Cases, Recovered Cases, Deaths]
const Map<String, List<int>> covidBoxData = {
  'Peel Region (Mississauga/Brampton)': [477, 4526, 23318, 383],
  'Toronto Region': [568, 4935, 36392, 1640],
  'York Region': [249, 1331, 10274, 324],
  'Ottawa Region': [61, 420, 7976, 379],
  'Niagra Region': [35, 178, 2016, 88],
  'Middlesex-London Region': [22, 292, 1426, 67],
  'City of Hamilton Region': [87, 585, 2891, 94],
  'Halton Region': [51, 471, 3275, 67],
  'Windsor-Essex County Region': [31, 426, 3471, 83],
  'Waterloo Region': [47, 503, 3326, 126],
  'Durham Region': [104, 639, 4102, 192]
};

//UPDATE ACCORDING TO LIVE DATA
//highest # in the last week = 15.0
//FORMAT- 'REGION NAME': [(# that day/highest) # * 15, ...] * 7
//TO DO: UPDATE SCALE AS WELL
const Map<String, List<double>> covidDailyNewCases = {
  'Peel Region (Mississauga/Brampton)': [
    11.63,
    10.81,
    9.59,
    10.89,
    14.0,
    9.75,
    13.2
  ],
  'Toronto Region': [15.4, 14.7, 14.5, 15.1, 15.0, 15.7, 14.9],
  'York Region': [5.5, 4.8, 4.5, 5.1, 7.3, 3.4, 6.7],
  'Ottawa Region': [10.0, 9.0, 7.5, 11.3, 7.6, 9.3, 8.8],
  'Niagra Region': [14.4, 13.7, 13.5, 14.1, 14.0, 14.7, 13.9],
  'Middlesex-London Region': [11.63, 10.81, 9.59, 10.89, 14.0, 9.75, 13.2],
  'City of Hamilton Region': [14.4, 13.7, 13.5, 14.1, 14.0, 14.7, 13.9],
  'Halton Region': [6.3, 4.4, 6.2, 3.9, 4.3, 6.0, 4.3],
  'Windsor-Essex County Region': [5.5, 9.81, 11.3, 8.8, 8.9, 9.75, 6.7],
  'Waterloo Region': [6.3, 4.4, 6.2, 3.9, 4.3, 6.0, 4.3],
  'Durham Region': [5.5, 9.81, 11.3, 8.8, 8.9, 9.75, 6.7]
};

//THE REGIONS
final regions = [
  'Peel Region (Mississauga/Brampton)',
  'Toronto Region',
  'York Region',
  'Ottawa Region',
  'Niagra Region',
  'Middlesex-London Region',
  'City of Hamilton Region',
  'Halton Region',
  'Windsor-Essex County Region',
  'Waterloo Region',
  'Durham Region'
];
