// Selection menu list
var selectopts = [
  {
    "value": ["arsenal", "lch(10 80 30.84 / 1)"],
    "label": "Arsenal"
  },
  {
    "value": ["aston-villa", "lch(10 80 250.84 / 1)"],
    "label": "Aston Villa"
  },
  {
    "value": ["barnsley", "lch(10 80 27.47 / 1)"],
    "label": "Barnsley"
  },
  {
    "value": ["birmingham", "lch(10 80 271.04 / 1)"],
    "label": "Birmingham"
  },
  {
    "value": ["blackburn", "lch(10 80 150.11 / 1)"],
    "label": "Blackburn"
  },
  {
    "value": ["blackpool", "lch(10 80 75.55 / 1)"],
    "label": "Blackpool"
  },
  {
    "value": ["bolton", "lch(10 80 278.29 / 1)"],
    "label": "Bolton"
  },
  {
    "value": ["bournemouth", "lch(10 80 38.81 / 1)"],
    "label": "Bournemouth"
  },
  {
    "value": ["bradford", "lch(10 80 84.07 / 1)"],
    "label": "Bradford"
  },
  {
    "value": ["brentford", "lch(10 80 31.23 / 1)"],
    "label": "Brentford"
  },
  {
    "value": ["brighton", "lch(10 80 270 / 1)"],
    "label": "Brighton"
  },
  {
    "value": ["burnley", "lch(10 80 345.02 / 1)"],
    "label": "Burnley"
  },
  {
    "value": ["cardiff", "lch(10 80 268.88 / 1)"],
    "label": "Cardiff"
  },
  {
    "value": ["charlton", "lch(10 80 34.27 / 1)"],
    "label": "Charlton"
  },
  {
    "value": ["chelsea", "lch(10 80 289.09 / 1)"],
    "label": "Chelsea"
  },
  {
    "value": ["coventry", "lch(10 80 83.3 / 1)"],
    "label": "Coventry"
  },
  {
    "value": ["crystal-palace", "lch(10 80 255.25 / 1)"],
    "label": "Crystal Palace"
  },
  {
    "value": ["derby", "lch(10 80 69.58 / 1)"],
    "label": "Derby"
  },
  {
    "value": ["everton", "lch(10 80 265.6 / 1)"],
    "label": "Everton"
  },
  {
    "value": ["fulham", "lch(10 80 30.41 / 1)"],
    "label": "Fulham"
  },
  {
    "value": ["huddersfield", "lch(10 80 272.39 / 1)"],
    "label": "Huddersfield"
  },
  {
    "value": ["hull", "lch(10 80 66.62 / 1)"],
    "label": "Hull"
  },
  {
    "value": ["ipswich", "lch(10 80 297.55 / 1)"],
    "label": "Ipswich"
  },
  {
    "value": ["leeds", "lch(10 80 92.85 / 1)"],
    "label": "Leeds"
  },
  {
    "value": ["leicester", "lch(10 80 267.5 / 1)"],
    "label": "Leicester"
  },
  {
    "value": ["liverpool", "lch(10 80 35.97 / 1)"],
    "label": "Liverpool"
  },
  {
    "value": ["man-city", "lch(10 80 254.28 / 1)"],
    "label": "Man City"
  },
  {
    "value": ["man-united", "lch(10 80 46.41 / 1)"],
    "label": "Man United"
  },
  {
    "value": ["middlesbrough", "lch(10 80 24.6 / 1)"],
    "label": "Middlesbrough"
  },
  {
    "value": ["newcastle", "lch(10 80 69.98 / 1)"],
    "label": "Newcastle"
  },
  {
    "value": ["norwich", "lch(10 80 132.15 / 1)"],
    "label": "Norwich"
  },
  {
    "value": ["nottingham-forest", "lch(10 80 18.14 / 1)"],
    "label": "Nottingham Forest"
  },
  {
    "value": ["portsmouth", "lch(10 80 30.84 / 1)"],
    "label": "Portsmouth"
  },
  {
    "value": ["qpr", "lch(10 80 256.32 / 1)"],
    "label": "QPR"
  },
  {
    "value": ["reading", "lch(10 80 27.99 / 1)"],
    "label": "Reading"
  },
  {
    "value": ["sheffield-united", "lch(10 80 24.97 / 1)"],
    "label": "Sheffield United"
  },
  {
    "value": ["sheffield-weds", "lch(10 80 243.34 / 1)"],
    "label": "Sheffield Weds"
  },
  {
    "value": ["southampton", "lch(10 80 33.98 / 1)"],
    "label": "Southampton"
  },
  {
    "value": ["stoke", "lch(10 80 21.15 / 1)"],
    "label": "Stoke"
  },
  {
    "value": ["sunderland", "lch(10 80 38.12 / 1)"],
    "label": "Sunderland"
  },
  {
    "value": ["swansea", "lch(10 80 356.63 / 1)"],
    "label": "Swansea"
  },
  {
    "value": ["tottenham", "lch(10 80 284.71 / 1)"],
    "label": "Tottenham"
  },
  {
    "value": ["watford", "lch(10 80 44.62 / 1)"],
    "label": "Watford"
  },
  {
    "value": ["west-brom", "lch(10 80 291.41 / 1)"],
    "label": "West Brom"
  },
  {
    "value": ["west-ham", "lch(10 80 18.89 / 1)"],
    "label": "West Ham"
  },
  {
    "value": ["wigan", "lch(10 80 261.98 / 1)"],
    "label": "Wigan"
  },
  {
    "value": ["wimbledon", "lch(10 80 88.5 / 1)"],
    "label": "Wimbledon"
  },
  {
    "value": ["wolves", "lch(10 80 79.86 / 1)"],
    "label": "Wolves"
  }
]

// List of elements for #container
var teams = ["arsenal", "aston-villa", "barnsley", "birmingham", "blackburn", "blackpool", "bolton", "bournemouth", "bradford", "brentford", "brighton", "burnley", "cardiff", "charlton", "chelsea", "coventry", "crystal-palace", "derby", "everton", "fulham", "huddersfield", "hull", "ipswich", "leeds", "leicester", "liverpool", "man-city", "man-united", "middlesbrough", "newcastle", "norwich", "nottingham-forest", "portsmouth", "qpr", "reading", "sheffield-united", "sheffield-weds", "southampton", "stoke", "sunderland", "swansea", "tottenham", "watford", "west-brom", "west-ham", "wigan", "wimbledon", "wolves"]
