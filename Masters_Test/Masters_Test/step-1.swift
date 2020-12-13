//
//  step-1.swift
//  Masters_Test
//
//  Created by sonjuhyeong on 2020/12/08.
//

import Foundation

struct PushWord {
    func makeInput() -> [String] {
        let inputArr = readLine()!.components(separatedBy: " ")
        return inputArr
    }
    
    func moveWord(input: [String]) -> String {
        var wordArr: [String] = String(input[0]).map{String($0)}
        let number: Int = Int(input[1])!
        let direction: String = input[2]
        if number >= -100 && number < 100 {
            if (number > 0 && (direction == "l" || direction == "L")) || (number < 0 && (direction == "r" || direction == "R")) {
                var str: String = ""
                for _ in 0...abs(number) - 1 {
                    str = wordArr[0]
                    wordArr.append(str)
                    wordArr.remove(at: 0)
                }
            }else if (number > 0 && (direction == "r" || direction == "R")) || (number < 0 && (direction == "l" || direction == "L")) {
                var str: String = ""
                for _ in 0...abs(number) - 1 {
                    str = wordArr[input[0].count - 1]
                    wordArr.remove(at: input[0].count - 1)
                    wordArr.insert(str, at: 0)
                }
            }else{
                exit(0)
            }
        }else{
            exit(0)
        }
        return wordArr.joined()
    }
}
