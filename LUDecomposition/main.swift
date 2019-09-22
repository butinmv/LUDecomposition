//
//  main.swift
//  LUDecomposition
//
//  Created by Максим Бутин on 16/09/2019.
//  Copyright © 2019 Максим Бутин. All rights reserved.
//

import Foundation

// MARK: - Random Generation Data For Matrix
func randomMatrix(size: Int) -> [[Double]] {
   var array: [[Double]] = Array(repeating: Array(repeating: 0, count: size), count: size)
   for i in 0..<size {
       for j in 0..<size {
           array[i][j] = Double(Int.random(in: 0..<100))
       }
   }
   return array
}
   
func computingMatrixB(array: [[Double]]) -> [Double] {
    var b = Array(repeating: 0.0, count: array.count)
   for i in 0..<array.count {
    var sum = 0.0
       for j in 0..<array.count {
           sum += array[i][j]
       }
       b[i] = sum
   }
   return b
}


// MARK: - Main program
func main() {
    let matrixA = [
        [1.0, 2.0, 3.0],
        [3.0, 4.0, 1.0],
        [2.0, 2.0, 2.0],
    ]

    let matrixB = [6.0, 8.0, 6.0]
    var lu = LUDecomposition(matrixA: matrixA, matrixB: matrixB)
    lu.decomposition()
    lu.printLU()
    print(lu.findSolution())
    
    let array = randomMatrix(size: 500)
    for i in 0..<array.count {
        for j in 0..<array.count {
            print("\(array[i][j]) \t", terminator: "")
        }
        print("\n")
    }
    let b = computingMatrixB(array: array)
    print(b)

    lu = LUDecomposition(matrixA: array, matrixB: b)
    lu.decomposition()
    lu.printLU()
    print(lu.findSolution())
}

main()
