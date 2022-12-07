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

