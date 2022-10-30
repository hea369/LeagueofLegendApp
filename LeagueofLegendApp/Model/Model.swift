//
//  Model.swift
//  LeagueofLegendApp
//
//  Created by 박호현 on 2022/10/29.
//

import Foundation

// MARK: - WelcomeElement
struct WelcomeElement: Codable {
    let championID, championLevel, championPoints, lastPlayTime: Int
    let championPointsSinceLastLevel, championPointsUntilNextLevel: Int
    let chestGranted: Bool
    let tokensEarned: Int
    let summonerID: SummonerID

    enum CodingKeys: String, CodingKey {
        case championID = "championId"
        case championLevel, championPoints, lastPlayTime, championPointsSinceLastLevel, championPointsUntilNextLevel, chestGranted, tokensEarned
        case summonerID = "summonerId"
    }
}

enum SummonerID: String, Codable {
    case b5JrmMGdlL2FTTIFRzFDyHJahMIuxFoZxzIwpTKhqN5DW = "B5JrmMGdlL2FTTIFRzFDy-hJahMIuxFoZxzIwpTKhqN5dw"
}

typealias Welcome = [WelcomeElement]
