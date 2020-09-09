//
//  getMiddleChar.swift
//  Programmers
//
//  Created by JomiC on 2020/09/09.
//  Copyright © 2020 JomiC. All rights reserved.
//
/*
 문제 설명
 단어 s의 가운데 글자를 반환하는 함수, solution을 만들어 보세요. 단어의 길이가 짝수라면 가운데 두글자를 반환하면 됩니다.

 재한사항
 s는 길이가 1 이상, 100이하인 스트링입니다.
 입출력 예
 s    return
 abcde    c
 */


import Foundation


func solution(_ s:String) -> String {
    var len = s.count
    var result = ""
    
    if len % 2 == 0 {
        let firstNum = s.index(s.startIndex, offsetBy: len / 2 - 1)
        let secondNum = s.index(s.startIndex, offsetBy: len / 2)
        result.append(s[firstNum])
        result.append(s[secondNum])
        return result
    } else {
        let number = s.index(s.startIndex, offsetBy: len / 2)
        result.append(s[number])
        return result
    }
}
