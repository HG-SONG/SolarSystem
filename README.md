# SolarSystem


I. 논리의 흐름 
-------------
1) 1단계에서 원을 그리는 기능을 구현한다.
2) 원을 그리는 기능을 이용하여 태양,지구,달 등의 천체를 구현한다. 
3) 달의 공전주기는 1달 , 지구의 공전주기는 1년으로 가정하고, 각 날짜마다의 위치관계를 고려하여 출력하는 기능을 구현한다.
4) 공백으로 채워진 2차원 배열인 backPlane , 공전의 기준이 되는 천체를 담은 2차원 배열 , 공전을 하는 천체를 담은 2차원 배열을 만든다. 
5) backPlane의 중앙에 공전의 기준이 되는 천체를 넣고, 입력된 날짜에 따른 위치에 공전을 하는 천체를 넣는다. 
6) 위치관계가 고려된 [공전의 기준인 천체 + 공전을 하는 천체]가 포함된 plane이 완성된다. 
7) 이 과정을 2회 거친다면 [ 태양 <-> [지구 <-> 달] ] 의 관계를 포함한 커다란 plane이 만들어진다. 
8) backPlane을 공백으로 채워진 2차원 배열 대신, 여러 특수문자가 함께 포함된 2차원 배열을 사용하여 우주공간의 느낌을 "멋지게" 표현한다. 
9) 이후 추가적인 우주적 요소들을 추가하여 완성시킨다. 

II. 사전준비
-----------
날짜에 따른 천체들의 위치관계를 출력하기 위해서는 어떤 날짜에 어떤 위치인지 알 필요가 있다. backPlane에 천체를 끼워넣는 방법을 사용 할 것이므로 , 
2차원배열을 좌표화하여 좌표평면상에서의 위치좌표를 파악해야한다. 중앙에 위치한 천체를 기준으로 각도에 따라 위치를 근사화시킨 좌표를 계산하여 얻어 놓았다. 

* example : 지구와 달의 날짜에 따른 위치관계 ( 공전주기 1달 )

![지구 달 좌표](https://user-images.githubusercontent.com/88966578/206142771-69186554-a528-45d4-a2da-3649e82a264a.jpeg)

이와 같은 방법으로 지구와 태양의 위치관계 좌표역시 미리 계산을 통해 얻어 놓았다. 

III. 구현 
--------
## 1단계 
- inputCircleSize()를 통해 입력을 받고 Int를 return한다. 
- drawCircle(num : inputCircleSize() )을 통해 입력된 size에 해당하는 원을 출력한다. 
- drawCircle()은 원의 Top + Middle + Bottom 의 구성으로 이루어져 있다. 이유는 원의 상부를 완성시키면, 하부는 reversed()로 뒤집으면 될 뿐이므로 이러한 구성을 채택하였다. 
- size가 even일 때, odd일 때의 경우를 if문으로 분할하여 반복문에 넣었다. 반복문을 통과하면 String이 생성되는데 , 이 String에는 "  @@  \n @  @ \n" 와 같은 꼴의 StringStream형태로 값이 저장된다. "\n"를 기준으로 줄바꿈을 해주면 "@"들이 원의 형태를 띠게된다. 
- size가 even일 때는 Middle파트는 필요없지만 odd일때는 Middle파트가 Top과 Bottom 사이에 들어가야한다. 
* 결과화면 : 크기가 6인 원 
<img width="651" alt="크기 6 원" src="https://user-images.githubusercontent.com/88966578/206149586-5be7b070-9797-41d7-b702-f3dea0e9aa7c.png">
(원보다는 타원에 가깝지만... 출력예시에 충실하게 구현하였다.)

* 코드 (아직 깎기전이다... 개선이 절실하지만 일단 풀고보자) 
```swift
import Foundation

class Circle {
    
    func run() {
        let number = inputCircleSize()
        print(drawCircle(num:number))
    }
    
    func inputCircleSize() -> Int{
        print("원의 크기를 입력하세요.")
        guard let number = Int(readLine()!) else { return self.inputCircleSize() }
        return number
    }
    
    func drawCircle( num : Int) -> String{
        let size = num
        var str : String = ""

        for i in 0 ..< size / 2 {
            for j in 0 ..< size/2 - i  {
                if size % 2 == 0 && j == 0{
                    continue
                }
                str += " "
            }
            if size % 2 == 0 {
                for j in 1 ... 2*(i+1)   {
                    if j == 1 || j == 2*(i+1) {
                        str += "@"
                    }
                    else {
                        str += " "
                    }
                }
            }
            if size % 2 != 0 {
                for j in 1 ... size % 2 + 2*i   {
                    if j == 1 || j == size % 2 + 2*i {
                        str += "@"
                    }
                    else {
                        str += " "
                    }
                }
            }
            for j in 0 ..< size/2 - i  {
                if size % 2 == 0 && j == 0{
                    continue
                }
                str += " "
            }
            str += "\n"
        }

        if size % 2 != 0 {
            for i in 1...size {
                if i == 1 || i == size {
                    str += "@"
                }
                else {
                    str += " "
                }
            }
            str += "\n"
        }

        for i in (0 ..< size / 2).reversed() {
            for j in 0 ..< size/2 - i  {
                if size % 2 == 0 && j == 0{
                    continue
                }
                str += " "
            }
            if size % 2 == 0 {
                for j in 1 ... 2*(i+1)   {
                    if j == 1 || j == 2*(i+1) {
                        str += "@"
                    }
                    else {
                        str += " "
                    }
                }
            }
            if size % 2 != 0 {
                for j in 1 ... size % 2 + 2*i   {
                    if j == 1 || j == size % 2 + 2*i {
                        str += "@"
                    }
                    else {
                        str += " "
                    }
                }
            }
            for j in 0 ..< size/2 - i  {
                if size % 2 == 0 && j == 0{
                    continue
                }
                str += " "
            }
            if i != 0 {
                str += "\n"
            }
        }
    return str
    }
}


let test = Circle()
test.run()

```
## 2단계 

## 3단계 
