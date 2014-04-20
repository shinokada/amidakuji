# amidakuji

* [Homepage](https://github.com/shinokada/amidakuji#readme)
* [Issues](https://github.com/shinokada/amidakuji/issues)
* [Documentation](http://rubydoc.info/gems/amidakuji/frames)
* [Google doc](https://docs.google.com/a/canacad.ac.jp/spreadsheets/d/1O5SHoE84DX79yZD5wQWSsDmmgMaPf4woM6yBSLAk83U/edit#gid=0)
* [Ladders: A research paper by David Senft](http://www2.edc.org/makingmath/studentWork/amidaKuji/AmidaKujiByDavidSenft.pdf)
* [Ghost leg](http://en.wikipedia.org/wiki/Ghost_Leg)

## Description

A  Amidakuji/Ghost ladder is a group of vertical columns and horizontal bars (“rungs”) between adjacent columns that collectively represent a permutation from an ordered arrangement above the ladder (the “top row”) to an ordered arrangement below the ladder (the “bottom row” or “sequence”).

If you have a four vertical columns there are 24 ways to pemutate 1, 2, 3 and 4. (4x3x2x1=24)
When you have no rungs there is only one way to arrange the number, 1 2 3 4.
When you have one rung, then you can swap two adjacent numbers. 

    # with one rung
    (1, 2), 3, 4 => 2, 1, 3, 4
    1, (2, 3), 4 => 1, 3, 2, 4
    1, 2, (3, 4) => 1, 2, 4, 3

This can be done only when the left number is smaller than the right one. Otherwise it will bring back to the previous/original number.

    # with two rungs
    (2, 1), 3, 4 => can't be done since left < right
    2, (1, 3), 4 => 2, 3, 1, 4

The followings are all the numbers with two rungs. Note that there are two '2, 1, 4, 3'. This means there are five numbers with two rungs.

    2314
    2143
    3124
    1342
    2143*
    1423

The followings are all the numbers with three rungs. Note that there are three duplicates, 3214, 3142, 1432. This means there are six numbers with three rungs.

    3214
    2341
    2413
    3214*
    3142
    3142*
    1432
    4123
    1432*

The followings are all the numbers with four rungs. Note that there are three duplicates, 3241, 4213, 4132. This means there are five numbers with four rungs.

    3214
    3214*
    4213
    2431
    3412
    4132
    4213*
    4132*

The followings are all the numbers with five rungs. There are four duplicates indicated by `*`. This means there are three numbers with five rungs.

    3421
    4231
    4231*
    3421*
    4312
    4231*
    4312*

And finally the followings are all the number with six rungs. There is only one number and two others are duplicates. 

    4321
    4321*
    4321*

I use these logic to find out how many sets of numbers will be obtained given number of columns and rungs.








## Features

## Examples

    require 'amidakuji'






