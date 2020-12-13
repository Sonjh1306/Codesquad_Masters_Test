# Codesquad_Masters_Test


## 3단계: 루빅스 큐브 구현하기

### **동작 설명**

1. cubeControl() 함수 실행시 0. 기본동작 , 1. 큐브 맞추기를 선택

2. 기본 동작을 선택시 makeInput()으로 입력을 처리하고 cubeAction()으로 각각 해당 면을 돌릴 경우 동작하게 만들어 둔 6개의 함수를 입력대로 실행하게 된다. 꼬리 재귀를 사용하여 지속적으로 동작하며, 
   큐브를 다시 원위치 시키거나 Q 입력시 종료하게 된다.

3. 큐브 맞추기 선택시 randomInput()으로 무작위 섞기를 할 입력을 랜덤하게 생성하고 radomMixedCube()으로 그 입력을 동작한다. 무작위로 섞인 큐브를 cubeAction() 재귀 사용하여 지속적으로 맞추는게
   가능하게 구현했다. 기본 동작과 마찬가지로 큐브를 다시 원위치 시키거나 Q 입력시 종료하게 된다.


### **함수별 기능 설명**
~~~swift
    func makeInput() -> [String] {
        let inputArr: [String] = String(readLine()!).map{String($0)}
        var filterArr: [String] = []
        var actionArr: [String] = []
        // "'" 를 필터해서 바꿔주는 루프
        for i in 0...inputArr.count - 1  {
            if inputArr[i] == "'" {
                filterArr.removeLast()
                filterArr.append("\(inputArr[i-1])'")
            }else{
                filterArr.append(inputArr[i])
            }
        }
        // 2번 돌리는 입력을 바꿔주는 루프
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
~~~
1. makeInput(): 입력을 처리하는 함수이며, 각각 입력을 쪼개서 배열에 넣어주고 리턴한다. 단, "'" 입력이나 2번 도는 경우를 따로 루프를 사용하여 처리하였다. 

~~~swift
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
        // 꼬리 재귀 사용으로 지속적인 반복을 하게함
        self.cubeAction()
    }
~~~
2. cubeAction(): 입력받은 내용을 동작으로 수행하는 함수이며, 90도 돌리는 경우 , -90도 돌리는 경우 , 180도 돌리는 경우를 조건으로 걸어서 수행한다. 추가적으로 Q 입력 또는 큐브를 맞췄을 경우를 각각 조건을    추가적으로 두었고, 꼬리 재귀를 사용하여 지속적으로 반복하게 끔 하였으나 Q 입력시는 printEndText()를 실행하여 텍스트를 출력하고 종료하고 큐브를 맞췄을 경우는 printCompleteText()를 실행하여 텍스트를 
   출력하고 종료한다.
   
~~~swift
    mutating func cubeControl() {
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
~~~
3. cubeControl(): 각각의 기능을 하게 만든 함수들을 선택한 작동에 맞게 실행하게 하는 함수이다.

~~~swift
    // Q 입력시 결과를 출력하는 함수
    func printEndText() {
        if roofEnd == true {
            print()
            let elapsedTime = Int(CFAbsoluteTimeGetCurrent() - startTime)
            print("경과시간: \(elapsedTime/60)분 \(elapsedTime%60)초")
            print("조작갯수: \(count - 1)")
            print("이용해 주셔서 감사합니다. 뚜뚜뚜.")
            exit(0)
        }
    }
    // 큐브 완성시 결과를 출력하는 함수
    func printCompleteText() {
        if completeSign == true {
            print("축하합니다. 모든 면을 맞추셨습니다.")
            let elapsedTime = Int(CFAbsoluteTimeGetCurrent() - startTime)
            print("경과시간: \(elapsedTime/60)분 \(elapsedTime%60)초")
            print("조작갯수: \(count)")
            print("이용해 주셔서 감사합니다. 뚜뚜뚜.")
            exit(0)
        }
    }
~~~
4. printEndText(),printCompleteText(): Q 입력 또는 큐브를 맞췄을 경우 실행하게 되는 함수이다.

~~~swift
    // 큐브의 상태를 출력하는 함수
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
~~~
5. printCube(): 출력화면에 펼쳐진 큐브의 모양대로 출력하는 함수이다.
6. actionUp(), actionDown(), actionLeft(), actionFront(), actionRight(), actionBack() 는 Step-2를 응용하여 각 면을 돌렸을 경우 보이는 면과 주변 맞닿은 면들을 변경하는 함수이다.

### **추가기능 구현**
**- 프로그램 종료 시 경과 시간 출력**
~~~swift
let startTime = CFAbsoluteTimeGetCurrent()
let elapsedTime = Int(CFAbsoluteTimeGetCurrent() - startTime)
print("경과시간: \(elapsedTime/60)분 \(elapsedTime%60)초")
~~~ 
구현 설명: 프로그램 시작시 바로 startTime으로 현재 시간을 측정하고 Q 입력 또는 큐브를 맞췄을 경우 현재 시간과 startTime의 차이를 elapsedTime에 넣어주었다. 시간의 차이가 Double값 초로 나오기에 Int값          으로 변환한 뒤, 분과 초를 계산하는 방식으로 구현하였다.

**- 큐브의 무작위 섞기 기능**
~~~swift
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
~~~
1. randomInput(): 랜덤하게 입력을 생성하는 함수이다. 1...10까지 랜덤 수를 생성하여 동작하는 수를 정하고 1...24까지 랜덤 수를 생성하여 동작을 고르는 함수이다.

~~~swift
    // 입력받은 랜덤 입력을 섞는 함수
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
        // cubeAction()을 재귀 사용하여 큐브 맞추기를 가능하게 함
        self.cubeAction()
    }
~~~
2. adomMixedCube(): randomInput()에서 생성한 랜덤 입력을 받아 각각의 동작을 하는 함수이며, cubeAction()를 재귀사용하여 지속적으로 동작하게 하였고 Q 입력 또는 큐브 맞추기가 가능하게 구현하였다.

**- 모든 면을 맞추면 축하 메시지와 함께 프로그램을 자동 종료**
~~~swift
    func printCompleteText() {
        if completeSign == true {
            print("축하합니다. 모든 면을 맞추셨습니다.")
            let elapsedTime = Int(CFAbsoluteTimeGetCurrent() - startTime)
            print("경과시간: \(elapsedTime/60)분 \(elapsedTime%60)초")
            print("조작갯수: \(count)")
            print("이용해 주셔서 감사합니다. 뚜뚜뚜.")
            exit(0)
        }
    }
~~~
구현 설명: cubeArr라는 초기 값을 가지고 있는 전역 변수로 만들어주고, 큐브 동작을 하는 cubeAction() 함수 내의 현재 함수 상태와 cubeArr를 비교하여 동일할 경우 printCompleteText() 실행하게 만들어
         큐브를 맞췄을 경우 종료하게 구현하였다.
