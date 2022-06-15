//
//  PreviewView.swift
//  ArtworkText
//
//  Created by Adam on 16/06/2022.
//

import SwiftUI
import NepTunesKit

struct PreviewView: View {

    @ObservedObject var app: NepTunes

    var body: some View {
        ArtworkTextView(track: app.state?.currentTrack ?? ArtworkTextTheme.previewTrack)
    }
}
