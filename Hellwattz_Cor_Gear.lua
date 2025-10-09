-- Setup vars that are user-dependent.  Can override this function in a sidecar file.
function user_setup()
    state.OffenseMode:options('Normal','Acc')
	state.HybridMode:options('Normal','DT')
    state.RangedMode:options('Normal', 'Acc')
    state.WeaponskillMode:options('Match','Normal', 'Acc','Proc')
    state.CastingMode:options('Normal', 'Resistant')
    state.IdleMode:options('Normal', 'PDT', 'Refresh')
	state.ExtraMeleeMode = M{['description']='Extra Melee Mode', 'None', 'DWMax'}
	state.Weapons:options('LeadenMelee','SavageWeapons','SavageWeapon','Fomalhaut','Leaden','LastStandDW') --'LeadenMelee','LeadenMelee2','AeolianWeapons','LeadenRanged','LastStand','SavageWeapons','SavageWeapon','Absorb'
	state.CompensatorMode:options('Always','300','1000','Never')
	
    gear.RAbullet = "Chrono Bullet"
    gear.WSbullet = "Chrono Bullet"
	gear.MAbullet = "Orichalc. Bullet"
	gear.QDbullet = "Hauksbok Bullet"
    options.ammo_warning_limit = 15
	
	-- gear.RAbullet = "Bronze Bullet"
    -- gear.WSbullet = "Bronze Bullet"
	-- gear.MAbullet = "Bronze Bullet"
	-- gear.QDbullet = "Bronze Bullet"
    -- options.ammo_warning_limit = 15
	
	
	-- gear.RAbullet = "Chrono Bullet" -- Chrono Bullet
    -- gear.WSbullet = "Chrono Bullet"
    -- gear.MAbullet = "Living Bullet" --For MAB WS, do not put single-use bullets here. Orichalc. Bullet
    -- gear.QDbullet = "Living Bullet"
    -- options.ammo_warning_limit = 15

	-- gear.tp_ranger_jse_back = {name="Camulus's Mantle",augments={'AGI+20','Rng.Acc.+20 Rng.Atk.+20','Rng.Acc.+10','"Store TP"+10',}}
	-- gear.snapshot_jse_back = {name="Camulus's Mantle",augments={'"Snapshot"+10',}}
	-- gear.tp_jse_back = {name="Camulus's Mantle",augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10',}}
	-- gear.ranger_wsd_jse_back = {name="Camulus's Mantle",augments={'AGI+20','Rng.Acc.+20 Rng.Atk.+20','AGI+10','Weapon skill damage +10%',}}
	-- gear.magic_wsd_jse_back = {name="Camulus's Mantle",augments={'AGI+20','Mag. Acc+20 /Mag. Dmg.+20','AGI+10','Weapon skill damage +10%',}}
	-- gear.str_wsd_jse_back = {name="Camulus's Mantle",augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}}
	autows_list = {['LeadenMelee']='Leaden Salute',['LeadenMelee2']='Leaden Salute',['SavageWeapons']='Savage Blade',['LastStand']='Last Stand',['SavageWeapon']='Savage Blade',['AeolianWeapons']='Aeolian Edge'}
	autowstp = 1250
	autofood = 'Grape Daifuku +1'

    -- Additional local binds
	send_command('bind !f11 gs c cycle ExtraMeleeMode')
	send_command('bind ^` gs c cycle ElementalMode')
	send_command('bind !` gs c elemental quickdraw')
	
	send_command('bind ^backspace input /ja "Double-up" <me>')
	send_command('bind @backspace input /ja "Snake Eye" <me>')
	send_command('bind !backspace input /ja "Fold" <me>')
	send_command('bind ^@!backspace input /ja "Crooked Cards" <me>')
	
	send_command('bind ^\\\\ input /ja "Random Deal" <me>')
    send_command('bind !\\\\ input /ja "Bolter\'s Roll" <me>')
	send_command('bind ^@!\\\\ gs c toggle LuzafRing')
	send_command('bind @f7 gs c toggle RngHelper')

	--send_command('bind !r gs c weapons SingleWeapon;gs c update')
	--send_command('bind @q gs c weapons MaccWeapons;gs c update')
	--send_command('bind ^q gs c weapons DualRangedWeapons;gs c update')
	--send_command('bind !q gs c weapons SavageWeapons;gs c update')

    select_default_macro_book()
