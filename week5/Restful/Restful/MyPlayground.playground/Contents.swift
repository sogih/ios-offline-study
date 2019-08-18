import Foundation

struct Person : Codable {
    var name : String
    var age : Int
}

let encoder = JSONEncoder()
encoder.outputFormatting = [.sortedKeys, .prettyPrinted]
let zedd = Person(name: "Zedd", age: 100)
let jsonData = try? encoder.encode(zedd)

var myJsonString: String?

if let jsonData = jsonData, let jsonString = String(data: jsonData, encoding: .utf8){
    print(jsonString)
    myJsonString = jsonString
}

let decoder = JSONDecoder()
var data = myJsonString!.data(using: .utf8)
if let data = data, let myPerson = try? decoder.decode(Person.self, from: data) {
    print(myPerson.name)
    print(myPerson.age)
}
