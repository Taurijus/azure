mapping = {}
-- x1, y1 - denotes upper left corner of rectangle
-- x2, y2 - denotes lower right corner of rectangle

function mapping.load()
	-- voidness coords (where player or dragon should not past)
	mapping.image = love.graphics.newImage(pre.."9.png")
	--mapping.image4 = love.graphics.newImage("images/11.png")
	mapping['wallImages'] = {}
	mapping.wallImages[1] = love.graphics.newImage("images/Siena1.png")
	mapping.wallImages[2] = love.graphics.newImage("images/Siena2.png")
	mapping.wallImages[3] = love.graphics.newImage("images/Siena3.png")
	mapping.wallImages[4] = love.graphics.newImage("images/Siena4.png")
	mapping.wallImages[5] = love.graphics.newImage("images/Siena5.png")
	mapping.wallImages[6] = love.graphics.newImage("images/Siena6.png")
	mapping.wallImages[7] = love.graphics.newImage("images/Siena7.png")
	mapping.wallImages[8] = love.graphics.newImage("images/Siena8.png")
	mapping.wallImages[9] = love.graphics.newImage("images/Siena9.png")
	mapping.wallImages[10] = love.graphics.newImage("images/Siena10.png")
	mapping.wallImages[11] = love.graphics.newImage("images/Siena11.png")
	mapping.wallImages[12] = love.graphics.newImage("images/Siena12.png")
	mapping.wallImages[13] = love.graphics.newImage("images/Siena13.png")
	mapping.wallImages[14] = love.graphics.newImage("images/Siena14.png")
	mapping.wallImages[15] = love.graphics.newImage("images/Siena15.png")
	mapping.wallImages[16] = love.graphics.newImage("images/Siena16.png")
	mapping.wallImages[17] = love.graphics.newImage("images/Siena17.png")
	
	--mapping.treeShow = true


	mapping.x = 0
	mapping.y = 0	
	mapping.xx = 0
	mapping.yy = 0
	mapping.file = love.filesystem.newFile("data.txt")
	mapping.file:open('w')


	--[[mapping['wall'] = {}
	mapping.wall[1] = {x1 = 839, y1 =406, x2 = 363, y2 = 686}
	mapping.wall[2] = {x1 = 363, y1 =686, x2 = 715, y2 = 1010}
	mapping.wall[3] = {x1 = 768, y1 =1054, x2 = 955, y2 = 1229}
	mapping.wall[4] = {x1 = 955, y1 =1229, x2 = 1217, y2 = 1018}
	mapping.wall[5] = {x1 = 1265, y1 =975, x2 = 1352, y2 = 905}
	mapping.wall[6] = {x1 = 1404, y1 =862, x2 = 1489, y2 = 795}
	mapping.wall[7] = {x1 = 1524, y1 =764, x2 = 1601, y2 = 702}
	mapping.wall[8] = {x1 = 1601, y1 =702, x2 = 1549, y2 = 666}
	mapping.wall[9] = {x1 = 1464, y1 =609, x2 = 1005, y2 = 310}
	mapping.wall[10] = {x1 = 1005, y1 =310, x2 = 892, y2 = 380}

	mapping.wall[11] = {x1 = 925, y1 =369, x2 = 985, y2 = 407}
	mapping.wall[12] = {x1 = 1254, y1 =482, x2 = 1189, y2 = 529}
	mapping.wall[13] = {x1 = 1154, y1 =505, x2 = 1308, y2 = 615}
	mapping.wall[14] = {x1 = 1486, y1 =677, x2 = 1360, y2 = 771}
	mapping.wall[15] = {x1 = 1192, y1 =777, x2 = 1093, y2 = 853}
	mapping.wall[16] = {x1 = 1221, y1 =876, x2 = 1071, y2 = 993}
	mapping.wall[17] = {x1 = 979, y1 =933, x2 = 884, y2 = 1005}
	mapping.wall[18] = {x1 = 803, y1 =935, x2 = 918, y2 = 1036}
	mapping.wall[19] = {x1 = 696, y1 =842, x2 = 670, y2 = 818}
	mapping.wall[20] = {x1 = 670, y1 =818, x2 = 735, y2 = 776}
	mapping.wall[21] = {x1 = 644, y1 =706, x2 = 586, y2 = 742}
	mapping.wall[22] = {x1 = 586, y1 =742, x2 = 470, y2 = 641}
		
	mapping.wall[23] = {x1 = 839, y1 =408, x2 = 738, y2 = 335}
	mapping.wall[24] = {x1 = 738, y1 =335, x2 = 657, y2 = 380}
	mapping.wall[25] = {x1 = 657, y1 =380, x2 = 732, y2 = 431}
	mapping.wall[26] = {x1 = 732, y1 =431, x2 = 336, y2 = 654}
	mapping.wall[27] = {x1 = 336, y1 =654, x2 = 268, y2 = 596}
	mapping.wall[28] = {x1 = 268, y1 =596, x2 = 113, y2 = 678}
	mapping.wall[29] = {x1 = 113, y1 =678, x2 = 173, y2 = 746}
	mapping.wall[30] = {x1 = 173, y1 =746, x2 = 282, y2 = 683}
	mapping.wall[31] = {x1 = 282, y1 =683, x2 = 425, y2 = 820}
	mapping.wall[32] = {x1 = 425, y1 =820, x2 = 317, y2 = 890}
	mapping.wall[33] = {x1 = 317, y1 =890, x2 = 389, y2 = 967}
	mapping.wall[34] = {x1 = 389, y1 =967, x2 = 501, y2 = 896}
	mapping.wall[35] = {x1 = 501, y1 =896, x2 = 623, y2 = 1012}
	mapping.wall[36] = {x1 = 623, y1 =1012, x2 = 571, y2 = 1052}
	mapping.wall[37] = {x1 = 571, y1 =1052, x2 = 611, y2 = 1093}
	mapping.wall[38] = {x1 = 611, y1 =1093, x2 = 711, y2 = 1023}
	mapping.wall[39] = {x1 = 758, y1 =1066, x2 = 595, y2 = 1179}
	mapping.wall[40] = {x1 = 595, y1 =1179, x2 = 468, y2 = 1050}
	mapping.wall[41] = {x1 = 468, y1 =1050, x2 = 522, y2 = 1012}
	mapping.wall[42] = {x1 = 522, y1 =1012, x2 = 487, y2 = 977}
	mapping.wall[43] = {x1 = 487, y1 =977, x2 = 367, y2 = 1049}
	mapping.wall[44] = {x1 = 367, y1 =1049, x2 = 21, y2 = 679}
	mapping.wall[45] = {x1 = 21, y1 =679, x2 = 290, y2 = 536}
	mapping.wall[46] = {x1 = 290, y1 =536, x2 = 355, y2 = 591}
	mapping.wall[47] = {x1 = 355, y1 =591, x2 = 452, y2 = 537}
	mapping.wall[48] = {x1 = 452, y1 =537, x2 = 388, y2 = 478}
	mapping.wall[49] = {x1 = 388, y1 =478, x2 = 745, y2 = 285}
	mapping.wall[50] = {x1 = 745, y1 =285, x2 = 883, y2 = 378}
	mapping.wall[51] = {x1 = 1473, y1 =605, x2 = 1540, y2 = 557}
	mapping.wall[52] = {x1 = 1540, y1 =557, x2 = 2009, y2 = 851}
	mapping.wall[53] = {x1 = 2009, y1 =851, x2 = 1690, y2 = 1162}
	mapping.wall[54] = {x1 = 1690, y1 =1162, x2 = 1575, y2 = 1080}
	mapping.wall[55] = {x1 = 1575, y1 =1080, x2 = 1436, y2 = 1201}
	mapping.wall[56] = {x1 = 1436, y1 =1201, x2 = 1223, y2 = 1029}
	mapping.wall[57] = {x1 = 1270, y1 =990, x2 = 1427, y2 = 1112}
	mapping.wall[58] = {x1 = 1427, y1 =1112, x2 = 1516, y2 = 1032}
	mapping.wall[59] = {x1 = 1516, y1 =1032, x2 = 1362, y2 = 915}
	mapping.wall[60] = {x1 = 1408, y1 =877, x2 = 1560, y2 = 992}
	mapping.wall[61] = {x1 = 1560, y1 =992, x2 = 1642, y2 = 918}
	mapping.wall[62] = {x1 = 1642, y1 =918, x2 = 1493, y2 = 810}
	mapping.wall[63] = {x1 = 1550, y1 =665, x2 = 1592, y2 = 638}
	mapping.wall[64] = {x1 = 1592, y1 =638, x2 = 1549, y2 = 618}
	mapping.wall[65] = {x1 = 1549, y1 =618, x2 = 1748, y2 = 744}
	mapping.wall[66] = {x1 = 1748, y1 =744, x2 = 1676, y2 = 810}
	mapping.wall[67] = {x1 = 1676, y1 =810, x2 = 1837, y2 = 921}
	mapping.wall[68] = {x1 = 1837, y1 =921, x2 = 1676, y2 = 1072}
	mapping.wall[69] = {x1 = 1676, y1 =1072, x2 = 1621, y2 = 1034}
	mapping.wall[70] = {x1 = 1621, y1 =1034, x2 = 1743, y2 = 919}
	mapping.wall[71] = {x1 = 1743, y1 =919, x2 = 1535, y2 = 776}
	mapping.wall[72] = {x1 = 771, y1 =617, x2 = 872, y2 = 554}
	mapping.wall[73] = {x1 = 942, y1 =518, x2 = 967, y2 = 502}
	mapping.wall[74] = {x1 = 967, y1 =502, x2 = 891, y2 = 449}]]
	mapping['wall'] = {}
