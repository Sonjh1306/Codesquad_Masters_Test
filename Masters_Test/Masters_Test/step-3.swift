//
//  step-3.swift
//  Masters_Test
//
//  Created by sonjuhyeong on 2020/12/09.
//

import Foundation

struct MakeRubiksCube {
    var upperArr: [[String]] = [["1","2","3"],["4","5","6"],["7","8","9"]]
    var bottomArr: [[String]] = [["1","2","3"],["4","5","6"],["7","8","9"]]
    var leftArr: [[String]] = [["1","2","3"],["4","5","6"],["7","8","9"]]
    var frontArr: [[String]] = [["1","2","3"],["4","5","6"],["7","8","9"]]
    var rightArr: [[String]] = [["1","2","3"],["4","5","6"],["7","8","9"]]
    var backArr: [[String]] = [["1","2","3"],["4","5","6"],["7","8","9"]]
    
    // 앞면 돌릴 경우: 1.복사, 2.제거, 3.삽입
    mutating func actionFront() {
        // 보이는 면
        let cha1 = frontArr[0][0]
        let cha2 = frontArr[0][1]
        let cha3 = frontArr[0][2]
        let cha4 = frontArr[1][0]
        let cha5 = frontArr[1][2]
        let cha6 = frontArr[2][0]
        let cha7 = frontArr[2][1]
        let cha8 = frontArr[2][2]
        let center = frontArr[1][1]


        frontArr[0].remove(at: 0)
        frontArr[0].append(cha6)
        frontArr[0].remove(at: 0)
        frontArr[0].append(cha4)
        frontArr[0].remove(at: 0)
        frontArr[0].append(cha1)
        frontArr[1].remove(at: 0)
        frontArr[1].append(cha7)
        frontArr[1].remove(at: 0)
        frontArr[1].append(center)
        frontArr[1].remove(at: 0)
        frontArr[1].append(cha2)
        frontArr[2].remove(at: 0)
        frontArr[2].append(cha8)
        frontArr[2].remove(at: 0)
        frontArr[2].append(cha5)
        frontArr[2].remove(at: 0)
        frontArr[2].append(cha3)
        // 주변면
        let cha9 = upperArr[2][0]
        let cha10 = upperArr[2][1]
        let cha11 = upperArr[2][2]
        let cha12 = rightArr[0][0]
        let cha13 = rightArr[1][0]
        let cha14 = rightArr[2][0]
        let cha15 = bottomArr[0][0]
        let cha16 = bottomArr[0][1]
        let cha17 = bottomArr[0][2]
        let cha18 = leftArr[0][2]
        let cha19 = leftArr[1][2]
        let cha20 = leftArr[2][2]
        
        upperArr[2].remove(at: 0)
        upperArr[2].append(cha20)
        upperArr[2].remove(at: 0)
        upperArr[2].append(cha19)
        upperArr[2].remove(at: 0)
        upperArr[2].append(cha18)
        
        rightArr[0].remove(at: 0)
        rightArr[0].insert(cha9, at: 0)
        rightArr[1].remove(at: 0)
        rightArr[1].insert(cha10, at: 0)
        rightArr[2].remove(at: 0)
        rightArr[2].insert(cha11, at: 0)
        
        bottomArr[0].remove(at: 0)
        bottomArr[0].append(cha14)
        bottomArr[0].remove(at: 0)
        bottomArr[0].append(cha13)
        bottomArr[0].remove(at: 0)
        bottomArr[0].append(cha12)
        
        leftArr[0].remove(at: 2)
        leftArr[0].append(cha15)
        leftArr[1].remove(at: 2)
        leftArr[1].append(cha16)
        leftArr[2].remove(at: 2)
        leftArr[2].append(cha17)
       
    }
    // 윗면 돌릴 경우: 1.복사, 2.제거, 3.삽입
    mutating func actionUpper() {
        // 보이는 면
        let cha1 = upperArr[0][0]
        let cha2 = upperArr[0][1]
        let cha3 = upperArr[0][2]
        let cha4 = upperArr[1][0]
        let cha5 = upperArr[1][2]
        let cha6 = upperArr[2][0]
        let cha7 = upperArr[2][1]
        let cha8 = upperArr[2][2]
        let center = upperArr[1][1]
        upperArr[0].remove(at: 0)
        upperArr[0].append(cha6)
        upperArr[0].remove(at: 0)
        upperArr[0].append(cha4)
        upperArr[0].remove(at: 0)
        upperArr[0].append(cha1)
        upperArr[1].remove(at: 0)
        upperArr[1].append(cha7)
        upperArr[1].remove(at: 0)
        upperArr[1].append(center)
        upperArr[1].remove(at: 0)
        upperArr[1].append(cha2)
        upperArr[2].remove(at: 0)
        upperArr[2].append(cha8)
        upperArr[2].remove(at: 0)
        upperArr[2].append(cha5)
        upperArr[2].remove(at: 0)
        upperArr[2].append(cha3)
        
        // 주변면
        let cha9 = backArr[0][2]
        let cha10 = backArr[0][1]
        let cha11 = backArr[0][0]
        let cha12 = rightArr[0][2]
        let cha13 = rightArr[0][1]
        let cha14 = rightArr[0][0]
        let cha15 = frontArr[0][0]
        let cha16 = frontArr[0][1]
        let cha17 = frontArr[0][2]
        let cha18 = leftArr[0][0]
        let cha19 = leftArr[0][1]
        let cha20 = leftArr[0][2]
        
        backArr[0].remove(at: 0)
        backArr[0].append(cha18)
        backArr[0].remove(at: 0)
        backArr[0].append(cha19)
        backArr[0].remove(at: 0)
        backArr[0].append(cha20)
        
        rightArr[0].remove(at: 0)
        rightArr[0].append(cha11)
        rightArr[0].remove(at: 0)
        rightArr[0].append(cha10)
        rightArr[0].remove(at: 0)
        rightArr[0].append(cha9)
        
        frontArr[0].remove(at: 0)
        frontArr[0].append(cha14)
        frontArr[0].remove(at: 0)
        frontArr[0].append(cha13)
        frontArr[0].remove(at: 0)
        frontArr[0].append(cha12)
        
        leftArr[0].remove(at: 0)
        leftArr[0].append(cha15)
        leftArr[0].remove(at: 0)
        leftArr[0].append(cha16)
        leftArr[0].remove(at: 0)
        leftArr[0].append(cha17)
       
        print(backArr)
        print(rightArr)
        print(frontArr)
        print(leftArr)
    }
    
}
