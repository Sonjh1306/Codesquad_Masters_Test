//
//  step-3.swift
//  Masters_Test
//
//  Created by sonjuhyeong on 2020/12/09.
//

import Foundation

struct MakeRubiksCube {
    let startTime = CFAbsoluteTimeGetCurrent()
    var count: Int = 0
    var roofEnd: Bool = false
    var completeSign: Bool = false
    var radomActionArr: [String] = []
    
    var upArr: [[String]] = Array(repeating: Array(repeating: "B", count: 3), count: 3)
    var downArr: [[String]] = Array(repeating: Array(repeating: "R", count: 3), count: 3)
    var leftArr: [[String]] = Array(repeating: Array(repeating: "W", count: 3), count: 3)
    var frontArr: [[String]] = Array(repeating: Array(repeating: "O", count: 3), count: 3)
    var rightArr: [[String]] = Array(repeating: Array(repeating: "G", count: 3), count: 3)
    var backArr: [[String]] = Array(repeating: Array(repeating: "Y", count: 3), count: 3)
    var cubeArr = [
        Array(repeating: Array(repeating: "B", count: 3), count: 3),
        Array(repeating: Array(repeating: "R", count: 3), count: 3),
        Array(repeating: Array(repeating: "W", count: 3), count: 3),
        Array(repeating: Array(repeating: "O", count: 3), count: 3),
        Array(repeating: Array(repeating: "G", count: 3), count: 3),
        Array(repeating: Array(repeating: "Y", count: 3), count: 3)
    ]
    
    
    // 일반 기능 구현
    //-----------------------------------------------------------------------//
    
    
    // 입력 관리
    func makeInput() -> [String] {
        let inputArr: [String] = String(readLine()!).map{String($0)}
        var filterArr: [String] = []
        var actionArr: [String] = []
        // " ' " 를 필터해서 바꿔주는 함수
        for i in 0...inputArr.count - 1  {
            if inputArr[i] == "'" {
                filterArr.removeLast()
                filterArr.append("\(inputArr[i-1])'")
            }else{
                filterArr.append(inputArr[i])
            }
        }
        // 2번 돌리는 입력을 바꿔주는 함수
        for i in 0...filterArr.count - 1 {
            if filterArr[i] == "U" || filterArr[i] == "D" || filterArr[i] == "F" || filterArr[i] == "B" || filterArr[i] == "L" || filterArr[i] == "R" || filterArr[i] == "Q"{
                actionArr.append(filterArr[i])
            }else if filterArr[i] == "U'" || filterArr[i] == "D'" || filterArr[i] == "F'" || filterArr[i] == "B'" ||
                        filterArr[i] == "L'" || filterArr[i] == "R'" || filterArr[i] == "Q"{
                actionArr.append(filterArr[i])
            }else{
                actionArr.removeLast()
                actionArr.append("\(filterArr[i-1])\(filterArr[i])")
            }
        }
        return actionArr
    }
    
    // 큐브 동작
    mutating func cubeAction() {
        printEndText()
        printCompleteText()
        let action = makeInput()
        print("CUBE> " + action.joined())
        for index in action {
            count += 1
            if index == "U" {print(index);actionUp();printCube()}
            else if index == "D"{print(index);actionDown();printCube()}
            else if index == "F"{print(index);actionFront();printCube()}
            else if index == "B"{print(index);actionBack();printCube()}
            else if index == "L"{print(index);actionLeft();printCube()}
            else if index == "R"{print(index);actionRight();printCube()}
            else if index == "U'"{print(index);for _ in 0...2 {actionUp()};printCube()}
            else if index == "D'"{print(index);for _ in 0...2 {actionDown()};printCube()}
            else if index == "F'"{print(index);for _ in 0...2 {actionFront()};printCube()}
            else if index == "B'"{print(index);for _ in 0...2 {actionBack()};printCube()}
            else if index == "L'"{print(index);for _ in 0...2 {actionLeft()};printCube()}
            else if index == "R'"{print(index);for _ in 0...2 {actionRight()};printCube()}
            
            else if index == "U2"{print(index);for _ in 0...1 {actionUp()};printCube()}
            else if index == "D2"{print(index);for _ in 0...1 {actionDown()};printCube()}
            else if index == "F2"{print(index);for _ in 0...1 {actionFront()};printCube()}
            else if index == "B2"{print(index);for _ in 0...1 {actionBack()};printCube()}
            else if index == "L2"{print(index);for _ in 0...1 {actionLeft()};printCube()}
            else if index == "R2"{print(index);for _ in 0...1 {actionRight()};printCube()}
            else if index == "U'2"{print(index);for _ in 0...1 {actionUp()};printCube()}
            else if index == "D'2"{print(index);for _ in 0...1 {actionDown()};printCube()}
            else if index == "F'2"{print(index);for _ in 0...1 {actionFront()};printCube()}
            else if index == "B'2"{print(index);for _ in 0...1 {actionBack()};printCube()}
            else if index == "L'2"{print(index);for _ in 0...1 {actionLeft()};printCube()}
            else if index == "R'2"{print(index);for _ in 0...1 {actionRight()};printCube()}
            else if index == "Q"{
                roofEnd = true
            }
        }
        if [upArr,downArr,leftArr,frontArr,rightArr,backArr] == cubeArr{
            completeSign = true
        }
        // 꼬리 재귀 사용
        self.cubeAction()
    }
    
