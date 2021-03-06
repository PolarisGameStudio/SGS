--mine_battle_buff

local mine_battle_buff = {
    -- key
    __key_map = {
      buff_id = 1,    --id_key-int 
      buff_name = 2,    --类型名称-简中-string 
      buff_txt = 3,    --类型描述-简中-string 
    
    },
    -- data
    _data = {
        [1] = {101,"疲劳","疲劳值50, 战斗中伤害降低5%",},
        [2] = {102,"疲劳","疲劳值55, 战斗中伤害降低10%",},
        [3] = {103,"疲劳","疲劳值60, 战斗中伤害降低15%",},
        [4] = {104,"疲劳","疲劳值65, 战斗中伤害降低20%",},
        [5] = {105,"疲劳","疲劳值70, 战斗中伤害降低25%",},
        [6] = {106,"疲劳","疲劳值75, 战斗中伤害降低30%",},
        [7] = {107,"疲劳","疲劳值80, 战斗中伤害降低35%",},
        [8] = {108,"疲劳","疲劳值85, 战斗中伤害降低40%",},
        [9] = {109,"疲劳","疲劳值90, 战斗中伤害降低45%",},
        [10] = {110,"疲劳","疲劳值100, 战斗中伤害降低50%",},
        [11] = {200,"霸占","所在军团独占当前矿区, 战斗中受到的伤害降低10%",},
    }
}

return mine_battle_buff