--horse_equipment

local horse_equipment = {
    version =  1,
    -- key
    __key_map = {
      id = 1,    --编号-int 
      name = 2,    --装备名称-string 
      description = 3,    --装备描述-string 
    
    },
    -- data
    _data = {
        [1] = {101,"白玉の鞍","白玉製の馬鞍。非常に有名で高価。",},
        [2] = {102,"紫金の鐙","紫金を象嵌した鐙。とても風格がある。",},
        [3] = {103,"銀輪の手綱","青い緞子で作られた手綱。非常に手触りがいい。",},
        [4] = {201,"蒼蛟の鞍","蛟龍の霊が憑いているので、全戦全勝の加護があると言われている。",},
        [5] = {202,"蒼狼の鐙","蒼き狼の霊に加護されている鐙。静かに主人を守っている。",},
        [6] = {203,"騰蛇の手綱","騰蛇のオーラをまとった手綱。雲や霧に乗っているように馬を走らせることができる。",},
    },

    -- index
    __index_id = {
        [101] = 1,
        [102] = 2,
        [103] = 3,
        [201] = 4,
        [202] = 5,
        [203] = 6,
    }
}

return horse_equipment