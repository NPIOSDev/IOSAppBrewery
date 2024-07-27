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


func loveCalculator() {
    let loveScore = Int.random(in: 0...100)
    print("\(loveScore)")
    switch loveScore {
    case 81...100:
        print("You love each other")
    case 41..<81:
        print("you go together")
    case ...40:
        print("you will be loved forever")
    default:
        print("Error lovescore is out of range")
    }
    
}

loveCalculator()

var ageMapping:Dictionary<String, Int> = [
    "John": 12
]
print(ageMapping)
ageMapping["Marry"] = 65
print(ageMapping)
ageMapping["Marry"] = 33
print(ageMapping)
for k in ageMapping.keys{
    print("\(k) is age \(ageMapping[k]!)")
}
print(ageMapping["A"] ?? "unknow")
for v in ageMapping.values{
    print(v)
}
for (k, v) in ageMapping{
    print(k, v)
}
