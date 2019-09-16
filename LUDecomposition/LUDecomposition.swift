//
//  LUDecomposition.swift
//  LUDecomposition
//
//  Created by Максим Бутин on 16/09/2019.
//  Copyright © 2019 Максим Бутин. All rights reserved.
//

import Foundation

public class LUDecomposition {
    
    private var matrixA: [[Int]]
    private var matrixY: [[Int]]
    
    private var lower: [[Int]]
    private var upper: [[Int]]
    
    public init(matrixA: [[Int]], matrixY: [[Int]]) {
        self.matrixA = matrixA
        self.matrixY = matrixY
        self.lower = Array(repeating: Array(repeating: 0, count: self.matrixA.count), count: self.matrixA.count)
        self.upper = Array(repeating: Array(repeating: 0, count: self.matrixA.count), count: self.matrixA.count)
    }
    
    // Decomposing matrix into Upper and Lower triangular matrix
    public func decomposition() {
        let n = matrixA.count
        for i in 0..<n {
            // Upper Triangular
            for k in i..<n {
                // Summation of L(i, j) * U(j, k)
                var sum = 0
                for j in 0..<i {
                    sum = sum + (lower[i][j] * upper[j][k])
                }
                // Evaluating U(i, k)
                upper[i][k] = matrixA[i][k] - sum
            }
            
            // Lower Triangle
            for k in i..<n {
                if (i == k) {
                    lower[i][i] = 1 // make diagonal
                } else {
                    // Summation of L(k, j) * U(j, i)
                    var sum = 0
                    for j in 0..<i {
                        sum = sum + (lower[k][j] * upper[j][i])
                    }
                    
                    // Evaluating L(k, i)
                    lower[k][i] = (matrixA[k][i] - sum) / upper[i][i]
                }
            }
        }
    }
    
    public func printL() {
        let n = matrixA.count
        for i in 0..<n {
            for j in 0..<n {
                print("\(lower[i][j]) \t", terminator: "")
            }
            print("\n")
        }
    }
    
    public func printU() {
        let n = matrixA.count
        for i in 0..<n {
            for j in 0..<n {
                print("\(upper[i][j]) \t", terminator: "")
            }
            print("\n")
        }
    }
}
