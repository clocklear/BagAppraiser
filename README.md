# BagAppraiser

A libdatabroker plugin that provides valuation of bag contents using TSM data.

![BagAppraiser](https://i.imgur.com/dtjXjsg.png)

BagAppraiser is a simple addon that taps into TradeSkillMaster or TheUndermineJournal pricing data to provide a total value of the items you have in your bags and bank.  One (or both) of the addons must be installed for it to function properly.  Open its configuration pane with '/ba' to adjust the pricing methodology used.  The addon is written as a libdatabroker plugin, so you'll need something like TitanPanel, Bagnon, or ChocolateBar to display the pricing data.

To calculate your totals, simply open your bags.  Bank totals will display as zero until you visit your bank.
