_xp = _this;
_out = [0,0]; //rank, xp to next rank

switch (TRUE) do {

case (_xp < 300): {_out = [1,300];};
case (_xp < 600): {_out = [2,600];};
case (_xp < 900): {_out = [3,900];};
case (_xp < 1300): {_out = [4,1300];};
case (_xp < 1700): {_out = [5,1700];};
case (_xp < 2100): {_out = [6,2100];};
case (_xp < 2600): {_out = [7,2600];};
case (_xp < 3100): {_out = [8,3100];};
case (_xp < 3600): {_out = [9,3600];};
case (_xp < 4200): {_out = [10,4200];};
case (_xp < 4800): {_out = [11,4800];};
case (_xp < 5400): {_out = [12,5400];};
case (_xp < 6200): {_out = [13,6200];};
case (_xp < 7000): {_out = [14,7000];};
case (_xp < 8000): {_out = [15,8000];};
case (_xp < 9000): {_out = [16,9000];};
case (_xp < 10000): {_out = [17,10000];};
case (_xp < 12000): {_out = [18,12000];};
case (_xp < 14000): {_out = [19,14000];};
case (_xp < 16000): {_out = [20,16000];};
case (_xp < 19000): {_out = [21,19000];};
case (_xp < 22000): {_out = [22,22000];};
case (_xp < 25000): {_out = [23,25000];};
case (_xp < 28000): {_out = [24,28000];};
case (_xp < 31000): {_out = [25,31000];};
case (_xp < 34000): {_out = [26,34000];};
case (_xp < 37000): {_out = [27,37000];};
case (_xp < 40000): {_out = [28,40000];};
case (_xp < 45000): {_out = [29,45000];};
case (_xp < 50000): {_out = [30,50000];};
case (_xp < 55000): {_out = [31,55000];};
case (_xp < 60000): {_out = [32,60000];};
case (_xp < 65000): {_out = [33,65000];};
case (_xp < 70000): {_out = [34,70000];};
case (_xp < 75000): {_out = [35,75000];};
case (_xp < 80000): {_out = [36,80000];};
case (_xp < 85000): {_out = [37,85000];};
case (_xp < 90000): {_out = [38,90000];};
case (_xp < 100000): {_out = [39,100000];};
case (_xp < 110000): {_out = [40,110000];};
case (_xp < 120000): {_out = [41,120000];};
case (_xp < 130000): {_out = [42,130000];};
case (_xp < 140000): {_out = [43,140000];};
case (_xp < 150000): {_out = [44,150000];};
case (_xp < 180000): {_out = [45,180000];};
case (_xp < 210000): {_out = [46,210000];};
case (_xp < 240000): {_out = [47,240000];};
case (_xp < 280000): {_out = [48,280000];};
case (_xp < 320000): {_out = [49,320000];};
case (_xp < 360000): {_out = [50,360000];};
case (_xp < 400000): {_out = [51,400000];};
case (_xp < 450000): {_out = [52,450000];};
case (_xp < 500000): {_out = [53,500000];};
case (_xp < 550000): {_out = [54,550000];};
case (_xp < 625000): {_out = [55,625000];};
case (_xp < 700000): {_out = [56,700000];};
case (_xp < 800000): {_out = [57,800000];};
case (_xp < 900000): {_out = [58,900000];};
case (_xp < 1000000): {_out = [59,1000000];};

default {_out = [60,0];};};

_out