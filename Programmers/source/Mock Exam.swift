//
//  Mock Exam.swift
//  Programmers
//
//  Created by JomiC on 2020/07/24.
//  Copyright © 2020 JomiC. All rights reserved.
//  Programmers Mock Exam

import Foundation

func solution(_ answers:[Int]) -> [Int] {
    
    let student1 = [1, 2, 3, 4, 5, 1, 2, 3, 4, 5]
    let student1Cnt: Int = student1.count
    let student2 = [2, 1, 2, 3, 2, 4, 2, 5, 2, 1, 2, 3, 2, 4, 2, 5]
    let student2Cnt: Int = student2.count
    let student3 = [3, 3, 1, 1, 2, 2, 4, 4, 5, 5, 3, 3, 1, 1, 2, 2, 4, 4, 5, 5]
    let student3Cnt: Int = student3.count
    var score1: Int = 0
    var score2: Int = 0
    var score3: Int = 0
    var result = [Int]()
    
    var score = [1:0, 2:0, 3:0]
    
    for (i, value) in answers.enumerated() {
        
        if value == student1[i % student1Cnt] {
            score1 += 1
        }
        
        if value == student2[i % student2Cnt] {
            score2 += 1
        }
        
        if value == student3[i % student3Cnt] {
            score3 += 1
        }
    }
    
    let maxScore = max(max(score1, score2), score3)
    
    
    if maxScore == score1 {
        result.append(1)
    }
    if maxScore == score2 {
        result.append(2)
    }
    if maxScore == score3 {
        result.append(3)
    }
    
    return result
}
