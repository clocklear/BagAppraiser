# BagAppraiser

A libdatabroker plugin that provides valuation of bag contents using various pricing sources.

![BagAppraiser](https://i.imgur.com/Zagxpho.png)

BagAppraiser is a simple addon that taps into TradeSkillMaster or TheUndermineJournal pricing data to provide a total value of the items you have in your bags and bank.  One (or both) of the addons must be installed for it to function properly.  Open its configuration pane with '/ba' to adjust the pricing methodology used.  The addon is written as a libdatabroker plugin, so it can also plug into other host addons as a data source (like TitanPanel, Bagnon, or ChocolateBar).

To calculate your totals, simply open your bags.  Bank totals will display as zero until you visit your bank.

## Features

* Quick value estimations for the items in your bags and bank based on several different configurable sources
* Support for Guild banks (must be enabled)
* Top contributors breakdowns for each container source -- see the top valued items contributing to the estimated total
* ElvUI support as a DataText

## Configuration

You can open the addon configuration in several different ways:

* Type `/ba` to open the config pane
* Click the minimap button, click the LDB display
* Locate the 'BagAppraiser' section within the Blizzard Interface -> Addon options

## ElvUI

As of v9.0.2-6, BagAppraiser has ElvUI support.  You can expose the addon inside any DataText panel you like:

![BagAppraiser in ElvUI](https://i.imgur.com/jJLrxys.png)

## Issues

If you encounter any problems, please [open an issue on Github](https://github.com/clocklear/BagAppraiser/issues).  I'll get to it ASAP.
