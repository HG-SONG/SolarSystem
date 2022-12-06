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