end

-- Define sets and vars used by this job file.
function init_gear_sets()
    --------------------------------------
    -- Start defining the sets
    --------------------------------------
	send_command('exec init.txt')
	
	-- Weapons sets
	--sets.weapons.Trials = {main="Qutrub Knife",sub="Apkallu Scepter",range="Ataktos"}
	sets.weapons.SavageWeapons = {main="Naegling",sub="Gleti's Knife",range="Ataktos"} -- sub="Gleti's Knife", range="Ataktos"
	sets.weapons.SavageWeapon = {main="Naegling",sub="Nusku Shield",range="Ataktos"}
	sets.weapons.Leaden = {main="Naegling",sub="Nusku Shield",range="Death Penalty"}
	sets.weapons.Absorb = {main="Naegling",sub="Nusku Shield",range=empty}
	sets.weapons.Dyna = {main="Naegling",sub={ name="Rostam", augments={'Path: C',}},range="Ataktos"}
	sets.weapons.AeolianWeapons = {main="Blurred Knife +1",sub="Hep. Rapier +1",range="Ataktos"}
	sets.weapons.LeadenMelee = {main="Naegling",sub='Tauret',range="Death Penalty"}
	sets.weapons.LeadenMelee2 = {main={ name="Rostam", augments={'Path: B',}},sub='Tauret',range="Death Penalty"}
	--sets.weapons.Prime = {main="Naegling",sub="Gleti's Knife",range="Earp"}
	sets.weapons.LeadenRanged = {main={ name="Rostam", augments={'Path: A',}},sub='Tauret',range="Death Penalty"}
	sets.weapons.Fomalhaut = {main="Naegling",sub="Nusku Shield",range="Fomalhaut"}
	sets.weapons.LastStand = {main={ name="Rostam", augments={'Path: A',}},sub="Nusku Shield",range="Fomalhaut"}
	sets.weapons.LastStandDW = {main="Naegling",sub='Tauret',range="Fomalhaut"}
	--sets.weapons.RostamRanged = {main="Rostam",sub={name="Rostam", bag="Wardrobe 3"},range="Death Penalty"}
	
    -- Precast Sets

    -- Precast sets to enhance JAs

	sets.precast.JA['Triple Shot'] = {body="Chasseur's Frac +3"}
    sets.precast.JA['Snake Eye'] = {legs="Lanun Trews +1"}
    sets.precast.JA['Wild Card'] = {feet="Lanun Bottes +4"}
    sets.precast.JA['Random Deal'] = {body="Lanun Frac +1"}
    sets.precast.FoldDoubleBust = {hands="Lanun Gants +4"}

    sets.precast.CorsairRoll = {
	main={ name="Rostam", augments={'Path: C',}},
	range="Compensator",
	head="Lanun Tricorne +4",
	neck="Regal Necklace",
	hands="Chasseur's Gants +3",
	ring2="Luzaf's Ring",
	back={ name="Camulus's Mantle", augments={'INT+20','Eva.+20 /Mag. Eva.+20','"Snapshot"+10',}},
	feet="Malignance Boots"}
	
	-- sets.precast.CorsairRoll = {
	-- main={ name="Rostam", augments={'Path: C',}},
	-- head="Lanun Tricorne +4",
	-- neck="Regal Necklace",
	-- hands="Chasseur's Gants +3",
	-- ring2="Luzaf's Ring",
    -- back={ name="Camulus's Mantle", augments={'INT+20','Eva.+20 /Mag. Eva.+20','"Snapshot"+10',}},
	-- feet="Malignance Boots",}

    sets.precast.LuzafRing = {ring2="Luzaf's Ring"}
	
	sets.precast.CorsairRoll["Bolter's Roll"] = {main={ name="Rostam", augments={'Path: C',}},}
    
    sets.precast.CorsairRoll["Caster's Roll"] = set_combine(sets.precast.CorsairRoll, {legs="Chas. Culottes +2"})
    sets.precast.CorsairRoll["Courser's Roll"] = set_combine(sets.precast.CorsairRoll, {feet="Chass. Bottes +2"})
    sets.precast.CorsairRoll["Blitzer's Roll"] = set_combine(sets.precast.CorsairRoll, {head="Chass. Tricorne +3"})
    sets.precast.CorsairRoll["Tactician's Roll"] = set_combine(sets.precast.CorsairRoll, {body="Chasseur's Frac +2"})
    sets.precast.CorsairRoll["Allies' Roll"] = set_combine(sets.precast.CorsairRoll, {hands="Chasseur's Gants +3"})
    
		
	sets.precast.CorsairShot = {
	ammo=gear.QDbullet,
	head="Ikenga's Hat",
    body="Lanun Frac +4",
    hands="Malignance Gloves",
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet="Chass. Bottes +3",
    neck="Baetyl Pendant",
    waist="Eschan Stone",
    left_ear="Friomisi Earring",
    right_ear="Hecate's Earring",
    left_ring="Dingir Ring",
    right_ring="Fenrir Ring +1",
    back={ name="Camulus's Mantle", augments={'AGI+20','Mag. Acc+20 /Mag. Dmg.+20','AGI+10','Weapon skill damage +10%',}},
}
		
	sets.precast.CorsairShot.Damage = {
	ammo=gear.QDbullet,
	head="Ikenga's Hat",
    body="Lanun Frac +4",
    hands={ name="Carmine Fin. Ga. +1", augments={'Rng.Atk.+20','"Mag.Atk.Bns."+12','"Store TP"+6',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet="Chass. Bottes +3",
    neck="Baetyl Pendant",
    waist="Eschan Stone",
    left_ear="Friomisi Earring",
    right_ear="Hecate's Earring",
    left_ring="Dingir Ring",
    right_ring="Fenrir Ring +1",
    back={ name="Camulus's Mantle", augments={'AGI+20','Mag. Acc+20 /Mag. Dmg.+20','AGI+10','Weapon skill damage +10%',}},
		}
	
    sets.precast.CorsairShot.Proc = {
	ammo=gear.QDbullet,
    head="Ikenga's Hat",
    body="Lanun Frac +4",
    hands={ name="Carmine Fin. Ga. +1", augments={'Rng.Atk.+20','"Mag.Atk.Bns."+12','"Store TP"+6',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet="Chass. Bottes +3",
    neck="Baetyl Pendant",
    waist="Eschan Stone",
    left_ear="Friomisi Earring",
    right_ear="Hecate's Earring",
    left_ring="Dingir Ring",
    right_ring="Fenrir Ring +1",
    back={ name="Camulus's Mantle", augments={'AGI+20','Mag. Acc+20 /Mag. Dmg.+20','AGI+10','Weapon skill damage +10%',}},
		}

    sets.precast.CorsairShot['Light Shot'] = {ammo=gear.QDbullet,
    head="Ikenga's Hat",
    body="Lanun Frac +4",
    hands={ name="Carmine Fin. Ga. +1", augments={'Rng.Atk.+20','"Mag.Atk.Bns."+12','"Store TP"+6',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet="Chass. Bottes +3",
    neck="Baetyl Pendant",
    waist="Eschan Stone",
	-- waist="Skrymir Cord +1",
    left_ear="Friomisi Earring",
    right_ear="Hecate's Earring",
    left_ring="Dingir Ring",
    right_ring="Fenrir Ring +1",
    back={ name="Camulus's Mantle", augments={'AGI+20','Mag. Acc+20 /Mag. Dmg.+20','AGI+10','Weapon skill damage +10%',}},
		}

    sets.precast.CorsairShot['Dark Shot'] = set_combine(sets.precast.CorsairShot['Light Shot'], {feet="Chass. Bottes +3"})

    -- Waltz set (chr and vit)
    sets.precast.Waltz = {
        head="Carmine Mask +1",neck="Loricate Torque +1",ear1="Etiolation Earring",ear2="Sanare Earring",
        body=gear.herculean_waltz_body,hands=gear.herculean_waltz_hands,ring1="Defending Ring",ring2="Valseur's Ring",
        back="Moonlight Cape",waist="Flume Belt",legs="Dashing Subligar",feet=gear.herculean_waltz_feet}
		
	sets.Self_Waltz = {head="Mummu Bonnet +2",body="Passion Jacket",ring1="Asklepian Ring"}
        
    -- Don't need any special gear for Healing Waltz.
    sets.precast.Waltz['Healing Waltz'] = {}

    -- Fast cast sets for spells
    
    sets.precast.FC = {
         head="Carmine Mask +1",
		neck="Baetyl Pendant",
		ear1="Enchntr. Earring +1",
		ear2="Loquacious Earring",
        body="Dread Jupon",
		hands="Leyline Gloves",
		ring1="Kishar Ring",
		ring2="Lebeche Ring",
        back="Moonbeam Cape",
		waist="Flume Belt +1",
		legs="Rawhide Trousers",
		feet="Carmine Greaves +1"
		}

    sets.precast.FC.Utsusemi = set_combine(sets.precast.FC, {neck="Magoraga Beads",body="Passion Jacket"})
	
	sets.precast.FC.Cure = set_combine(sets.precast.FC, {ear2="Mendi. Earring"})

    sets.precast.RA = {ammo=gear.RAbullet,
        head="Chass. Tricorne +3",
		neck="Commodore Charm +2",
        body="Laksa. Frac +4",
		hands={ name="Lanun Gants +4", augments={'Enhances "Fold" effect',}},
		Left_ring="Crepuscular Ring",
		back={ name="Camulus's Mantle", augments={'INT+20','Eva.+20 /Mag. Eva.+20','"Snapshot"+10',}},
		waist="Impulse Belt",
		legs="Adhemar kecks +1", -- buy jinxed kecks of AH 
		feet="Meg. Jam. +2"}
		
	sets.precast.RA.Flurry = set_combine(sets.precast.RA, {})
	sets.precast.RA.Flurry2 = set_combine(sets.precast.RA, {})

       
    -- Weaponskill sets
    -- Default set for any weaponskill that isn't any more specifically defined
    sets.precast.WS = {
       head={ name="Nyame Helm", augments={'Path: B',}},
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck="Rep. Plat. Medal",
    waist={ name="Sailfi Belt +1", augments={'Path: A',}},
    left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    right_ear="Ishvara Earring",
    left_ring="Epaminondas's Ring",
    right_ring="Ephramad's Ring",
    back={ name="Camulus's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}},
		}
		
    sets.precast.WS.Acc = {}		
		
    sets.precast.WS.Proc = {}
		
    -- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.

    sets.precast.WS['Requiescat'] = set_combine(sets.precast.WS, {head="Carmine Mask +1",ring2="Rufescent Ring",legs="Carmine Cuisses +1",feet="Carmine Greaves +1"})
	
		
	sets.precast.WS['Savage Blade'] = {ammo=gear.WSbullet,
    head="Nyame Helm",
    body="Laksa. Frac +4",
	hands="Chasseur's Gants +3",
    legs="Nyame Flanchard",
    feet="Lanun Bottes +4",
    neck="Rep. Plat. Medal",
    waist="Sailfi belt +1",
    left_ear="Moonshade Earring",
    right_ear="Ishvara Earring",
    left_ring="Sroda Ring",
    right_ring="Ephramad's Ring",
    back={ name="Camulus's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}},}

    sets.precast.WS['Savage Blade'].Acc = {ammo=gear.WSbullet,
        head="Nyame Helm",
    body="Laksa. Frac +4",
	hands="Chasseur's Gants +3",
    legs="Nyame Flanchard",
    feet="Lanun Bottes +4",
    neck="Rep. Plat. Medal",
    waist="Sailfi belt +1",
    left_ear="Moonshade Earring",
    right_ear="Ishvara Earring",
    left_ring="Sroda Ring",
    right_ring="Ephramad's Ring",
    back={ name="Camulus's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}},}
	
    sets.precast.WS['Last Stand'] = {ammo=gear.WSbullet,
        head="Lanun Tricorne +4", -- need to +3 relic
    body="Laksa. Frac +4",
    hands="Chasseur's Gants +3",
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet="Lanun Bottes +4",
    neck="Fotia Gorget",
    waist="Fotia Belt",
    left_ear="Moonshade Earring",
    right_ear="Ishvara Earring",
    left_ring="Epaminondas's Ring",
    right_ring="Regal ring",
    back={ name="Camulus's Mantle", augments={'AGI+20','Rng.Acc.+20 Rng.Atk.+20','AGI+10','Weapon skill damage +10%',}},
		}
		

    sets.precast.WS['Last Stand'].Acc = {ammo=gear.WSbullet,
        head="Lanun Tricorne +4", -- need to +3 relic
    body="Laksa. Frac +4",
    hands="Chasseur's Gants +3",
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet="Lanun Bottes +4",
    neck="Fotia Gorget",
    waist="Fotia Belt",
    left_ear="Moonshade Earring",
    right_ear="Ishvara Earring",
    left_ring="Epaminondas's Ring",
    right_ring="Regal ring",
    back={ name="Camulus's Mantle", augments={'AGI+20','Rng.Acc.+20 Rng.Atk.+20','AGI+10','Weapon skill damage +10%',}},
		}
		
    sets.precast.WS['Detonator'] = sets.precast.WS['Last Stand']
    sets.precast.WS['Detonator'].Acc = sets.precast.WS['Last Stand'].Acc
    sets.precast.WS['Slug Shot'] = sets.precast.WS['Last Stand']
    sets.precast.WS['Slug Shot'].Acc = sets.precast.WS['Last Stand'].Acc
    sets.precast.WS['Numbing Shot'] = sets.precast.WS['Last Stand']
    sets.precast.WS['Numbing Shot'].Acc = sets.precast.WS['Last Stand'].Acc
    sets.precast.WS['Sniper Shot'] = sets.precast.WS['Last Stand']
    sets.precast.WS['Sniper Shot'].Acc = sets.precast.WS['Last Stand'].Acc
    sets.precast.WS['Split Shot'] = sets.precast.WS['Last Stand']
    sets.precast.WS['Split Shot'].Acc = sets.precast.WS['Last Stand'].Acc
	
		
		sets.precast.WS['Leaden Salute'] = {ammo=gear.MAbullet,
    head="Pixie Hairpin +1",
    body="Lanun Frac +4",
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet="Lanun Bottes +4",
    neck="Commodore Charm +2",
    waist="Eschan Stone",
    left_ear="Moonshade Earring",
    right_ear="Friomisi Earring",
    left_ring="Dingir Ring",
    right_ring="Archon Ring",
    back={ name="Camulus's Mantle", augments={'AGI+20','Mag. Acc+20 /Mag. Dmg.+20','AGI+10','Weapon skill damage +10%',}},
	} 

    sets.precast.WS['Leaden Salute'].Acc = {ammo=gear.MAbullet,
    head="Pixie Hairpin +1",
    body="Lanun Frac +4",
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet="Lanun Bottes +4",
    neck="Commodore Charm +2",
    waist="Eschan Stone",
    left_ear="Moonshade Earring",
    right_ear="Friomisi Earring",
    left_ring="Dingir Ring",
    right_ring="Archon Ring",
    back={ name="Camulus's Mantle", augments={'AGI+20','Mag. Acc+20 /Mag. Dmg.+20','AGI+10','Weapon skill damage +10%',}},
		}

    sets.precast.WS['Wildfire'] = {ammo=gear.MAbullet,
        head={ name="Nyame Helm", augments={'Path: B',}},
    body="Lanun Frac +4",
	hands={ name="Nyame Gauntlets", augments={'Path: B',}},
	legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet="Lanun Bottes +4",
    neck="Commodore Charm +2",
    waist="Eschan Stone",
    left_ear="Moonshade Earring",
    right_ear="Friomisi Earring",
    left_ring="Dingir Ring",
    right_ring="Epaminondas's Ring",
    back={ name="Camulus's Mantle", augments={'AGI+20','Mag. Acc+20 /Mag. Dmg.+20','AGI+10','Weapon skill damage +10%',}},
		}

    sets.precast.WS['Wildfire'].Acc = {ammo=gear.MAbullet,
         head={ name="Nyame Helm", augments={'Path: B',}},
    body="Lanun Frac +4",
	hands={ name="Nyame Gauntlets", augments={'Path: B',}},
	legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet="Lanun Bottes +4",
    neck="Commodore Charm +2",
    waist="Eschan Stone",
    left_ear="Moonshade Earring",
    right_ear="Friomisi Earring",
    left_ring="Dingir Ring",
    right_ring="Epaminondas's Ring",
    back={ name="Camulus's Mantle", augments={'AGI+20','Mag. Acc+20 /Mag. Dmg.+20','AGI+10','Weapon skill damage +10%',}},
		}
		
    sets.precast.WS['Hot Shot'] = sets.precast.WS['Wildfire']
    sets.precast.WS['Hot Shot'].Acc = sets.precast.WS['Wildfire'].Acc
		
		--Because omen skillchains.
    sets.precast.WS['Burning Blade'] = {ammo=gear.RAbullet,
       head={ name="Nyame Helm", augments={'Path: B',}},
    body="Lanun Frac +4",
	hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet="Lanun Bottes +4",
    neck="Commodore Charm +2",
    waist="Eschan Stone",
    left_ear="Moonshade Earring",
    right_ear="Friomisi Earring",
    left_ring="Dingir Ring",
    right_ring="Epaminondas's Ring",
    back={ name="Camulus's Mantle", augments={'AGI+20','Mag. Acc+20 /Mag. Dmg.+20','AGI+10','Weapon skill damage +10%',}},
		}
		

	-- Swap to these on Moonshade using WS if at 3000 TP
	sets.MaxTP = {}
	sets.AccMaxTP = {}
	
	sets.midcast['Absorb-TP'] = {
		ammo="Pemphredo Tathlum",
		head="Chass. Tricorne +3",
		body="Chasseur's Frac +3",
		hands="Chasseur's Gants +3",
		legs="Chas. Culottes +3",
		feet="Chass. Bottes +3",
		neck="Null Loop",
		waist="Null Belt",
		left_ear="Digni. Earring",
		right_ear="Gwati Earring",
		left_ring="Stikini Ring",
		right_ring="Metamor. Ring +1",
		back="Null Shawl",
}
        
    -- Midcast Sets
    sets.midcast.FastRecast = {
        head="Carmine Mask +1",neck="Baetyl Pendant",ear1="Enchntr. Earring +1",ear2="Loquacious Earring",
        body="Dread Jupon",hands="Leyline Gloves",ring1="Kishar Ring",ring2="Lebeche Ring",
        back="Moonlight Cape",waist="Flume Belt",legs="Rawhide Trousers",feet="Carmine Greaves +1"}
        
    -- Specific spells

	sets.midcast.Cure = {
        head="Carmine Mask +1",neck="Phalaina Locket",ear1="Enchntr. Earring +1",ear2="Mendi. Earring",
        body="Dread Jupon",hands="Leyline Gloves",ring1="Janniston Ring",ring2="Lebeche Ring",
        back="Solemnity Cape",waist="Flume Belt",legs="Carmine Cuisses +1",feet="Carmine Greaves +1"}
	
	sets.Self_Healing = {neck="Phalaina Locket",hands="Buremte Gloves",ring2="Kunaji Ring",waist="Gishdubar Sash"}
	sets.Cure_Received = {neck="Phalaina Locket",hands="Buremte Gloves",ring2="Kunaji Ring",waist="Gishdubar Sash"}
	sets.Self_Refresh = {waist="Gishdubar Sash"}
	
    sets.midcast.Utsusemi = sets.midcast.FastRecast

    -- Ranged gear
    sets.midcast.RA = {ammo=gear.RAbullet,
        head="Malignance Chapeau",
    body="Malignance Tabard",
    hands="Malignance Gloves",
    --legs={ name="Adhemar Kecks +1", augments={'AGI+12','Rng.Acc.+20','Rng.Atk.+20',}},
	legs="Malignance Tights",
    --feet={ name="Adhe. Gamashes +1", augments={'HP+65','"Store TP"+7','"Snapshot"+10',}},
	feet="Malignance Boots",
    neck="Iskur Gorget",
    waist="Yemaya Belt",
    left_ear="Telos Earring",
    right_ear="Crep. Earring",
    left_ring="Crepuscular Ring",
    right_ring="Ilabrat Ring",
    back={ name="Camulus's Mantle", augments={'AGI+20','Rng.Acc.+20 Rng.Atk.+20','AGI+10','"Store TP"+10',}},
		}


    sets.midcast.RA.Acc = {
		ammo=gear.RAbullet,
        head="Malignance Chapeau",
    body="Malignance Tabard",
    hands="Malignance Gloves",
    --legs={ name="Adhemar Kecks +1", augments={'AGI+12','Rng.Acc.+20','Rng.Atk.+20',}},
	legs="Malignance Tights",
    --feet={ name="Adhe. Gamashes +1", augments={'HP+65','"Store TP"+7','"Snapshot"+10',}},
	feet="Malignance Boots",
    neck="Iskur Gorget",
    waist="Yemaya Belt",
    left_ear="Telos Earring",
    right_ear="Crep. Earring",
    left_ring="Crepuscular Ring",
    right_ring="Ilabrat Ring",
    back={ name="Camulus's Mantle", augments={'AGI+20','Rng.Acc.+20 Rng.Atk.+20','AGI+10','"Store TP"+10',}},
		}
		
	sets.buff['Triple Shot'] = {
	body="Chasseur's Frac +3",
	hands="Lanun Gants +4"}
	
	-- sets.buff['Triple Shot'] = {
	-- body="Chasseur's Frac +3",
	-- hands="Lanun Gants +4",
	-- head="Oshosi Mask +1",
	-- legs="Osh. Trousers +1",
	-- feet="Osh. Leggings +1",
	-- back={ name="Camulus's Mantle", augments={'AGI+20','Rng.Acc.+20 Rng.Atk.+20','AGI+10','"Store TP"+10',}},}
    
    -- Sets to return to when not performing an action.
	
	sets.DayIdle = {}
	sets.NightIdle = {}
	
	sets.buff.Doom = set_combine(sets.buff.Doom, {})
    
    -- Resting sets
    sets.resting = {}
    

    -- Idle sets
    -- sets.idle = {    
	-- range="Compensator",
    -- ammo="Eminent Bullet",
    -- head={ name="Lanun Tricorne +4", augments={'Enhances "Winning Streak" effect',}},
    -- body="Mekosu. Harness",
    -- hands="Umuthi Gloves",
    -- legs="Carmine Cuisses +1",
    -- feet={ name="Lanun Bottes +1", augments={'Enhances "Wild Card" effect',}},
    -- neck="Loricate Torque +1",
    -- waist="Chaac Belt",
    -- left_ear="Merman's Earring",
    -- right_ear="Merman's Earring",
    -- left_ring="Defending Ring",
    -- right_ring={ name="Dark Ring", augments={'Breath dmg. taken -5%','Spell interruption rate down -4%','Phys. dmg. taken -3%',}},
    -- back="Repulse Mantle",
-- }

sets.idle = {
	ammo=gear.RAbullet,
	head="Null Masque",
    body="Malignance Tabard",
    hands="Malignance Gloves",
    legs="Carmine Cuisses +1",
    feet="Malignance Boots",
    neck="Loricate Torque +1",
    waist="Flume Belt +1",
    left_ear="Odnowa Earring",
    right_ear="Odnowa Earring +1",
    left_ring="Defending Ring",
    right_ring="Vocane Ring",
    back="Moonbeam Cape",
}
		
    sets.idle.Refresh = {}
    
    -- Defense sets
    sets.defense.PDT = {}

    sets.defense.MDT = {}
		
    sets.defense.MEVA = {}

    sets.Kiting = {legs="Carmine Cuisses +1"}
	sets.TreasureHunter = set_combine(sets.TreasureHunter, {})
	sets.DWMax = {ear1="Dudgeon Earring",ear2="Heartseeker Earring",body="Adhemar Jacket +1",hands="Floral Gauntlets",waist="Reiki Yotai"}
	
    -- Engaged sets

    -- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
    -- sets if more refined versions aren't defined.
    -- If you create a set with both offense and defense modes, the offense mode should be first.
    -- EG: sets.engaged.Dagger.Accuracy.Evasion
    
    -- Normal melee group
    -- sets.engaged = {
		-- head="Dampening Tam",neck="Iskur Gorget",ear1="Cessance Earring",ear2="Brutal Earring",
		-- body="Meg. Cuirie +2",hands="Adhemar Wrist. +1",ring1="Epona's Ring",ring2="Petrov Ring",
		-- back=gear.tp_jse_back,waist="Windbuffet Belt +1",legs="Samnuha Tights",feet=gear.herculean_ta_feet}
		
	-- sets.engaged = {
    -- head={ name="Adhemar Bonnet +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
    -- body={ name="Adhemar Jacket +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
    -- hands={ name="Adhemar Wrist. +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
    -- legs={ name="Samnuha Tights", augments={'STR+8','DEX+9','"Dbl.Atk."+3','"Triple Atk."+2',}},
    -- feet={ name="Herculean Boots", augments={'Accuracy+21 Attack+21','"Triple Atk."+3','STR+5','Accuracy+11','Attack+15',}},
    -- neck="Lissome Necklace",
    -- waist="Windbuffet Belt +1",
    -- left_ear="Telos Earring",
    -- right_ear="Suppanomimi",
    -- left_ring="Petrov Ring",
    -- right_ring="Epona's Ring",
    -- back={ name="Camulus's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dual Wield"+10','Phys. dmg. taken-10%',}},
-- }

sets.engaged = {
    head="Malignance Chapeau",
    body="Malignance Tabard",
    --hands={ name="Adhemar Wrist. +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
	hands="Malignance Gloves",
    legs="Chasseur's Culottes +3",
    feet="Malignance Boots",
    neck="Combatant's Torque",
    waist="Reiki Yotai",
    left_ear="Dedition Earring",
    right_ear="Cessance Earring",
    left_ring="Chirich Ring +1",
    right_ring="Chirich Ring +1",
    back={ name="Camulus's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dual Wield"+10','Phys. dmg. taken-10%',}},
}
    
		
	sets.engaged.Acc = {
	head="Malignance Chapeau",
    body="Malignance Tabard",
    --hands={ name="Adhemar Wrist. +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
	hands="Malignance Gloves",
    legs="Chasseur's Culottes +3",
    feet="Malignance Boots",
    neck="Combatant's Torque",
    waist="Reiki Yotai",
    left_ear="Dedition Earring",
    right_ear="Cessance Earring",
    left_ring="Chirich Ring +1",
    right_ring="Chirich Ring +1",
    back={ name="Camulus's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dual Wield"+10','Phys. dmg. taken-10%',}},
}
		
		sets.engaged.DW = {
    head="Malignance Chapeau",
    body="Malignance Tabard",
    --hands={ name="Adhemar Wrist. +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
	hands="Malignance Gloves",
    legs="Chasseur's Culottes +3",
    feet="Malignance Boots",
    neck="Combatant's Torque",
    waist="Reiki Yotai",
    left_ear="Dedition Earring",
    right_ear="Cessance Earring",
    left_ring="Chirich Ring +1",
    right_ring="Chirich Ring +1",
    back={ name="Camulus's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dual Wield"+10','Phys. dmg. taken-10%',}},
}
    
    sets.engaged.DW.Acc = {
		head="Malignance Chapeau",
    body="Malignance Tabard",
    --hands={ name="Adhemar Wrist. +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
	hands="Malignance Gloves",
    legs="Chasseur's Culottes +3",
    feet="Malignance Boots",
    neck="Combatant's Torque",
    waist="Reiki Yotai",
    left_ear="Dedition Earring",
    right_ear="Cessance Earring",
    left_ring="Chirich Ring +1",
    right_ring="Chirich Ring +1",
    back={ name="Camulus's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dual Wield"+10','Phys. dmg. taken-10%',}},
		}
		
		
		sets.engaged.DT = {
   head="Malignance Chapeau",
    body="Malignance Tabard",
    --hands={ name="Adhemar Wrist. +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
	hands="Malignance Gloves",
    legs="Chasseur's Culottes +3",
    feet="Malignance Boots",
    neck="Combatant's Torque",
    waist="Reiki Yotai",
    left_ear="Dedition Earring",
    right_ear="Cessance Earring",
    left_ring="Chirich Ring +1",
    right_ring="Chirich Ring +1",
    back={ name="Camulus's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dual Wield"+10','Phys. dmg. taken-10%',}},
}

	sets.engaged.DW.DT = {
    head="Malignance Chapeau",
    body="Malignance Tabard",
    --hands={ name="Adhemar Wrist. +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
	hands="Malignance Gloves",
    legs="Chasseur's Culottes +3",
    feet="Malignance Boots",
    neck="Combatant's Torque",
    waist="Reiki Yotai",
    left_ear="Dedition Earring",
    right_ear="Cessance Earring",
    left_ring="Chirich Ring +1",
    right_ring="Chirich Ring +1",
    back={ name="Camulus's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dual Wield"+10','Phys. dmg. taken-10%',}},
}

end

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
    if player.sub_job == 'NIN' then
        set_macro_page(2, 19)
    elseif player.sub_job == 'DNC' then
		set_macro_page(2, 19)
    elseif player.sub_job == 'RNG' then
        set_macro_page(2, 19)
    else
        set_macro_page(2, 19)
    end   

end