# Codesquad_Masters_Test


## 2단계: 평면 큐브 구현하기

~~~swift
// main.swift
// Step-2
var cube = FlatCube()
var action = cube.makeAction()
cube.makeCube(action: action)
~~~

<요구 사항>

- 처음 시작하면 초기 상태를 출력한다.

- 간단한 프롬프트 (CLI에서 키보드 입력받기 전에 표시해주는 간단한 글자들 - 예: CUBE> )를 표시해 준다.

- 한 번에 여러 문자를 입력받은 경우 순서대로 처리해서 매 과정을 화면에 출력한다.

1. makeAction() 함수를 생성, 동작을 입력 받고 배열을 리턴한다.  U', R', L', B' 등 " ' "와 같이 입력되는 동작들은 " ' " 와 영문자가 나눠지므로 제거한 다음, 앞 인덱스의 문자를 변경한다.

~~~swift
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
~~~
2.  makeCube() 함수를 생성, action으로  makeAction()의 리턴 값을 받는다.

3.  평면 큐브 배열의 초기 상태를 만들어 준다.

4.  action 배열을 돌면서 각각 인덱스를 확인하는 for 문을 생성한다.

5.  동작 " U "(가장 윗줄을 왼쪽으로 한 칸 밀기): 이동할 위치 복사,  원하는 위치 삽입, 이동한 위치 제거

    동작 " U' "(가장 윗줄을 오른쪽으로 한 칸 밀기): 이동할 위치 복사, 원하는 위치 삽입, 이동한 위치 제거 

    동작 " R "(가장 오른쪽 줄을 위로 한 칸 밀기):  변수를 3개 사용하여 각각 위치를 복사, 제거, 삽입을 3번 시행

    동작 " R' "(가장 오른쪽 줄을 아래로 한 칸 밀기): 변수를 3개 사용하여 각각 위치를 복사, 제거, 삽입을 3번 시행

    동작 " L "(가장 왼쪽 줄을 아래로 한 칸 밀기): 변수를 3개 사용하여 각각 위치를 복사, 제거, 삽입을 3번 시행

    동작 " L' "(가장 왼쪽 줄을 위로 한 칸 밀기): 변수를 3개 사용하여 각각 위치를 복사, 제거, 삽입을 3번 시행

    동작 " B " (가장 아랫줄을 오른쪽으로 한 칸 밀기): 이동할 위치 복사, 원하는 위치 삽입, 이동한 위치 제거 

    동작 " B' "(가장 아랫줄을 왼쪽으로 한 칸 밀기): 이동할 위치 복사, 원하는 위치 삽입, 이동한 위치 제거 

    동작 " Q "(Bye~를 출력하고 프로그램을 종료한다.)
~~~swift
    func makeCube(action: [String]){
        var cubeArr: [[String]] = [["R","R","W"],["G","C","W"],["G","B","B"]]
        for i in 0...2 {
            for j in 0...2 {
                print(cubeArr[i][j], terminator:" ")
            }
            print()
        }
        print()
        print("CUBE> \(action.joined())")
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
            for i in 0...2 {
                for j in 0...2 {
                    print(cubeArr[i][j], terminator:" ")
                }
                print()
            }
            print()
        }
    }
~~~
