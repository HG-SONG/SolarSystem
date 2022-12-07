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

* 요구사항 체크리스트 
- 입력: 1 이상 80 이하의 정수를 콘솔을 통해 입력받는다. (V)
- 출력: 터미널 화면에 해당 크기의 원을 "멋지게" 출력한다. (V) "상당히 멋진 것 같다."
- 컴파일 또는 실행이 가능해야 한다. (V) 
- 자기만의 기준으로 최대한 간결하게 코드를 작성한다. (V) **"나의 기준은 상당히 관대하다."**
- Readme.md에 풀이 과정 및 코드 설명, 실행 결과를 기술하고 코드와 같이 gist에 포함해야 한다 (V) 
- 제출시 gist URL과 revision 번호를 함께 제출한다 (V) **"다만... Gist Push가 안됨... Github repo로 확인해주었으면 합니다." **
- https://gist.github.com/HG-SONG/0c4a7d7985ae52748618e38d4b6e286b (revision : 11번)

## 2단계 
- inputMD()를 통해 x월 y일을 입력받는다.
- stringToIntMD()를 통해 입력받은 x , y 를 분리하여 Int로 타입변환 후 arrayMD[0],arrayMD[1]에 각각 저장.
- angleByDate() , angleByMonth() 에 넘겨주면, 월 / 일에 따른 공전하는 천체의 위치를 좌표화하여 리턴한다. 
- CelestialBody 내부 구조체를 생성하여 태양,지구,달에대한 size 정보와 각각의 천체를 표현하는 2차원 배열을 저장할 shape 프로퍼티를만들어준다. 
- "멋진" 표현을 위해 태양,지구,달의 size는 6,4,2 로 고정. drawCircle()로 Stringstream을 만들어준다. 
- generate2DArray()는 Stringstream을 2차원배열로 좌표평면화 하는 기능을 한다. "\n"을 기준으로 한줄씩 배열에 추가하여 최종적으로 만들어진 2차원배열을 리턴한다. 
- Stringstream형태의 데이터들을 모조리 2차원배열화 하여 태양,지구,달에 대한 shape프로퍼티에 저장한다. 
- bakcplane()을 통해 " " 로 채워진 2차원 배열 backPlane을 생성한다. ( [지구<->달] 의 경우 20*20 , [태양 <-> 지구+달 ] 의 경우 76*76 ) 
- generateEarthPlane()에 20*20의 backPlane , 지구.shape , 달.shape , 달의 공전에 따른 위치좌표 를 넘겨주어 [지구<->달] 의 plane을 생성한다. 

<img width="169" alt="지구와 달 plane" src="https://user-images.githubusercontent.com/88966578/206159394-8df3d9b9-9a91-4bce-a4c8-0e6ef69561ec.png">

- generateSunPlane() 에 76*76의 backPlane , 태양.shape , [지구<->달] 의 plane , 지구의 공전에 따른 위치좌표 를 넘겨주어 [태양 <-> 지구+달 ] 의 plane을 생성한다. 

<img width="690" alt="태양 plane" src="https://user-images.githubusercontent.com/88966578/206159474-d39dbea8-825e-4db0-8560-aabd62cd4d27.png"> 

**( 여기에 [지구<->달] plane을 집어 넣으면 된다. )**
--------------------------------------

* 결과화면 : 1월 1일 / 5월 23일 / 9월 11일

<img width="300" alt="1월 1일" src="https://user-images.githubusercontent.com/88966578/206160454-271c6c1c-5e21-4457-892a-e3826a164e82.png"> <img width="300" alt="5월 23일" src="https://user-images.githubusercontent.com/88966578/206160476-ed987bec-a231-424e-a99a-2ad70d262534.png"> <img width="300" alt="9월 11일" src="https://user-images.githubusercontent.com/88966578/206160491-a92ad982-312d-4a34-8547-e8e0d0a48deb.png">

( 위치좌표가 좀 이상해서 이후에 수정하였다.)
* 코드 

