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
