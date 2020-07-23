//
//  Crane Game.swift
//  Programmers
//
//  Created by JomiC on 2020/07/24.
//  Copyright © 2020 JomiC. All rights reserved.
//  Programmers Crane Game

import Foundation

func solution(_ board:[[Int]], _ moves:[Int]) -> Int {
    
    var answer = 0
    
    var map = board
    var basket: [Int] = []
    
    for col in moves {
        for row in 0..<map.count{
            if (map[row][col - 1] != 0) {
                let doll = map[row][col - 1]
                
                map[row][col - 1] = 0
                
                if (basket.isEmpty || basket.last != doll) {
                    basket.append(doll)
                } else {
                    answer += 2
                    basket.popLast()
                }
                break
            }
        }
    }
    return answer
}