```swift
import Foundation

struct SolarSystem {
    
    struct CelestialBody {
        var size : Int
        var shape : [[String]]
        init(diameter: Int){
            size = diameter
            shape = [[]]
        }
    }
    
    func step1Run() {
        let number = inputCircleSize()
        print(drawCircle(num:number))
    }
    
    func step2Run() {
        var S = CelestialBody(diameter: 6)
        var E = CelestialBody(diameter: 4)
        var M = CelestialBody(diameter: 2)
        let backPlaneEarth = generate2DArray(str: backPlane(width: 20))
        let backPlaneSolarSystem = generate2DArray(str: backPlane(width: 76))
        S.shape = generate2DArray(str: drawCircle(num: S.size))
        E.shape = generate2DArray(str: drawCircle(num: E.size))
        M.shape = generate2DArray(str: drawCircle(num: M.size))
        
        let arrayMD = stringToIntMD(data: inputMD())
        let moonAngle = angleByDate(date: arrayMD[1])
        let earthAngle = angleByMonth(month: arrayMD[0])
        let earthPlane = generateEarthPlane(back: backPlaneEarth, earth: E.shape, moon: M.shape, angle: moonAngle)
        let sunPlane = generateSunPlane(back: backPlaneSolarSystem, sun: S.shape, EPlane: earthPlane, angle: earthAngle)
        
        printPlane(plane: sunPlane, width: 76)
        
    }
    
    func inputCircleSize() -> Int{
        print("원의 크기를 입력하세요.")
        guard let number = Int(readLine()!) else { return self.inputCircleSize() }
        return number
    }
    
    func drawCircle( num : Int) -> String {
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
    
    func generate2DArray (str : String) -> [[String]] {
        let array1D : [String] = str.map{String($0)}
        var array2D : [[String]] = [[]]
        var count = 0
        
        for item in array1D {
            if item == "\n" {
                count += 1
                array2D.append([])
            }
            else {
                array2D[count].append(item)
            }
        }
        return array2D
    }
    
    func inputMD() -> String {
        print("날짜를 입력하세요. 예 : 1월 1일 ")
        guard let MD = readLine() else { return self.inputMD() }
        return MD
    }
    
    func stringToIntMD( data : String ) -> [Int] {
        var arr1 : [String] = data.components(separatedBy: " ")
        let arr2 : [String] = arr1[0].components(separatedBy: "ㅇㅜㅓㄹ")
        arr1 = arr1[1].components(separatedBy: "ㅇㅣㄹ")
        var resultArray : [Int] = []
        resultArray.append(Int(arr2[0])!)
        resultArray.append(Int(arr1[0])!)
        return resultArray
    }
    
    func angleByDate ( date : Int) -> [Int] {
        switch date {
        case 1,2,3 : return [9,13] ; case 4,5 : return [11,12] ; case 6,7,8 : return [13,10]
        case 9,10,11 : return [15,9] ; case 12,13 : return [13,7]
        case 14,15,16 : return [11,5] ; case 17,18 : return [9,3]
        case 19,20,21 : return [7,5] ; case 22,23 : return [5,7]
        case 24,25,26 : return [3,9] ; case 27,28 : return [5,10]
        case 29,30,31 : return [7,12]
        default:
            break
        }
        return [0,0]
    }
    
    func angleByMonth ( month : Int) -> [Int] {
        switch month {
        case 1 : return [35,56] ; case 2 : return [41,49] ; case 3 : return [49,41]
        case 4 : return [56,35] ; case 5 : return [49,23] ; case 6 : return [41,12]
        case 7 : return [35,0] ; case 8 : return [23,12] ; case 9 : return [12,23]
        case 10 : return [0,35] ; case 11 : return [12,42] ; case 12 : return [12,42]
        default:
            break
        }
        return [0,0]
    }
    
    func backPlane ( width : Int) -> String {
        var str : String = ""
        for _ in 1...width {
            for _ in 1...width{
                str += " "
            }
                str += "\n"
        }
        return str
    }
    
    
    func generateEarthPlane (back : [[String]], earth : [[String]], moon : [[String]], angle : [Int]) -> [[String]] {
        var earthPlane : [[String]] = back
        
        for i in 0...3 {
            for j in 0...3{
                earthPlane[8+i][8+j] = earth[i][j]
            }
        }
        for i in 0...1 {
            for j in 0...1{
                earthPlane[angle[0]+i][angle[1]+j] = moon[i][j]
            }
        }
        return earthPlane
    }
    
    func generateSunPlane (back : [[String]], sun : [[String]], EPlane: [[String]], angle : [Int]) -> [[String]] {
        var sunPlane : [[String]] = back
        
        for i in 0...5 {
            for j in 0...5{
                sunPlane[35+i][35+j] = sun[i][j]
            }
        }
        for i in 0...19 {
            for j in 0...19{
                sunPlane[angle[0]+i][angle[1]+j] = EPlane[i][j]
            }
        }
        return sunPlane
    }
    
    func printPlane (plane : [[String]] , width : Int) {
        for i in 0 ..< width{
            for j in 0 ..< width {
                print(plane[i][j],terminator: "")
            }
            print("")
        }
    }
}


let test = SolarSystem()
//test.step1Run()
test.step2Run()

```