    func printEndText() {
        if roofEnd == true {
            print()
            let elapsedTime = Int(CFAbsoluteTimeGetCurrent() - startTime)
            print("경과시간: \(elapsedTime/60)분 \(elapsedTime)초")
            print("조작갯수: \(count - 1)")
            print("이용해 주셔서 감사합니다. 뚜뚜뚜.")
            exit(0)
        }
    }
    
    func printCompleteText() {
        if completeSign == true {
            print("축하합니다. 모든 면을 맞추셨습니다.")
            let elapsedTime = Int(CFAbsoluteTimeGetCurrent() - startTime)
            print("경과시간: \(elapsedTime/60)분 \(elapsedTime)초")
            print("조작갯수: \(count)")
            print("이용해 주셔서 감사합니다. 뚜뚜뚜.")
            exit(0)
        }
    }
    
    // 화면 출력
    mutating func screenOfOuput() {
        print("기본 동작을 작동하시려면 0을 입력해주시고 큐브 맞추기를 하시려면 1을 입력해주세요.")
        let selectNum: Int = Int(readLine()!)!
        if selectNum == 0 {
            print("초기 상태")
            print()
            printCube()
            print()
            cubeAction()
        }else if selectNum == 1{
            _ = randomInput()
            radomMixedCube()
        }else{
            print("잘못 입력하셨습니다. 강제 종료 합니다.")
            exit(0)
        }
    }
    
    // 큐브 출력
    mutating func printCube() {
        for i in 0...2 {
            print("       ",terminator:"")
            for j in 0...2 {
                print(upArr[i][j], terminator:" ")
            }
            print()
        }
        print()
        for i in 0...2 {
            for j in 0...2 {
                print(leftArr[i][j], terminator:" ")
            }
            print(" ",terminator:"")
            for j in 0...2 {
                print(frontArr[i][j], terminator:" ")
            }
            print(" ",terminator:"")
            for j in 0...2 {
                print(rightArr[i][j], terminator:" ")
            }
            print(" ",terminator:"")
            for j in 0...2 {
                print(backArr[i][j], terminator:" ")
            }
            print()
        }
        print()
        for i in 0...2 {
            print("       ",terminator:"")
            for j in 0...2 {
                print(downArr[i][j], terminator:" ")
            }
            print()
        }
    }
    // 추가 기능 구현
    //-----------------------------------------------------------------------//
    mutating func randomInput() -> [String]{
        let radomCount: Int = Int.random(in: 1...10)
        for _ in 0...radomCount {
            let radomAction: Int = Int.random(in: 1...24)
            switch radomAction {
            case 1: radomActionArr.append("U")
            case 2: radomActionArr.append("D")
            case 3: radomActionArr.append("F")
            case 4: radomActionArr.append("B")
            case 5: radomActionArr.append("L")
            case 6: radomActionArr.append("R")
            case 7: radomActionArr.append("U'")
            case 8: radomActionArr.append("D'")
            case 9: radomActionArr.append("F'")
            case 10: radomActionArr.append("B'")
            case 11: radomActionArr.append("L'")
            case 12: radomActionArr.append("R'")
            case 13: radomActionArr.append("U2")
            case 14: radomActionArr.append("D2")
            case 15: radomActionArr.append("F2")
            case 16: radomActionArr.append("B2")
            case 17: radomActionArr.append("L2")
            case 18: radomActionArr.append("R2")
            case 19: radomActionArr.append("U'2")
            case 20: radomActionArr.append("D'2")
            case 21: radomActionArr.append("F'2")
            case 22: radomActionArr.append("B'2")
            case 23: radomActionArr.append("L'2")
            case 24: radomActionArr.append("R'2")
            default:
                break
            }
        }
        return radomActionArr
    }
    mutating func radomMixedCube() {
        let action = radomActionArr
        for index in action {
            if index == "U" {actionUp()}
            else if index == "D"{actionDown()}
            else if index == "F"{actionFront()}
            else if index == "B"{actionBack()}
            else if index == "L"{actionLeft()}
            else if index == "R"{actionRight()}
            else if index == "U'"{for _ in 0...2 {actionUp()}}
            else if index == "D'"{for _ in 0...2 {actionDown()}}
            else if index == "F'"{for _ in 0...2 {actionFront()}}
            else if index == "B'"{for _ in 0...2 {actionBack()}}
            else if index == "L'"{for _ in 0...2 {actionLeft()}}
            else if index == "R'"{for _ in 0...2 {actionRight()}}
            
            else if index == "U2"{for _ in 0...1 {actionUp()}}
            else if index == "D2"{for _ in 0...1 {actionDown()}}
            else if index == "F2"{for _ in 0...1 {actionFront()}}
            else if index == "B2"{for _ in 0...1 {actionBack()}}
            else if index == "L2"{for _ in 0...1 {actionLeft()}}
            else if index == "R2"{for _ in 0...1 {actionRight()}}
            else if index == "U'2"{for _ in 0...1 {actionUp()}}
            else if index == "D'2"{for _ in 0...1 {actionDown()}}
            else if index == "F'2"{for _ in 0...1 {actionFront()}}
            else if index == "B'2"{for _ in 0...1 {actionBack()}}
            else if index == "L'2"{for _ in 0...1 {actionLeft()}}
            else if index == "R'2"{for _ in 0...1 {actionRight()}}
            else if index == "Q"{roofEnd = true}
        }
        printCube()
        // 꼬리 재귀 사용
        self.cubeAction()
    }


    
    // 큐브 동작 기능 함수
    //-----------------------------------------------------------------------//
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
    
