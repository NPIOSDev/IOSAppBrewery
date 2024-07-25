func defaultAge() -> Int{
    return 23
}

let inputAge: String = "90"
var age: Int = Int(inputAge) ?? defaultAge()
print(age)

let inputName: String? = nil
var name: String = inputName ?? "Marry"
print(name)

print(Int.random(in: 0..<2))

for i in Range(1...4){
    print(i)
}

var arr = [12,3,4,5,56]
print(arr.count)


enum MyError: Error {
    case Unknow
    case Error1
    case Error2(code:Int)
}
func throwError() throws -> Int {
    throw MyError.Error1
}

func throwError2() throws -> Int {
    throw MyError.Error2(code: 112)
}

do{
    try throwError()
} catch{
    print("\(error)")
}

var x = try? throwError()
print(x as Any)

var x1 = try? throwError2()
print(x1 as Any)

do {
    try throwError2()
} catch {
    print("\(error)")
}


