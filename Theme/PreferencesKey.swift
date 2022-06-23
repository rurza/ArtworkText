//
//  PreferencesKey.swift
//  ArtworkText
//
//  Created by Adam on 17/06/2022.
//

import Foundation

enum PreferencesKey: String {
    case textColor

    var key: String {
        "software.micropixels.ArtworkText." + self.rawValue
    }
}

enum TextColor: String, CaseIterable {
    case white
    case black

    var name: String {
        self.rawValue.capitalized
    }
}
