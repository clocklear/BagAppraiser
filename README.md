# BagAppraiser

A libdatabroker plugin that provides valuation of bag contents using TSM data.

![BagAppraiser](https://i.imgur.com/Zagxpho.png)

BagAppraiser is a simple addon that taps into TradeSkillMaster or TheUndermineJournal pricing data to provide a total value of the items you have in your bags and bank.  One (or both) of the addons must be installed for it to function properly.  Open its configuration pane with '/ba' to adjust the pricing methodology used.  The addon is written as a libdatabroker plugin, so it can also plug into other host addons as a data source (like TitanPanel, Bagnon, or ChocolateBar).

To calculate your totals, simply open your bags.  Bank totals will display as zero until you visit your bank.

## Features

* Quick value estimations for the items in your bags and bank based on several different configurable sources
* Support for Guild banks (must be enabled)
* Top contributors breakdowns for each container source -- see the top valued items contributing to the estimated total

## Configuration

You can open the addon configuration in several different ways:

* Type `/ba` to open the config pane
* Click the minimap button, click the LDB display
* Locate the 'BagAppraiser' section within the Blizzard Interface -> Addon options