* 요구사항 체크리스트 
- 프로그램을 실행하면 1월 1일부터 12월 31일까지 날짜를 입력받는다. (V) "32일도 입력가능하지만...요구사항은 맞췄다..."
- 해당 날짜에 태양 지구 달의 상대적인 위치를 콘솔에 "멋지게" 출력한다. (V)
- 단 1월 1일에 태양 - 지구 - 달은 순서대로 일직선상에 위치한다고 가정한다. (V)
- 문제의 단순화를 위해 태양 지구 달은 같은 평면상에서 공전하며, 공전궤도는 완전한 원이라고 가정한다. (V)
- 너무 크지 않은 함수 단위로 구현하고 중복된 코드를 줄이도록 노력한다. (V?)
- 마찬가지로 Readme.md 파일과 작성한 소스 코드를 모두 기존 secret gist에 올려야 한다. (V)
- 전역변수의 사용을 자제한다. (V)
- 객체 또는 배열을 적절히 활용한다 (V)
- https://gist.github.com/HG-SONG/0c4a7d7985ae52748618e38d4b6e286b (revision : 12번)

## 3단계 

- 입력 포맷을 ooo년 xx월 yy일 으로 변경. IntputYMD() , stringToIntYMD() 추가 
- 하지만 ooo년은 어디다 쓰는걸까. 공전,자전 궤도와 축에 영향을 끼치는 요소인데 ... 100년 1월1일과 2000년 1월1일의 위치관계는 동일하다고 가정하고 ooo년의 정보는 쓰지않겠다. 
- 우주공간의 느낌을 살리기 위해 공백으로 채워진 backPlane 대신 특수문자와 공백으로 채워진 backPlane을 만든다. 
- backPlane에 랜덤하게 공백 or 특수문자 를 뿌린뒤, 천체들을 넣어주는 방법을 사용한다. 

* 결과화면 : ???년 3월 1일 / ???년 9월 27일 

<img width="300" alt="완성 3 1" src="https://user-images.githubusercontent.com/88966578/206165334-a57b0c13-7304-4290-bc93-11aa3a9c64aa.png"> <img width="300" alt="완성? 9 27" src="https://user-images.githubusercontent.com/88966578/206165424-402ee67f-5080-4a51-9a78-a9ab4fef9248.png">

* 전체코드 

