//
//  ThemePicker.swift
//  Scrumdinger
//
//  Created by Jerico Radin on 4/6/22.
//

import SwiftUI

struct ThemePicker: View {
    
    @Binding var selection: Theme
    
    var body: some View {
        Picker("Theme", selection: $selection) {
            ForEach(Theme.allCases) { theme in
                ThemeView(theme: theme)
                    .tag(theme) // subviews (here is showing the paint palette)
            }
        }
    }
}

struct ThemePicker_Previews: PreviewProvider {
    static var previews: some View {
        ThemePicker(selection: .constant(.indigo)) // When declaring a @Binding variable, you have to initialize it first so that it can preview it. While for @State, I don't think so
    }
}
