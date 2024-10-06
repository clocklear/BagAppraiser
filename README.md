# BagAppraiser

A World of Warcraft addon that offers comprehensive valuation of your bag contents by accessing a diverse range of pricing sources.

![BagAppraiser](https://i.imgur.com/Zagxpho.png)

BagAppraiser is a simple addon that taps into pricing data from different addons to provide a total value of the items you have in your bags and bank.  At least one of the dependent addons must be installed for it to function properly.  Open its configuration pane with '/ba' to adjust the pricing methodology used.  The addon is written as a libdatabroker plugin, so it can also plug into other host addons as a data source (like TitanPanel, Bagnon, or ChocolateBar).  It is also displayed within the AddonCompartmentFrame added in the retail version of the game.

To calculate your totals, simply open your bags.  Bank totals will display as zero until you visit your bank.

## Supported price sources

- TradeSkillMaster
- Oribos Exchange
- Auctionator
- Auction House DataBase

## Features

* Quick value estimations for the items in your bags and bank based on several different configurable sources
* Support for Guild banks (must be enabled)
* Top contributors breakdowns for each container source -- see the top valued items contributing to the estimated total
* ElvUI support as a DataText
* Localizations for `enUS`, `itIT`, `deDE`, `ruRU`, `koKR`, `frFR`, `esES`, `esMX`, `zhTW`, `ptBR`, and `zhCN`

## Configuration

You can open the addon configuration in several different ways:

* Type `/ba` to open the config pane
* Click the minimap button, click the LDB display
* Locate the 'BagAppraiser' section within the Blizzard Interface -> Addon options

## ElvUI

As of v9.0.2-6, BagAppraiser has ElvUI support.  You can expose the addon inside any DataText panel you like:

![BagAppraiser in ElvUI](https://i.imgur.com/jJLrxys.png)

## Issues

### I can't open the addon options pane and my bags at the same time!

There is a limitation in the default Blizzard UI in which bags and the WoW menu cannot be opened simultaneously.  This is typically only a problem if you need to modify the item allowlists or blocklists.  As a workaround, consider (temporarily) installing a bag-replacement addon (such as BetterBags or Bagnon), or any other addon that allows you to open your bags while the menu is open.  Adding a bespoke UI frame to manage these lists outside of the default options pane is more than I want to take on at this point in time.

### Other Issues

If you encounter any problems, please [open an issue on Github](https://github.com/clocklear/BagAppraiser/issues).  I'll get to it ASAP.
