//
//  main.swift
//  LUDecomposition
//
//  Created by Максим Бутин on 16/09/2019.
//  Copyright © 2019 Максим Бутин. All rights reserved.
//

import Foundation

let matrixA = [
    [2, -1, -2],
    [-4, 6, 3],
    [-4, -2, 8]
]

let matrixY = [[3], [4]]



let lu = LUDecomposition(matrixA: matrixA, matrixY: matrixY)
lu.decomposition()
lu.printL()
print("\n\n\n")
lu.printU()