```swift
import Foundation

struct SolarSystem {
    
    struct CelestialBody {
        var size : Int
        var shape : [[String]]
        init(diameter: Int){
            size = diameter
            shape = [[]]
        }
    }
    
    func step1Run() {
        let number = inputCircleSize()
        print(drawCircle(num:number))
    }

    func step23Run() {
        var S = CelestialBody(diameter: 6)
        var E = CelestialBody(diameter: 4)
        var M = CelestialBody(diameter: 2)
        let backPlaneEarth = generate2DArray(str: backPlane(width: 20))
        let backPlaneSolarSystem = generate2DArray(str: backPlane(width: 76))
        S.shape = generate2DArray(str: drawCircle(num: S.size))
        E.shape = generate2DArray(str: drawCircle(num: E.size))
        M.shape = generate2DArray(str: drawCircle(num: M.size))
        
        
        let arrayMD = stringToIntYMD(data: inputYMD())
        let moonAngle = angleByDate(date: arrayMD[1])
        let earthAngle = angleByMonth(month: arrayMD[0])
        let earthPlane = generateEarthPlane(back: backPlaneEarth, earth: E.shape, moon: M.shape, angle: moonAngle)
        let sunPlane = generateSunPlane(back: backPlaneSolarSystem, sun: S.shape, EPlane: earthPlane, angle: earthAngle)
        
        printPlane(plane: sunPlane, width: 76)
    }
    
    func inputCircleSize() -> Int{
        print("원의 크기를 입력하세요.")
        guard let number = Int(readLine()!) else { return self.inputCircleSize() }
        return number
    }
    
    func drawCircle( num : Int) -> String {
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
    
    func generate2DArray (str : String) -> [[String]] {
        let array1D : [String] = str.map{String($0)}
        var array2D : [[String]] = [[]]
        var count = 0
        
        for item in array1D {
            if item == "\n" {
                count += 1
                array2D.append([])
            }
            else {
                array2D[count].append(item)
            }
        }
        return array2D
    }
    
    func inputMD() -> String {
        print("날짜를 입력하세요. 예 : 1월 1일 ")
        print("! 주의 : 한번에 정확하게 입력해야함. 오타정정시 재실행 요망 ")
        guard let MD = readLine() else { return self.inputMD() }
        return MD
    }
    
    func inputYMD() -> String {
        print("날짜를 입력하세요. 예 : 2022년 1월 1일 ")
        print("! 주의 : 한번에 정확하게 입력해야함. 오타정정시 재실행 요망 ")
        guard let MD = readLine() else { return self.inputYMD() }
        return MD
    }
    
    func stringToIntMD( data : String ) -> [Int] {
        var arr1 : [String] = data.components(separatedBy: " ")
        let arr2 : [String] = arr1[0].components(separatedBy: "ㅇㅜㅓㄹ")
        arr1 = arr1[1].components(separatedBy: "ㅇㅣㄹ")
        var resultArray : [Int] = []
        resultArray.append(Int(arr2[0])!)
        resultArray.append(Int(arr1[0])!)
        return resultArray
    }
    
    func stringToIntYMD( data : String ) -> [Int] {
        let arr1 : [String] = data.components(separatedBy: "ㄴㅕㄴ ")
        let resultArray = stringToIntMD(data: arr1[1])
        return resultArray
    }
    
    func angleByDate ( date : Int) -> [Int] {
        switch date {
        case 1,2,3 : return [9,15] ; case 4,5 : return [12,14] ; case 6,7,8 : return [14,12]
        case 9,10,11 : return [15,9] ; case 12,13 : return [14,6]
        case 14,15,16 : return [12,4] ; case 17,18 : return [9,3]
        case 19,20,21 : return [6,4] ; case 22,23 : return [4,6]
        case 24,25,26 : return [3,9] ; case 27,28 : return [4,12]
        case 29,30,31 : return [6,14]
        default:
            break
        }
        return [0,0]
    }
    
    func angleByMonth ( month : Int) -> [Int] {
        switch month {
        case 1 : return [28,56] ; case 2 : return [37,49] ; case 3 : return [47,37]
        case 4 : return [56,28] ; case 5 : return [47,19] ; case 6 : return [37,9]
        case 7 : return [28,0] ; case 8 : return [19,9] ; case 9 : return [9,19]
        case 10 : return [0,28] ; case 11 : return [9,37] ; case 12 : return [19,47]
        default:
            break
        }
        return [0,0]
    }
    
    func backPlane ( width : Int) -> String {
        var str : String = ""
        let specialCharacters = "✧ *̣̩ ☽ ⋆ ✿ . * ･ . · ´ ¸ . · * ´ ¨ ) ¸ . · * ¨ ) "
        var specialCharactersArray : [String] = specialCharacters.components(separatedBy: " ")
        for _ in 0...399{
            specialCharactersArray.append(" ")
        }

        for _ in 1...width {
            for _ in 1...width{
                str += specialCharactersArray[Int.random(in: 0 ... 423)]
            }
                str += "\n"
        }
        return str
    }
    
    
    func generateEarthPlane (back : [[String]], earth : [[String]], moon : [[String]], angle : [Int]) -> [[String]] {
        var earthPlane : [[String]] = back
        
        for i in 0...3 {
            for j in 0...3{
                earthPlane[8+i][8+j] = earth[i][j]
            }
        }
        for i in 0...1 {
            for j in 0...1{
                earthPlane[angle[0]+i][angle[1]+j] = moon[i][j]
            }
        }
        return earthPlane
    }
    
    func generateSunPlane (back : [[String]], sun : [[String]], EPlane: [[String]], angle : [Int]) -> [[String]] {
        var sunPlane : [[String]] = back
        
        for i in 0...5 {
            for j in 0...5{
                sunPlane[35+i][35+j] = sun[i][j]
            }
        }
        for i in 0...19 {
            for j in 0...19{
                sunPlane[angle[0]+i][angle[1]+j] = EPlane[i][j]
            }
        }
        return sunPlane
    }
    
    func printPlane (plane : [[String]] , width : Int) {
        for i in 0 ..< width{
            for j in 0 ..< width {
                print(plane[i][j],terminator: "")
            }
            print("")
        }
    }
}


let test = SolarSystem()
//test.step1Run()

test.step23Run()
```

* 요구사항 체크리스트

- 1년 1월 1일부터 9999년 12월 31일까지 임의의 날짜를 입력받는다. (V)
- 해당날짜의 태양과 행성의 모습을 "멋지게" 콘솔에 출력한다. (V)
- 옵션: 부가적인 태양계의 객체를 자유롭게 추가 출력해도 무방하다. (예: 달, 기타 위성, 혜성 등) (V) " 멀리서 봤다. "
- 가능한 한 커밋을 자주 하고 구현의 의미가 명확하게 전달되도록 커밋 메시지를 작성한다 (V) "커밋 히스토리는... github으로 봐주시길 바랍니다..."
- 함수나 메소드는 한 번에 한 가지 일을 하고 가능하면 20줄이 넘지 않도록 구현한다 (V?) 
- 함수나 메소드의 들여쓰기를 가능하면 적게(3단계까지만) 할 수 있도록 노력한다 (V?)
- https://gist.github.com/HG-SONG/0c4a7d7985ae52748618e38d4b6e286b (revision : 14번)

github repository URL : 

