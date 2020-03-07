# Theorybuilding

Smite is designed with an eye for creating an intuitive sort of quality to building: "I need penetration for tanky targets," "build attack speed if you want to do attack damage," and so forth.  But when it comes down to really justifying your decision-making with the game math, it can be a little more complicated.

## The Damage Equation

Here is the main damage equation:

D<sub>r</sub> = (100 / (100 + P - N)) \* D<sub>g</sub>

* D<sub>r</sub>: Damage received
* P: Target Protections
* N: Penetration
* D<sub>g</sub>: damage given

The basic idea is that an attack that deals 100 damage, with 0 protections and 0 penetration, results in 100 damage on the target.  Add 30 protections, and that 100 damage is multiplied by 100/130, resulting in about 77 damage.  Add 15 penetration against those 30 protections, and that brings the multiplier to 100/115 to bring the damage to be 87 damage.  This creates a protections curve with a "diminishing returns" effect.  Your first 100 protections are very effective (reducing 100 damage to 50 damage).  Your second 100 protections do continue to reduce the damage you receive (the original 100 damage becomes 33 damage), but not as much as the first 100 protections.

Note that penetrations, on the other hand (which move you the other direction on the curve) become more useful as you build more of them!

One important exception is that the effective armor of a target (Protection - Penetration) can never fall below 0.  Therefore, the number you multiply D<sub>g</sub> by can never rise above 1.

## An Extended Damage Equation

We're going to add a few terms.  First of all, we're going to extend this from a just a "damage for one attack" equation to a "damage over time" equation by multiplying by attack speed (attacks per second).

Ω = ((A<sub>b</sub> \* A<sub>i</sub>) + L\*ΔA<sub>L</sub>) * D<sub>r</sub>

Second, we're going to break down all of the terms as far as we possibly can, as follows:

P = P<sub>b</sub> + M\*ΔP<sub>M</sub> + P<sub>i</sub>
D<sub>g</sub> = D<sub>b</sub> + L\*ΔD<sub>L</sub> + O\*ΔD<sub>O</sub> + S<sub>W</sub>\*W

That gives us the equation:

Ω = ((A<sub>b</sub> \* A<sub>i</sub>) + L\*ΔA<sub>L</sub>) \* (100 / (100 + P<sub>b</sub> + M\*ΔP<sub>M</sub> + P<sub>i</sub> - N)) \* (D<sub>b</sub> + L\*ΔD<sub>L</sub> + O\*ΔD<sub>O</sub> + S<sub>W</sub>\*W)

* Ω: Damage Per Second
* A<sub>b</sub>: Character base Attack Speed
* A<sub>i</sub>: Attack Speed from items
* L: Character level
* ΔA<sub>L</sub>: Character additional attack speed per level
* P<sub>b</sub>: Target character base protections
* M: Target character level
* ΔP<sub>M</sub>: Target additional protections per level
* P<sub>i</sub>: Target item protections
* N: Penetrations
* D<sub>b</sub>: Character base damage
* ΔD<sub>L</sub>: Character extra damage per level (0 for abilities)
* O: Ability level (0 for basic attacks)
* ΔD<sub>O</sub>: extra damage per ability level
* S<sub>W</sub>: Ability/Attack Scaling By Power
* W: Item power

This damage calculation allows us to do some math and make a few conclusions that help us decide how to build.

## Some Rules

By adding a term to account for the increase in item damage and then dividing our new DPS by our old DPS, we can determine the **percent damage increase given by an item in a situation**, which will allow us to compare items to each other.  This math is made much simpler by observing the fact that there are **three main factors** that multiply together to give you your DPS, Ω.  The first is **attack speed**, which comes from your items and some built-in speed based on your character and character level, the second is **a protection factor** that is calculated based on your target's protections and your penetrations, and the third is your **attack strength** which comes from your item physical/magical power and your character's base and ability attributes.

A good place to start is attack speed.  It may seem like a 20% increase in attack speed would result in a 20% increase in DPS, **but that's not exactly the case**.  Item attack speeds are combined additively to create A<sub>i</sub>, and note that the attack speed given by items, A<sub>i</sub>, is multiplied by the character's base attack speed A<sub>b</sub>, *not* the total attack speed including previously owned items or attack speed increases by character level.  Therefore, when you buy an attack speed item, **your DPS increases by an amount equal to the ratio of your new (A<sub>b</sub> \* A<sub>i</sub>) + L\*ΔA<sub>L</sub> to your old (A<sub>b</sub> \* A<sub>i</sub>) + L\*ΔA<sub>L</sub>**.  If you are a Level 10 Artemis (A<sub>b</sub> = 0.95, ΔA<sub>L</sub> = 0.014) and have Ninja Tabi (A<sub>i</sub> = 1.15) and you build Hastened Fatalis (new A<sub>i</sub> = 1.15 + 1.30 = 1.45), your DPS changes by a factor of (0.95\*1.45 + 10\*0.014) / (0.95\*1.15 + 10\*0.014) = 1.23, or a 23% increase.  You'll note that this is a bit less than 30%, which is the attack speed increase given by Hastened Fatalis.  Each time you buy another Attack Speed item (and each time your character levels up), the difference between the item's attack speed increase and your overall DPS increase will be just a little larger.

