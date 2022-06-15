//
//  ContentView.swift
//  ArtworkTextPreview
//
//  Created by Adam on 11/06/2022.
//

import SwiftUI
import NepTunesKit

struct ContentView: View {
    var body: some View {
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

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
