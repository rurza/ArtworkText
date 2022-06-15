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

    var body: some View {
        HStack {
            if let data = track.artworkData,
               let nsImage = NSImage(data: data) {
                Image(nsImage: nsImage)
                    .resizable()
                    .frame(width: 60, height: 60)
                    .clipShape(RoundedRectangle(cornerRadius: 11, style: .continuous))
                    .shadow(color: .black.opacity(0.2),
                            radius: 6, x: 0, y: 3)
                    .zIndex(2)
            }
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
                    .id(track.artist) /// used for
                    .foregroundColor(.secondary)
                    .transition(
                        .asymmetric(insertion: .slide.combined(with: .opacity).animation(.easeIn(duration: 0.3).delay(0.2)),
                                    removal: .move(edge: .leading).combined(with: .opacity).animation(.easeIn(duration: 0.2)))
                    )
                    .animation(.easeInOut(duration: 0.5), value: track)
            }
            .zIndex(1)
            .fixedSize(horizontal: true, vertical: false)
        }
//        .clipped() /// used to clip the animation
        .padding()
        .environment(\.colorScheme, .dark)
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
