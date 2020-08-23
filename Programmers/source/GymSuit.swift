//
//  GymSuit.swift
//  Programmers
//
//  Created by JomiC on 2020/08/23.
//  Copyright © 2020 JomiC. All rights reserved.
//

/*
 점심시간에 도둑이 들어, 일부 학생이 체육복을 도난당했습니다. 다행히 여벌 체육복이 있는 학생이 이들에게 체육복을 빌려주려 합니다. 학생들의 번호는 체격 순으로 매겨져 있어, 바로 앞번호의 학생이나 바로 뒷번호의 학생에게만 체육복을 빌려줄 수 있습니다. 예를 들어, 4번 학생은 3번 학생이나 5번 학생에게만 체육복을 빌려줄 수 있습니다. 체육복이 없으면 수업을 들을 수 없기 때문에 체육복을 적절히 빌려 최대한 많은 학생이 체육수업을 들어야 합니다.

 전체 학생의 수 n, 체육복을 도난당한 학생들의 번호가 담긴 배열 lost, 여벌의 체육복을 가져온 학생들의 번호가 담긴 배열 reserve가 매개변수로 주어질 때, 체육수업을 들을 수 있는 학생의 최댓값을 return 하도록 solution 함수를 작성해주세요.

 제한사항
 전체 학생의 수는 2명 이상 30명 이하입니다.
 체육복을 도난당한 학생의 수는 1명 이상 n명 이하이고 중복되는 번호는 없습니다.
 여벌의 체육복을 가져온 학생의 수는 1명 이상 n명 이하이고 중복되는 번호는 없습니다.
 여벌 체육복이 있는 학생만 다른 학생에게 체육복을 빌려줄 수 있습니다.
 여벌 체육복을 가져온 학생이 체육복을 도난당했을 수 있습니다. 이때 이 학생은 체육복을 하나만 도난당했다고 가정하며, 남은 체육복이 하나이기에 다른 학생에게는 체육복을 빌려줄 수 없습니다.
 입출력 예
 n    lost    reserve    return
 5    [2, 4]    [1, 3, 5]    5
 5    [2, 4]    [3]    4
 3    [3]    [1]    2
 입출력 예 설명
 예제 #1
 1번 학생이 2번 학생에게 체육복을 빌려주고, 3번 학생이나 5번 학생이 4번 학생에게 체육복을 빌려주면 학생 5명이 체육수업을 들을 수 있습니다.

 예제 #2
 3번 학생이 2번 학생이나 4번 학생에게 체육복을 빌려주면 학생 4명이 체육수업을 들을 수 있습니다.
 */

import Foundation

func solution(_ n:Int, _ lost:[Int], _ reserve:[Int]) -> Int {
    var n = n
    var lost = lost
    var reserve = reserve
    var student = [Int](repeating: 1, count: n)
    
    // 도난당한 학생들을 student 배열에서 1을 빼준다
    for i in lost {
        var index = i - 1
        student[index] = student[index] - 1
    }
    
    // 여유분이 있는 학생들을 student 배열에서 1을 더해준다
    for j in reserve {
        var index = j - 1
        student[index] = student[index] + 1
    }
    
    // student 배열을 반복
    for (index, value) in student.enumerated() {
        // index 번째의 value = 0 이면 체육복이 없는것
        if value == 0 {
            // 0번째 학생보다 뒤에있고, index번째 학생 앞에 2개를 가진 친구가 있으면 체육복 양도
            if (index > 0 && student[index - 1] == 2) {
                student[index - 1] -= 1
                student[index] += 1
            // 마지막 학생보다 앞에있고, 자기 뒤에 학생이 2개를 가지고있으면 체육복 양도받음
            } else if (index < student.count - 1) && student[index + 1] == 2 {
                student[index + 1] -= 1
                student[index] += 1
            }
        }
    }
    // student 배열에서 체육복 개수가 1이상인 학생 수를 구함
    var result = student.filter{($0 >= 1)}.count
    
    return result
}
