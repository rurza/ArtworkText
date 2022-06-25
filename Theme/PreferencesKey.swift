//
//  PreferencesKey.swift
//  ArtworkText
//
//  Created by Adam on 17/06/2022.
//

import Foundation

enum PreferencesKey: String {
    case textColor
    case textWithShadow

    var key: String {
        "software.micropixels.ArtworkText." + self.rawValue
    }
}

enum TextColor: String, CaseIterable {
    case white
    case black
    case system

    var name: String {
        self.rawValue.capitalized
    }
}
