//: Playground - noun: a place where people can play

import UIKit

let numbers = [11, 23, 43, 44, 59, 43, 88, 92, 58, 11, 13, 14, 15]


let multiplesOfThree = numbers.filter({$0 % 3 == 0})

print(multiplesOfThree)

let largestNumber = numbers.reduce(Int.min, combine: {max($0, $1)})

print(largestNumber)

let array = ["I", "Love", "DevMtn"]

