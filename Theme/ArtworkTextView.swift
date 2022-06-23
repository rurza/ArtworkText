//
//  ArtworkTextView.swift
//  ArtworkText
//
//  Created by Adam on 11/06/2022.
//

import SwiftUI
import NepTunesKit

struct ArtworkTextView: View {
    let track: AnyTrack
    @AppStorage(wrappedValue: TextColor.white, PreferencesKey.textColor.rawValue) var textColor: TextColor

    var body: some View {
        HStack {
            Group {
                if let data = track.artworkData,
                   let nsImage = NSImage(data: data) {
                    Image(nsImage: nsImage)
                        .resizable()
                        .interpolation(.high)
                } else {
                    NepTunes.defaultArtwork
                        .resizable()
                        .interpolation(.high)
                }
            }
            .aspectRatio(1, contentMode: .fill)
            .frame(width: 60, height: 60)
            .clipShape(RoundedRectangle(cornerRadius: 11, style: .continuous))
            .shadow(color: .black.opacity(0.3),
                    radius: 6, x: 0, y: 3)
            .zIndex(2)
            VStack(alignment: .leading) {
                Text(track.title)
                    .fontWeight(.medium)
                    .id(track.title)
                    .transition(
                        .asymmetric(insertion: .slide.combined(with: .opacity).animation(.easeIn(duration: 0.3).delay(0.2)),
                                    removal: .move(edge: .leading).combined(with: .opacity).animation(.easeIn(duration: 0.2)))
                    )
                    .animation(.easeInOut(duration: 0.5), value: track)
                Text(track.artist)
                    .id(track.artist) /// used for animation
                    .foregroundColor(.secondary)
                    .transition(
                        .asymmetric(insertion: .slide.combined(with: .opacity).animation(.easeIn(duration: 0.3).delay(0.2)),
                                    removal: .move(edge: .leading).combined(with: .opacity).animation(.easeIn(duration: 0.2)))
                    )
                    .animation(.easeInOut(duration: 0.5), value: track)
            }
            .shadow(color: .black.opacity(0.2),
                    radius: 3, x: 0, y: 1)
            .environment(\.colorScheme, textColor == .white ? .dark : .light)
            .zIndex(1)
            .fixedSize(horizontal: true, vertical: false)
        }
        .padding()
    }
}

struct ArtworkTextView_Preview: PreviewProvider {
    static var previews: some View {
        ArtworkTextView(
            track: AnyTrack(
                title: "Gravity (feat. Jana Hunter & Lower Dens)",
                artist: "Trentemøller",
                album: "Lost",
                artworkData: NSImage(named: "artwork")!.tiffRepresentation,
                duration: 350
            )
        )
    }
}