# OC-Storage-Manager
Simple Storage Manager for OpenComputers to manage Refined Storage (Minecraft Mods). Currently built to keep specified items in stock.

## Guide
The stock variable allows for new items to be added.

stock = {

  {"mod:item", damage: number, amount: number}

}

The item name "mod:item" is given with minecraft advanced debug options. The damage number is needed for some mods such as Thermal Expansion or Mekanism. The amount number is the amount of the item to keep stock of.
For example, keeping a stock of 32 osmium ingots from Mekanism would be an entry like:

{"mekanism:ingot, 1.0, 32}
