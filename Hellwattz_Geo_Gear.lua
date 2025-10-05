function user_setup()

	-- Options: Override default values
    state.OffenseMode:options('Normal')
	state.CastingMode:options('Normal', 'Resistant', 'Fodder', 'Proc')
    state.IdleMode:options('Normal', 'PDT', 'TPEat')
	state.PhysicalDefenseMode:options('PDT', 'NukeLock', 'GeoLock', 'PetPDT')
	state.MagicalDefenseMode:options('MDT', 'NukeLock')
	state.ResistDefenseMode:options('MEVA')
	state.Weapons:options('None','Nehushtan','DualWeapons')

	gear.nuke_jse_back = {name="Nantosuelta's Cape",augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','"Mag.Atk.Bns."+10'}}
	gear.idle_jse_back = {name="Nantosuelta's Cape",augments={'HP+60','Eva.+20 /Mag. Eva.+20','Pet: "Regen"+10'}}
	
	gear.obi_cure_back = "Tempered Cape +1"
	gear.obi_cure_waist = "Witful Belt"

	gear.obi_low_nuke_back = gear.nuke_jse_back
	gear.obi_low_nuke_waist = "Sekhmet Corset"

	gear.obi_high_nuke_back = gear.nuke_jse_back
	gear.obi_high_nuke_waist = "Refoccilation Stone"
	
	autoindi = "Haste"
	autogeo = "Frailty"

	buff_spell_lists = {
	Auto = {	
		{Name='Haste',		Buff='Haste',		SpellID=57,		When='Always'},
		{Name='Refresh',	Buff='Refresh',		SpellID=109,	When='Always'},
	},
	
	Default = {
		{Name='Haste',		Buff='Haste',		SpellID=57,		Reapply=false},
		{Name='Refresh',	Buff='Refresh',		SpellID=109,	Reapply=false},
		{Name='Aquaveil',	Buff='Aquaveil',	SpellID=55,		Reapply=false},
		{Name='Stoneskin',	Buff='Stoneskin',	SpellID=54,		Reapply=false},
		{Name='Blink',		Buff='Blink',		SpellID=53,		Reapply=false},
		{Name='Regen',		Buff='Regen',		SpellID=108,	Reapply=false},
		{Name='Phalanx',	Buff='Phalanx',		SpellID=106,	Reapply=false},
	},
}
	
	-- Additional local binds
	-- send_command('bind ^` gs c cycle ElementalMode')
	-- send_command('bind !` input /ja "Full Circle" <me>')
	-- send_command('bind @f8 gs c toggle AutoNukeMode')
	-- send_command('bind @` gs c cycle MagicBurstMode')
	-- send_command('bind @f10 gs c cycle RecoverMode')
	-- send_command('bind ^backspace input /ja "Entrust" <me>')
	-- send_command('bind !backspace input /ja "Life Cycle" <me>')
	-- send_command('bind @backspace input /ma "Sleep II" <t>')
	-- send_command('bind ^delete input /ma "Aspir III" <t>')
	-- send_command('bind @delete input /ma "Sleep" <t>')
	
	send_command('exec init.txt')
	
	indi_duration = 290
	
	select_default_macro_book()
end

function init_gear_sets()
	
	--------------------------------------
	-- Precast sets
	--------------------------------------

	-- Precast sets to enhance JAs
	sets.precast.JA.Bolster = {body="Bagua Tunic +3"}
	sets.precast.JA['Life Cycle'] = {body="Geomancy Tunic +3"} -- back=gear.idle_jse_back
	sets.precast.JA['Radial Arcana'] = {feet="Bagua Sandals +3"}
	sets.precast.JA['Mending Halation'] = {legs="Bagua Pants +3"}
	sets.precast.JA['Full Circle'] = {head="Azimuth Hood +3",hands="Bagua Mitaines +3"}
	
	-- Weapons sets
	sets.weapons.Idris = {main='Idris',sub='Genmei Shield'}
	sets.WakeUpWeapons = {main="Prime Maul"}
	
	-- Indi Duration in slots that would normally have skill here to make entrust more efficient.
	sets.buff.Entrust = {}
	
	-- Fast cast sets for spells

	sets.precast.FC = {head="Nahtirah Hat",ear1="Loquacious Earring",ear2="Enchntr. Earring +1",
        body="Vanir Cotehardie",hands="Hagondes Cuffs +1",ring1="Prolix Ring",ring2="Veneficium Ring",
        back="Lifestream Cape",waist="Witful Belt",legs="Geo. Pants +1",feet="Regal Pumps +1"}

	sets.precast.FC.Geomancy = set_combine(sets.precast.FC, {main="Idris",range="Dunna",ammo=empty})
	
    sets.precast.FC['Elemental Magic'] = set_combine(sets.precast.FC, {ear2="Barkaro. Earring"})

	sets.precast.FC.Cure = set_combine(sets.precast.FC, {main="Tamaxchi",sub="Sors Shield",back="Pahtli Cape"}) -- main="Serenity",sub="Clerisy Strap +1"
		
	sets.precast.FC.Curaga = sets.precast.FC.Cure
	
	sets.Self_Healing = {neck="Phalaina Locket",ring1="Kunaji Ring",ring2="Asklepian Ring",waist="Gishdubar Sash"}
	sets.Cure_Received = {neck="Phalaina Locket",ring1="Kunaji Ring",ring2="Asklepian Ring",waist="Gishdubar Sash"}
	sets.Self_Refresh = {back="Grapevine Cape",waist="Gishdubar Sash",feet="Inspirited Boots"}
	
    sets.precast.FC['Enhancing Magic'] = set_combine(sets.precast.FC, {waist="Siegel Sash"})

    sets.precast.FC.Stoneskin = set_combine(sets.precast.FC['Enhancing Magic'], {})

	sets.precast.FC.Impact = {ammo="Impatiens",
		head=empty,neck="Voltsurge Torque",ear1="Enchntr. Earring +1",ear2="Loquacious Earring",
		body="Twilight Cloak",hands="Volte Gloves",ring1="Kishar Ring",ring2="Lebeche Ring",
		back="Lifestream Cape",waist="Witful Belt",legs="Geo. Pants +1",feet="Regal Pumps +1"}
	
	sets.precast.FC['Elemental Magic'] = set_combine(sets.precast.FC, {hands="Bagua Mitaines +3"})
	
	-- Weaponskill sets
	-- Default set for any weaponskill that isn't any more specifically defined
	sets.precast.WS = {
    ammo="Crepuscular Pebble",
    head={ name="Nyame Helm", augments={'Path: B',}},
    body="Nyame Mail",
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet="Nyame Sollerets",
    neck="Fotia Gorget",
    waist="Fotia Belt",
    left_ear="Regal Earring",
    right_ear="Dominance Earring +1",
    left_ring="Epaminondas's Ring",
    right_ring="Metamor. Ring +1",
    back={ name="Nantosuelta's Cape", augments={'INT+20','Accuracy+20 Attack+20','INT+10','Weapon skill damage +10%','Damage taken-5%',}},
	}


	--------------------------------------
	-- Midcast sets
	--------------------------------------

    sets.midcast.FastRecast = {head="Nahtirah Hat",ear1="Loquacious Earring",ear2="Enchntr. Earring +1",
        body="Vanir cotehardie",hands="Hagondes Cuffs +1",ring1="Prolix Ring",ring2="Veneficium Ring",
        back="Lifestream Cape",waist="Ninurta's Sash",legs="Geo. Pants +1",feet="Regal Pumps +1"}

	sets.midcast.Geomancy = {main="Idris",sub="Genmei Shield",range="Dunna",head="Azimuth Hood +3",
		body="Bagua Tunic +3",hands="Geo. Mitaines +4",neck="Incanter's Torque",ring1="Stikini Ring",ring2="Stikini Ring",
		back="Lifestream Cape",waist="Austerity Belt +1",legs="Bagua Pants +3",feet="Azimuth Gaiters +3"}


	--Extra Indi duration as long as you can keep your 900 skill cap.
	sets.midcast.Geomancy.Indi = set_combine(sets.midcast.Geomancy, {legs="Bagua Pants +3",feet="Azimuth Gaiters +3"}) -- back=gear.idle_jse_back
	
	sets.midcast['Absorb-TP'] = {
		head="Azimuth Hood +3",
		body="Azimuth Coat +3",
		hands="Azimuth Gloves +3",
		legs="Azimuth Tights +3",
		feet="Azimuth Gaiters +3",
		neck="Erra Pendant",
		waist="Null Belt",
		left_ear="Malignance Earring",
		right_ear="Crep. Earring",
		left_ring="Stikini Ring",
		right_ring="Stikini Ring",
		back="Null Shawl"}
		
    sets.midcast.Cure = {main="Tamaxchi",sub="Genmei Shield",
        body="Heka's Kalasiris",hands="Bokwus Gloves",ring1="Haoma Ring",ring2="Sirona's Ring",
        back="Lifestream Cape",legs="Geo. Pants +1",feet="Hagondes Sabots +1"}
		
    sets.midcast.LightWeatherCure = {main="Chatoyant Staff",sub="Curatio Grip",ammo="Hasty Pinion +1",
        head="Amalric Coif +1",neck="Phalaina Locket",ear1="Gifted Earring",ear2="Etiolation Earring",
        body="Vrikodara Jupon",hands="Telchine Gloves",ring1="Janniston Ring",ring2="Lebeche Ring",
        back="Twilight Cape",waist="Hachirin-no-Obi",legs="Geo. Pants +1",feet="Vanya Clogs"}
		
		--Cureset for if it's not light weather but is light day.
    sets.midcast.LightDayCure = {main=gear.gada_healing_club,sub="Sors Shield",ammo="Hasty Pinion +1",
        head="Amalric Coif +1",neck="Incanter's Torque",ear1="Gifted Earring",ear2="Etiolation Earring",
        body="Zendik Robe",hands="Telchine Gloves",ring1="Janniston Ring",ring2="Lebeche Ring",
        back="Twilight Cape",waist="Hachirin-no-Obi",legs="Geo. Pants +1",feet="Vanya Clogs"}

    sets.midcast.Curaga = sets.midcast.Cure

	sets.midcast.Cursna =  set_combine(sets.midcast.Cure, {neck="Debilis Medallion",ring1="Haoma's Ring",ring2="Haoma's Ring"})
	
	sets.midcast.StatusRemoval = set_combine(sets.midcast.FastRecast, {main="Oranyan",sub="Clemency Grip"})
	
    sets.midcast['Elemental Magic'] = {
		main="Bunzi's Rod",
		sub="Ammurapi Shield",
		ammo={ name="Ghastly Tathlum +1", augments={'Path: A',}},
		head="Azimuth Hood +3",
		body="Azimuth Coat +3",
		hands="Azimuth Gloves +3",
		legs="Azimuth Tights +3",
		feet="Azimuth Gaiters +3",
		neck="Mizu. Kubikazari", --Baetyl pendant Warder Of Love
		waist={ name="Acuity Belt +1", augments={'Path: A',}}, -- Sacro cord Alexander
		left_ear="Malignance Earring",
		right_ear="Regal Earring",
		left_ring="Metamor. Ring +1",
		right_ring="Metamor. Ring +1",
		back={ name="Nantosuelta's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10',}},
}


	sets.MagicBurst={
		main="Bunzi's Rod",
		sub="Ammurapi Shield",
		ammo={ name="Ghastly Tathlum +1", augments={'Path: A',}}, -- upgrade this
		head="Azimuth Hood +3",
		body="Azimuth Coat +3",
		hands="Bagua Mitaines +3", 
		legs="Azimuth Tights +3",
		feet="Azimuth Gaiters +3",
		neck="Mizu. Kubikazari",
		waist="Acuity Belt +1", --upgrade thhis
		left_ear="Malignance Earring",
		right_ear="Regal Earring",
		left_ring="Metamor. Ring +1", -- augment this
		right_ring="Mujin Band", -- buy this
		back={ name="Nantosuelta's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10',}},
}

    sets.midcast['Elemental Magic'].Resistant = {}	
    sets.midcast['Elemental Magic'].Fodder = {}
	sets.midcast['Elemental Magic'].HighTierNuke = set_combine(sets.midcast['Elemental Magic'], {})
	sets.midcast['Elemental Magic'].HighTierNuke.Resistant = set_combine(sets.midcast['Elemental Magic'].Resistant, {})
	sets.midcast['Elemental Magic'].HighTierNuke.Fodder = set_combine(sets.midcast['Elemental Magic'].Fodder, {})
		
    sets.midcast['Dark Magic'] = {main="Rubicundity",sub="Ammurapi Shield",ammo="Pemphredo Tathlum",
        head=gear.merlinic_nuke_head,neck="Erra Pendant",ear1="Regal Earring",ear2="Barkaro. Earring",
        body=gear.merlinic_nuke_body,hands="Amalric Gages +1",ring1="Stikini Ring",ring2="Stikini Ring",
        back=gear.nuke_jse_back,waist="Yamabuki-no-Obi",legs="Merlinic Shalwar",feet=gear.merlinic_aspir_feet}
		
    sets.midcast.Drain = {main="Rubicundity",sub="Ammurapi Shield",ammo="Pemphredo Tathlum",
        head="Pixie Hairpin +1",neck="Erra Pendant",ear1="Regal Earring",ear2="Barkaro. Earring",
        body=gear.merlinic_nuke_body,hands="Amalric Gages +1",ring1="Archon Ring",ring2="Evanescence Ring",
        back=gear.nuke_jse_back,waist="Fucho-no-obi",legs="Merlinic Shalwar",feet=gear.merlinic_aspir_feet}
    
    sets.midcast.Aspir = sets.midcast.Drain
		
	sets.midcast.Stun = {main="Oranyan",sub="Clerisy Strap +1",ammo="Hasty Pinion +1",
		head="Amalric Coif +1",neck="Voltsurge Torque",ear1="Enchntr. Earring +1",ear2="Loquacious Earring",
		body="Zendik Robe",hands="Volte Gloves",ring1="Kishar Ring",ring2="Stikini Ring",
		back="Lifestream Cape",waist="Witful Belt",legs="Psycloth Lappas",feet="Regal Pumps +1"}
		
	sets.midcast.Stun.Resistant = {main="Oranyan",sub="Enki Strap",ammo="Pemphredo Tathlum",
		head="Amalric Coif +1",neck="Erra Pendant",ear1="Regal Earring",ear2="Barkaro. Earring",
		body="Zendik Robe",hands="Amalric Gages +1",ring1="Stikini Ring",ring2="Stikini Ring",
		back=gear.nuke_jse_back,waist="Acuity Belt +1",legs="Merlinic Shalwar",feet=gear.merlinic_aspir_feet}

		
	sets.midcast.Impact = {main="Oranyan",sub="Enki Strap",ammo="Pemphredo Tathlum",
		head=empty,neck="Erra Pendant",ear1="Regal Earring",ear2="Barkaro. Earring",
		body="Twilight Cloak",hands="Regal Cuffs",ring1="Stikini Ring",ring2="Stikini Ring",
		back=gear.nuke_jse_back,waist="Acuity Belt +1",legs="Merlinic Shalwar",feet=gear.merlinic_nuke_feet}
		
	sets.midcast['Enfeebling Magic'] = {ammo="Pemphredo Tathlum",
		head="Befouled Crown",ring1="Stikini Ring",ring2="Stikini Ring"}
		
	sets.midcast['Enfeebling Magic'].Resistant = {}
		
    sets.midcast.ElementalEnfeeble = set_combine(sets.midcast['Enfeebling Magic'], {main="Idris",head="Amalric Coif +1",ear2="Barkaro. Earring",waist="Acuity Belt +1"})
    sets.midcast.ElementalEnfeeble.Resistant = set_combine(sets.midcast['Enfeebling Magic'].Resistant, {main="Idris",head="Amalric Coif +1",ear2="Barkaro. Earring",waist="Acuity Belt +1"})
	
	sets.midcast.IntEnfeebles = set_combine(sets.midcast['Enfeebling Magic'], {head="Amalric Coif +1",ear2="Barkaro. Earring",waist="Acuity Belt +1"})
	sets.midcast.IntEnfeebles.Resistant = set_combine(sets.midcast['Enfeebling Magic'].Resistant, {head="Amalric Coif +1",ear2="Barkaro. Earring",waist="Acuity Belt +1"})
	
	sets.midcast.MndEnfeebles = set_combine(sets.midcast['Enfeebling Magic'], {main="Idris",range=empty,ring1="Stikini Ring"})
	sets.midcast.MndEnfeebles.Resistant = set_combine(sets.midcast['Enfeebling Magic'].Resistant, {range=empty,ring1="Stikini Ring"})
	
	sets.midcast.Dia = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	sets.midcast['Dia II'] = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	
	sets.midcast.Bio = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	sets.midcast['Bio II'] = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	
	sets.midcast['Divine Magic'] = set_combine(sets.midcast['Enfeebling Magic'], {ring1="Stikini Ring"})
		
	sets.midcast['Enhancing Magic'] = {main=gear.gada_enhancing_club,sub="Ammurapi Shield",ammo="Hasty Pinion +1",
		head="Telchine Cap",neck="Incanter's Torque",ear1="Andoaa Earring",ear2="Gifted Earring",
		body="Telchine Chas.",hands="Telchine Gloves",ring1="Stikini Ring",ring2="Stikini Ring",
		back="Perimede Cape",waist="Olympus Sash",legs="Telchine Braconi",feet="Telchine Pigaches"}
		
	sets.midcast.Stoneskin = set_combine(sets.midcast['Enhancing Magic'], {neck="Nodens Gorget",ear2="Earthcry Earring",waist="Siegel Sash",legs="Shedir Seraweels"})
	
	sets.midcast.Refresh = set_combine(sets.midcast['Enhancing Magic'], {head="Amalric Coif +1"})
	
	sets.midcast.Aquaveil = set_combine(sets.midcast['Enhancing Magic'], {main="Vadose Rod",sub="Genmei Shield",head="Amalric Coif +1",hands="Regal Cuffs",waist="Emphatikos Rope",legs="Shedir Seraweels"})
	
	sets.midcast.BarElement = set_combine(sets.precast.FC['Enhancing Magic'], {legs="Shedir Seraweels"})
	
	sets.midcast.Protect = set_combine(sets.midcast['Enhancing Magic'], {ring2="Sheltered Ring",ear1="Gifted Earring",ear2="Loquacious Earring",waist="Sekhmet Corset"})
	sets.midcast.Protectra = set_combine(sets.midcast['Enhancing Magic'], {ring2="Sheltered Ring",ear1="Gifted Earring",ear2="Loquacious Earring",waist="Sekhmet Corset"})
	sets.midcast.Shell = set_combine(sets.midcast['Enhancing Magic'], {ring2="Sheltered Ring",ear1="Gifted Earring",ear2="Loquacious Earring",waist="Sekhmet Corset"})
	sets.midcast.Shellra = set_combine(sets.midcast['Enhancing Magic'], {ring2="Sheltered Ring",ear1="Gifted Earring",ear2="Loquacious Earring",waist="Sekhmet Corset"})

	-- Gear for specific elemental nukes.
	sets.element.Wind = {}
	sets.element.Ice = {}
	sets.element.Earth = {}

	--------------------------------------
	-- Idle/resting/defense/etc sets
	--------------------------------------
--Assid. Pants +1
	-- Resting sets
	sets.resting = {
		main="Idris",
		sub="Genmei Shield",
		range="Dunna",
        head="Azimuth Hood +3",
		neck="Loricate Torque +1",
		ear1="Etiolation Earring",
		ear2="Genmei Earring",
        body="Azimuth Coat +3",
		hands="Geo. Mitaines +4",
		ring1="Defending Ring",
		ring2="Murky Ring",
        back="Solemnity Cape",
		waist="Isa Belt",
		legs="Assid. Pants +1",
		feet="Geo. Sandals +4"}

	-- Idle sets

	sets.idle = {
		main="Idris",
		sub="Genmei Shield",
		range="Dunna",
        head="Azimuth Hood +3",
		neck="Loricate Torque +1",
		ear1="Etiolation Earring",
		ear2="Genmei Earring",
        body="Azimuth Coat +3",
		hands="Geo. Mitaines +4",
		ring1="Defending Ring",
		ring2="Murky Ring",
        back="Solemnity Cape",
		waist="Isa Belt",
		legs="Assid. Pants +1",
		feet="Geo. Sandals +4"}
		
	-- feet Mallquis Clogs +2
	sets.idle.PDT = {
		main="Idris",
		sub="Genmei Shield",
		range="Dunna",
        head="Azimuth Hood +3",
		neck="Loricate Torque +1",
		ear1="Etiolation Earring",
		ear2="Genmei Earring",
        body="Azimuth Coat +3",
		hands="Geo. Mitaines +4",
		ring1="Defending Ring",
		ring2="Murky Ring",
        back="Solemnity Cape",
		waist="Isa Belt",
		legs="Assid. Pants +1",
		feet="Geo. Sandals +4"}
		
	sets.idle.TPEat = set_combine(sets.idle, {})

	-- .Pet sets are for when Luopan is present.
	-- body Jhakri Robe +2 Legs Psycloth Lappas
	sets.idle.Pet = {
		main="Idris",
		sub="Genmei Shield",
		range="Dunna",
		head="Azimuth Hood +3",
		neck={ name="Bagua Charm +2", augments={'Path: A',}},
		ear1="Etiolation Earring",
		ear2="Genmei Earring",
		body="Azimuth Coat +3",
		hands="Geo. Mitaines +4",
		ring1="Defending Ring",
		ring2="Murky Ring",
		back={ name="Nantosuelta's Cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Pet: "Regen"+10','Pet: "Regen"+5',}},
		waist="Isa Belt",
		legs="Nyame Flanchard",
		feet="Bagua Sandals +3"}

	sets.idle.PDT.Pet = {
		main="Idris",
		sub="Genmei Shield",
		range="Dunna",
		head="Azimuth Hood +3",
		neck={ name="Bagua Charm +2", augments={'Path: A',}},
		ear1="Etiolation Earring",
		ear2="Genmei Earring",
		body="Azimuth Coat +3",
		hands="Geo. Mitaines +4",
		ring1="Defending Ring",
		ring2="Murky Ring",
		back={ name="Nantosuelta's Cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Pet: "Regen"+10','Pet: "Regen"+5',}},
		waist="Isa Belt",
		legs="Nyame Flanchard",
		feet="Bagua Sandals +3"
	}

	-- .Indi sets are for when an Indi-spell is active.
	sets.idle.Indi = set_combine(sets.idle, {})
	sets.idle.Pet.Indi = set_combine(sets.idle.Pet, {}) 
	sets.idle.PDT.Indi = set_combine(sets.idle.PDT, {}) 
	sets.idle.PDT.Pet.Indi = set_combine(sets.idle.PDT.Pet, {})

	sets.idle.Weak = {
		main="Idris",
		sub="Genmei Shield",
		range="Dunna",
        head="Azimuth Hood +3",
		neck="Loricate Torque +1",
		ear1="Etiolation Earring",
		ear2="Genmei Earring",
        body="Azimuth Coat +3",
		hands="Geo. Mitaines +4",
		ring1="Defending Ring",
		ring2="Murky Ring",
        back="Solemnity Cape",
		waist="Isa Belt",
		legs="Assid. Pants +1",
		feet={ name="Bagua Sandals +3", augments={'Enhances "Radial Arcana" effect',}},}

	-- Defense sets
	
	sets.defense.PDT = set_combine(sets.idle, {})

	sets.defense.MDT = set_combine(sets.idle, {})
		
    sets.defense.MEVA = set_combine(sets.idle, {})
		
	sets.defense.PetPDT = sets.idle.PDT.Pet
		
	sets.defense.NukeLock = sets.midcast['Elemental Magic']
	
	sets.defense.GeoLock = sets.midcast.Geomancy.Indi

	sets.Kiting = {feet="Geo. Sandals +4"}
	sets.latent_refresh = {waist="Fucho-no-obi"}
	sets.DayIdle = {}
	sets.NightIdle = {}
	sets.TreasureHunter = set_combine(sets.TreasureHunter, {feet=gear.chironic_treasure_feet})
	
	sets.HPDown = {}
	
	sets.buff.Doom = set_combine(sets.buff.Doom, {})

	--------------------------------------
	-- Engaged sets
	--------------------------------------

	-- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
	-- sets if more refined versions aren't defined.
	-- If you create a set with both offense and defense modes, the offense mode should be first.
	-- EG: sets.engaged.Dagger.Accuracy.Evasion

	-- Normal melee group
	sets.engaged = {
	main="Idris",
    sub="Genmei Shield",
    range={ name="Dunna", augments={'MP+20','Mag. Acc.+10','"Fast Cast"+3',}},
    head="Azimuth Hood +3",
    body="Nyame Mail",
    hands="Gazu Bracelets +1",
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet="Azimuth Gaiters +3",
    neck="Combatant's Torque",
    waist="Null Belt",
    left_ear="Dedition Earring",
    right_ear="Crep. Earring",
    left_ring="Chirich Ring +1",
    right_ring="Chirich Ring +1",
    back={ name="Nantosuelta's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10','Damage taken-5%',}},
	}

	sets.engaged.DW = {
	main="Idris",
    sub="C.Palug Hammer",
    range={ name="Dunna", augments={'MP+20','Mag. Acc.+10','"Fast Cast"+3',}},
    head="Azimuth Hood +3",
    body="Nyame Mail",
    hands="Gazu Bracelets +1",
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet="Azimuth Gaiters +3",
    neck="Combatant's Torque",
    waist="Null Belt",
    left_ear="Dedition Earring",
    right_ear="Crep. Earring",
    left_ring="Chirich Ring +1",
    right_ring="Chirich Ring +1",
    back={ name="Nantosuelta's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10','Damage taken-5%',}},
	}

	--------------------------------------
	-- Custom buff sets
	--------------------------------------
	
	-- Gear that converts elemental damage done to recover MP.	
	sets.RecoverMP = {body="Seidr Cotehardie"}
	
	-- Gear for Magic Burst mode.
	sets.RecoverBurst = {}
	
end

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
	set_macro_page(1, 6)
end

function sub_job_change(new,old)
send_command('wait 2;input /lockstyleset 3')
end

send_command('wait 2;input /lockstyleset 3')

-- function user_self_command(commandArgs, eventArgs)
	-- if commandArgs[1] == 'buff' then
	   -- send_command('input //cp unpause')
       -- add_to_chat(158,'Resuming')
	-- elseif commandArgs[1] == 'rad' then
       -- send_command('input /echo waiting; wait 1.5; input //temps buy radialens')
       -- add_to_chat(158,'Radialens')
	-- elseif commandArgs[1] == 'bli' then
       -- send_command('input /ma "Blind" <bt>')
	   -- add_to_chat(158,'Blinding')
	-- elseif commandArgs[1] == 'ewz' then
		-- send_command('ew z')
		-- add_to_chat(158,'Zoning')
	-- elseif commandArgs[1] == 'ew1' then
		-- send_command('input //ew 1')
		-- add_to_chat(158,'Zoning')
	-- elseif commandArgs[1] == 'ew2' then
		-- send_command('input //ew 2')
		-- add_to_chat(158,'Zoning')
	-- elseif commandArgs[1] == 'ew3' then
		-- send_command('input //ew 3')
		-- add_to_chat(158,'Zoning')
	-- elseif commandArgs[1] == 'ew4' then
		-- send_command('input //ew 4')
		-- add_to_chat(158,'Zoning')
	-- elseif commandArgs[1] == 'ew5' then
		-- send_command('input //ew 5')
		-- add_to_chat(158,'Zoning')
	-- elseif commandArgs[1] == 'ew6' then
		-- send_command('input //ew 6')
		-- add_to_chat(158,'Zoning')
	-- elseif commandArgs[1] == 'ew7' then
		-- send_command('input //ew 7')
		-- add_to_chat(158,'Zoning')
	-- elseif commandArgs[1] == 'ew8' then
		-- send_command('input //ew 8')
		-- add_to_chat(158,'Zoning')
	-- elseif commandArgs[1] == 'ew9' then
		-- send_command('input //ew 9')
		-- add_to_chat(158,'Zoning')
	-- elseif commandArgs[1] == 'ew10' then
		-- send_command('input //ew 10')
		-- add_to_chat(158,'Zoning')
	-- elseif commandArgs[1] == 'ew11' then
		-- send_command('input //ew 11')
		-- add_to_chat(158,'Zoning')
	-- elseif commandArgs[1] == 'ew12' then
		-- send_command('input //ew 12')
		-- add_to_chat(158,'Zoning')
	-- elseif commandArgs[1] == 'ew13' then
		-- send_command('input //ew 13')
		-- add_to_chat(158,'Zoning')
	-- elseif commandArgs[1] == 'ew14' then
		-- send_command('input //ew 14')
		-- add_to_chat(158,'Zoning')
	-- elseif commandArgs[1] == 'ew15' then
		-- send_command('input //ew 15')
		-- add_to_chat(158,'Zoning')
	-- elseif commandArgs[1] == 'stop' then
       -- windower.ffxi.run(false)
       -- windower.ffxi.follow()
	   -- add_to_chat(158,'Chillin')
	-- elseif commandArgs[1] == 'food' then
		-- send_command('input /item "Pear Crepe" <me>')
		-- add_to_chat(158,'Eating')
	-- elseif commandArgs[1] == 'charm' then
       -- send_command('input /item "Charm Buffer" <me>')
       -- add_to_chat(158,'Charm buffer')
	-- elseif commandArgs[1] == 'wing1' then
       -- send_command('input /item "Lucid Wings I" <me>')
       -- add_to_chat(158,'Lucid Wings I')
	-- elseif commandArgs[1] == 'wing2' then
       -- send_command('input /item "Lucid Wings II" <me>')
       -- add_to_chat(158,'Lucid Wings II')
	-- elseif commandArgs[1] == 'wing3' then
       -- send_command('input /item "Daedalus wing" <me>')
       -- add_to_chat(158,'Daedalus wing')
	-- elseif commandArgs[1] == 'pois' then
       -- send_command('input /item "Poison Buffer" <me>')
       -- add_to_chat(158,'Poison Buffer')
	-- elseif commandArgs[1] == 'super' then
       -- send_command('input /item "Super Revitalizer" <me>')
       -- add_to_chat(158,'Super Revitalizer')
	-- elseif commandArgs[1] == 'doom' then
       -- send_command('input /item "Savior\'s Tonic" <me>')
       -- add_to_chat(158,'Savior tonic')
	-- elseif commandArgs[1] == 'amne' then
       -- send_command('input /item "Moneta\'s Tonic"  <me>')
       -- add_to_chat(158,'Monetas Tonic')
	-- elseif commandArgs[1] == 'petri' then
       -- send_command('input /item "Mirror\'s Tonic" <me>')
       -- add_to_chat(158,'Mirrors Tonic')
	-- elseif commandArgs[1] == 'pote' then
       -- send_command('input /item "Champion\'s Drink" <me>')
       -- add_to_chat(158,'Champions Drink')
	-- end
-- end