//
//  AmiiboModel.swift
//  MyMiibos
//
//  Created by Jérôme Figueiredo on 25/06/2021.
//

import Foundation
import SwiftUI

// MARK: - Amiibos List
struct AmiiboList: Codable {
    let amiibo: [Amiibo]
}

struct SingleAmiibo: Codable {
    let amiibo: Amiibo
}

// MARK: - Amiibo
struct Amiibo: Codable {
    let amiiboSeries: String
    let character: String
    let gameSeries: String
    let head: String
    let image: String
    let name: String
    //    let release: Release
    let tail: String
    let type: String
}

// MARK: - Release
struct Release: Codable, Hashable  {
    let au : String?
    let eu : String?
    let jp : String?
    let na : String?
}

extension SingleAmiibo {
    
    static func placeholder() -> SingleAmiibo {
        return SingleAmiibo(amiibo: Amiibo(amiiboSeries: "N/A", character: "N/A", gameSeries: "N/A", head: "", image: "", name: "Loading...", tail: "", type: "N/A"))
    }
}

extension Amiibo {
    
    func getAmiiboSeriesLogo() -> Image {
        print(amiiboSeries)
        
        switch amiiboSeries {
        case "Super Smash Bros.":
            return Image("smash")
        case "Super Nintendo World":
            return Image("brickwall")
        case "Super Mario Bros.":
            return Image("mushroom")
        case "Chibi-Robo":
            return Image("switch")
        case "Yoshi's Woolly World":
            return Image("mushroom")
        case "Splatoon":
            return Image("ghost")
        case "Animal Crossing":
            return Image("leaf")
        case "8 - Bit Mario":
            return Image("mushroom")
        case "Skylanders":
            return Image("trophy")
        case "Legend Of Zelda":
            return Image("zelda")
        case "Shovel Knight":
            return Image("sword")
        case "Kirby":
            return Image("kirby")
        case "Pokemon":
            return Image("pokeball")
        case "Mario Sports Superstars":
            return Image("mushroom")
        case "Monster Hunter":
            return Image("sword")
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
    
    func getAmiiboSeriesColor() -> Image {
        print(amiiboSeries)
        
        switch amiiboSeries {
        case "Super Smash Bros.":
            return Image("smash")
        case "Super Nintendo World":
            return Image("brickwall")
        case "Super Mario Bros.":
            return Image("mushroom")
        case "Chibi-Robo":
            return Image("switch")
        case "Yoshi's Woolly World":
            return Image("mushroom")
        case "Splatoon":
            return Image("ghost")
        case "Animal Crossing":
            return Image("leaf")
        case "8 - Bit Mario":
            return Image("mushroom")
        case "Skylanders":
            return Image("trophy")
        case "Legend Of Zelda":
            return Image("zelda")
        case "Shovel Knight":
            return Image("sword")
        case "Kirby":
            return Image("kirby")
        case "Pokemon":
            return Image("pokeball")
        case "Mario Sports Superstars":
            return Image("mushroom")
        case "Monster Hunter":
            return Image("sword")
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
}
