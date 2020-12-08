# Codesquad_Masters_Test


## 1단계: 단어 밀어내기 구현하기

~~~swift
// main.swift
// Step-1
var word = PushWord()
var input = word.makeInput()
print(word.moveWord(input: input))
~~~
<요구 사항>

- 입력: 사용자로부터 단어 하나, 정수 숫자 하나( -100 <= N < 100) , L 또는 R을 입력받는다. L 또는 R은 대소문자 모두 입력 가능하다.

- 주어진 단어를 L이면 주어진 숫자 갯수만큼 왼쪽으로, R이면 오른쪽으로 밀어낸다.

- 밀려나간 단어는 반대쪽으로 채워진다.

1. makeInput() 함수를 생성, readLine()으로 받은 입력 값 배열 생성 후 리턴한다.

~~~swift
    func makeInput() -> [String] {
        let inputArr = readLine()!.components(separatedBy: " ")
        return inputArr
    }
~~~

2. makeInput() 리턴 값을 파라미터로 받는 moveWord() 함수를 생성, 각각 단어, 횟수 , 방향 변수에 값을 넣어준다.

3. if 문을 생성 , 횟수의 범위를 지정하고 벗어날 시 강제 종료 한다. 중첩 if 문을 통하여 (양수 && 왼쪽 || 음수 && 오른쪽) 과 (양수&& 오른쪽 || 음수 && 왼쪽) 의 각각 동작을 구분하고 그 외에 입력을 받을 시 강제 종료 한다.

4. (양수 && 왼쪽 || 음수 && 오른쪽)의 동작은 str 변수에 단어의 맨 앞을 넣어주고 그 값을 배열 맨 뒤에 넣는다.그리고 맨 앞의 인덱스를 제거한다. (양수&& 오른쪽 || 음수 && 왼쪽) 동작은 str 변수에 단어의 맨 끝을 넣어주고배열의 마지막 인덱스를 제거한 후 맨 처음 인덱스로 넣어준다.

5. joined()를 통하여 이동된 배열의 각 요소들을 합친 후 String으로 리턴한다.

~~~swift
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
~~~
