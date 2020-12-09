//
//  step-3.swift
//  Masters_Test
//
//  Created by sonjuhyeong on 2020/12/09.
//

import Foundation

struct MakeRubiksCube {
    var upArr: [[String]] = [["1","2","3"],["4","5","6"],["7","8","9"]]
    var downArr: [[String]] = [["1","2","3"],["4","5","6"],["7","8","9"]]
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
        let cha9 = upArr[2][0]
        let cha10 = upArr[2][1]
        let cha11 = upArr[2][2]
        let cha12 = rightArr[0][0]
        let cha13 = rightArr[1][0]
        let cha14 = rightArr[2][0]
        let cha15 = downArr[0][0]
        let cha16 = downArr[0][1]
        let cha17 = downArr[0][2]
        let cha18 = leftArr[0][2]
        let cha19 = leftArr[1][2]
        let cha20 = leftArr[2][2]
        
        upArr[2].remove(at: 0)
        upArr[2].append(cha20)
        upArr[2].remove(at: 0)
        upArr[2].append(cha19)
        upArr[2].remove(at: 0)
        upArr[2].append(cha18)
        
        rightArr[0].remove(at: 0)
        rightArr[0].insert(cha9, at: 0)
        rightArr[1].remove(at: 0)
        rightArr[1].insert(cha10, at: 0)
        rightArr[2].remove(at: 0)
        rightArr[2].insert(cha11, at: 0)
        
        downArr[0].remove(at: 0)
        downArr[0].append(cha14)
        downArr[0].remove(at: 0)
        downArr[0].append(cha13)
        downArr[0].remove(at: 0)
        downArr[0].append(cha12)
        
        leftArr[0].remove(at: 2)
        leftArr[0].append(cha15)
        leftArr[1].remove(at: 2)
        leftArr[1].append(cha16)
        leftArr[2].remove(at: 2)
        leftArr[2].append(cha17)
    }
    
    // 윗면 돌릴 경우: 1.복사, 2.제거, 3.삽입
    mutating func actionUp() {
        // 보이는 면
        let cha1 = upArr[0][0]
        let cha2 = upArr[0][1]
        let cha3 = upArr[0][2]
        let cha4 = upArr[1][0]
        let cha5 = upArr[1][2]
        let cha6 = upArr[2][0]
        let cha7 = upArr[2][1]
        let cha8 = upArr[2][2]
        let center = upArr[1][1]
        upArr[0].remove(at: 0)
        upArr[0].append(cha6)
        upArr[0].remove(at: 0)
        upArr[0].append(cha4)
        upArr[0].remove(at: 0)
        upArr[0].append(cha1)
        upArr[1].remove(at: 0)
        upArr[1].append(cha7)
        upArr[1].remove(at: 0)
        upArr[1].append(center)
        upArr[1].remove(at: 0)
        upArr[1].append(cha2)
        upArr[2].remove(at: 0)
        upArr[2].append(cha8)
        upArr[2].remove(at: 0)
        upArr[2].append(cha5)
        upArr[2].remove(at: 0)
        upArr[2].append(cha3)
        
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
    
    // 바닥면 돌릴 경우: 1.복사, 2.제거, 3.삽입
    mutating func actionDown() {
        // 보이는 면
        let cha1 = downArr[0][0]
        let cha2 = downArr[0][1]
        let cha3 = downArr[0][2]
        let cha4 = downArr[1][0]
        let cha5 = downArr[1][2]
        let cha6 = downArr[2][0]
        let cha7 = downArr[2][1]
        let cha8 = downArr[2][2]
        let center = downArr[1][1]
        downArr[0].remove(at: 0)
        downArr[0].append(cha6)
        downArr[0].remove(at: 0)
        downArr[0].append(cha4)
        downArr[0].remove(at: 0)
        downArr[0].append(cha1)
        downArr[1].remove(at: 0)
        downArr[1].append(cha7)
        downArr[1].remove(at: 0)
        downArr[1].append(center)
        downArr[1].remove(at: 0)
        downArr[1].append(cha2)
        downArr[2].remove(at: 0)
        downArr[2].append(cha8)
        downArr[2].remove(at: 0)
        downArr[2].append(cha5)
        downArr[2].remove(at: 0)
        downArr[2].append(cha3)
        
        // 주변면
        let cha9 = frontArr[2][0]
        let cha10 = frontArr[2][1]
        let cha11 = frontArr[2][2]
        let cha12 = rightArr[2][0]
        let cha13 = rightArr[2][1]
        let cha14 = rightArr[2][2]
        let cha15 = backArr[2][0]
        let cha16 = backArr[2][1]
        let cha17 = backArr[2][2]
        let cha18 = leftArr[2][0]
        let cha19 = leftArr[2][1]
        let cha20 = leftArr[2][2]
        
        frontArr[2].remove(at: 0)
        frontArr[2].append(cha18)
        frontArr[2].remove(at: 0)
        frontArr[2].append(cha19)
        frontArr[2].remove(at: 0)
        frontArr[2].append(cha20)
        
        rightArr[2].remove(at: 0)
        rightArr[2].append(cha9)
        rightArr[2].remove(at: 0)
        rightArr[2].append(cha10)
        rightArr[2].remove(at: 0)
        rightArr[2].append(cha11)
        
        backArr[2].remove(at: 0)
        backArr[2].append(cha12)
        backArr[2].remove(at: 0)
        backArr[2].append(cha13)
        backArr[2].remove(at: 0)
        backArr[2].append(cha14)
        
        leftArr[2].remove(at: 0)
        leftArr[2].append(cha15)
        leftArr[2].remove(at: 0)
        leftArr[2].append(cha16)
        leftArr[2].remove(at: 0)
        leftArr[2].append(cha17)
    }
    
    
}
