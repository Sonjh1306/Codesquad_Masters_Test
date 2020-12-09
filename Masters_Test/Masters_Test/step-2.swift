//
//  step-2.swift
//  Masters_Test
//
//  Created by sonjuhyeong on 2020/12/08.
//

import Foundation

struct FlatCube {
    
    func makeAction() -> [String] {
        let inputArr: [String] = String(readLine()!).map{String($0)}
        var actionArr: [String] = []
        for i in 0...inputArr.count - 1  {
            if inputArr[i] == "'" {
                actionArr.remove(at: i - 1)
                actionArr.append("\(inputArr[i-1])'")
                
            }else{
                actionArr.append(inputArr[i])
            }
        }
        return actionArr
    }
    
    func makeCube(action: [String]){
        var cubeArr: [[String]] = [["R","R","W"],["G","C","W"],["G","B","B"]]
        
        print(cubeArr)
        print()
        print("CUBE> \(action)")
        print()
        
        for index in action {
            var str1: String = ""
            var str2: String = ""
            var str3: String = ""
            if index == "U" {
                str1 = cubeArr[0][0]
                cubeArr[0].insert(str1, at: 3)
                cubeArr[0].remove(at: 0)
            }else if index == "U'"{
                str1 = cubeArr[0][2]
                cubeArr[0].insert(str1, at: 0)
                cubeArr[0].remove(at: 3)
            }else if index == "R"{
                str1 = cubeArr[0][2]
                str2 = cubeArr[1][2]
                str3 = cubeArr[2][2]
                cubeArr[0].remove(at: 2)
                cubeArr[0].insert(str2, at: 2)
                cubeArr[1].remove(at: 2)
                cubeArr[1].insert(str3, at: 2)
                cubeArr[2].remove(at: 2)
                cubeArr[2].insert(str1, at: 2)
            }else if index == "R'"{
                str1 = cubeArr[0][2]
                str2 = cubeArr[1][2]
                str3 = cubeArr[2][2]
                cubeArr[0].remove(at: 2)
                cubeArr[0].insert(str3, at: 2)
                cubeArr[1].remove(at: 2)
                cubeArr[1].insert(str1, at: 2)
                cubeArr[2].remove(at: 2)
                cubeArr[2].insert(str2, at: 2)
            }else if index == "L"{
                str1 = cubeArr[0][0]
                str2 = cubeArr[1][0]
                str3 = cubeArr[2][0]
                cubeArr[0].remove(at: 0)
                cubeArr[0].insert(str3, at: 0)
                cubeArr[1].remove(at: 0)
                cubeArr[1].insert(str1, at: 0)
                cubeArr[2].remove(at: 0)
                cubeArr[2].insert(str2, at: 0)
            }else if index == "L'"{
                str1 = cubeArr[0][0]
                str2 = cubeArr[1][0]
                str3 = cubeArr[2][0]
                cubeArr[0].remove(at: 0)
                cubeArr[0].insert(str2, at: 0)
                cubeArr[1].remove(at: 0)
                cubeArr[1].insert(str3, at: 0)
                cubeArr[2].remove(at: 0)
                cubeArr[2].insert(str1, at: 0)
            }else if index == "B"{
                str1 = cubeArr[2][2]
                cubeArr[2].insert(str1, at: 0)
                cubeArr[2].remove(at: 3)
            }else if index == "B'"{
                str1 = cubeArr[2][0]
                cubeArr[2].insert(str1, at: 3)
                cubeArr[2].remove(at: 0)
            }else if index == "Q"{
                print("Bye~")
                exit(0)
            }
            print(index)
            print(cubeArr)
            print()
        }
    }
}