    // 왼쪽면 돌릴 경우: 1.복사, 2.제거, 3.삽입
    mutating func actionLeft() {
        // 보이는 면
        let cha1 = leftArr[0][0]
        let cha2 = leftArr[0][1]
        let cha3 = leftArr[0][2]
        let cha4 = leftArr[1][0]
        let cha5 = leftArr[1][2]
        let cha6 = leftArr[2][0]
        let cha7 = leftArr[2][1]
        let cha8 = leftArr[2][2]
        let center = leftArr[1][1]

        leftArr[0].remove(at: 0)
        leftArr[0].append(cha6)
        leftArr[0].remove(at: 0)
        leftArr[0].append(cha4)
        leftArr[0].remove(at: 0)
        leftArr[0].append(cha1)
        leftArr[1].remove(at: 0)
        leftArr[1].append(cha7)
        leftArr[1].remove(at: 0)
        leftArr[1].append(center)
        leftArr[1].remove(at: 0)
        leftArr[1].append(cha2)
        leftArr[2].remove(at: 0)
        leftArr[2].append(cha8)
        leftArr[2].remove(at: 0)
        leftArr[2].append(cha5)
        leftArr[2].remove(at: 0)
        leftArr[2].append(cha3)
        // 주변면
        let cha9 = upArr[0][0]
        let cha10 = upArr[1][0]
        let cha11 = upArr[2][0]
        let cha12 = frontArr[0][0]
        let cha13 = frontArr[1][0]
        let cha14 = frontArr[2][0]
        let cha15 = downArr[0][0]
        let cha16 = downArr[1][0]
        let cha17 = downArr[2][0]
        let cha18 = backArr[0][2]
        let cha19 = backArr[1][2]
        let cha20 = backArr[2][2]
        
        upArr[0].remove(at: 0)
        upArr[0].insert(cha20, at: 0)
        upArr[1].remove(at: 0)
        upArr[1].insert(cha19, at: 0)
        upArr[2].remove(at: 0)
        upArr[2].insert(cha18, at: 0)
        
        frontArr[0].remove(at: 0)
        frontArr[0].insert(cha9, at: 0)
        frontArr[1].remove(at: 0)
        frontArr[1].insert(cha10, at: 0)
        frontArr[2].remove(at: 0)
        frontArr[2].insert(cha11, at: 0)
        
        downArr[0].remove(at: 0)
        downArr[0].insert(cha12, at: 0)
        downArr[1].remove(at: 0)
        downArr[1].insert(cha13, at: 0)
        downArr[2].remove(at: 0)
        downArr[2].insert(cha14, at: 0)
        
        backArr[0].remove(at: 2)
        backArr[0].append(cha17)
        backArr[1].remove(at: 2)
        backArr[1].append(cha16)
        backArr[2].remove(at: 2)
        backArr[2].append(cha15)
    }
    
