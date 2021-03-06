--hero_skill_effect

local hero_skill_effect = {
    -- key
    __key_map = {
      buff_type = 1,    --buff类型-int 
      buff_sum_txt = 2,    --buff统计文本-string 
    
    },
    -- data
    _data = {
        [1] = {2101,"",},
        [2] = {2102,"",},
        [3] = {2103,"",},
        [4] = {2104,"",},
        [5] = {2114,"",},
        [6] = {3333,"",},
        [7] = {2105,"",},
        [8] = {2106,"",},
        [9] = {2108,"Tăng Nộ|điểm",},
        [10] = {2121,"",},
        [11] = {2302,"",},
        [12] = {2308,"",},
        [13] = {2311,"",},
        [14] = {2335,"",},
        [15] = {2336,"",},
        [16] = {2351,"",},
        [17] = {2201,"",},
        [18] = {2202,"Tê Liệt|người",},
        [19] = {2203,"Choáng|người",},
        [20] = {2204,"Trầm Mặc|người",},
        [21] = {2205,"",},
        [22] = {2117,"",},
        [23] = {2110,"",},
        [24] = {2109,"Giảm Nộ|điểm",},
        [25] = {2306,"",},
        [26] = {2307,"",},
        [27] = {2303,"",},
        [28] = {2107,"",},
        [29] = {2401,"",},
        [30] = {2402,"",},
        [31] = {2206,"Choáng|người",},
        [32] = {2309,"",},
        [33] = {2113,"",},
        [34] = {2338,"",},
        [35] = {2339,"",},
        [36] = {2340,"",},
        [37] = {2341,"",},
        [38] = {2342,"",},
        [39] = {2343,"",},
        [40] = {2344,"",},
        [41] = {2345,"Cứu|người",},
        [42] = {2362,"",},
        [43] = {2363,"",},
        [44] = {2365,"",},
        [45] = {2370,"Trầm Mặc|người",},
        [46] = {2367,"",},
        [47] = {2368,"",},
        [48] = {2373,"",},
        [49] = {2374,"",},
        [50] = {2369,"",},
        [51] = {2352,"",},
        [52] = {2375,"",},
        [53] = {2359,"",},
        [54] = {2376,"Trúng|người",},
        [55] = {2377,"",},
        [56] = {2378,"",},
        [57] = {2379,"",},
        [58] = {2380,"",},
        [59] = {2381,"",},
        [60] = {2382,"Choáng|người",},
        [61] = {2383,"",},
        [62] = {2384,"",},
        [63] = {2385,"",},
        [64] = {2392,"",},
        [65] = {2393,"Trầm Mặc|người",},
        [66] = {2394,"Choáng|người",},
        [67] = {2395,"Choáng|người",},
        [68] = {2396,"Trầm Mặc|người",},
        [69] = {2397,"Trầm Mặc|người",},
        [70] = {2399,"",},
        [71] = {2400,"Tăng Nộ|điểm",},
        [72] = {2403,"",},
        [73] = {2404,"",},
        [74] = {2405,"Tăng Nộ|điểm",},
        [75] = {2407,"",},
        [76] = {3001,"",},
        [77] = {3002,"",},
        [78] = {3003,"",},
        [79] = {3004,"",},
        [80] = {3005,"",},
        [81] = {3006,"",},
        [82] = {3007,"",},
        [83] = {3008,"",},
        [84] = {2410,"Tăng Nộ|điểm",},
        [85] = {2411,"",},
        [86] = {2412,"Lưu Đày|người",},
        [87] = {2414,"",},
        [88] = {2416,"",},
        [89] = {2419,"",},
        [90] = {2420,"",},
        [91] = {2421,"",},
        [92] = {2422,"",},
        [93] = {2423,"",},
        [94] = {2424,"",},
        [95] = {2425,"",},
        [96] = {2426,"",},
        [97] = {2427,"Đánh Bay|người",},
        [98] = {2428,"",},
        [99] = {2429,"",},
        [100] = {2432,"",},
        [101] = {2433,"Tăng Nộ|điểm",},
        [102] = {2435,"",},
        [103] = {2437,"",},
        [104] = {2439,"",},
        [105] = {2440,"",},
        [106] = {2441,"",},
        [107] = {2443,"",},
        [108] = {2444,"Suy Yếu | người",},
        [109] = {2446,"",},
        [110] = {2447,"",},
        [111] = {2448,"",},
        [112] = {2449,"Áp Chế|Người",},
        [113] = {2450,"Áp Chế|Người",},
        [114] = {2453,"",},
        [115] = {2454,"Tăng Nộ|điểm",},
        [116] = {2456,"",},
        [117] = {2457,"",},
        [118] = {2458,"",},
        [119] = {2459,"",},
        [120] = {2461,"",},
        [121] = {2462,"Xóa Choáng, Thiêu Đốt|Người",},
        [122] = {2463,"Xóa Áp Chế, Suy Yếu | người",},
        [123] = {2464,"",},
        [124] = {2465,"Tăng Nộ|điểm",},
        [125] = {2469,"",},
        [126] = {2474,"",},
        [127] = {2475,"",},
        [128] = {2481,"",},
        [129] = {2483,"",},
        [130] = {2484,"",},
        [131] = {2485,"",},
        [132] = {2487,"",},
        [133] = {2489,"Choáng|người",},
        [134] = {2490,"",},
        [135] = {2491,"",},
        [136] = {2492,"Choáng|người",},
        [137] = {2493,"",},
        [138] = {2494,"",},
        [139] = {2495,"",},
        [140] = {2496,"Tăng Nộ|điểm",},
        [141] = {2497,"",},
        [142] = {2498,"",},
        [143] = {2499,"",},
        [144] = {2500,"",},
        [145] = {4001,"",},
    },

    -- index
    __index_buff_type = {
        [2101] = 1,
        [2102] = 2,
        [2103] = 3,
        [2104] = 4,
        [2105] = 7,
        [2106] = 8,
        [2107] = 28,
        [2108] = 9,
        [2109] = 24,
        [2110] = 23,
        [2113] = 33,
        [2114] = 5,
        [2117] = 22,
        [2121] = 10,
        [2201] = 17,
        [2202] = 18,
        [2203] = 19,
        [2204] = 20,
        [2205] = 21,
        [2206] = 31,
        [2302] = 11,
        [2303] = 27,
        [2306] = 25,
        [2307] = 26,
        [2308] = 12,
        [2309] = 32,
        [2311] = 13,
        [2335] = 14,
        [2336] = 15,
        [2338] = 34,
        [2339] = 35,
        [2340] = 36,
        [2341] = 37,
        [2342] = 38,
        [2343] = 39,
        [2344] = 40,
        [2345] = 41,
        [2351] = 16,
        [2352] = 51,
        [2359] = 53,
        [2362] = 42,
        [2363] = 43,
        [2365] = 44,
        [2367] = 46,
        [2368] = 47,
        [2369] = 50,
        [2370] = 45,
        [2373] = 48,
        [2374] = 49,
        [2375] = 52,
        [2376] = 54,
        [2377] = 55,
        [2378] = 56,
        [2379] = 57,
        [2380] = 58,
        [2381] = 59,
        [2382] = 60,
        [2383] = 61,
        [2384] = 62,
        [2385] = 63,
        [2392] = 64,
        [2393] = 65,
        [2394] = 66,
        [2395] = 67,
        [2396] = 68,
        [2397] = 69,
        [2399] = 70,
        [2400] = 71,
        [2401] = 29,
        [2402] = 30,
        [2403] = 72,
        [2404] = 73,
        [2405] = 74,
        [2407] = 75,
        [2410] = 84,
        [2411] = 85,
        [2412] = 86,
        [2414] = 87,
        [2416] = 88,
        [2419] = 89,
        [2420] = 90,
        [2421] = 91,
        [2422] = 92,
        [2423] = 93,
        [2424] = 94,
        [2425] = 95,
        [2426] = 96,
        [2427] = 97,
        [2428] = 98,
        [2429] = 99,
        [2432] = 100,
        [2433] = 101,
        [2435] = 102,
        [2437] = 103,
        [2439] = 104,
        [2440] = 105,
        [2441] = 106,
        [2443] = 107,
        [2444] = 108,
        [2446] = 109,
        [2447] = 110,
        [2448] = 111,
        [2449] = 112,
        [2450] = 113,
        [2453] = 114,
        [2454] = 115,
        [2456] = 116,
        [2457] = 117,
        [2458] = 118,
        [2459] = 119,
        [2461] = 120,
        [2462] = 121,
        [2463] = 122,
        [2464] = 123,
        [2465] = 124,
        [2469] = 125,
        [2474] = 126,
        [2475] = 127,
        [2481] = 128,
        [2483] = 129,
        [2484] = 130,
        [2485] = 131,
        [2487] = 132,
        [2489] = 133,
        [2490] = 134,
        [2491] = 135,
        [2492] = 136,
        [2493] = 137,
        [2494] = 138,
        [2495] = 139,
        [2496] = 140,
        [2497] = 141,
        [2498] = 142,
        [2499] = 143,
        [2500] = 144,
        [3001] = 76,
        [3002] = 77,
        [3003] = 78,
        [3004] = 79,
        [3005] = 80,
        [3006] = 81,
        [3007] = 82,
        [3008] = 83,
        [3333] = 6,
        [4001] = 145,
    }
}

return hero_skill_effect