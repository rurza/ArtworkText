//
//  PreferencesView.swift
//  ArtworkText
//
//  Created by Adam on 17/06/2022.
//

import SwiftUI

struct PreferencesView: View {

    @AppStorage(wrappedValue: TextColor.white, PreferencesKey.textColor.rawValue) var textColor: TextColor
    @AppStorage(wrappedValue: true, PreferencesKey.textColor.rawValue) var textWithShadow: Bool


    var body: some View {
        Form {
            Picker.init("Text color", selection: $textColor) {
                Text(TextColor.black.name).tag(TextColor.black)
                Text(TextColor.white.name).tag(TextColor.white)
                Divider()
                Text(TextColor.system.name).tag(TextColor.system)
            }
            Toggle(isOn: $textWithShadow) {
                Text("Text with shadow")
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
