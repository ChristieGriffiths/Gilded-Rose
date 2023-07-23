# Gilded Rose Challenge - My Ruby Implementation

## Introduction

Welcome to my Ruby implementation of the Gilded Rose challenge. The Gilded Rose is a coding kata where I worked on an inventory system to manage the quality and sell-in values of various items over time.

## Installation

To run my Gilded Rose Ruby implementation, follow these simple steps:

1. Make sure you have Ruby installed on your system. If you're unsure, you can check by running the following command in your terminal or command prompt:

   ```bash
   ruby --version
   ```

   If Ruby is not installed, don't worry! You can easily download and install it from the official Ruby website: https://www.ruby-lang.org/en/downloads/

2. Next, just copy the Ruby code I provided into a file named `gilded_rose.rb`.

3. Now you can use the `GildedRose` class in your Ruby scripts or tests by requiring the `gilded_rose.rb` file. For example:

   ```ruby
   require_relative 'gilded_rose'

   # Now you can use the GildedRose class and interact with the inventory items.
   ```

## Rules

In my implementation, the Gilded Rose inventory system operates based on the following rules:

1. All items have a `sell_in` value, which denotes the number of days left to sell the item. The `sell_in` value decreases by 1 at the end of each day.

2. The `quality` of each item decreases by 1 at the end of each day.

3. Once the `sell_in` days are past, the `quality` degrades twice as fast.

4. The `quality` of an item is never negative.

5. "Aged Brie" is a special item that increases in quality over time.

6. "Sulfuras" is a legendary item with a fixed quality value that never changes.

7. "Backstage passes" increase in quality as the `sell_in` days decrease.

8. There is a new item type called "ConjuredItem" that degrades in quality twice as fast as a standard item.

With these rules in mind, my `GildedRose` class efficiently manages the items in the inventory, ensuring their quality and sell-in values are updated correctly as time passes. Feel free to explore the code and test it out with different scenarios!
