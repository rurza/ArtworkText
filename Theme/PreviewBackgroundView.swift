//
//  PreviewBackgroundView.swift
//  ArtworkText
//
//  Created by Adam on 17/06/2022.
//

import SwiftUI
import NepTunesKit
import ImageColors

struct PreviewBackgroundView: View {

    @ObservedObject var app: NepTunes
    @State private var colors: ImageColors? = nil


    var body: some View {
        Color(nsColor: colors?.background.nsColor ?? NSColor.systemGray)
            .animation(.default, value: colors?.background.hashValue)
            .task {
                self.colors = await extractBackgroundColor()
            }
            .onChange(of: app.state?.currentTrack?.eraseToAnyTrack()) { _ in
                Task {
                    self.colors = await extractBackgroundColor()
                }
            }
    }

    func extractBackgroundColor() async -> ImageColors? {
        guard let track = app.state?.currentTrack,
              let data = track.artworkData,
              let image = NSImage(data: data),
              let cgImage = image.cgImage(forProposedRect: nil, context: nil, hints: nil) else { return nil }
        return try? await cgImage.extractColors(withQuality: .low)
    }
}
