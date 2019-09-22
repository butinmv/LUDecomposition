//
//  LUDecomposition.swift
//  LUDecomposition
//
//  Created by Максим Бутин on 16/09/2019.
//  Copyright © 2019 Максим Бутин. All rights reserved.
//

import Foundation

public class LUDecomposition {
    
    // MARK: - Properties
    private var matrixA: [[Double]]
    private var matrixB: [Double]
    private var LU: [[Double]]
    
    
    // MARK: - Init
    public init(matrixA: [[Double]], matrixB: [Double]) {
        self.matrixA = matrixA
        self.matrixB = matrixB
        
        self.LU = Array(repeating: Array(repeating: 0, count: self.matrixA.count), count: self.matrixA.count)
    }
    
    //MARK: - Decomposing matrix into Upper and Lower triangular matrix
    public func decomposition() {
        let n = matrixA.count
        for i in 0..<n {
            for j in 0..<n {
                if (i <= j) {
                    var sum = 0.0
                    for k in 0..<i {
                        sum += (LU[i][k] * LU[k][j])
                    }
                    LU[i][j] = matrixA[i][j] - sum
                } else {
                    var sum = 0.0
                    for k in 0..<i {
                        sum = sum + (LU[i][k] * LU[k][j])
                    }
                    LU[i][j] = (matrixA[i][j] - sum) / LU[j][j]
                }
            }
        }
    }
    
    //MARK: - Find Solution
    public func findSolution() -> [Double] {
        return findSolutionFromU(findSolutionFromL())
    }
    
    private func findSolutionFromL() -> [Double] {
        let n = matrixA.count
        var y = Array(repeating: 0.0, count: n)
        for i in 0..<n {
            var sum = 0.0
            for j in 0..<i {
                sum += LU[i][j] * y[j]
            }
            y[i] = matrixB[i] - sum
        }
        return y
    }
    
    private func findSolutionFromU(_ y: [Double]) -> [Double] {
        let n = matrixA.count
        var x = Array(repeating: 0.0, count: n)
        for i in (0..<n).reversed() {
            var sum = 0.0
            for j in (i..<n).reversed() {
                sum += LU[i][j] * x[j]
            }
            x[i] = (y[i] - sum) / LU[i][i]
        }
        return x
    }
    
    //MARK: - Print LU-Matrix
    public func printLU() {
        print("LU matrix")
        let n = matrixA.count
        for i in 0..<n {
            for j in 0..<n {
                print("\(LU[i][j]) \t", terminator: "")
            }
            print("\n")
        }
    }
}
