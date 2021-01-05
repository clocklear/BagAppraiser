# BagAppraiser
A libdatabroker plugin that provides valuation of bag contents using TSM data.

![BagAppraiser](https://i.imgur.com/TVYeP3E.png)

BagAppraiser is a simple addon that taps into TradeSkillMaster pricing data to provide a total value of the items you have in your bags and bank.  It currently has no configuration and uses the DBMarket pricing source to  calculate item values.  TSM 4+ is required; you won't get any values without TSM installed.  The addon is written as a libdatabroker plugin, so you'll need something like TitanPanel, Bagnon, or ChocolateBar to display the pricing data.

To calculate your totals, simply open your bags.  Bank totals will display as zero until you visit your bank.

More configuration may come at a later date!
