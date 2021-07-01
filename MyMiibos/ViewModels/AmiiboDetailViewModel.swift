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
    
    var color: Color {
        return self.singleAmiibo.amiibo.getAmiiboSeriesColor()
    }
    
    var logo: Image {
        return self.singleAmiibo.amiibo.getAmiiboSeriesLogo()
    }
    
    func getSeriesLogo() -> Image {
        switch amiiboSeries {
        case "Super Smash Bros.":
            return Image("smash")
        case "Super Nintendo World":
            return Image("gameboy")
        case "Super Mario Bros.":
            return Image("mushroom")
        case "Chibi-Robo":
            return Image("switch")
        case "Yoshi's Woolly World":
            return Image("mushroom")
        case "Splatoon":
            return Image("ghost")
        case "Animal Crossing":
            return Image("tea")
        case "8-bit Mario":
            return Image("brickwall")
        case "Skylanders":
            return Image("sun")
        case "Legend Of Zelda":
            return Image("zelda")
        case "Shovel Knight":
            return Image("sword")
        case "Kirby":
            return Image("kirby")
        case "Pokemon":
            return Image("pokeball")
        case "Mario Sports Superstars":
            return Image("trophy")
        case "Monster Hunter":
            return Image("mask")
        case "BoxBoy!":
            return Image("switch")
        case "Pikmin":
            return Image("leaf")
        case "Fire Emblem":
            return Image("sword")
        case "Metroid":
            return Image("aim")
        case "Others":
            return Image("switch")
        case "Mega Man":
            return Image("aim")
        case "Diablo":
            return Image("sword")
        default:
            return Image("switch")
        }
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