    // 오른쪽면 돌릴 경우: 1.복사, 2.제거, 3.삽입
    mutating func actionRight() {
        // 보이는 면
        let cha1 = rightArr[0][0]
        let cha2 = rightArr[0][1]
        let cha3 = rightArr[0][2]
        let cha4 = rightArr[1][0]
        let cha5 = rightArr[1][2]
        let cha6 = rightArr[2][0]
        let cha7 = rightArr[2][1]
        let cha8 = rightArr[2][2]
        let center = rightArr[1][1]

        rightArr[0].remove(at: 0)
        rightArr[0].append(cha6)
        rightArr[0].remove(at: 0)
        rightArr[0].append(cha4)
        rightArr[0].remove(at: 0)
        rightArr[0].append(cha1)
        rightArr[1].remove(at: 0)
        rightArr[1].append(cha7)
        rightArr[1].remove(at: 0)
        rightArr[1].append(center)
        rightArr[1].remove(at: 0)
        rightArr[1].append(cha2)
        rightArr[2].remove(at: 0)
        rightArr[2].append(cha8)
        rightArr[2].remove(at: 0)
        rightArr[2].append(cha5)
        rightArr[2].remove(at: 0)
        rightArr[2].append(cha3)
        // 주변면
        let cha9 = upArr[2][2]
        let cha10 = upArr[1][2]
        let cha11 = upArr[0][2]
        let cha12 = backArr[0][0]
        let cha13 = backArr[1][0]
        let cha14 = backArr[2][0]
        let cha15 = downArr[0][2]
        let cha16 = downArr[1][2]
        let cha17 = downArr[2][2]
        let cha18 = frontArr[0][2]
        let cha19 = frontArr[1][2]
        let cha20 = frontArr[2][2]
        
        upArr[0].remove(at: 2)
        upArr[0].append(cha18)
        upArr[1].remove(at: 2)
        upArr[1].append(cha19)
        upArr[2].remove(at: 2)
        upArr[2].append(cha20)
        
        backArr[0].remove(at: 0)
        backArr[0].insert(cha9, at: 0)
        backArr[1].remove(at: 0)
        backArr[1].insert(cha10, at: 0)
        backArr[2].remove(at: 0)
        backArr[2].insert(cha11, at: 0)
        
        downArr[0].remove(at: 2)
        downArr[0].append(cha14)
        downArr[1].remove(at: 2)
        downArr[1].append(cha13)
        downArr[2].remove(at: 2)
        downArr[2].append(cha12)
        
        frontArr[0].remove(at: 2)
        frontArr[0].append(cha15)
        frontArr[1].remove(at: 2)
        frontArr[1].append(cha16)
        frontArr[2].remove(at: 2)
        frontArr[2].append(cha17)
    }
    
    // 뒷면 돌릴 경우: 1.복사, 2.제거, 3.삽입
    mutating func actionBack() {
        // 보이는 면
        let cha1 = backArr[0][0]
        let cha2 = backArr[0][1]
        let cha3 = backArr[0][2]
        let cha4 = backArr[1][0]
        let cha5 = backArr[1][2]
        let cha6 = backArr[2][0]
        let cha7 = backArr[2][1]
        let cha8 = backArr[2][2]
        let center = backArr[1][1]

        backArr[0].remove(at: 0)
        backArr[0].append(cha6)
        backArr[0].remove(at: 0)
        backArr[0].append(cha4)
        backArr[0].remove(at: 0)
        backArr[0].append(cha1)
        backArr[1].remove(at: 0)
        backArr[1].append(cha7)
        backArr[1].remove(at: 0)
        backArr[1].append(center)
        backArr[1].remove(at: 0)
        backArr[1].append(cha2)
        backArr[2].remove(at: 0)
        backArr[2].append(cha8)
        backArr[2].remove(at: 0)
        backArr[2].append(cha5)
        backArr[2].remove(at: 0)
        backArr[2].append(cha3)
        // 주변면
        let cha9 = upArr[0][2]
        let cha10 = upArr[0][1]
        let cha11 = upArr[0][0]
        let cha12 = leftArr[0][0]
        let cha13 = leftArr[1][0]
        let cha14 = leftArr[2][0]
        let cha15 = downArr[2][2]
        let cha16 = downArr[2][1]
        let cha17 = downArr[2][0]
        let cha18 = rightArr[0][2]
        let cha19 = rightArr[1][2]
        let cha20 = rightArr[2][2]
        
        upArr[0].remove(at: 0)
        upArr[0].append(cha18)
        upArr[0].remove(at: 0)
        upArr[0].append(cha19)
        upArr[0].remove(at: 0)
        upArr[0].append(cha20)
        
        leftArr[0].remove(at: 0)
        leftArr[0].insert(cha9, at: 0)
        leftArr[1].remove(at: 0)
        leftArr[1].insert(cha10, at: 0)
        leftArr[2].remove(at: 0)
        leftArr[2].insert(cha11, at: 0)
        
        downArr[2].remove(at: 0)
        downArr[2].append(cha12)
        downArr[2].remove(at: 0)
        downArr[2].append(cha13)
        downArr[2].remove(at: 0)
        downArr[2].append(cha14)
        
        rightArr[0].remove(at: 2)
        rightArr[0].append(cha15)
        rightArr[1].remove(at: 2)
        rightArr[1].append(cha16)
        rightArr[2].remove(at: 2)
        rightArr[2].append(cha17)
    }
}
