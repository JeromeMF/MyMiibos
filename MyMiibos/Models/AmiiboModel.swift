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
    
    func amiiboSeriesLogo() -> Image {
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
    
    func amiiboSeriesColor() -> Color {
        switch amiiboSeries {
        case "Super Smash Bros.":
            return .greySNES
        case "Super Nintendo World":
            return .purpleSNES
        case "Super Mario Bros.":
            return .redMario
        case "Chibi-Robo":
            return .greyRobo
        case "Yoshi's Woolly World":
            return .greenYoshi
        case "Splatoon":
            return .pinkSplatoon
        case "Animal Crossing":
            return .greenPikmin
        case "8-bit Mario":
            return .redMario
        case "Skylanders":
            return .blueSkylanders
        case "Legend Of Zelda":
            return .greenZelda
        case "Shovel Knight":
            return .blueShovelKnight
        case "Kirby":
            return .pinkKirby
        case "Pokemon":
            return .yellowPokemon
        case "Mario Sports Superstars":
            return .redMario
        case "Monster Hunter":
            return .brownMonster
        case "BoxBoy!":
            return .gray
        case "Pikmin":
            return .greenPikmin
        case "Fire Emblem":
            return .black
        case "Metroid":
            return .orangeMetroid
        case "Others":
            return .gray
        case "Mega Man":
            return .blueMegaMan
        case "Diablo":
            return .redDiablo
        default:
            return .black
        }
    }
}
