//
//  AmiiboDetailViewModel.swift
//  MyMiibos
//
//  Created by Jérôme Figueiredo on 29/06/2021.
//

import Foundation
import Combine
import SwiftUI

class AmiiboDetailViewModel: ObservableObject {
    
    @Published var singleAmiibo = SingleAmiibo.placeholder()
    
    var cancellable: AnyCancellable?
    
    func fetchAmiiboDetail(amiiboHead: String, amiiboTail: String) {
        cancellable = ApiWebservice().getAmiiboById(head: amiiboHead, tail: amiiboTail)
            .catch { _ in Just(SingleAmiibo.placeholder()) }
            .sink(receiveCompletion: { _ in }, receiveValue: { sAmiibo in
                self.singleAmiibo = sAmiibo
            })
    }
}

extension AmiiboDetailViewModel {
    
    var name: String {
        return self.singleAmiibo.amiibo.name
    }
    
    var image: String {
        return self.singleAmiibo.amiibo.image
    }
    
    var gameSeries: String {
        return self.singleAmiibo.amiibo.gameSeries
    }
    
    var amiiboSeries: String {
        return self.singleAmiibo.amiibo.amiiboSeries
    }
    
    var character: String {
        return self.singleAmiibo.amiibo.character
    }
    
    var type: String {
        return self.singleAmiibo.amiibo.type
    }
    
    func loadImage() -> UIImage {
        do {
            guard let url = URL(string: image) else {
                return UIImage()
            }
            let data: Data = try Data(contentsOf: url)
            
            return UIImage(data: data) ?? UIImage()
        } catch {
            
        }
        return UIImage()
    }
}
