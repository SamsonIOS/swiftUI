import UIKit

var array = [1, 2, 3]

//for i in 0..<array.count {
//    var result = array[i] + 1
//    array[i] = result
//
//}
//print(array)

let map = array.map { $0 + 1 }
print(map)

var arraySecond = ["1", "2", "/3"]

var newArray = arraySecond.compactMap(Int.init)

var intArray = [1,2,3,4,5,6,7,8,9]

let test = intArray.reduce(0) { $0 + $1 }

let test2 = intArray.filter { $0 % 2 == 0 }

print(test2)
