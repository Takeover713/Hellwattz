function user_setup()

	state.OffenseMode:options('Normal','SomeAcc','Acc','HighAcc','FullAcc')
	state.HybridMode:options('Normal','DTLite')
	state.WeaponskillMode:options('Match','Normal','SomeAcc','Acc','HighAcc','FullAcc')
	state.CastingMode:options('Normal','SIRD','Resistant')
	state.PhysicalDefenseMode:options('PDT', 'PDT_HP')
	state.MagicalDefenseMode:options('MDT','MDT_HP','BDT','BDT_HP')
	state.ResistDefenseMode:options('MEVA','MEVA_HP','Death','Charm','DTCharm')
	state.IdleMode:options('Normal','Tank','KiteTank','Sphere')
	state.Weapons:options('Epeolatry','Lionheart','None')
	
	state.ExtraDefenseMode = M{['description']='Extra Defense Mode','None','MP'}
	
	state.NotifyBuffs = M(true, 'Notify Buffs')
	NotifyBuffs = S{'doom','petrification','Curse'}

	-- gear.enmity_jse_back = {name="Ogma's cape",augments={'INT+20','Eva.+20 /Mag. Eva.+20','Enmity+10',}}
	-- gear.stp_jse_back = {name="Ogma's cape",augments={'DEX+20','Accuracy+20 Attack+20','"Store TP"+10',}}
	-- gear.da_jse_back = {name="Ogma's cape",augments={'STR+20','Accuracy+20 Attack+20','"Dbl.Atk."+10',}}
	
buff_spell_lists = {
	Auto = {--Options for When are: Always, Engaged, Idle, OutOfCombat, Combat
		{Name='Crusade',	Buff='Enmity Boost',	SpellID=476,	When='Combat'},
		{Name='Temper',		Buff='Multi Strikes',	SpellID=493,	When='Engaged'},
		{Name='Phalanx',	Buff='Phalanx',			SpellID=106,	When='Always'},
		{Name='Refresh',	Buff='Refresh',			SpellID=109,	When='Idle'},
	},

	Default = {
		{Name='Crusade',	Buff='Enmity Boost',	SpellID=476,	Reapply=false},
		{Name='Temper',		Buff='Multi Strikes',	SpellID=493,	Reapply=false},
		{Name='Haste',		Buff='Haste',			SpellID=57,		Reapply=false},
		{Name='Refresh',	Buff='Refresh',			SpellID=109,	Reapply=false},
		{Name='Phalanx',	Buff='Phalanx',			SpellID=106,	Reapply=false},
	},
	
	Full = {
		{Name='Crusade',	Buff='Enmity Boost',	SpellID=476,	Reapply=false},
		{Name='Temper',		Buff='Multi Strikes',	SpellID=493,	Reapply=false},
		{Name='Haste',		Buff='Haste',			SpellID=57,		Reapply=false},
		{Name='Refresh',	Buff='Refresh',			SpellID=109,	Reapply=false},
		{Name='Aquaveil',	Buff='Aquaveil',		SpellID=55,		Reapply=false},
		{Name='Stoneskin',	Buff='Stoneskin',		SpellID=54,		Reapply=false},
		{Name='Blink',		Buff='Blink',			SpellID=53,		Reapply=false},
		{Name='Phalanx',	Buff='Phalanx',			SpellID=106,	Reapply=false},
		{Name='Regen IV',	Buff='Regen',			SpellID=477,	Reapply=false},
	},
	Melee = {
		{Name='Temper',		Buff='Multi Strikes',	SpellID=493,	Reapply=false},
		{Name='Haste',		Buff='Haste',			SpellID=57,		Reapply=false},
		{Name='Refresh',	Buff='Refresh',			SpellID=109,	Reapply=false},
		{Name='Aquaveil',	Buff='Aquaveil',		SpellID=55,		Reapply=false},
		{Name='Stoneskin',	Buff='Stoneskin',		SpellID=54,		Reapply=false},
		{Name='Blink',		Buff='Blink',			SpellID=53,		Reapply=false},
		{Name='Phalanx',	Buff='Phalanx',			SpellID=106,	Reapply=false},
		{Name='Regen IV',	Buff='Regen',			SpellID=477,	Reapply=false},
	},
}


	-- Additional local binds
		--Bind special characters.
	--@ = Windows Key
	--% = Works only when text bar not up.
	--$ = Works only when text bar is up.
	--^ = Control Key
	--! = Alt Key
	--~ = Shift Key
	--# = Apps Key
	--send_command('bind !pageup ffo me')
	--send_command('bind !pagedown ffo stopall')
	send_command('bind !` gs c SubJobEnmity')
	send_command('bind @` gs c cycle RuneElement')
	send_command('bind ^` gs c RuneElement')
	send_command('bind @pause gs c toggle AutoRuneMode')
	send_command('bind ^delete input /ja "Provoke" <stnpc>')
	send_command('bind !delete input /ma "Cure IV" <stal>')
	send_command('bind @delete input /ma "Flash" <stnpc>')
    send_command('bind !f11 gs c cycle ExtraDefenseMode')
	send_command('bind ^\\\\ input /ma "Protect IV" <t>')
	send_command('bind @\\\\ input /ma "Shell V" <t>')
	send_command('bind !\\\\ input /ma "Crusade" <me>')
	send_command('bind ^backspace input /ja "Lunge" <t>')
	send_command('bind @backspace input /ja "Gambit" <t>')
	send_command('bind !backspace input /ja "Rayke" <t>')
	send_command('bind @f8 gs c toggle AutoTankMode')
	send_command('bind @f10 gs c toggle TankAutoDefense')
	send_command('bind ^@!` gs c cycle SkillchainMode')
	send_command('bind !pause gs c toggle AutoBuffMode')
	--send_command('bind !a send @smn assault <tid>')
	--send_command('bind !s send @whm sacrosanctity')
	--send_command('bind !h send @whm hb on')
	--send_command('bind ^h send @geo hb on')
	--send_command('bind @h send @brd hb on')
	--send_command('bind !f send @others gs c attackbt')
	--send_command('bind ^q send @cor gs c toggle Autowsmode')
	--send_command('bind @q send @sam gs c toggle Autowsmode')
	--send_command('bind !z send @cor leadensalute <tid>')
	--send_command('bind !v send @geo fullcircle')
	-- send_command('bind @x send @smn thunderspark <tid>')
	--send_command('bind ![ send @geo fira3 <tid>')
	--send_command('bind !] send @geo Thundara3 <tid>')
	-- send_command('bind !x send @smn voltstrike <tid>')
	-- send_command('bind ^x send @smn apogee')
	-- send_command('bind !b gs c buffup Full')
	--send_command('bind !m send @geo geomalaise <tid>')
	--send_command('bind !c send @geo c1 hell')
	--send_command('bind !r gs c weapons Lionheart;gs c update')
	
	autows = 'Dimidiation'
	autowstp = 1250
	
	select_default_macro_book()
