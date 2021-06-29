//
//  ApiService.swift
//  MyMiibos
//
//  Created by Jérôme Figueiredo on 25/06/2021.
//

import Foundation
import Combine

class ApiWebservice {
    
    func getAllAmiibos() -> AnyPublisher<AmiiboList, Error> {
        
        guard let url = URL(string: "https://amiiboapi.com/api/amiibo/") else { //https://amiiboapi.com/api/amiibo/?id=01010000000e0002
            fatalError("Invalid URL")
        }

        let publisher = URLSession.shared.dataTaskPublisher(for: url)
            .receive(on: RunLoop.main)
            .map(\.data)
            .decode(type: AmiiboList.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
        
        return publisher
    }
    
    func getAmiiboById(head: String, tail: String) -> AnyPublisher<SingleAmiibo, Error> {
        
        guard let url = URL(string: "https://amiiboapi.com/api/amiibo/?id=\(head)\(tail)") else {
            fatalError("Invalid URL")
        }
        
        let publisher = URLSession.shared.dataTaskPublisher(for: url)
            .receive(on: RunLoop.main)
            .map(\.data)
            .decode(type: SingleAmiibo.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
        
        return publisher
    }
}