mapping.wall[1] = {x1 = 961, y1 = 1218, x2 = 775, y2 = 1048}
mapping.wall[2] = {x1 = 1206, y1 = 1016.427827537, x2 = 945.73280081791, y2 = 1217.427827537}
mapping.wall[3] = {x1 = 1200, y1 = 1015.8018880601, x2 = 1416.7587409938, y2 = 1198.8018880601}
mapping.wall[4] = {x1 = 1391, y1 = 1192.8018880601, x2 = 1469.7587409938, y2 = 1196.8018880601}
mapping.wall[5] = {x1 = 1448, y1 = 1203.411578175, x2 = 1556.85722684, y2 = 1101.411578175}
mapping.wall[6] = {x1 = 1549, y1 = 1102.411578175, x2 = 1599.85722684, y2 = 1098.411578175}
mapping.wall[7] = {x1 = 1592, y1 = 1094.411578175, x2 = 1661.85722684, y2 = 1147.411578175}
mapping.wall[8] = {x1 = 1651, y1 = 1143.411578175, x2 = 1728.85722684, y2 = 1136.411578175}
mapping.wall[9] = {x1 = 1715, y1 = 1142.7432179996, x2 = 1994.9168249336, y2 = 871.7432179996}
mapping.wall[10] = {x1 = 1990, y1 = 883.7432179996, x2 = 1983.9168249336, y2 = 816.7432179996}
mapping.wall[11] = {x1 = 1995, y1 = 827.50061251779, x2 = 1561.0039521905, y2 = 562.50061251779}
mapping.wall[12] = {x1 = 1585, y1 = 569.21565951135, x2 = 1503.8322853027, y2 = 564.21565951135}
mapping.wall[13] = {x1 = 1530, y1 = 557.21565951135, x2 = 1459.8322853027, y2 = 616.21565951135}
mapping.wall[14] = {x1 = 1467, y1 = 616.79759132265, x2 = 997.30161948398, y2 = 315.79759132265}
mapping.wall[15] = {x1 = 1269, y1 = 481.79759132265, x2 = 1198.301619484, y2 = 530.79759132265}
mapping.wall[16] = {x1 = 1160, y1 = 499.79759132265, x2 = 1323.301619484, y2 = 609.79759132265}
mapping.wall[17] = {x1 = 1186, y1 = 522.79759132265, x2 = 1255.301619484, y2 = 471.79759132265}
mapping.wall[18] = {x1 = 1324, y1 = 603.79759132265, x2 = 1304.301619484, y2 = 618.79759132265}
mapping.wall[19] = {x1 = 1310, y1 = 619.79759132265, x2 = 1150.301619484, y2 = 508.79759132265}
mapping.wall[20] = {x1 = 1150, y1 = 513.79759132265, x2 = 1167.301619484, y2 = 499.79759132265}
mapping.wall[21] = {x1 = 1005, y1 = 315.96850353177, x2 = 891.33513281995, y2 = 386.96850353177}
mapping.wall[22] = {x1 = 923, y1 = 353.96850353177, x2 = 1000.3351328199, y2 = 408.96850353177}
mapping.wall[23] = {x1 = 910, y1 = 362.96850353177, x2 = 985.33513281995, y2 = 416.96850353177}
mapping.wall[24] = {x1 = 979, y1 = 416.96850353177, x2 = 999.33513281995, y2 = 404.96850353177}
mapping.wall[25] = {x1 = 769, y1 = 297.96850353177, x2 = 899.33513281995, y2 = 387.96850353177}
mapping.wall[26] = {x1 = 786, y1 = 303.3798616131, x2 = 707.34649219173, y2 = 294.3798616131}
mapping.wall[27] = {x1 = 723, y1 = 289.3798616131, x2 = 407.34684422798, y2 = 460.77683095882}
mapping.wall[28] = {x1 = 413, y1 = 442.77683095882, x2 = 407.34684422798, y2 = 509.77683095882}
mapping.wall[29] = {x1 = 402, y1 = 492.77683095882, x2 = 437.34684422798, y2 = 525.77683095882}
mapping.wall[30] = {x1 = 433, y1 = 517.77683095882, x2 = 433.34684422798, y2 = 551.77683095882}
mapping.wall[31] = {x1 = 438, y1 = 544.77683095882, x2 = 373.34684422798, y2 = 582.77683095882}
mapping.wall[32] = {x1 = 381, y1 = 580.77683095882, x2 = 322.34684422798, y2 = 571.77683095882}
mapping.wall[33] = {x1 = 306, y1 = 543.77683095882, x2 = 333.34684422798, y2 = 576.77683095882}
mapping.wall[34] = {x1 = 319, y1 = 549.19247208259, x2 = 257.53120388801, y2 = 542.19247208259}
mapping.wall[35] = {x1 = 265, y1 = 540.69137456939, x2 = 42.310834633614, y2 = 664.58906279913}
mapping.wall[36] = {x1 = 48, y1 = 651.58906279913, x2 = 38.310834633614, y2 = 707.58906279913}
mapping.wall[37] = {x1 = 34, y1 = 696.34807022422, x2 = 342.71721939906, y2 = 1033.3480702242}
mapping.wall[38] = {x1 = 322, y1 = 1026.3480702242, x2 = 397.71721939906, y2 = 1043.3480702242}
mapping.wall[39] = {x1 = 387, y1 = 1047.3480702242, x2 = 479.71721939906, y2 = 986.34807022422}
mapping.wall[40] = {x1 = 505, y1 = 1006.3480702242, x2 = 473.71721939906, y2 = 985.34807022422}
mapping.wall[41] = {x1 = 500, y1 = 995.34807022422, x2 = 494.71721939906, y2 = 1036.3480702242}
mapping.wall[42] = {x1 = 499, y1 = 1025.4492380777, x2 = 460.38754611831, y2 = 1053.4492380777}
mapping.wall[43] = {x1 = 469, y1 = 1029.4492380777, x2 = 482.38754611831, y2 = 1094.4492380777}
mapping.wall[44] = {x1 = 468, y1 = 1068.4492380777, x2 = 578.38754611831, y2 = 1170.4492380777}
mapping.wall[45] = {x1 = 559, y1 = 1163.4492380777, x2 = 648.38754611831, y2 = 1167.4492380777}
mapping.wall[46] = {x1 = 630, y1 = 1174.4492380777, x2 = 780.38754611831, y2 = 1050.4492380777}
mapping.wall[47] = {x1 = 848, y1 = 414.34946833158, x2 = 377.10869957206, y2 = 689.34946833158}
mapping.wall[48] = {x1 = 374, y1 = 674.4839905705, x2 = 731.44322296136, y2 = 1008.4839905705}
mapping.wall[49] = {x1 = 628, y1 = 1079.2525281554, x2 = 731.87468225768, y2 = 1003.2525281554}
mapping.wall[50] = {x1 = 641, y1 = 1074.2525281554, x2 = 590.87468225768, y2 = 1078.2525281554}
mapping.wall[51] = {x1 = 582, y1 = 1060.2525281554, x2 = 599.87468225768, y2 = 1078.2525281554}
mapping.wall[52] = {x1 = 586, y1 = 1067.2525281554, x2 = 588.87468225768, y2 = 1039.2525281554}
mapping.wall[53] = {x1 = 583, y1 = 1047.2525281554, x2 = 610.87468225768, y2 = 1022.2525281554}
mapping.wall[54] = {x1 = 609, y1 = 1034.2525281554, x2 = 601.87468225768, y2 = 979.25252815538}
mapping.wall[55] = {x1 = 610, y1 = 995.25252815538, x2 = 516.87468225768, y2 = 906.25252815538}
mapping.wall[56] = {x1 = 526, y1 = 912.25252815538, x2 = 475.87468225768, y2 = 900.25252815538}
mapping.wall[57] = {x1 = 486, y1 = 897.25252815538, x2 = 407.87468225768, y2 = 950.25252815538}
mapping.wall[58] = {x1 = 419, y1 = 946.25252815538, x2 = 362.87468225768, y2 = 935.25252815538}
mapping.wall[59] = {x1 = 372, y1 = 938.25252815538, x2 = 329.87468225768, y2 = 902.25252815538}
mapping.wall[60] = {x1 = 335, y1 = 909.25252815538, x2 = 332.87468225768, y2 = 884.25252815538}
mapping.wall[61] = {x1 = 329, y1 = 890.25252815538, x2 = 414.87468225768, y2 = 832.25252815538}
mapping.wall[62] = {x1 = 410, y1 = 842.25252815538, x2 = 410.87468225768, y2 = 784.25252815538}
mapping.wall[63] = {x1 = 416, y1 = 803.25252815538, x2 = 293.87468225768, y2 = 685.25252815538}
mapping.wall[64] = {x1 = 320, y1 = 701.25252815538, x2 = 249.87468225768, y2 = 685.25252815538}
mapping.wall[65] = {x1 = 268, y1 = 682.02683561979, x2 = 184.05446194873, y2 = 733.02683561979}
mapping.wall[66] = {x1 = 199, y1 = 730.02683561979, x2 = 141.05446194873, y2 = 718.02683561979}
mapping.wall[67] = {x1 = 153, y1 = 727.02683561979, x2 = 125.05446194873, y2 = 686.02683561979}
mapping.wall[68] = {x1 = 125, y1 = 698.02683561979, x2 = 133.05446194873, y2 = 669.02683561979}
mapping.wall[69] = {x1 = 128, y1 = 675.02683561979, x2 = 250.05446194873, y2 = 608.02683561979}
mapping.wall[70] = {x1 = 240, y1 = 608.03200748161, x2 = 293.84928772209, y2 = 612.03200748161}
mapping.wall[71] = {x1 = 285, y1 = 608.03200748161, x2 = 319.84928772209, y2 = 639.03200748161}
mapping.wall[72] = {x1 = 306, y1 = 634.03200748161, x2 = 364.84928772209, y2 = 644.03200748161}
mapping.wall[73] = {x1 = 355, y1 = 645.03200748161, x2 = 712.84928772209, y2 = 443.03200748161}
mapping.wall[74] = {x1 = 673, y1 = 376.03200748161, x2 = 717.84928772209, y2 = 344.03200748161}
mapping.wall[75] = {x1 = 756, y1 = 350.71811795159, x2 = 710.68352989815, y2 = 348.71811795159}
mapping.wall[76] = {x1 = 744, y1 = 346.71811795159, x2 = 846.68352989815, y2 = 416.71811795159}
mapping.wall[77] = {x1 = 676, y1 = 367.71811795159, x2 = 681.68352989815, y2 = 401.71811795159}
mapping.wall[78] = {x1 = 678, y1 = 389.71811795159, x2 = 717.68352989815, y2 = 421.71811795159}
mapping.wall[79] = {x1 = 713, y1 = 399.71811795159, x2 = 698.68352989815, y2 = 465.71811795159}
mapping.wall[80] = {x1 = 885, y1 = 451.71811795159, x2 = 962.68352778218, y2 = 504.71811795159}
mapping.wall[81] = {x1 = 965, y1 = 492.71811795159, x2 = 933.68352778218, y2 = 516.71811795159}
mapping.wall[82] = {x1 = 935, y1 = 507.71811795159, x2 = 952.68352778218, y2 = 521.71811795159}
mapping.wall[83] = {x1 = 944, y1 = 524.71811795159, x2 = 980.68352778218, y2 = 501.71811795159}
mapping.wall[84] = {x1 = 984, y1 = 507.71811795159, x2 = 894.68352778218, y2 = 445.71811795159}
mapping.wall[85] = {x1 = 902, y1 = 446.71811795159, x2 = 883.68352778218, y2 = 455.71811795159}
mapping.wall[86] = {x1 = 861, y1 = 558.71811795159, x2 = 877.68352778218, y2 = 568.71811795159}
mapping.wall[87] = {x1 = 880, y1 = 563.71811795159, x2 = 778.68352778218, y2 = 628.71811795159}
mapping.wall[88] = {x1 = 767, y1 = 614.71811795159, x2 = 784.68352778218, y2 = 628.71811795159}
mapping.wall[89] = {x1 = 867, y1 = 557.71811795159, x2 = 766.68352778218, y2 = 620.71811795159}
mapping.wall[90] = {x1 = 597, y1 = 734.71811795159, x2 = 472.68352778218, y2 = 625.71811795159}
mapping.wall[91] = {x1 = 634, y1 = 702.71811795159, x2 = 582.68352778218, y2 = 730.71811795159}
mapping.wall[92] = {x1 = 627, y1 = 700.71811795159, x2 = 646.68352778218, y2 = 715.71811795159}
mapping.wall[93] = {x1 = 647, y1 = 710.71811795159, x2 = 584.68352778218, y2 = 751.71811795159}
mapping.wall[94] = {x1 = 454, y1 = 632.71811795159, x2 = 590.68352778218, y2 = 749.71811795159}
mapping.wall[95] = {x1 = 661, y1 = 818.83900382847, x2 = 692.64210232559, y2 = 847.83900382847}
mapping.wall[96] = {x1 = 688, y1 = 847.83900382847, x2 = 707.64210232559, y2 = 833.83900382847}
mapping.wall[97] = {x1 = 682, y1 = 814.83900382847, x2 = 707.64210232559, y2 = 837.83900382847}
mapping.wall[98] = {x1 = 680, y1 = 820.83900382847, x2 = 738.64210232559, y2 = 782.83900382847}
mapping.wall[99] = {x1 = 739, y1 = 787.83900382847, x2 = 721.64210232559, y2 = 773.83900382847}
mapping.wall[100] = {x1 = 728, y1 = 772.83900382847, x2 = 660.64210232559, y2 = 820.83900382847}
mapping.wall[101] = {x1 = 801, y1 = 944.83900382847, x2 = 915.24210136595, y2 = 1044.8390038285}
mapping.wall[102] = {x1 = 930, y1 = 1032.8390038285, x2 = 814.24210136595, y2 = 933.83900382847}
mapping.wall[103] = {x1 = 819, y1 = 934.83900382847, x2 = 802.24210136595, y2 = 948.83900382847}
mapping.wall[104] = {x1 = 908, y1 = 1043.8390038285, x2 = 932.24210136595, y2 = 1027.8390038285}
mapping.wall[105] = {x1 = 894, y1 = 1006.8390038285, x2 = 989.24210136595, y2 = 940.83900382847}
mapping.wall[106] = {x1 = 968, y1 = 929.83900382847, x2 = 987.24210136595, y2 = 943.83900382847}
mapping.wall[107] = {x1 = 977, y1 = 926.83900382847, x2 = 874.24210136595, y2 = 1000.8390038285}
mapping.wall[108] = {x1 = 1086, y1 = 847.83900382847, x2 = 1105.242101366, y2 = 860.83900382847}
mapping.wall[109] = {x1 = 1182, y1 = 772.83900382847, x2 = 1201.242101366, y2 = 786.83900382847}
mapping.wall[110] = {x1 = 1205, y1 = 778.83900382847, x2 = 1097.242101366, y2 = 861.83900382847}
mapping.wall[111] = {x1 = 1085, y1 = 852.83900382847, x2 = 1188.242101366, y2 = 771.83900382847}
mapping.wall[112] = {x1 = 1066, y1 = 985.02378059497, x2 = 1083.5714517191, y2 = 999.02378059497}
mapping.wall[113] = {x1 = 1212, y1 = 871.02378059497, x2 = 1231.5714517191, y2 = 887.02378059497}
mapping.wall[114] = {x1 = 1232, y1 = 880.02378059497, x2 = 1078.5714517191, y2 = 997.02378059497}
mapping.wall[115] = {x1 = 1067, y1 = 991.02378059497, x2 = 1216.5714517191, y2 = 871.02378059497}
mapping.wall[116] = {x1 = 1252, y1 = 977.75929679456, x2 = 1400.3789180193, y2 = 1091.7592967946}
mapping.wall[117] = {x1 = 1388, y1 = 1087.7592967946, x2 = 1453.3789180193, y2 = 1095.7592967946}
mapping.wall[118] = {x1 = 1444, y1 = 1095.7592967946, x2 = 1498.3789180193, y2 = 1046.7592967946}
mapping.wall[119] = {x1 = 1482, y1 = 1003.7592967946, x2 = 1498.3789180193, y2 = 1052.7592967946}
mapping.wall[120] = {x1 = 1346, y1 = 903.75929679456, x2 = 1488.3789180193, y2 = 1012.7592967946}
mapping.wall[121] = {x1 = 1353, y1 = 903.75929679456, x2 = 1253.3789180193, y2 = 983.75929679456}
mapping.wall[122] = {x1 = 1391, y1 = 868.6132923253, x2 = 1545.5249231517, y2 = 980.6132923253}
mapping.wall[123] = {x1 = 1537, y1 = 978.6132923253, x2 = 1585.5249231517, y2 = 971.6132923253}
mapping.wall[124] = {x1 = 1576, y1 = 974.6132923253, x2 = 1631.5249231517, y2 = 927.6132923253}
mapping.wall[125] = {x1 = 1620, y1 = 896.6132923253, x2 = 1629.5249231517, y2 = 931.6132923253}
mapping.wall[126] = {x1 = 1626, y1 = 907.6132923253, x2 = 1474.5249231517, y2 = 801.6132923253}
mapping.wall[127] = {x1 = 1481, y1 = 800.6132923253, x2 = 1390.5249231517, y2 = 871.6132923253}
mapping.wall[128] = {x1 = 1521, y1 = 764.6132923253, x2 = 1731.5249231517, y2 = 907.6132923253}
mapping.wall[129] = {x1 = 1722, y1 = 877.6132923253, x2 = 1721.5249231517, y2 = 961.6132923253}
mapping.wall[130] = {x1 = 1749, y1 = 911.6132923253, x2 = 1636.5249231517, y2 = 1022.6132923253}
mapping.wall[131] = {x1 = 1640, y1 = 1010.6132923253, x2 = 1644.5249231517, y2 = 1050.6132923253}
mapping.wall[132] = {x1 = 1638, y1 = 1038.6132923253, x2 = 1671.5249231517, y2 = 1064.6132923253}
mapping.wall[133] = {x1 = 1662, y1 = 1061.6132923253, x2 = 1702.5249231517, y2 = 1052.6132923253}
mapping.wall[134] = {x1 = 1692, y1 = 1057.6132923253, x2 = 1822.3249223887, y2 = 934.6132923253}
mapping.wall[135] = {x1 = 1807, y1 = 898.6132923253, x2 = 1818.3249223887, y2 = 940.6132923253}
mapping.wall[136] = {x1 = 1817, y1 = 909.6132923253, x2 = 1682.3249223887, y2 = 813.6132923253}
mapping.wall[137] = {x1 = 1700, y1 = 840.6132923253, x2 = 1685.3249223887, y2 = 786.6132923253}
mapping.wall[138] = {x1 = 1682, y1 = 804.6132923253, x2 = 1734.3249223887, y2 = 755.6132923253}
mapping.wall[139] = {x1 = 1717, y1 = 723.6132923253, x2 = 1731.3249223887, y2 = 761.6132923253}
mapping.wall[140] = {x1 = 1725, y1 = 732.6132923253, x2 = 1568.3249223887, y2 = 630.6132923253}
mapping.wall[141] = {x1 = 1578, y1 = 633.6132923253, x2 = 1536.3249223887, y2 = 627.6132923253}
mapping.wall[142] = {x1 = 1541, y1 = 622.6132923253, x2 = 1511.3249223887, y2 = 651.6132923253}
mapping.wall[143] = {x1 = 1512, y1 = 644.6132923253, x2 = 1592.3249223887, y2 = 699.6132923253}
mapping.wall[144] = {x1 = 1598, y1 = 693.6132923253, x2 = 1521.3249223887, y2 = 769.6132923253}
mapping.wall[145] = {x1 = 1366, y1 = 777.6132923253, x2 = 1495.3249223887, y2 = 679.6132923253}
mapping.wall[146] = {x1 = 1479, y1 = 671.6132923253, x2 = 1496.3249223887, y2 = 683.6132923253}
mapping.wall[147] = {x1 = 1489, y1 = 669.6132923253, x2 = 1353.3249223887, y2 = 770.6132923253}
mapping.wall[148] = {x1 = 1352, y1 = 765.6132923253, x2 = 1370.3249223887, y2 = 776.6132923253}
mapping.wall[149] = {x1 = 1772, y1 = 797.7317582521, x2 = 1781.0064565782, y2 = 820.7317582521}
mapping.wall[150] = {x1 = 1775, y1 = 813.7317582521, x2 = 1872.0064565782, y2 = 875.7317582521}
mapping.wall[151] = {x1 = 1858, y1 = 874.7317582521, x2 = 1892.0064565782, y2 = 868.7317582521}
mapping.wall[152] = {x1 = 1906, y1 = 843.7317582521, x2 = 1881.0064565782, y2 = 875.7317582521}
mapping.wall[153] = {x1 = 1903, y1 = 854.7317582521, x2 = 1878.0064565782, y2 = 823.7317582521}
mapping.wall[154] = {x1 = 1891, y1 = 834.7317582521, x2 = 1808.0064565782, y2 = 786.7317582521}
mapping.wall[155] = {x1 = 1827, y1 = 785.7317582521, x2 = 1781.0064565782, y2 = 793.7317582521}
mapping.wall[156] = {x1 = 1797, y1 = 786.7317582521, x2 = 1772.0064565782, y2 = 806.7317582521}
mapping.wall[157] = {x1 = 1670, y1 = 750.7317582521, x2 = 1646.0064565782, y2 = 762.7317582521}
mapping.wall[158] = {x1 = 1659, y1 = 740.7317582521, x2 = 1616.0064565782, y2 = 752.7317582521}
	
	
end



