
local color_red = Color(255, 0, 0, 255)
hook.Add("loadCustomDarkRPItems", "TFM_DarkrpThings", function()
    DarkRP.createCategory{
        name = "Turkish Food Mod",
        categorises = "jobs",
        startExpanded = true,
        color = color_red,
        canSee = function(ply) return true end,
        sortOrder = 100,
    }

    DarkRP.createCategory{
        name = "Turkish Food Mod / Yemekler",
        categorises = "entities",
        startExpanded = true,
        color = Color(255, 0, 0, 255),
        canSee = function(ply)
            return ply:Team() == TEAM_ASCI or TEAM_BAKKAL
        end,
        sortOrder = 100,
    }

    DarkRP.createCategory{
        name = "Turkish Food Mod / İçecekler",
        categorises = "entities",
        startExpanded = true,
        color = color_red,
        canSee = function(ply)
            return ply:Team() == TEAM_ASCI or TEAM_BAKKAL
        end,
        sortOrder = 100,
    }

    DarkRP.createCategory{
        name = "Turkish Food Mod / Tezgahlar",
        categorises = "entities",
        startExpanded = true,
        color = color_red,
        canSee = function(ply)
            return ply:Team() == TEAM_DONDURMACI or TEAM_CIGKOFTECI or TEAM_PILAVCI or TEAM_BAKKAL
        end,
        sortOrder = 100,
    }

    TEAM_ASCI = DarkRP.createJob("Aşçı", {
        color = color_red,
        model = "models/playermodels/foodmodplayermodel.mdl",
        description = [[Bir aşçısın f4 menüden istediğin yemeği yapıp satabilirsin.]],
        weapons = {},
        command = "chefmeen",
        max = 1,
        salary = 1500,
        admin = 0,
        vote = false,
        hasLicense = false,
        category = "Turkish Food Mod",
    })

    TEAM_DONDURMACI = DarkRP.createJob("Dondurmacı", {
        color = color_red,
        model = "models/playermodels/foodmodplayermodel.mdl",
        description = [[Bir dondurmacısın f4 menüden dondurma,külah ve stand satın alıp ticaret yapabilirsin.]],
        weapons = {},
        command = "icecreemeen",
        max = 1,
        salary = 1500,
        admin = 0,
        vote = false,
        hasLicense = false,
        category = "Turkish Food Mod",
    })

    TEAM_BAKKAL = DarkRP.createJob("Bakkal", {
        color = color_red,
        model = "models/playermodels/foodmodplayermodel.mdl",
        description = [[Bir bakkalsın abur cubur ve çay satıyorsun.]],
        weapons = {},
        command = "bakkalmeen",
        max = 1,
        salary = 1500,
        admin = 0,
        vote = false,
        hasLicense = false,
        category = "Turkish Food Mod",
    })

    TEAM_CIGKOFTECI = DarkRP.createJob("Çiğköfteci", {
        color = color_red,
        model = "models/playermodels/foodmodplayermodel.mdl",
        description = [[Bir çiğköftecisin acılı ve acısız çiğköfte satıyorsun.]],
        weapons = {},
        command = "koftemeen",
        max = 1,
        salary = 1500,
        admin = 0,
        vote = false,
        hasLicense = false,
        category = "Turkish Food Mod",
    })

    TEAM_PILAVCI = DarkRP.createJob("Pilavcı", {
        color = color_red,
        model = "models/playermodels/foodmodplayermodel.mdl",
        description = [[Bir pilavcısın ve 3 çeşit pilav satıyorsun.]],
        weapons = {},
        command = "pilavmeen",
        max = 1,
        salary = 1500,
        admin = 0,
        vote = false,
        hasLicense = false,
        category = "Turkish Food Mod",
    })

    TEAM_FIRINCI = DarkRP.createJob("Fırıncı", {
        color = color_red,
        model = "models/playermodels/foodmodplayermodel.mdl",
        description = [[Bir fırıncısın ve Ekmek,Pide ve Lahmacun satıyorsun.]],
        weapons = {},
        command = "firinmeen",
        max = 1,
        salary = 1500,
        admin = 0,
        vote = false,
        hasLicense = false,
        category = "Turkish Food Mod",
    })

    DarkRP.createEntity("Adana Kebap", {
        ent = "adana",
        model = "models/foods/adanakebap/adanakebap.mdl",
        price = 3000,
        max = 0,
        allowed = TEAM_ASCI,
        cmd = "buyadana",
        category = "Turkish Food Mod / Yemekler",
    })

    DarkRP.createEntity("Mercimek Çorbası", {
        ent = "corba",
        model = "models/foods/corba/corba.mdl",
        price = 1000,
        max = 0,
        allowed = TEAM_ASCI,
        cmd = "buycorba",
        category = "Turkish Food Mod / Yemekler",
    })

    DarkRP.createEntity("Çay", {
        ent = "tea",
        model = "models/foods/tea/tea.mdl",
        price = 100,
        max = 0,
        allowed = TEAM_ASCI,
        cmd = "buytea",
        category = "Turkish Food Mod / İçecekler",
    })

    DarkRP.createEntity("Ekmek", {
        ent = "ekmek",
        model = "models/foods/ekmek/ekmek.mdl",
        price = 10,
        max = 0,
        allowed = {TEAM_ASCI, TEAM_BAKKAL},
        cmd = "buyekmek",
        category = "Turkish Food Mod / Yemekler",
    })

    DarkRP.createEntity("Lahmacun", {
        ent = "lahmacun",
        model = "models/foods/lahmacun/lahmacun.mdl",
        price = 800,
        max = 0,
        allowed = TEAM_ASCI,
        cmd = "buylahmacun",
        category = "Turkish Food Mod / Yemekler",
    })

    DarkRP.createEntity("Sucuklu Yumurta", {
        ent = "sckegg",
        model = "models/foods/sckegg/sckegg.mdl",
        price = 1500,
        max = 0,
        allowed = TEAM_ASCI,
        cmd = "buysckegg",
        category = "Turkish Food Mod / Yemekler",
    })

    DarkRP.createEntity("Patates Köfte", {
        ent = "patkof",
        model = "models/foods/patkof/patkof.mdl",
        price = 5000,
        max = 0,
        allowed = TEAM_ASCI,
        cmd = "buypatkof",
        category = "Turkish Food Mod / Yemekler",
    })

    DarkRP.createEntity("Gofret", {
        ent = "gofret",
        model = "models/foods/gofret/gofret.mdl",
        price = 1000,
        max = 0,
        allowed = TEAM_BAKKAL,
        cmd = "buygofret",
        category = "Turkish Food Mod / Yemekler",
    })

    DarkRP.createEntity("Şalgam", {
        ent = "salgam",
        model = "models/drinks/salgam/salgam.mdl",
        price = 350,
        max = 0,
        allowed = {TEAM_ASCI, TEAM_BAKKAL},
        cmd = "buysalgam",
        category = "Turkish Food Mod / İçecekler",
    })

    DarkRP.createEntity("Gazoz", {
        ent = "gazoz",
        model = "models/drinks/gazoz/gazoz.mdl",
        price = 1500,
        max = 0,
        allowed = {TEAM_ASCI, TEAM_BAKKAL},
        cmd = "buygazoz",
        category = "Turkish Food Mod / İçecekler",
    })

    DarkRP.createEntity("Ayran", {
        ent = "ayran",
        model = "models/drinks/ayran/ayran.mdl",
        price = 100,
        max = 0,
        allowed = {TEAM_ASCI, TEAM_BAKKAL},
        cmd = "buyayran",
        category = "Turkish Food Mod / İçecekler",
    })

    DarkRP.createEntity("Metro", {
        ent = "metro",
        model = "models/foods/metro/metro.mdl",
        price = 1000,
        max = 0,
        allowed = TEAM_BAKKAL,
        cmd = "buymero",
        category = "Turkish Food Mod / Yemekler",
    })

    DarkRP.createEntity("Hoşbeş", {
        ent = "hosbes",
        model = "models/foods/hosbes/hosbes.mdl",
        price = 1000,
        max = 0,
        allowed = TEAM_BAKKAL,
        cmd = "buyhosbes",
        category = "Turkish Food Mod / Yemekler",
    })

    DarkRP.createEntity("Dondurma Tezgahı", {
        ent = "ice-stand",
        model = "models/stands/ice_stand/ice_stand.mdl",
        price = 1500,
        max = 1,
        allowed = TEAM_DONDURMACI,
        cmd = "buyicestand",
        category = "Turkish Food Mod / Tezgahlar",
    })

    DarkRP.createEntity("Çiğköfte Tezgahı", {
        ent = "kofte_stand",
        model = "models/stands/cigkofte_stand/cigkofte_stand.mdl",
        price = 1500,
        max = 1,
        allowed = TEAM_CIGKOFTECI,
        cmd = "buykoftestand",
        category = "Turkish Food Mod / Tezgahlar",
    })

    DarkRP.createEntity("Büfe", {
        ent = "bufe",
        model = "models/stands/bakkal_stand/bakkal.mdl",
        price = 1500,
        max = 0,
        allowed = TEAM_BAKKAL,
        cmd = "buybufe",
        category = "Turkish Food Mod / Tezgahlar",
    })

    DarkRP.createEntity("Pilavcı Tezgahı", {
        ent = "pilav_stand",
        model = "models/stands/pilav_stand/pilav_stand.mdl",
        price = 5000,
        max = 1,
        allowed = TEAM_PILAVCI,
        cmd = "buypilavstand",
        category = "Turkish Food Mod / Tezgahlar",
    })

    DarkRP.createEntity("Taş Fırın", {
        ent = "stone_oven",
        model = "models/stands/stoneoven/stoneoven.mdl",
        price = 5000,
        max = 1,
        allowed = TEAM_FIRINCI,
        cmd = "buystoneoven",
        category = "Turkish Food Mod / Tezgahlar",
    })
end)
