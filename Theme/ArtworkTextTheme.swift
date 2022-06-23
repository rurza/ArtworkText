//
//  ArtworkTextTheme.swift
//  ArtworkText
//
//  Created by Adam on 11/06/2022.
//

import SwiftUI
import NepTunesKit

final class ArtworkTextTheme: Theme {

    override var info: ThemeInfo {
        ThemeInfo(
            name: "Artwork Text",
            version: 2,
            identifier: "software.micropixels.ArtworkText",
            author: "Adam Różyński",
            iconFileURL: Bundle(for: Self.self).urlForImageResource("icon")!
        )
    }

    override func themePreview() -> AnyView {
        AnyView(PreviewView(app: self.app))
    }

    override func themeWindow() -> ThemeWindow {
        let window = super.themeWindow()
        window.contentView = NSHostingView(rootView: ContentView(app: self.app))
        return window
    }

    override func preferencesView() -> AnyView? {
        AnyView(PreferencesView())
    }

    override func previewBackgroundView() -> AnyView {
        AnyView(PreviewBackgroundView(app: app))
    }

}
