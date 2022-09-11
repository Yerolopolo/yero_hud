# Yero HUD

Yero HUD is a clean and simple FiveM HUD with dynamic mode, automatic minimap and many other features.

## Installation
1.  Extract the .zip
2.  Place `yero_hud` in your resources directory.
3.  Add `ensure yero_hud` to your server.cfg

### Requirements

-   [es_extended](https://github.com/esx-framework/esx-legacy/tree/main/%5Besx%5D/es_extended)
-   [esx_society](https://github.com/esx-framework/esx-legacy/tree/main/%5Besx_addons%5D/esx_society)
-   [esx_addonaccount](https://github.com/esx-framework/esx-legacy/tree/main/%5Besx_addons%5D/esx_addonaccount)

### Optional

-   [yero_basicneeds](https://github.com/yerolopolo/yero_basicneeds) (Only if you want the Stress to be enabled.)

## Settings

**Config.serverLogo**  
This is the link for the logo that is on the right corner of the screen.

**Config.showServerLogo**  
Enable/disable the logo on the right corner of the screen. Default = *true*

**Config.healthRegen**  
Enable/disable health regeneration. Default = *false*

### Config.ui
Here you can enable/disable all the elements from the hud.

- **showHealth**: Enable/disable health icon. Default = *true*
- **showDrunk**: Enable/disable drunk icon. Default = *true*
- **showStress**: Enable/disable stress icon. (Requires [yero_basicneeds](https://github.com/yerolopolo/yero_basicneeds)) Default = *false*
- **showHunger**: Enable/disable hunger icon. Default = *true*
- **showThirst**: Enable/disable thirst icon. Default = *true*
- **showDynamicMinimap**: If set on true, the minimap will only show when the player is on a vehicle. Default = *true*

**Config.dynamicUI**
Toggle dynamic UI (When is active, the UI only shows when an element is below or above the percentages below)

### Config.percentages
At what percentage should the HUD show every element?

- **healthPercent** From 0 to 100, default is *99* (Less than)
- **drunkPercent** From 0 to 100, default is *0* (More than)
- **stressPercent** From 0 to 100, default is *75* (More than)
- **hungerPercent** From 0 to 100, default is *35* (Less than)
- **thirstPercent** From 0 to 100, default is *35* (Less than)

## Support
Feel free to ask me anything on my discord (**Yero#0001**).