end

function init_gear_sets()

    sets.Enmity = {		
		ammo="Sapience orb",
		head="Halitus Helm",
		body="Emet Harness +1",
		hands="Kurys Gloves",
		legs="Eri. Leg Guards +3",
		feet="Erilaz Greaves +3",
		neck="Moonlight Necklace",
		waist="Trance belt",
		left_ear="Cryptic Earring",
		right_ear="Pluto's Pearl",
		left_ring="Defending Ring",
		right_ring="Moonlight Ring",
		back={ name="Ogma's cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','HP+20','Enmity+10','Phys. dmg. taken-10%',}},}
		
		
		--ammo="Sapience orb",
	--	head="Halitus Helm",
	--	body="Emet Harness +1",
	--	hands="Kurys Gloves",
	--	legs="Eri. Leg Guards +3",
	--	feet="Erilaz Greaves +3",
	--	neck="Moonlight Necklace",
	--	waist="Goading Belt",
	--	left_ear="Cryptic Earring",
	--	right_ear="Pluto's Pearl",
	--	left_ring="Provocare Ring",
	--	right_ring="Supershear Ring",
	--	back={ name="Ogma's cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','HP+20','Enmity+10','Phys. dmg. taken-10%',}},
		
	sets.precast.FC.SIRD = {
		ammo="Staunch Tathlum +1",
		head="Erilaz Galea +3",
		neck="Moonlight Necklace",
		ear1="Halasz Earring",
		ear2="Cryptic Earring",
		body="Erilaz Surcoat +3",
		hands="Regal Gauntlets",
		left_ring="Defending Ring",
		right_ring="Moonlight Ring",
		back={ name="Ogma's cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','HP+20','"Fast Cast"+10','Spell interruption rate down-10%',}},
		waist="Audumbla Sash",
		legs="Carmine Cuisses +1",
		feet="Erilaz Greaves +3"
		}
		
		-- sets["MC_SIRD"] = {
    -- ammo="Staunch Tathlum +1",
    -- head="Erilaz Galea +3",
    -- neck="Moonlight Necklace",
    -- ear1="Magnetic Earring",
    -- ear2="Halasz Earring",
    -- body="Nyame Mail",
    -- hands="Rawhide Gloves",
    -- ring1="Defending Ring",
    -- ring2="Gelatinous Ring +1",
    -- back="Ogma's Cape",
    -- waist="Audumbla Sash",
    -- legs="Carmine Cuisses +1",
    -- feet="Erilaz Greaves +3"
-- }
		 
    sets.Enmity.SIRD = {
		ammo="Staunch Tathlum +1",
		head="Erilaz Galea +3",
		neck="Moonlight Necklace",
		ear1="Halasz Earring",
		ear2="Cryptic Earring",
		body="Emet Harness +1",
		hands="Regal Gauntlets",
		ring1="Defending Ring",
		ring2="Moonlight Ring",
		back={ name="Ogma's cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','HP+20','"Fast Cast"+10','Spell interruption rate down-10%',}},
		waist="Audumbla Sash",
		legs="Carmine Cuisses +1",
		feet="Erilaz Greaves +3"}

    sets.Enmity.DT = {}

	--------------------------------------
	-- Precast sets
	--------------------------------------

	-- Item sets.

	-- Precast sets to enhance JAs
    sets.precast.JA['Vallation'] = set_combine(sets.Enmity,{body="Runeist's Coat +1",legs="Futhark Trousers +1"})
    sets.precast.JA['Valiance'] = sets.precast.JA['Vallation']
    sets.precast.JA['Pflug'] = set_combine(sets.Enmity,{feet="Runeist's Boots +1"})
    sets.precast.JA['Battuta'] = set_combine(sets.Enmity,{head="Fu. Bandeau +4"})
    sets.precast.JA['Liement'] = set_combine(sets.Enmity,{body="Futhark Coat +1"})
    sets.precast.JA['Gambit'] = set_combine(sets.Enmity,{hands="Runeist's Mitons +1"})
    sets.precast.JA['Rayke'] = set_combine(sets.Enmity,{feet="Futhark Boots +1"})
    sets.precast.JA['Elemental Sforzo'] = set_combine(sets.Enmity,{body="Futhark Coat +1"})
    sets.precast.JA['Swordplay'] = set_combine(sets.Enmity,{hands="Futhark Mitons +1"})
    sets.precast.JA['Embolden'] = set_combine(sets.Enmity,{})
    sets.precast.JA['One For All'] = set_combine(sets.Enmity,{waist="Plat. Mog. Belt"}) -- body="Runeist Coat +1"
    sets.precast.JA['Provoke'] = set_combine(sets.Enmity, {})
	sets.precast.JA['Warcry'] = set_combine(sets.Enmity, {})
	sets.precast.JA['Defender'] = set_combine(sets.Enmity, {})
	sets.precast.JA['Berserk'] = set_combine(sets.Enmity, {})
	sets.precast.JA['Last Resort'] = set_combine(sets.Enmity, {})
	sets.precast.JA['Aggressor'] = set_combine(sets.Enmity, {})
	sets.precast.JA['Animated Flourish'] = set_combine(sets.Enmity, {})

    -- sets.precast.JA['Vallation'].DT = set_combine(sets.Enmity.DT,{body="Runeist's Coat +1", legs="Futhark Trousers +1"})
    -- sets.precast.JA['Valiance'].DT = sets.precast.JA['Vallation'].DT
    -- sets.precast.JA['Pflug'].DT = set_combine(sets.Enmity.DT,{feet="Runeist's Boots +1"})
    -- sets.precast.JA['Battuta'].DT = set_combine(sets.Enmity.DT,{head="Fu. Bandeau +4"})
    -- sets.precast.JA['Liement'].DT = set_combine(sets.Enmity.DT,{body="Futhark Coat +1"})
    -- sets.precast.JA['Gambit'].DT = set_combine(sets.Enmity.DT,{hands="Runeist's Mitons +1"})
    -- sets.precast.JA['Rayke'].DT = set_combine(sets.Enmity.DT,{feet="Futhark Boots +1"})
    -- sets.precast.JA['Elemental Sforzo'].DT = set_combine(sets.Enmity.DT,{body="Futhark Coat +1"})
    -- sets.precast.JA['Swordplay'].DT = set_combine(sets.Enmity.DT,{hands="Futhark Mitons +1"})
    -- sets.precast.JA['Embolden'].DT = set_combine(sets.Enmity.DT,{})
    -- sets.precast.JA['One For All'].DT = set_combine(sets.Enmity.DT,{})
    -- sets.precast.JA['Provoke'].DT = set_combine(sets.Enmity.DT, {})
	-- sets.precast.JA['Warcry'].DT = set_combine(sets.Enmity.DT, {})
	-- sets.precast.JA['Defender'].DT = set_combine(sets.Enmity.DT, {})
	-- sets.precast.JA['Berserk'].DT = set_combine(sets.Enmity.DT, {})
	-- sets.precast.JA['Last Resort'].DT = set_combine(sets.Enmity.DT, {})
	-- sets.precast.JA['Aggressor'].DT = set_combine(sets.Enmity.DT, {})
	-- sets.precast.JA['Animated Flourish'].DT = set_combine(sets.Enmity.DT, {})

    sets.precast.JA['Lunge'] = {ammo="Seeth. Bomblet +1",
        head=gear.herculean_nuke_head,neck="Baetyl Pendant",ear1="Friomisi Earring",ear2="Crematio Earring",
        body="Samnuha Coat",hands="Carmine Fin. Ga. +1",ring1="Shiva Ring +1",ring2="Shiva Ring +1",
        back="Toro Cape",waist="Eschan Stone",legs=gear.herculean_nuke_legs,feet=gear.herculean_nuke_feet}

	sets.precast.JA['Swipe'] = sets.precast.JA['Lunge']

	sets.element.Earth = {neck="Quanpur Necklace"}

	-- Pulse sets, different stats for different rune modes, stat aligned.
    sets.precast.JA['Vivacious Pulse'] = {head="Erilaz Galea +3",neck="Incanter's Torque",ring1="Stikini Ring",ring2="Stikini Ring",legs="Rune. Trousers +1"}
    sets.precast.JA['Vivacious Pulse']['Ignis'] = set_combine(sets.precast.JA['Vivacious Pulse'], {})
	sets.precast.JA['Vivacious Pulse']['Gelus'] = set_combine(sets.precast.JA['Vivacious Pulse'], {})
	sets.precast.JA['Vivacious Pulse']['Flabra'] = set_combine(sets.precast.JA['Vivacious Pulse'], {})
	sets.precast.JA['Vivacious Pulse']['Tellus'] = set_combine(sets.precast.JA['Vivacious Pulse'], {})
	sets.precast.JA['Vivacious Pulse']['Sulpor'] = set_combine(sets.precast.JA['Vivacious Pulse'], {})
	sets.precast.JA['Vivacious Pulse']['Unda'] = set_combine(sets.precast.JA['Vivacious Pulse'], {})
	sets.precast.JA['Vivacious Pulse']['Lux'] = set_combine(sets.precast.JA['Vivacious Pulse'], {})
	sets.precast.JA['Vivacious Pulse']['Tenebrae'] = set_combine(sets.precast.JA['Vivacious Pulse'], {})
	
	
    -- Waltz set (chr and vit)
    sets.precast.Waltz = {ammo="Yamarang",
        head="Carmine Mask +1",neck="Unmoving Collar +1",ear1="Enchntr. Earring +1",ear2="Handler's Earring +1",
        body=gear.herculean_waltz_body,hands=gear.herculean_waltz_hands,ring1="Defending Ring",ring2="Valseur's Ring",
        back="Moonlight Cape",waist="Chaac Belt",legs="Dashing Subligar",feet=gear.herculean_waltz_feet}
        
    -- Don't need any special gear for Healing Waltz.
    sets.precast.Waltz['Healing Waltz'] = {}
	
    sets.precast.Step = {}
		
	sets.precast.JA['Violent Flourish'] = {}
		
	-- Fast cast sets for spells
	
    --sets.precast.FC = {		ammo="Sapience Orb",
	--	head="Rune. Bandeau +4",
	--	body="Taeon Tabard",
	--	hands={ name="Leyline Gloves", augments={'Accuracy+12','Mag. Acc.+14','"Mag.Atk.Bns."+15','"Fast Cast"+2',}},
	--	legs={ name="Futhark Trousers +1", augments={'Enhances "Inspire" effect',}},
	--	feet="Carmine Greaves +1",
--		neck="Voltsurge Torque",
	--	waist="Tempus Fugit",
	--	left_ear="Enchntr. Earring +1",
	--	right_ear="Loquac. Earring",
	--	left_ring="Prolix Ring",
	--	right_ring="Kishar Ring",
	--	back={ name="Ogma's cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','HP+20','"Fast Cast"+10','Spell interruption rate down-10%',}},}
		
	sets.precast.FC = {		
		ammo="Sapience Orb",
		head="Rune. Bandeau +4",
		neck="Voltsurge Torque",
		left_ear="Etiolation Earring",
		right_ear="Odnowa Earring +1",
		body="Erilaz Surcoat +3",
		hands="Leyline Gloves",
		left_ring="Moonlight Ring",
		right_ring="Moonlight Ring",
		legs="Agwu's Slops",
		feet="Carmine Greaves +1",
		back={ name="Ogma's cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','HP+20','"Fast Cast"+10','Spell interruption rate down-10%',}},}
		
	--ammo="Sapience Orb",
    --head="Rune. Bandeau +4",
    --neck="Orunmila's Torque",
    --ear1="Etiolation Earring",
    --ear2="Odnowa Earring +1",
    --body="Erilaz Surcoat +3",
    --hands="Leyline Gloves",
    --ring1="Moonlight Ring",
    --ring2="Moonlight Ring",
    --back="Ogma's Cape",
    --legs="Agwu's Slops",
    --feet="Carmine Greaves +1"
		
			
	sets.precast.FC.DT = {ammo="Staunch Tathlum +1",
        head="Rune. Bandeau +4",neck="Loricate Torque +1",ear1="Odnowa Earring +1",ear2="Odnowa Earring",
        body="Runeist's Coat +3",hands=gear.herculean_dt_hands,ring1="Moonbeam Ring",ring2="Moonbeam Ring",
        back="Moonlight Cape",waist="Flume Belt",legs="Eri. Leg Guards +3",feet="Erilaz Greaves +3"}
			
    sets.precast.FC['Enhancing Magic'] = set_combine(sets.precast.FC, {waist="Siegel Sash", legs="Futhark Trousers +1"})
    sets.precast.FC.Utsusemi = set_combine(sets.precast.FC, {neck='Magoraga beads', back="Mujin Mantle"})
	sets.precast.FC.Cure = set_combine(sets.precast.FC, {})

	-- Weaponskill sets
	sets.precast.WS = {    
	ammo="Knobkierrie",
    head="Meghanada Visor +1",
    body="Meg. Cuirie +1",
    hands="Meg. Gloves +1",
    legs="Meg. Chausses +1",
    feet="Meg. Jam. +1",
    neck="Fotia Gorget",
    waist="Fotia Belt",
    left_ear="Moonshade Earring",
    right_ear="Ishvara Earring",
    left_ring="Niqmaddu ring",
    right_ring="Regal Ring",
    back={ name="Ogma's cape", augments={'STR+20','Accuracy+20 Attack+20','STR+10','"Dbl.Atk."+10',}},}
	sets.precast.WS.SomeAcc = {}
	sets.precast.WS.Acc = {}
	sets.precast.WS.HighAcc = {}
	sets.precast.WS.FullAcc = {}

    sets.precast.WS['Resolution'] = set_combine(sets.precast.WS,{})
    sets.precast.WS['Resolution'].Acc = set_combine(sets.precast.WS.Acc,{})
    sets.precast.WS['Resolution'].HighAcc = set_combine(sets.precast.WS.HighAcc,{})
	sets.precast.WS['Resolution'].FullAcc = set_combine(sets.precast.WS.FullAcc,{})

    sets.precast.WS['Dimidiation'] = set_combine(sets.precast.WS,{
		body="Herculean Vest",
		head="Herculean Helm",
		right_ring="Ilabrat Ring",
		legs="Lustr. Subligar +1",
		feet="Lustra. Leggings +1",
		back={ name="Ogma's cape", augments={'DEX+20','Accuracy+20 Attack+20','Weapon skill damage +10%','Phys. dmg. taken-10%',}},})
    sets.precast.WS['Dimidiation'].Acc = set_combine(sets.precast.WS.Acc,{t})
	sets.precast.WS['Dimidiation'].HighAcc = set_combine(sets.precast.WS.HighAcc,{})
	sets.precast.WS['Dimidiation'].FullAcc = set_combine(sets.precast.WS.FullAcc,{})
	
    sets.precast.WS['Ground Strike'] = set_combine(sets.precast.WS,{})
    sets.precast.WS['Ground Strike'].Acc = set_combine(sets.precast.WS.Acc,{})
	sets.precast.WS['Ground Strike'].HighAcc = set_combine(sets.precast.WS.HighAcc,{})
	sets.precast.WS['Ground Strike'].FullAcc = set_combine(sets.precast.WS.FullAcc,{})
		
    sets.precast.WS['Herculean Slash'] = set_combine(sets.precast['Lunge'], {})
	sets.precast.WS['Sanguine Blade'] = set_combine(sets.precast['Lunge'], {})

	--------------------------------------
	-- Midcast sets
	--------------------------------------
	
    sets.midcast.FastRecast = {ammo="Impatiens",
            head="Carmine Mask +1",neck="Voltsurge Torque",ear1="Enchntr. Earring +1",ear2="Loquacious Earring",
            body="Dread Jupon",hands="Leyline Gloves",ring1="Lebeche Ring",ring2="Kishar Ring",
            back="Moonlight Cape",waist="Flume Belt",legs="Rawhide Trousers",feet="Carmine Greaves +1"}
			
	sets.midcast.FastRecast.DT = {ammo="Staunch Tathlum +1",
        head="Fu. Bandeau +4",neck="Loricate Torque +1",ear1="Odnowa Earring +1",ear2="Odnowa Earring",
        body="Runeist's Coat +3",hands=gear.herculean_dt_hands,ring1="Moonbeam Ring",ring2="Moonbeam Ring",
        back="Moonlight Cape",waist="Flume Belt",legs="Eri. Leg Guards +3",feet="Erilaz Greaves +3"}

    sets.midcast['Enhancing Magic'] = set_combine(sets.midcast.FastRecast,{		
		head="Erilaz Galea +3",
		body="Erilaz Surcoat +3",
		hands="Regal Gauntlets",
		legs={ name="Futhark Trousers +1", augments={'Enhances "Inspire" effect',}},
		feet="Erilaz Greaves +3",
		neck="Incanter's Torque",
		waist="Olympus Sash",
		left_ear="Andoaa Earring",
		right_ear="Mimir Earring",
		left_ring="Stikini Ring",
		right_ring="Stikini Ring",
		back="Merciful Cape"})
		
    sets.midcast['Phalanx'] = set_combine(sets.midcast['Enhancing Magic'],{head="Fu. Bandeau +4",legs="Carmine Cuisses +1"})
    sets.midcast['Regen'] = set_combine(sets.midcast['Enhancing Magic'],{head="Rune. Bandeau +4"}) 
	sets.midcast['Refresh'] = set_combine(sets.midcast['Enhancing Magic'],{head="Erilaz Galea +3"}) 
    sets.midcast.Stoneskin = set_combine(sets.midcast['Enhancing Magic'], {ear2="Earthcry Earring",waist="Siegel Sash"})
	sets.midcast.Flash = set_combine(sets.Enmity, {})
	sets.midcast.Foil = set_combine(sets.Enmity, {})
	--sets.midcast.Flash.SIRD = set_combine(sets.Enmity.SIRD, {})
	--sets.midcast.Foil.SIRD = set_combine(sets.Enmity.SIRD, {})
    sets.midcast.Stun = set_combine(sets.Enmity, {})
	sets.midcast.Stun.DT = set_combine(sets.Enmity.DT, {})
	sets.midcast.Jettatura = set_combine(sets.Enmity, {})
	sets.midcast.Jettatura.DT = set_combine(sets.Enmity.DT, {})
	sets.midcast['Blue Magic'] = set_combine(sets.Enmity, {})
	sets.midcast['Blue Magic'].DT = set_combine(sets.Enmity.DT, {})
	sets.midcast['Blue Magic'].SIRD = set_combine(sets.Enmity.SIRD, {})
	sets.midcast.Cocoon = set_combine(sets.Enmity.SIRD, {})

    sets.midcast.Cure = {ammo="Staunch Tathlum +1",
        head="Carmine Mask +1",neck="Phalaina Locket",ear1="Mendi. Earring",ear2="Roundel Earring",
        body="Vrikodara Jupon",hands="Buremte Gloves",ring1="Lebeche Ring",ring2="Janniston Ring",
        back="Tempered Cape +1",waist="Luminary Sash",legs="Carmine Cuisses +1",feet="Skaoi Boots"}
		
	sets.midcast['Wild Carrot'] = set_combine(sets.midcast.Cure, {})
		
	sets.Self_Healing = {neck="Phalaina Locket",hands="Buremte Gloves",ring2="Kunaji Ring",waist="Gishdubar Sash"}
	sets.Cure_Received = {neck="Phalaina Locket",hands="Buremte Gloves",ring2="Kunaji Ring",waist="Gishdubar Sash"}
	sets.Self_Refresh = {waist="Gishdubar Sash"}
	
    sets.midcast.Protect = set_combine(sets.midcast['Enhancing Magic'], {ring2="Sheltered Ring"})
    sets.midcast.Shell = set_combine(sets.midcast['Enhancing Magic'], {ring2="Sheltered Ring"})

	--------------------------------------
	-- Idle/resting/defense/etc sets
	--------------------------------------

	sets.resting = {}

    sets.idle = {		
		ammo="Staunch Tathlum +1",
		head="Erilaz Galea +3",
		body="Erilaz Surcoat +3",
		hands="Erilaz Gauntlets +3",
		legs="Eri. Leg Guards +3",
		feet="Erilaz Greaves +3",
		neck={ name="Loricate Torque +1", augments={'Path: A',}},
		waist="Engraved Belt",
		left_ear="Odnowa Earring",
		right_ear="Odnowa Earring +1",
		left_ring="Defending Ring",
		right_ring="Moonlight Ring",
		back={ name="Ogma's Cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','HP+20','Enmity+10','Phys. dmg. taken-10%',}},
		}
		
    sets.idle.Sphere = set_combine(sets.idle,{body="Mekosu. Harness"})
			
	sets.idle.Tank = {		
		ammo="Staunch Tathlum +1",
		head="Erilaz Galea +3",
		body="Erilaz Surcoat +3",
		hands="Erilaz Gauntlets +3",
		legs="Eri. Leg Guards +3",
		feet="Erilaz Greaves +3",
		neck={ name="Loricate Torque +1", augments={'Path: A',}},
		waist="Engraved Belt",
		left_ear="Odnowa Earring",
		right_ear="Odnowa Earring +1",
		left_ring="Defending Ring",
		right_ring="Moonlight Ring",
		back={ name="Ogma's Cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','HP+20','Enmity+10','Phys. dmg. taken-10%',}},
		}
		
	sets.idle.KiteTank = {ammo="Staunch Tathlum +1",
        head="Fu. Bandeau +4",neck="Vim Torque +1",ear1="Genmei Earring",ear2="Ethereal Earring",
        body="Futhark Coat +1",hands=gear.herculean_dt_hands,ring1="Defending Ring",ring2="Moonbeam Ring",
        back="Moonlight Cape",waist="Flume Belt",legs="Carmine Cuisses +1",feet="Hippo. Socks +1"}

	sets.idle.Weak = {		
		ammo="Staunch Tathlum +1",
		head="Erilaz Galea +3",
		body="Erilaz Surcoat +3",
		hands="Erilaz Gauntlets +3",
		legs="Eri. Leg Guards +3",
		feet="Erilaz Greaves +3",
		neck={ name="Loricate Torque +1", augments={'Path: A',}},
		waist="Engraved Belt",
		left_ear="Odnowa Earring",
		right_ear="Odnowa Earring +1",
		left_ring="Defending Ring",
		right_ring="Moonlight Ring",
		back={ name="Ogma's Cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','HP+20','Enmity+10','Phys. dmg. taken-10%',}},
		}

	sets.Kiting = {legs="Carmine Cuisses +1"}
	
	sets.latent_refresh = {waist="Fucho-no-obi"}
	sets.DayIdle = {}
	sets.NightIdle = {}

    -- Extra defense sets.  Apply these on top of melee or defense sets.
    sets.Knockback = {}
    sets.MP = {ear2="Ethereal Earring",waist="Flume Belt"}
	sets.TreasureHunter = set_combine(sets.TreasureHunter, {})
	
	-- Weapons sets
	sets.weapons.Epeolatry = {main="Epeolatry",sub="Utu Grip"}
	sets.weapons.Lionheart = {main="Lionheart",sub="Utu Grip"}
	--sets.weapons.Prime = {main="Helheim",sub="Utu Grip"}
	--sets.weapons.Trial = {main="Sword of Trials",sub="Utu Grip"}
	--sets.weapons.DualWeapons = {main="Firangi",sub="Reikiko"}
	
	-- Defense Sets
	
	sets.defense.PDT = {		ammo="Staunch Tathlum +1",
		head={ name="Fu. Bandeau +4", augments={'Enhances "Battuta" effect',}},
		body="Futhark Coat +1",
		hands="Runeist Mitons +1",
		legs="Eri. Leg Guards +3",
		feet="Erilaz Greaves +3",
		neck="Loricate Torque +1",
		waist="Flume Belt +1",
		left_ear="Odnowa Earring",
		right_ear="Odnowa Earring +1",
		left_ring="Defending Ring",
		right_ring="Moonlight Ring",
		back={ name="Ogma's cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','HP+20','Enmity+10','Phys. dmg. taken-10%',}},}
		
	sets.defense.PDT_HP = {ammo="Staunch Tathlum +1",
        head="Fu. Bandeau +4",neck="Loricate Torque +1",ear1="Odnowa Earring +1",ear2="Odnowa Earring",
        body="Runeist's Coat +3",hands=gear.herculean_dt_hands,ring1="Moonbeam Ring",ring2="Moonbeam Ring",
        back="Moonlight Cape",waist="Flume Belt",legs="Eri. Leg Guards +3",feet="Erilaz Greaves +3"}
		
	sets.defense.MDT = {    
	ammo="Staunch Tathlum +1",
    head={ name="Fu. Bandeau +4", augments={'Enhances "Battuta" effect',}},
    body="Futhark Coat +1",
    hands="Runeist Mitons +1",
    legs="Eri. Leg Guards +3",
    feet="Erilaz Greaves +3",
    neck="Loricate Torque +1",
    waist="Engraved belt",
    left_ear="Odnowa Earring",
    right_ear="Odnowa Earring +1",
    left_ring="Defending Ring",
    right_ring="Moonlight Ring",
    back="Moonbeam Cape",}
	
	sets.defense.MDT_HP = {ammo="Staunch Tathlum +1",
        head="Erilaz Galea +3",neck="Loricate Torque +1",ear1="Odnowa Earring +1",ear2="Odnowa Earring",
        body="Runeist's Coat +3",hands=gear.herculean_dt_hands,ring1="Moonbeam Ring",ring2="Moonbeam Ring",
        back="Moonlight Cape",waist="Engraved Belt",legs="Eri. Leg Guards +3",feet="Erilaz Greaves +3"}
	
	sets.defense.BDT = {    ammo="Staunch Tathlum +1",
    head={ name="Fu. Bandeau +4", augments={'Enhances "Battuta" effect',}},
    body="Futhark Coat +1",
    hands="Runeist Mitons +1",
    legs="Eri. Leg Guards +3",
    feet="Erilaz Greaves +3",
    neck="Loricate Torque +1",
    waist="Engraved belt",
    left_ear="Odnowa Earring",
    right_ear="Odnowa Earring +1",
    left_ring="Defending Ring",
    right_ring="Moonlight Ring",
    back="Moonbeam Cape",}
	
	sets.defense.BDT_HP = {ammo="Staunch Tathlum +1",
        head="Erilaz Galea +3",neck="Loricate Torque +1",ear1="Odnowa Earring +1",ear2="Odnowa Earring",
        body="Runeist's Coat +3",hands=gear.herculean_dt_hands,ring1="Moonbeam Ring",ring2="Moonbeam Ring",
        back="Moonlight Cape",waist="Engraved Belt",legs="Eri. Leg Guards +3",feet="Erilaz Greaves +3"}
	
	sets.defense.MEVA = {    ammo="Staunch Tathlum +1",
    head={ name="Fu. Bandeau +4", augments={'Enhances "Battuta" effect',}},
    body="Futhark Coat +1",
    hands="Runeist Mitons +1",
    legs="Eri. Leg Guards +3",
    feet="Erilaz Greaves +3",
    neck="Loricate Torque +1",
    waist="Engraved belt",
    left_ear="Odnowa Earring",
    right_ear="Odnowa Earring +1",
    left_ring="Defending Ring",
    right_ring="Moonlight Ring",
    back="Moonbeam Cape",}
	
	sets.defense.MEVA_HP = {ammo="Staunch Tathlum +1",
        head="Erilaz Galea +3",neck="Warder's Charm +1",ear1="Odnowa Earring +1",ear2="Sanare Earring",
        body="Runeist's Coat +3",hands="Erilaz Gauntlets +3",ring1="Moonbeam Ring",ring2="Moonbeam Ring",
        back="Moonlight Cape",waist="Engraved Belt",legs="Rune. Trousers +3",feet="Erilaz Greaves +3"}
		
	sets.defense.Death = {ammo="Staunch Tathlum +1",
        head="Erilaz Galea +3",neck="Warder's Charm +1",ear1="Odnowa Earring +1",ear2="Sanare Earring",
        body="Runeist's Coat +3",hands="Erilaz Gauntlets +3",ring1="Purity Ring",ring2="Vengeful Ring",
        back=gear.enmity_jse_back,waist="Engraved Belt",legs="Rune. Trousers +3",feet="Erilaz Greaves +3"}

	sets.defense.DTCharm = {ammo="Staunch Tathlum +1",
        head="Erilaz Galea +3",neck="Unmoving Collar +1",ear1="Odnowa Earring +1",ear2="Sanare Earring",
        body="Runeist's Coat +3",hands="Erilaz Gauntlets +3",ring1="Defending Ring",ring2="Moonlight Ring",
        back=gear.enmity_jse_back,waist="Engraved Belt",legs="Rune. Trousers +3",feet="Erilaz Greaves +3"}
		
	sets.defense.Charm = {ammo="Staunch Tathlum +1",
        head="Erilaz Galea +3",neck="Unmoving Collar +1",ear1="Odnowa Earring +1",ear2="Sanare Earring",
        body="Runeist's Coat +3",hands="Erilaz Gauntlets +3",ring1="Purity Ring",ring2="Vengeful Ring",
        back=gear.enmity_jse_back,waist="Engraved Belt",legs="Rune. Trousers +3",feet="Erilaz Greaves +3"}
	
	-- Swap to these on Moonshade using WS if at 3000 TP
	sets.MaxTP = {ear1="Brutal Earring"}
	sets.AccMaxTP = {ear1="Telos Earring"}

	--------------------------------------
	-- Engaged sets
	--------------------------------------

    sets.engaged = {
    ammo="Yamarang",
    head="Aya. Zucchetto +2",
    body="Ayanmo Corazza +2",
    hands="Turms Mittens +1",
    legs="Eri. Leg Guards +3",
    feet="Turms Leggings +1",
    neck="Anu Torque",
    waist="Sailfi Belt +1",
    left_ear="Sherida Earring",
    right_ear="Digni. Earring",
    left_ring="Moonlight Ring",
    right_ring="Moonlight Ring",
    back={ name="Ogma's Cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','HP+20','Enmity+10','Phys. dmg. taken-10%',}},
}
	
	-- sub="Utu Grip",
    -- ammo="Staunch Tathlum +1",
    -- head="Adhemar Bonnet +1",
    -- neck="Futhark Torque +2",
    -- ear1="Sherida Earring",
    -- ear2="Telos Earring",
    -- body="Ashera Harness",
    -- hands="Adhemar Wrist. +1",
    -- ring1="Moonlight Ring",
    -- ring2="Moonlight Ring",
    -- back="Ogma's Cape",
    -- waist="Windbuffet Belt +1",
    -- legs="Nyame Flanchard",
    -- feet="Nyame Sollerets"
	
	
	
	
	-- {ammo="Staunch Tathlum +1",
		-- head={ name="Fu. Bandeau +4", augments={'Enhances "Battuta" effect',}},
		-- body="Futhark Coat +1",
		-- hands="Turms Mittens +1",
		-- legs="Eri. Leg Guards +3",
		-- feet="Turms Leggings +1",
		-- neck="Loricate Torque +1",
		-- waist="Flume Belt +1",
		-- left_ear="Odnowa Earring",
		-- right_ear="Odnowa Earring +1",
		-- left_ring="Defending Ring",
		-- right_ring="Moonlight Ring",
		-- back={ name="Ogma's cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','HP+20','Enmity+10','Phys. dmg. taken-10%',}},}
    
	sets.engaged.SomeAcc = {ammo="Yamarang",
            head="Dampening Tam",neck="Combatant's Torque",ear1="Brutal Earring",ear2="Sherida Earring",
            body="Ayanmo Corazza +2",hands="Adhemar Wrist. +1",ring1="Niqmaddu Ring",ring2="Epona's Ring",
            back=gear.stp_jse_back,waist="Windbuffet Belt +1",legs="Samnuha Tights",feet=gear.herculean_ta_feet}
	
	sets.engaged.Acc = {ammo="Falcon Eye",
            head="Dampening Tam",neck="Combatant's Torque",ear1="Cessance Earring",ear2="Sherida Earring",
            body="Ayanmo Corazza +2",hands="Adhemar Wrist. +1",ring1="Niqmaddu Ring",ring2="Epona's Ring",
            back=gear.stp_jse_back,waist="Windbuffet Belt +1",legs="Meg. Chausses +2",feet=gear.herculean_ta_feet}
	
	sets.engaged.HighAcc = {ammo="Falcon Eye",
            head="Aya. Zucchetto +2",neck="Combatant's Torque",ear1="Telos Earring",ear2="Sherida Earring",
            body="Ayanmo Corazza +2",hands="Meg. Gloves +2",ring1="Niqmaddu Ring",ring2="Ilabrat Ring",
            back=gear.stp_jse_back,waist="Grunfeld Rope",legs="Meg. Chausses +2",feet=gear.herculean_acc_feet}
	
	sets.engaged.FullAcc = {ammo="Falcon Eye",
            head="Carmine Mask +1",neck="Combatant's Torque",ear1="Telos Earring",ear2="Zennaroi Earring",
            body="Ayanmo Corazza +2",hands="Meg. Gloves +2",ring1="Ramuh Ring +1",ring2="Ramuh Ring +1",
            back=gear.stp_jse_back,waist="Olseni Belt",legs="Carmine Cuisses +1",feet=gear.herculean_acc_feet}
    
	sets.engaged.DTLite = {
		ammo="Staunch Tathlum +1",
		head="Erilaz Galea +3",
		body="Erilaz Surcoat +3",
		hands="Erilaz Gauntlets +3",
		legs="Eri. Leg Guards +3",
		feet="Erilaz Greaves +3",
		neck={ name="Loricate Torque +1", augments={'Path: A',}},
		waist="Engraved Belt",
		left_ear="Odnowa Earring",
		right_ear="Odnowa Earring +1",
		left_ring="Defending Ring",
		right_ring="Moonlight Ring",
		back={ name="Ogma's Cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','HP+20','Enmity+10','Phys. dmg. taken-10%',}},
		}
    sets.engaged.SomeAcc.DTLite = {ammo="Falcon Eye",
            head="Aya. Zucchetto +2",neck="Loricate Torque +1",ear1="Cessance Earring",ear2="Sherida Earring",
            body="Ayanmo Corazza +2",hands="Meg. Gloves +2",ring1="Defending Ring",ring2="Patricius Ring",
            back="Moonlight Cape",waist="Windbuffet Belt +1",legs="Meg. Chausses +2",feet="Ahosi Leggings"}
	sets.engaged.Acc.DTLite = {ammo="Falcon Eye",
            head="Aya. Zucchetto +2",neck="Loricate Torque +1",ear1="Telos Earring",ear2="Sherida Earring",
            body="Ayanmo Corazza +2",hands="Meg. Gloves +2",ring1="Defending Ring",ring2="Patricius Ring",
            back="Moonlight Cape",waist="Grunfeld Rope",legs="Meg. Chausses +2",feet="Ahosi Leggings"}
	sets.engaged.HighAcc.DTLite = {ammo="Falcon Eye",
            head="Aya. Zucchetto +2",neck="Loricate Torque +1",ear1="Telos Earring",ear2="Sherida Earring",
            body="Ayanmo Corazza +2",hands="Meg. Gloves +2",ring1="Defending Ring",ring2="Patricius Ring",
            back="Moonlight Cape",waist="Olseni Belt",legs="Meg. Chausses +2",feet="Ahosi Leggings"}
	sets.engaged.FullAcc.DTLite = {ammo="Falcon Eye",
            head="Aya. Zucchetto +2",neck="Loricate Torque +1",ear1="Telos Earring",ear2="Zennaroi Earring",
            body="Ayanmo Corazza +2",hands="Meg. Gloves +2",ring1="Defending Ring",ring2="Patricius Ring",
            back="Moonlight Cape",waist="Olseni Belt",legs="Meg. Chausses +2",feet="Ahosi Leggings"}
	
    sets.engaged.Tank = {
		ammo="Staunch Tathlum +1",
		head="Erilaz Galea +3",
		body="Erilaz Surcoat +3",
		hands="Erilaz Gauntlets +3",
		legs="Eri. Leg Guards +3",
		feet="Erilaz Greaves +3",
		neck={ name="Loricate Torque +1", augments={'Path: A',}},
		waist="Engraved Belt",
		left_ear="Odnowa Earring",
		right_ear="Odnowa Earring +1",
		left_ring="Defending Ring",
		right_ring="Moonlight Ring",
		back={ name="Ogma's Cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','HP+20','Enmity+10','Phys. dmg. taken-10%',}},
		}
    sets.engaged.SomeAcc.Tank = sets.engaged.Tank
	sets.engaged.Acc.Tank = sets.engaged.Tank
	sets.engaged.HighAcc.Tank = sets.engaged.Tank
	sets.engaged.FullAcc.Tank = sets.engaged.Tank
	
	--------------------------------------
	-- Custom buff sets
	--------------------------------------
	sets.buff.Doom = set_combine(sets.buff.Doom, {})
	sets.buff.Sleep = {head="Frenzy Sallet"}
	sets.buff.Battuta = {}
	sets.buff.Embolden = {back="Evasionist's Cape"}
	
end

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
	-- Default macro set/book
	if player.sub_job == 'DNC' then
		set_macro_page(2, 1)
	elseif player.sub_job == 'RDM' then
		set_macro_page(2, 1)
	elseif player.sub_job == 'SCH' then
		set_macro_page(2, 1)
	elseif player.sub_job == 'BLU' then
		set_macro_page(2, 1)
	elseif player.sub_job == 'WAR' then
		set_macro_page(2, 1)
	elseif player.sub_job == 'SAM' then
		set_macro_page(2, 1)
	elseif player.sub_job == 'DRK' then
		set_macro_page(2, 1)
	elseif player.sub_job == 'NIN' then
		set_macro_page(2, 1)
	else
		set_macro_page(2, 1)
	end
end

			--elseif not buffactive['Battuta'] and abil_recasts[120] < latency then
				--windower.chat.input('/ja "Battuta" <me>')
				--tickdelay = os.clock() + 1.8
				--return true


function user_job_target_change(target)
    if target and S{"Quetzalcoatl","Naga Raja","Azi Dahaka"}:contains(target.name) then
        state.AutoRuneMode:set('true')
    end

    return false
end

function sub_job_change(new,old)
send_command('wait 10;input /lockstyleset 3')
end

send_command('wait 7;input /lockstyleset 3')

send_command('exec init.txt')
