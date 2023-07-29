-- reference: https://github.com/Shark-vil/background-citizens/blob/master/lua/background_npcs_core/config/sh_npcs.lua

local function HasWorkshopItem(wsid)
  local addons = engine.GetAddons()
  for i = 1, #addons do
    local addon = addons[i]
    if addon.wsid == wsid and addon.mounted then
      return true
    end
  end
  return false
end

local wsdb = {
  citizen = {
    ["2525472545"] = {
      "models/catcraze777/animal_crossing/alligatorpack_acnh/alfonso_pm.mdl",
      "models/catcraze777/animal_crossing/alligatorpack_acnh/alli_pm.mdl",
      "models/catcraze777/animal_crossing/alligatorpack_acnh/boots_pm.mdl",
      "models/catcraze777/animal_crossing/alligatorpack_acnh/del_pm.mdl",
      "models/catcraze777/animal_crossing/alligatorpack_acnh/drago_pm.mdl",
      "models/catcraze777/animal_crossing/alligatorpack_acnh/gayle_pm.mdl",
      "models/catcraze777/animal_crossing/alligatorpack_acnh/sly_pm.mdl",
    },
    ["2235739820"] = {
      "models/catcraze777/animal_crossing/bearpack_acnh/beardo_npc.mdl",
      "models/catcraze777/animal_crossing/bearpack_acnh/charlise_npc.mdl",
      "models/catcraze777/animal_crossing/bearpack_acnh/chow_npc.mdl",
      "models/catcraze777/animal_crossing/bearpack_acnh/curt_npc.mdl",
      "models/catcraze777/animal_crossing/bearpack_acnh/grizzly_npc.mdl",
      "models/catcraze777/animal_crossing/bearpack_acnh/groucho_npc.mdl",
      "models/catcraze777/animal_crossing/bearpack_acnh/ike_npc.mdl",
      "models/catcraze777/animal_crossing/bearpack_acnh/klaus_npc.mdl",
      "models/catcraze777/animal_crossing/bearpack_acnh/megan_npc.mdl",
      "models/catcraze777/animal_crossing/bearpack_acnh/nate_npc.mdl",
      "models/catcraze777/animal_crossing/bearpack_acnh/paula_npc.mdl",
      "models/catcraze777/animal_crossing/bearpack_acnh/pinky_npc.mdl",
      "models/catcraze777/animal_crossing/bearpack_acnh/teddy_npc.mdl",
      "models/catcraze777/animal_crossing/bearpack_acnh/tutu_npc.mdl",
      "models/catcraze777/animal_crossing/bearpack_acnh/ursala_npc.mdl",
    },
    ["2257071793"] = {
      "models/catcraze777/animal_crossing/birdpack_acnh/admiral_npc.mdl",
      "models/catcraze777/animal_crossing/birdpack_acnh/anchovy_npc.mdl",
      "models/catcraze777/animal_crossing/birdpack_acnh/jacob_npc.mdl",
      "models/catcraze777/animal_crossing/birdpack_acnh/jacques_npc.mdl",
      "models/catcraze777/animal_crossing/birdpack_acnh/jay_npc.mdl",
      "models/catcraze777/animal_crossing/birdpack_acnh/jitters_npc.mdl",
      "models/catcraze777/animal_crossing/birdpack_acnh/lucha_npc.mdl",
      "models/catcraze777/animal_crossing/birdpack_acnh/midge_npc.mdl",
      "models/catcraze777/animal_crossing/birdpack_acnh/peck_npc.mdl",
      "models/catcraze777/animal_crossing/birdpack_acnh/piper_npc.mdl",
      "models/catcraze777/animal_crossing/birdpack_acnh/robin_npc.mdl",
      "models/catcraze777/animal_crossing/birdpack_acnh/sparro_npc.mdl",
      "models/catcraze777/animal_crossing/birdpack_acnh/twiggy_npc.mdl",
    },
    ["2223833696"] = {
      "models/catcraze777/animal_crossing/ankha_acnh/ankha_npc.mdl",
      "models/catcraze777/animal_crossing/bob_acnh/bob_npc.mdl",
      "models/catcraze777/animal_crossing/catpack1_acnh/kabuki_npc.mdl",
      "models/catcraze777/animal_crossing/catpack1_acnh/katt_npc.mdl",
      "models/catcraze777/animal_crossing/catpack1_acnh/kidcat_npc.mdl",
      "models/catcraze777/animal_crossing/catpack1_acnh/kiki_npc.mdl",
      "models/catcraze777/animal_crossing/catpack1_acnh/kitty_npc.mdl",
      "models/catcraze777/animal_crossing/catpack1_acnh/merry_npc.mdl",
      "models/catcraze777/animal_crossing/catpack1_acnh/olivia_npc.mdl",
      "models/catcraze777/animal_crossing/catpack1_acnh/punchy_npc.mdl",
      "models/catcraze777/animal_crossing/catpack1_acnh/purrl_npc.mdl",
      "models/catcraze777/animal_crossing/catpack1_acnh/tom_npc.mdl",
      "models/catcraze777/animal_crossing/catpack2_acnh/felicity_npc.mdl",
      "models/catcraze777/animal_crossing/catpack2_acnh/moe_npc.mdl",
      "models/catcraze777/animal_crossing/catpack2_acnh/monique_npc.mdl",
      "models/catcraze777/animal_crossing/catpack2_acnh/rudy_npc.mdl",
      "models/catcraze777/animal_crossing/catpack2_acnh/stinky_npc.mdl",
      "models/catcraze777/animal_crossing/catpack2_acnh/tabby_npc.mdl",
      "models/catcraze777/animal_crossing/lolly_acnh/lolly_npc.mdl",
      "models/catcraze777/animal_crossing/raymond_acnh/raymond_npc.mdl",
      "models/catcraze777/animal_crossing/rosie_acnh/rosie_npc.mdl",
      "models/catcraze777/animal_crossing/tangy_acnh/tangy_npc.mdl",
      "models/croissant/animalcrossing/mitzi/mitzi_npc.mdl",
    },
    ["2231858663"] = {
      "models/catcraze777/animal_crossing/cubpack_acnh/barold_npc.mdl",
      "models/catcraze777/animal_crossing/cubpack_acnh/bluebear_npc.mdl",
      "models/catcraze777/animal_crossing/cubpack_acnh/cheri_npc.mdl",
      "models/catcraze777/animal_crossing/cubpack_acnh/chester_npc.mdl",
      "models/catcraze777/animal_crossing/cubpack_acnh/judy_npc.mdl",
      "models/catcraze777/animal_crossing/cubpack_acnh/june_npc.mdl",
      "models/catcraze777/animal_crossing/cubpack_acnh/kody_npc.mdl",
      "models/catcraze777/animal_crossing/cubpack_acnh/maple_npc.mdl",
      "models/catcraze777/animal_crossing/cubpack_acnh/murphy_npc.mdl",
      "models/catcraze777/animal_crossing/cubpack_acnh/olive_npc.mdl",
      "models/catcraze777/animal_crossing/cubpack_acnh/pekoe_npc.mdl",
      "models/catcraze777/animal_crossing/cubpack_acnh/poncho_npc.mdl",
      "models/catcraze777/animal_crossing/cubpack_acnh/pudge_npc.mdl",
      "models/catcraze777/animal_crossing/cubpack_acnh/stitches_npc.mdl",
      "models/catcraze777/animal_crossing/cubpack_acnh/tammy_npc.mdl",
      "models/catcraze777/animal_crossing/cubpack_acnh/vladimir_npc.mdl",
    },
    ["2244265449"] = {
      "models/catcraze777/animal_crossing/deerpack_acnh/bam_npc.mdl",
      "models/catcraze777/animal_crossing/deerpack_acnh/beau_npc.mdl",
      "models/catcraze777/animal_crossing/deerpack_acnh/bruce_npc.mdl",
      "models/catcraze777/animal_crossing/deerpack_acnh/deirdre_npc.mdl",
      "models/catcraze777/animal_crossing/deerpack_acnh/diana_npc.mdl",
      "models/catcraze777/animal_crossing/deerpack_acnh/erik_npc.mdl",
      "models/catcraze777/animal_crossing/deerpack_acnh/fauna_npc.mdl",
      "models/catcraze777/animal_crossing/deerpack_acnh/fuchsia_npc.mdl",
      "models/catcraze777/animal_crossing/deerpack_acnh/lopez_npc.mdl",
      "models/catcraze777/animal_crossing/deerpack_acnh/zell_npc.mdl",
    },
    ["2222966341"] = {
      "models/catcraze777/animal_crossing/dogpack1_acnh/bones_npc.mdl",
      "models/catcraze777/animal_crossing/dogpack1_acnh/butch_npc.mdl",
      "models/catcraze777/animal_crossing/dogpack1_acnh/cherry_npc.mdl",
      "models/catcraze777/animal_crossing/dogpack1_acnh/cookie_npc.mdl",
      "models/catcraze777/animal_crossing/dogpack1_acnh/goldie_npc.mdl",
      "models/catcraze777/animal_crossing/dogpack1_acnh/lucky_npc.mdl",
      "models/catcraze777/animal_crossing/dogpack1_acnh/portia_npc.mdl",
      "models/catcraze777/animal_crossing/dogpack1_acnh/shep_npc.mdl",
      "models/catcraze777/animal_crossing/dogpack2_acnh/bea_npc.mdl",
      "models/catcraze777/animal_crossing/dogpack2_acnh/benjamin_npc.mdl",
      "models/catcraze777/animal_crossing/dogpack2_acnh/biskit_npc.mdl",
      "models/catcraze777/animal_crossing/dogpack2_acnh/daisy_npc.mdl",
      "models/catcraze777/animal_crossing/dogpack2_acnh/mac_npc.mdl",
      "models/catcraze777/animal_crossing/dogpack2_acnh/maddie_npc.mdl",
      "models/catcraze777/animal_crossing/dogpack2_acnh/marcel_npc.mdl",
      "models/catcraze777/animal_crossing/dogpack2_acnh/walker_npc.mdl",
    },
    ["2266064880"] = {
      "models/catcraze777/animal_crossing/duckpack_acnh/bill_npc.mdl",
      "models/catcraze777/animal_crossing/duckpack_acnh/deena_npc.mdl",
      "models/catcraze777/animal_crossing/duckpack_acnh/derwin_npc.mdl",
      "models/catcraze777/animal_crossing/duckpack_acnh/drake_npc.mdl",
      "models/catcraze777/animal_crossing/duckpack_acnh/freckles_npc.mdl",
      "models/catcraze777/animal_crossing/duckpack_acnh/gloria_npc.mdl",
      "models/catcraze777/animal_crossing/duckpack_acnh/joey_npc.mdl",
      "models/catcraze777/animal_crossing/duckpack_acnh/ketchup_npc.mdl",
      "models/catcraze777/animal_crossing/duckpack_acnh/maelle_npc.mdl",
      "models/catcraze777/animal_crossing/duckpack_acnh/mallary_npc.mdl",
      "models/catcraze777/animal_crossing/duckpack_acnh/miranda_npc.mdl",
      "models/catcraze777/animal_crossing/duckpack_acnh/molly_npc.mdl",
      "models/catcraze777/animal_crossing/duckpack_acnh/pate_npc.mdl",
      "models/catcraze777/animal_crossing/duckpack_acnh/pompom_npc.mdl",
      "models/catcraze777/animal_crossing/duckpack_acnh/quillson_npc.mdl",
      "models/catcraze777/animal_crossing/duckpack_acnh/scoot_npc.mdl",
      "models/catcraze777/animal_crossing/duckpack_acnh/weber_npc.mdl",
    },
    ["2248509783"] = {
      "models/catcraze777/animal_crossing/eaglepack_acnh/amelia_npc.mdl",
      "models/catcraze777/animal_crossing/eaglepack_acnh/apollo_npc.mdl",
      "models/catcraze777/animal_crossing/eaglepack_acnh/avery_npc.mdl",
      "models/catcraze777/animal_crossing/eaglepack_acnh/buzz_npc.mdl",
      "models/catcraze777/animal_crossing/eaglepack_acnh/celia_npc.mdl",
      "models/catcraze777/animal_crossing/eaglepack_acnh/frank_npc.mdl",
      "models/catcraze777/animal_crossing/eaglepack_acnh/keaton_npc.mdl",
      "models/catcraze777/animal_crossing/eaglepack_acnh/pierce_npc.mdl",
      "models/catcraze777/animal_crossing/eaglepack_acnh/sterling_npc.mdl",
    },
    ["2258494877"] = {
      "models/catcraze777/animal_crossing/elephantpack_acnh/axel_npc.mdl",
      "models/catcraze777/animal_crossing/elephantpack_acnh/bigtop_npc.mdl",
      "models/catcraze777/animal_crossing/elephantpack_acnh/cyd_npc.mdl",
      "models/catcraze777/animal_crossing/elephantpack_acnh/dizzy_npc.mdl",
      "models/catcraze777/animal_crossing/elephantpack_acnh/ellie_npc.mdl",
      "models/catcraze777/animal_crossing/elephantpack_acnh/eloise_npc.mdl",
      "models/catcraze777/animal_crossing/elephantpack_acnh/margie_npc.mdl",
      "models/catcraze777/animal_crossing/elephantpack_acnh/opal_npc.mdl",
      "models/catcraze777/animal_crossing/elephantpack_acnh/paolo_npc.mdl",
      "models/catcraze777/animal_crossing/elephantpack_acnh/tia_npc.mdl",
      "models/catcraze777/animal_crossing/elephantpack_acnh/tucker_npc.mdl",
    },
    ["2382600560"] = {
      "models/catcraze777/animal_crossing/frogpack_acnh/camofrog_pm.mdl",
      "models/catcraze777/animal_crossing/frogpack_acnh/cousteau_pm.mdl",
      "models/catcraze777/animal_crossing/frogpack_acnh/croque_pm.mdl",
      "models/catcraze777/animal_crossing/frogpack_acnh/diva_pm.mdl",
      "models/catcraze777/animal_crossing/frogpack_acnh/drift_pm.mdl",
      "models/catcraze777/animal_crossing/frogpack_acnh/frobert_pm.mdl",
      "models/catcraze777/animal_crossing/frogpack_acnh/gigi_pm.mdl",
      "models/catcraze777/animal_crossing/frogpack_acnh/henry_pm.mdl",
      "models/catcraze777/animal_crossing/frogpack_acnh/huck_pm.mdl",
      "models/catcraze777/animal_crossing/frogpack_acnh/jambette_pm.mdl",
      "models/catcraze777/animal_crossing/frogpack_acnh/jeremiah_pm.mdl",
      "models/catcraze777/animal_crossing/frogpack_acnh/lily_pm.mdl",
      "models/catcraze777/animal_crossing/frogpack_acnh/prince_pm.mdl",
      "models/catcraze777/animal_crossing/frogpack_acnh/puddles_pm.mdl",
      "models/catcraze777/animal_crossing/frogpack_acnh/raddle_pm.mdl",
      "models/catcraze777/animal_crossing/frogpack_acnh/ribbot_pm.mdl",
      "models/catcraze777/animal_crossing/frogpack_acnh/tad_pm.mdl",
      "models/catcraze777/animal_crossing/frogpack_acnh/wartjr_pm.mdl",
    },
    ["2384490612"] = {
      "models/catcraze777/animal_crossing/goatpack_acnh/billy_pm.mdl",
      "models/catcraze777/animal_crossing/goatpack_acnh/chevre_pm.mdl",
      "models/catcraze777/animal_crossing/goatpack_acnh/gruff_pm.mdl",
      "models/catcraze777/animal_crossing/goatpack_acnh/kidd_pm.mdl",
      "models/catcraze777/animal_crossing/goatpack_acnh/nan_pm.mdl",
      "models/catcraze777/animal_crossing/goatpack_acnh/pashmina_pm.mdl",
      "models/catcraze777/animal_crossing/goatpack_acnh/sherb_pm.mdl",
      "models/catcraze777/animal_crossing/goatpack_acnh/velma_pm.mdl",
    },
    ["2421903808"] = {
      "models/catcraze777/animal_crossing/gorillapack_acnh/al_pm.mdl",
      "models/catcraze777/animal_crossing/gorillapack_acnh/boone_pm.mdl",
      "models/catcraze777/animal_crossing/gorillapack_acnh/boyd_pm.mdl",
      "models/catcraze777/animal_crossing/gorillapack_acnh/cesar_pm.mdl",
      "models/catcraze777/animal_crossing/gorillapack_acnh/hans_pm.mdl",
      "models/catcraze777/animal_crossing/gorillapack_acnh/louie_pm.mdl",
      "models/catcraze777/animal_crossing/gorillapack_acnh/peewee_pm.mdl",
      "models/catcraze777/animal_crossing/gorillapack_acnh/rocket_pm.mdl",
      "models/catcraze777/animal_crossing/gorillapack_acnh/violet_pm.mdl",
    },
    ["2499362109"] = {
      "models/catcraze777/animal_crossing/hamsterpack_acnh/apple_pm.mdl",
      "models/catcraze777/animal_crossing/hamsterpack_acnh/clay_pm.mdl",
      "models/catcraze777/animal_crossing/hamsterpack_acnh/flurry_pm.mdl",
      "models/catcraze777/animal_crossing/hamsterpack_acnh/graham_pm.mdl",
      "models/catcraze777/animal_crossing/hamsterpack_acnh/hamlet_pm.mdl",
      "models/catcraze777/animal_crossing/hamsterpack_acnh/hamphrey_pm.mdl",
      "models/catcraze777/animal_crossing/hamsterpack_acnh/rodney_pm.mdl",
      "models/catcraze777/animal_crossing/hamsterpack_acnh/soleil_pm.mdl",
    },
    ["2485552673"] = {
      "models/catcraze777/animal_crossing/horsepack_acnh/annalise_pm.mdl",
      "models/catcraze777/animal_crossing/horsepack_acnh/buck_pm.mdl",
      "models/catcraze777/animal_crossing/horsepack_acnh/cleo_pm.mdl",
      "models/catcraze777/animal_crossing/horsepack_acnh/clyde_pm.mdl",
      "models/catcraze777/animal_crossing/horsepack_acnh/colton_pm.mdl",
      "models/catcraze777/animal_crossing/horsepack_acnh/ed_pm.mdl",
      "models/catcraze777/animal_crossing/horsepack_acnh/elmer_pm.mdl",
      "models/catcraze777/animal_crossing/horsepack_acnh/julian_pm.mdl",
      "models/catcraze777/animal_crossing/horsepack_acnh/papi_pm.mdl",
      "models/catcraze777/animal_crossing/horsepack_acnh/peaches_pm.mdl",
      "models/catcraze777/animal_crossing/horsepack_acnh/reneigh_pm.mdl",
      "models/catcraze777/animal_crossing/horsepack_acnh/roscoe_pm.mdl",
      "models/catcraze777/animal_crossing/horsepack_acnh/savannah_pm.mdl",
      "models/catcraze777/animal_crossing/horsepack_acnh/victoria_pm.mdl",
      "models/catcraze777/animal_crossing/horsepack_acnh/winnie_pm.mdl",
    },
    ["2413984920"] = {
      "models/catcraze777/animal_crossing/kangaroopack_acnh/astrid_pm.mdl",
      "models/catcraze777/animal_crossing/kangaroopack_acnh/carrie_pm.mdl",
      "models/catcraze777/animal_crossing/kangaroopack_acnh/kitt_pm.mdl",
      "models/catcraze777/animal_crossing/kangaroopack_acnh/marcie_pm.mdl",
      "models/catcraze777/animal_crossing/kangaroopack_acnh/mathilda_pm.mdl",
      "models/catcraze777/animal_crossing/kangaroopack_acnh/rooney_pm.mdl",
      "models/catcraze777/animal_crossing/kangaroopack_acnh/sylvia_pm.mdl",
      "models/catcraze777/animal_crossing/kangaroopack_acnh/walt_pm.mdl",
    },
    ["2573471182"] = {
      "models/catcraze777/animal_crossing/koalapack_acnh/alice_pm.mdl",
      "models/catcraze777/animal_crossing/koalapack_acnh/canberra_pm.mdl",
      "models/catcraze777/animal_crossing/koalapack_acnh/eugene_pm.mdl",
      "models/catcraze777/animal_crossing/koalapack_acnh/gonzo_pm.mdl",
      "models/catcraze777/animal_crossing/koalapack_acnh/lyman_pm.mdl",
      "models/catcraze777/animal_crossing/koalapack_acnh/melba_pm.mdl",
      "models/catcraze777/animal_crossing/koalapack_acnh/ozzie_pm.mdl",
      "models/catcraze777/animal_crossing/koalapack_acnh/sydney_pm.mdl",
      "models/catcraze777/animal_crossing/koalapack_acnh/yuka_pm.mdl",
    },
    ["2286517625"] = {
      "models/catcraze777/animal_crossing/mousepack_acnh/anicotti_npc.mdl",
      "models/catcraze777/animal_crossing/mousepack_acnh/bella_npc.mdl",
      "models/catcraze777/animal_crossing/mousepack_acnh/bettina_npc.mdl",
      "models/catcraze777/animal_crossing/mousepack_acnh/bree_npc.mdl",
      "models/catcraze777/animal_crossing/mousepack_acnh/broccolo_npc.mdl",
      "models/catcraze777/animal_crossing/mousepack_acnh/candi_npc.mdl",
      "models/catcraze777/animal_crossing/mousepack_acnh/chadder_npc.mdl",
      "models/catcraze777/animal_crossing/mousepack_acnh/dora_npc.mdl",
      "models/catcraze777/animal_crossing/mousepack_acnh/greta_npc.mdl",
      "models/catcraze777/animal_crossing/mousepack_acnh/limberg_npc.mdl",
      "models/catcraze777/animal_crossing/mousepack_acnh/moose_npc.mdl",
      "models/catcraze777/animal_crossing/mousepack_acnh/penelope_npc.mdl",
      "models/catcraze777/animal_crossing/mousepack_acnh/rizzo_npc.mdl",
      "models/catcraze777/animal_crossing/mousepack_acnh/rod_npc.mdl",
      "models/catcraze777/animal_crossing/mousepack_acnh/samson_npc.mdl",
    },
    ["2277213102"] = {
      "models/catcraze777/animal_crossing/octopuspack_acnh/marina_npc.mdl",
      "models/catcraze777/animal_crossing/octopuspack_acnh/octavian_npc.mdl",
      "models/catcraze777/animal_crossing/octopuspack_acnh/zucker_npc.mdl",
    },
    ["2451076603"] = {
      "models/catcraze777/animal_crossing/ostrichpack_acnh/blanche_pm.mdl",
      "models/catcraze777/animal_crossing/ostrichpack_acnh/cranston_pm.mdl",
      "models/catcraze777/animal_crossing/ostrichpack_acnh/flora_pm.mdl",
      "models/catcraze777/animal_crossing/ostrichpack_acnh/gladys_pm.mdl",
      "models/catcraze777/animal_crossing/ostrichpack_acnh/julia_pm.mdl",
      "models/catcraze777/animal_crossing/ostrichpack_acnh/phil_pm.mdl",
      "models/catcraze777/animal_crossing/ostrichpack_acnh/phoebe_pm.mdl",
      "models/catcraze777/animal_crossing/ostrichpack_acnh/queenie_pm.mdl",
      "models/catcraze777/animal_crossing/ostrichpack_acnh/sandy_pm.mdl",
      "models/catcraze777/animal_crossing/ostrichpack_acnh/sprocket_pm.mdl",
    },
    ["2290494052"] = {
      "models/catcraze777/animal_crossing/penguinpack_acnh/aurora_npc.mdl",
      "models/catcraze777/animal_crossing/penguinpack_acnh/boomer_npc.mdl",
      "models/catcraze777/animal_crossing/penguinpack_acnh/cube_npc.mdl",
      "models/catcraze777/animal_crossing/penguinpack_acnh/flo_npc.mdl",
      "models/catcraze777/animal_crossing/penguinpack_acnh/friga_npc.mdl",
      "models/catcraze777/animal_crossing/penguinpack_acnh/gwen_npc.mdl",
      "models/catcraze777/animal_crossing/penguinpack_acnh/hopper_npc.mdl",
      "models/catcraze777/animal_crossing/penguinpack_acnh/iggly_npc.mdl",
      "models/catcraze777/animal_crossing/penguinpack_acnh/puck_npc.mdl",
      "models/catcraze777/animal_crossing/penguinpack_acnh/roald_npc.mdl",
      "models/catcraze777/animal_crossing/penguinpack_acnh/sprinkle_npc.mdl",
      "models/catcraze777/animal_crossing/penguinpack_acnh/tex_npc.mdl",
      "models/catcraze777/animal_crossing/penguinpack_acnh/wade_npc.mdl",
    },
    ["2481411400"] = {
      "models/catcraze777/animal_crossing/pigpack_acnh/agnes_pm.mdl",
      "models/catcraze777/animal_crossing/pigpack_acnh/boris_pm.mdl",
      "models/catcraze777/animal_crossing/pigpack_acnh/chops_pm.mdl",
      "models/catcraze777/animal_crossing/pigpack_acnh/cobb_pm.mdl",
      "models/catcraze777/animal_crossing/pigpack_acnh/curly_pm.mdl",
      "models/catcraze777/animal_crossing/pigpack_acnh/gala_pm.mdl",
      "models/catcraze777/animal_crossing/pigpack_acnh/hugh_pm.mdl",
      "models/catcraze777/animal_crossing/pigpack_acnh/kevin_pm.mdl",
      "models/catcraze777/animal_crossing/pigpack_acnh/lucy_pm.mdl",
      "models/catcraze777/animal_crossing/pigpack_acnh/maggie_pm.mdl",
      "models/catcraze777/animal_crossing/pigpack_acnh/pancetti_pm.mdl",
      "models/catcraze777/animal_crossing/pigpack_acnh/peggy_pm.mdl",
      "models/catcraze777/animal_crossing/pigpack_acnh/rasher_pm.mdl",
      "models/catcraze777/animal_crossing/pigpack_acnh/spork_pm.mdl",
      "models/catcraze777/animal_crossing/pigpack_acnh/truffles_pm.mdl",
    },
    ["2218825507"] = {
      "models/catcraze777/animal_crossing/rabbitpack1_acnh/bonbon_npc.mdl",
      "models/catcraze777/animal_crossing/rabbitpack1_acnh/bunnie_npc.mdl",
      "models/catcraze777/animal_crossing/rabbitpack1_acnh/chrissy_npc.mdl",
      "models/catcraze777/animal_crossing/rabbitpack1_acnh/coco_npc.mdl",
      "models/catcraze777/animal_crossing/rabbitpack1_acnh/cole_npc.mdl",
      "models/catcraze777/animal_crossing/rabbitpack1_acnh/francine_npc.mdl",
      "models/catcraze777/animal_crossing/rabbitpack1_acnh/genji_npc.mdl",
      "models/catcraze777/animal_crossing/rabbitpack1_acnh/ohare_npc.mdl",
      "models/catcraze777/animal_crossing/rabbitpack1_acnh/ruby_npc.mdl",
      "models/catcraze777/animal_crossing/rabbitpack1_acnh/snake_npc.mdl",
      "models/catcraze777/animal_crossing/rabbitpack2_acnh/carmen_npc.mdl",
      "models/catcraze777/animal_crossing/rabbitpack2_acnh/claude_npc.mdl",
      "models/catcraze777/animal_crossing/rabbitpack2_acnh/doc_npc.mdl",
      "models/catcraze777/animal_crossing/rabbitpack2_acnh/dotty_npc.mdl",
      "models/catcraze777/animal_crossing/rabbitpack2_acnh/gabi_npc.mdl",
      "models/catcraze777/animal_crossing/rabbitpack2_acnh/gaston_npc.mdl",
      "models/catcraze777/animal_crossing/rabbitpack2_acnh/hopkins_npc.mdl",
      "models/catcraze777/animal_crossing/rabbitpack2_acnh/mira_npc.mdl",
      "models/catcraze777/animal_crossing/rabbitpack2_acnh/pippy_npc.mdl",
      "models/catcraze777/animal_crossing/rabbitpack2_acnh/tiffany_npc.mdl",
    },
    ["2433983127"] = {
      "models/catcraze777/animal_crossing/sanrio_acnh/chai_npc.mdl",
      "models/catcraze777/animal_crossing/sanrio_acnh/chelsea_npc.mdl",
      "models/catcraze777/animal_crossing/sanrio_acnh/etoile_npc.mdl",
      "models/catcraze777/animal_crossing/sanrio_acnh/marty_npc.mdl",
      "models/catcraze777/animal_crossing/sanrio_acnh/rilla_pm.mdl",
      "models/catcraze777/animal_crossing/sanrio_acnh/toby_npc.mdl",
    },
    ["2284083956"] = {
      "models/catcraze777/animal_crossing/sheeppack_acnh/baabara_npc.mdl",
      "models/catcraze777/animal_crossing/sheeppack_acnh/cashmere_npc.mdl",
      "models/catcraze777/animal_crossing/sheeppack_acnh/curlos_npc.mdl",
      "models/catcraze777/animal_crossing/sheeppack_acnh/dom_npc.mdl",
      "models/catcraze777/animal_crossing/sheeppack_acnh/eunice_npc.mdl",
      "models/catcraze777/animal_crossing/sheeppack_acnh/frita_npc.mdl",
      "models/catcraze777/animal_crossing/sheeppack_acnh/muffy_npc.mdl",
      "models/catcraze777/animal_crossing/sheeppack_acnh/pietro_npc.mdl",
      "models/catcraze777/animal_crossing/sheeppack_acnh/stella_npc.mdl",
      "models/catcraze777/animal_crossing/sheeppack_acnh/timbra_npc.mdl",
      "models/catcraze777/animal_crossing/sheeppack_acnh/vesta_npc.mdl",
      "models/catcraze777/animal_crossing/sheeppack_acnh/wendy_npc.mdl",
      "models/catcraze777/animal_crossing/sheeppack_acnh/willow_npc.mdl",
    },
    ["2230096421"] = {
      "models/catcraze777/animal_crossing/marshal_acnh/marshal_npc.mdl",
      "models/catcraze777/animal_crossing/squirrelpack_acnh/agents_npc.mdl",
      "models/catcraze777/animal_crossing/squirrelpack_acnh/blaire_npc.mdl",
      "models/catcraze777/animal_crossing/squirrelpack_acnh/cally_npc.mdl",
      "models/catcraze777/animal_crossing/squirrelpack_acnh/caroline_npc.mdl",
      "models/catcraze777/animal_crossing/squirrelpack_acnh/filbert_npc.mdl",
      "models/catcraze777/animal_crossing/squirrelpack_acnh/hazel_npc.mdl",
      "models/catcraze777/animal_crossing/squirrelpack_acnh/mint_npc.mdl",
      "models/catcraze777/animal_crossing/squirrelpack_acnh/nibbles_npc.mdl",
      "models/catcraze777/animal_crossing/squirrelpack_acnh/peanut_npc.mdl",
      "models/catcraze777/animal_crossing/squirrelpack_acnh/pecan_npc.mdl",
      "models/catcraze777/animal_crossing/squirrelpack_acnh/poppy_npc.mdl",
      "models/catcraze777/animal_crossing/squirrelpack_acnh/ricky_npc.mdl",
      "models/catcraze777/animal_crossing/squirrelpack_acnh/sally_npc.mdl",
      "models/catcraze777/animal_crossing/squirrelpack_acnh/sheldon_npc.mdl",
      "models/catcraze777/animal_crossing/squirrelpack_acnh/static_npc.mdl",
      "models/catcraze777/animal_crossing/squirrelpack_acnh/sylvana_npc.mdl",
      "models/catcraze777/animal_crossing/squirrelpack_acnh/tasha_npc.mdl",
    },
    ["2279024373"] = {
      "models/catcraze777/animal_crossing/tigerpack_acnh/bangle_npc.mdl",
      "models/catcraze777/animal_crossing/tigerpack_acnh/bianca_npc.mdl",
      "models/catcraze777/animal_crossing/tigerpack_acnh/claudia_npc.mdl",
      "models/catcraze777/animal_crossing/tigerpack_acnh/leonardo_npc.mdl",
      "models/catcraze777/animal_crossing/tigerpack_acnh/rolf_npc.mdl",
      "models/catcraze777/animal_crossing/tigerpack_acnh/rowan_npc.mdl",
      "models/catcraze777/animal_crossing/tigerpack_acnh/tybalt_npc.mdl",
    },
    ["2225437009"] = {
      "models/catcraze777/animal_crossing/audie_acnh/audie_npc.mdl",
      "models/catcraze777/animal_crossing/wolfpack_acnh/chief_npc.mdl",
      "models/catcraze777/animal_crossing/wolfpack_acnh/dobie_npc.mdl",
      "models/catcraze777/animal_crossing/wolfpack_acnh/fang_npc.mdl",
      "models/catcraze777/animal_crossing/wolfpack_acnh/freya_npc.mdl",
      "models/catcraze777/animal_crossing/wolfpack_acnh/kyle_npc.mdl",
      "models/catcraze777/animal_crossing/wolfpack_acnh/lobo_npc.mdl",
      "models/catcraze777/animal_crossing/wolfpack_acnh/skye_npc.mdl",
      "models/catcraze777/animal_crossing/wolfpack_acnh/vivian_npc.mdl",
      "models/catcraze777/animal_crossing/wolfpack_acnh/whitney_npc.mdl",
      "models/catcraze777/animal_crossing/wolfpack_acnh/wolfgang_npc.mdl",
    },
  }
}

-- replace NPC drivers 
if HasWorkshopItem("2543229881") then
  hook.Add( "InitPostEntity", "ChangeDecentVehicleCharacters", function()
    hook.Remove( "InitPostEntity", "ChangeDecentVehicleCharacters" )
    if DecentVehicleDestination then
      DecentVehicleDestination.DefaultDriverModel = {
        "models/catcraze777/animal_crossing/react_acnh/react_pm.mdl",
      }
    end
  end)
end

for group, data in pairs(wsdb) do
  local gtbl = bgNPC.cfg.npcs_template[group]
  if gtbl ~= nil then
    gtbl.random_skin = false
    gtbl.random_bodygroups = false
    gtbl.default_models = false
    gtbl.models = {}

    for wsid, models in pairs(data) do
      if HasWorkshopItem(wsid) then
        for i = 1, #models do
          table.insert(gtbl.models, models[i])
        end
      end
    end
  end
end
