//
//  HttpViewModel.swift
//  AppColection
//
//  Created by Danilo Osorio on 2/07/25.
//

import Foundation

@Observable
final class HttpViewModel {
    
    func executeApi(){
        let urlSession = URLSession.shared
        let url = URL(string: "https://itunes.apple.com/search/media=music&identity=song&term=avicii")
        
        urlSession.dataTask(with: url!) { (data, response, error) in
            print("✅ Data \(String(describing: data))")
            print("📦 Response \(String(describing: response))")
            if let data = data {
                let json = try? JSONSerialization.jsonObject(with: data)
                print(String(describing: json))
            }
            print("❌ Error \(String(describing: error))")
        }.resume()
    }
    
    func testDecodable(){
        let data = """
        {
            "identifier":"1234456",
            "user": {
                    "name":"Danilo",
                    "age": 30
                    },
            "job": {
                    "name": "Software Enginer",
                    "description": "swift developmet, Kotlin, Java, React, etc"
                    }
        }
        """.data(using: .utf8)!
        
        let curriculumn = try? JSONDecoder().decode(Curriculum.self, from: data)
        print("\(curriculumn?.user.name ?? "") - \(curriculumn!.job.name)")
    }
    
    func testDecodableCodingKeys(){
        let data = """
            { "name_of_user":"danilo",
            "age":30
            }
    """.data(using: .utf8)
        let user = try? JSONDecoder().decode(UserWithCodingKeys.self, from: data!)
    }
    
    func nestedCointainer(){
        let data =  """
            { "name_of_user": "Danilo",
            "age":30,
            "addres":{
                "city":"medellin",
                "zip":"124",
                "street":"calller 01"
            }
            }
            """.data(using: .utf8)
        
        let nestedCointainer = try? JSONDecoder().decode(NestedCointainer.self, from: data!)
        print("\(nestedCointainer?.city ?? "nil")" )
    }
    
}

struct NestedCointainer: Decodable {
    let name:String
    let age:Int
    let city:String
    
    enum CodingKeys: String, CodingKey {
        case name
        case age
        case city
        case address
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        name = try container.decode(String.self, forKey: .name)
        age = try container.decode(Int.self, forKey: .age)
        
        let address = try container.nestedContainer(keyedBy: CodingKeys.self, forKey: .address)
        city = try address.decode(String.self, forKey: .city)
    }
}

struct UserWithCodingKeys: Decodable {
    let name:String
    let city: String?
    let age:Int
    
    enum CodingKeys: String, CodingKey {
        case name = "name_of_user"
        case city
        case age
    }
}

struct User: Decodable {
    let name:String
    let age:Int
}

struct Job: Decodable {
    let name:String
    let description:String
}

struct Curriculum: Decodable {
    let identifier:String
    let user: User
    let job:Job
}