The rule for power is that **your DPS increases by a fraction equal to what you get if you express your new D<sub>b</sub> + L\*ΔD<sub>L</sub> + S<sub>W</sub>\*W as a fraction of your previously existing D<sub>b</sub> + L\*ΔD<sub>L</sub> + S<sub>W</sub>\*W**.  To take as an example, some values for a Level 5 Rama:

* D<sub>b</sub> + L\*ΔD<sub>L</sub> = 53
* S<sub>W</sub> = 1.0 (for any character's basic attacks)
* A<sub>b</sub> = 0.95
* ΔA<sub>L</sub> = 0.017

So a Level 5 Rama who goes from no items to full warrior tabi (+40 power) will be increasing his DPS by (53 + 1.0\*40) / (53 + 1.0\*0) = 1.755.  If that Level 5 Rama goes from no items to full Ninja Tabi, his DPS first increases by (53 + 1.0\*20) / (53 + 1.0\*0) = 1.377, and then it increases another (0.95\*1.15 + 5\*0.017) / (0.95\*1.0 + 5\*0.017) = 1.138 (multiplicatively with the 1.377 increase) from Ninja Tabi's attack speed for a total of a 1.567 factor DPS increase.

Another formulation for this rule is **your DPS increases by a percentage equal to what you get if you express your additional power as a percentage of your previously existing D<sub>b</sub> + L\*ΔD<sub>L</sub> + S<sub>W</sub>\*W**.  The Warrior Tabi calculation above would look like 100% \* 40 / (53 + 1.0\*0) = 75.5%.

The rule for penetration is similar.  Your DPS against a target increases by a fraction equal to the old (100 + P<sub>b</sub> + M\*ΔP<sub>M</sub> + P<sub>i</sub> - N) as a fraction of the new (100 + P<sub>b</sub> + M\*ΔP<sub>M</sub> + P<sub>i</sub> - N).  Or, put more simply, **divide the target's old effective armor against your attacks by the target's new effective armor against your attacks.**

So a Level 10 Medusa (D<sub>b</sub> + L\*ΔD<sub>L</sub> = 64.4) with Warrior Tabi who full-buys Asi for 1780 gold and attacks a Level 10 Rama (P<sub>b</sub> + M\*ΔP<sub>M</sub> = 40.2) with no additional protections will be increasing her DPS against him by (100 + 40.2 + 0 - 0)/(100 + 40.2 + 0 - 15) = 1.120 (12.0% increase) from the penetration and then another (multiplicative) (0.95\*1.20 + 10\*0.014) / (0.95\*1.0 + 10\*0.014) = 1.174 from the attack speed, increasing her DPS against him by a total of 31.5%.  By comparison, buying devourer's guantlet would increase her DPS by (64.4 + 1\*65)/(64.4 + 1\*40) = 23.9%, increasing to 52.7% with full stacks (although by the time the stacks are full, the level-based numbers will be different, and both characters will have more items which will further change the calculation).

## What Do I Build Right Now?

These rules help us figure out what is going to give us the most damage or the most survivability in the moment.  We can also use them to sanity check full builds to see if we can squeeze any damage improvements out of them.  But first, some second-order rules that fall out of them:

**Power is extremely potent for early basic attacking, but has diminishing returns.**  Many power items give power in the 40-60 range.  The first time you build one of these items, you might very well double your basic attack damage.  The second time, you might add 40% or 50% to your damage.  The third time, it might only be 20%.  The fourth time, it's likely only to be in the 10% range.  By then, it's clear that you're better off looking for attack speed or penetration items!

**Power is useful for ability damage, but has quickly diminishing returns.**  For example, buying Warrior Tabi with a Level 2 Bastet Pounce increases your damage by 27.6%.  Buying Jotun's Wrath with an existing Warrior Tabi and a Level 4 Bastet Pounce only increases your damage by 12.7% from the power itself.

**Penetration is extremely important to build for ability damage**.  The 11 penetration on Jotun's Wrath, from the Bastet example above, gives you another 8.5% damage increase (multiplicitavely against a typical, squishy 40-protection target), but if you swap that item with Brawler's Beatstick the 20 penetration gives you a 16.7% damage increase.  That 20 penetration is already more valuable than 40 power, and that's with just two power items!

**Attack speed, penetration, and power are held in balance on hunter builds.**  Looking at a level 20 Medusa (D<sub>b</sub> + L\*ΔD<sub>L</sub> = 90): if you've built Warrior Tabi (40 power) and Transcendance (35 + 58.5 power), another 40 power only increases your DPS by 17.9%.  At this point, attack speed items are likely to be more valuable—Hastened Fatalis would give a 23% increase!  On the penetration side of things, Titan's Bane gives, effectively, 20 penetration against a 60 protection target to be worth 14.2% (just in protections).  20 more penetration against the same target is worth another 16.7%, and then 20 more penetration (which doesn't hit your 50 penetration cap, since Titan's Bane doesn't count toward the cap) is worth 20%!

**The landscape is a little different for magic users.**  Magic power items tend to hover around 80-120 power, there exists a much smaller stable of penetration items useful for ability-based magic users, and characters' built-in magical protections are much lower (for almost all characters, magic protections start near 30.  For Warriors and Guardians they scale up to 48, but for Hunters, Assassins, and Mages they don't scale by level at all).  The end result is that Mages are usually interested in building a penetration item as their third or fourth item after having acquired 2 or 3 power or utility-oriented items.

Take Ra as an example.  Build Ra with Warlock's Sash, Shoes of Focus, and Chronos Pendant: a conservative but reasonable build with 215 power.  We can build:

* Book of Thoth for ~120 power and a damage increase of (275 + .7 \* 335) / (275 + .7 \* 215) = 1.197 on his Level 4 Celestial Beam,
* or we can build Obsidian Shard for a damage increase of (275 + .7 \* 285) / (275 + .7 \* 215) = 1.115 from power and then an additional 1.083 (multiplicative total: 1.208) against typical low-protections targets (30 magical protection), or 1.198 (multiplicative total: 1.336) against high-protections targets (100 magical protection).

The analysis isn't as clearly favorable to building Obsidian shard ealier.  For example, let's decide whether we want to go from Shoes of Focus straight into Book of Thoth or Obsidian Shard:

* Book of Thoth for ~120 power and a damage increase of (215 + .7 \* 150) / (215 + .7 \* 30) = 1.356 on his Level 3 Celestial Beam (level 3 instead of 4 since we're earlier in the game),
* or we can build Obsidian Shard for a damage increase of (215 + .7 \* 100) / (215 + .7 \* 30) = 1.208 from power and then an additional 1.083 (multiplicative total: 1.308) against typical low-protections targets (30 magical protection), or 1.198 (multiplicative total: 1.447) against high-protections targets (100 magical protection).  High protections targets will be a bit more rare; it would require a target to rush Bulwark, Heartward, or one of the Garb items.

Obsidian Shard's damage numbers are roughly competitive with Book of Thoth's as a second item, but on the other hand, Book of Thoth offers roughly the same damage and a whole lot of utility (MP5, mana, stacking for further mana and power) in addition.

### Breastplate of Valor

Build a level 10 Ra with Warlock's Sash and Pen Boots for 155 power.

* Breastplate for no additional damage, but 75 protections, which increases physical protections from 35 to 110.  Assuming your opponent has 15 penetration, this cuts their damage down to a fraction of (120 / 195) = .615 of what it once was.
* Chronos pendant for 75 magic power, increasing Level 3 Celestial Beam damage by (215 + .7 \* 230) / (215 + .7 \* 155) = 1.162.

Thinking about this for a fifth item slot: build a level 20 Ra with Pen Boots, Warlock's Sash, Chronos Pendant, and Obsidian Shard.

* Breastplate for no additional damage, but 75 protections, which increases physical protections from 55 to 130.  Against an opponent with poor penetrations (10), cut their damage by (145 / 220) = 0.659.  Against an opponent with very effective penetrations (such as an ADC with Titan's Bane, Asi, Ichiaval, and the Crusher), cut their damage by a factor of (100 / 142.1) = 0.703.
* Soul Reaver for 100 magic power, increasing Level 5 Celestial Beam damage by (335 + .7 \* 400) / (335 + .7 \* 300) = 1.128.  Soul reaver does have a nice passive, of course.

There are certainly more conclusions that can be drawn from these numbers, but hopefully now you have the tools to consider builds on your own!