function mapping.wallTouch()
	for i = 1, #mapping.wall do
		local width = love.graphics.getWidth()
		local height = love.graphics.getHeight()
		local vx1 = mapping.wall[i].x1 + PlayerI.x
		local vy1 = mapping.wall[i].y1 + PlayerI.y
		local vx2 = mapping.wall[i].x2 + PlayerI.x
		local vy2 = mapping.wall[i].y2 + PlayerI.y
		local vx3 = mapping.wall[i].x2 - mapping.wall[i].x1
		local vy3 = mapping.wall[i].y2 - mapping.wall[i].y1

		if math.abs(math.sqrt(vx3*vx3+vy3*vy3)-math.sqrt(vx2*vx2+vy2*vy2)-math.sqrt(vx1*vx1+vy1*vy1)) < 3 then
			return true
		end
			
	end
	return false
end

function mapping.update(dt)

--[[	if love.mouse.isDown("l") then
		local x, y = love.mouse.getPosition()
		mapping.xx = x
		mapping.yy = y
		--mapping.file.write( tostring(mapping.xx+mapping.x .. ' '..  mapping.yy+mapping.y)) 
	end]]
	
end
function mapping.draw()

	love.graphics.draw(mapping.image, mapping.x, mapping.y)
	-- love.graphics.setColor( 255, 255, 0, 100 ) --Debug version (cool color)
	-- nice color my ass..
	for i = 1, #mapping.wallImages do
		love.graphics.draw(mapping.wallImages[i], mapping.x, mapping.y)
	end
	--[[
	for i = 1, #mapping.wall do
                       --love.graphics.print(tostring(mapping.wall[i][j].x1), j * 50, i * 10)
		local xx1 = mapping.wall[i].x1
		local yy1 = mapping.wall[i].y1
		local xx2 = mapping.wall[i].x2
		local yy2 = mapping.wall[i].y2
		love.graphics.line(xx1,yy1,xx2,yy2)
	end
	]]
	

end

-- sakys true, jei yra nors viena besikertanti siena
function mapping.intersect (x1, y1, x2, y2)		
	for i = 1, #mapping.wall do 				-- per visas sienas
		local denom = (mapping.wall[i].y2 - mapping.wall[i].y1) * (x2 - x1) - (mapping.wall[i].x2 - mapping.wall[i].x1) * (y2 - y1)
		if denom ~= 0 then
			local ua = ((mapping.wall[i].x2 - mapping.wall[i].x1) * (y1 - mapping.wall[i].y1) - (mapping.wall[i].y2 - mapping.wall[i].y1) * (x1 - mapping.wall[i].x1)) / denom
			if ua > 0 and ua < 1 then				
				local ub = ((x2 - x1) * (y1 - mapping.wall[i].y1) - (y2 - y1) * (x1 - mapping.wall[i].x1)) / denom
				if ub > 0 and ub < 1
					then
						return true, i
				end
			end
		end	
	end
	return false, 0
end

