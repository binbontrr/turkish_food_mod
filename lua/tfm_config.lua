TFM = TFM or {}

--THIS CONFIG FOR EDITING MOD NOT COMPLEX! YOU CAN EDIT WITHOUT BREAKING TABLE STRUCTURE
--BU CONFIG MOD DÜZENLEMESİ İÇİN EKLENMİŞTİR FAZLA DETAYLI DEĞİLDİR! TABLE YAPISINI BOZMADAN DÜZENLEYEBİLİRSİNİZ

TFM.Foods = {
    ["adana"] = {
        model = "models/foods/adanakebap/adanakebap.mdl",
        health = 25,
        eat_sound = "eating.wav"
    },
    ["ayran"] = {
        model = "models/drinks/ayran/ayran.mdl",
        health = 5,
        eat_sound = "slurp.wav"
    },
    ["ayran"] = {
        model = "models/drinks/ayran/ayran.mdl",
        health = 5,
        eat_sound = "slurp.wav"
    },
    ["corba"] = {
        model = "models/foods/corba/corba.mdl",
        health = 15,
        eat_sound = "slurp.wav"
    },
    ["ekmek"] = {
        model = "models/foods/ekmek/ekmek.mdl",
        health = 10,
        eat_sound = "eating.wav"
    },
    ["gazoz"] = {
        model = "models/drinks/gazoz/gazoz.mdl",
        health = 5,
        eat_sound = "slurp.wav"
    },
    ["gofret"] = {
        model = "models/foods/gofret/gofret.mdl",
        health = 8,
        eat_sound = "eating.wav"
    },
    ["hosbes"] = {
        model = "models/foods/hosbes/hosbes.mdl",
        health = 10,
        eat_sound = "eating.wav"
    },
    ["kofte_durum"] = {
        model = "models/foods/cigkofte_durum/cigkofte_durum.mdl",
        health = 10,
        eat_sound = "eating.wav"
    },
    ["kofte_durum_hot"] = {
        model = "models/foods/cigkofte_durum/cigkofte_durum.mdl",
        eat_sound = "eating.wav"
    },
    ["lahmacun"] = {
        model = "models/foods/lahmacun/lahmacun.mdl",
        health = 15,
        eat_sound = "eating.wav"
    },
    ["metro"] = {
        model = "models/foods/metro/metro.mdl",
        health = 7,
        eat_sound = "eating.wav"
    },
    ["nohutlu_pilav"] = {
        model = "models/foods/pilavs/nohutlu.mdl",
        health = 25,
        eat_sound = "eating.wav"
    },
    ["patkof"] = {
        model = "models/foods/patkof/patkof.mdl",
        health = 23,
        eat_sound = "eating.wav"
    },
    ["sade_pilav"] = {
        model = "models/foods/pilavs/sade.mdl",
        health = 22,
        eat_sound = "eating.wav"
    },
    ["salgam"] = {
        model = "models/drinks/salgam/salgam.mdl",
        health = 11,
        eat_sound = "slurp.wav"
    },
    ["sckegg"] = {
        model = "models/foods/sckegg/sckegg.mdl",
        health = 14,
        eat_sound = "eating.wav"
    },
    ["tavuklu_pilav"] = {
        model = "models/foods/pilavs/tavuklu.mdl",
        health = 28,
        eat_sound = "eating.wav"
    },
    ["tea"] = {
        model = "models/drinks/tea/tea.mdl",
        health = 15,
        eat_sound = "slurp.wav"
    },
    ["pide"] = {
        model = "models/foods/pide/pide.mdl",
        health = 23,
        eat_sound = "eating.wav"
    }
}

TFM.Stands = {
    ["bufe"] = {
        model = "models/stands/bakkal_stand/bakkal.mdl"
    },
    ["kofte_stand"] = {
        model = "models/stands/cigkofte_stand/cigkofte_stand.mdl",
        price_normal = 1500,
        price_hot = 1500
    },
    ["ice_stand"] = {
        model = "models/stands/ice_stand/ice_stand.mdl",
        time_of_icecreems = 15,
        price_of_icecreems = 2000,
        icecreem_colors = {
            [1] = {clr = Color(104, 48, 27, 255),name = "Kakao"},
            [2] = {clr = Color(255, 255, 255, 255),name = "Sade"},
            [3] = {clr = Color(154, 249, 152, 255),name = "Antep Fıstığı"},
            [4] = {clr = Color(252, 90, 141, 255),name = "Çilek"},
            [5] = {clr = Color(235, 66, 66, 255),name = "Anjelika Eriği"},
            [6] = {clr = Color(242, 242, 69, 255),name = "Muz"},
            [7] = {clr = Color(0, 243, 255, 255),name = "Orman Meyvesi"},
            [8] = {clr = Color(54, 147, 51, 255),name = "Kivi"}
        }
    },
    ["pilav_stand"] = {
        model = "models/stands/pilav_stand/pilav_stand.mdl",
        time_of_pilavs = 15,
        info_of_pilavs = {
            [1] = {name = "Sade",price = 1500},
            [2] = {name = "Nohutlu",price = 2000},
            [3] = {name = "Tavuklu",price = 3000}
        },
    },
    ["stone_oven"] = {
        time_of_foods = 15,
        info_of_foods = {
            [1] = {name = "Ekmek",price = 500},
            [2] = {name = "Pide",price = 600},
            [3] = {name = "Lahmacun",price = 700}
        }
    }
}