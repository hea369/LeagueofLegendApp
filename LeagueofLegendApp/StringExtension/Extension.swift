//
//  Extension.swift
//  LeagueofLegendApp
//
//  Created by 박호현 on 2022/10/31.
//

import Foundation

extension String {
    func translate() -> String {
        if self == "Fighter" {
            return "전사"
        } else if self == "Tank" {
            return "탱커"
        } else if self == "Mage" {
            return "마법사"
        } else if self == "Assassin" {
            return "암살자"
        } else if self == "Support" {
            return "서폿터"
        } else if self == "Marksman" {
                return "원거리"
        } else {
            return ""
        }
    }
}
