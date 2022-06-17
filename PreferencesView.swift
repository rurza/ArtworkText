//
//  PreferencesView.swift
//  ArtworkText
//
//  Created by Adam on 17/06/2022.
//

import SwiftUI

struct PreferencesView: View {

    @AppStorage(wrappedValue: TextColor.white, PreferencesKey.textColor.rawValue) var textColor: TextColor

    var body: some View {
        Form {
            Picker.init("Text color", selection: $textColor) {
                ForEach(TextColor.allCases, id: \.self) { color in
                    Text(color.name)
                }
            }
        }
        .frame(width: 200)
        .padding()
    }
}

struct PreferencesView_Previews: PreviewProvider {
    static var previews: some View {
        PreferencesView()
    }
}
