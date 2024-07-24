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
