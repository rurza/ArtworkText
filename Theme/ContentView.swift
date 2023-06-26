//
//  ContentView.swift
//  ArtworkText
//
//  Created by Adam on 16/06/2022.
//

import SwiftUI
import NepTunesKit

struct ContentView: View {

    @ObservedObject var app: NepTunes

    var body: some View {
        VStack {
            if let track = app.state?.currentTrack {
                ArtworkTextView(track: track, artworkClickAction: app.playPause)
            }
        }
        .frame(height: 92)
    }
}
