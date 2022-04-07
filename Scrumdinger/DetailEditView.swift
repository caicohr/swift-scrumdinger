//
//  DetailEditView.swift
//  Scrumdinger
//
//  Created by Jerico Radin on 4/1/22.
//

import SwiftUI

struct DetailEditView: View {
    @State private var data = DailyScrum.Data() // State declaration that is private only on this view
    @State private var newAttendeeName = ""
    
    
    var body: some View {
        Form {
            Section(header: Text("Meeting Info")) {
                TextField("Title", text: $data.title)
                HStack {
                    Slider(value: $data.lengthInMinutes, in: 5...30, step: 1) {// step: 1 is restricting users only to use whole number (steps they only can choose from
                        Text("Length")
                    }
                    .accessibilityValue("\(Int(data.lengthInMinutes)) minutes")
                    Spacer()
                    Text("\(Int(data.lengthInMinutes)) minutes") // what's the difference between the ones with $ sign? (It is the binding sa nya)
                        .accessibilityHidden(true) // not needed because you already added one on top
                }
                ThemePicker(selection: $data.theme)
            }
            Section(header: Text("Attendees")) {
                ForEach(data.attendees) { attendee in
                    Text(attendee.name)
                }
                .onDelete { indices in // this is the time when you delete a list (THE ACTION to delete)
                    data.attendees.remove(atOffsets: indices) // this is how you delete an item in a list
                }
                HStack {
                    TextField("New Attendee", text: $newAttendeeName) // Got it. This is how you bind data. The $ sign. You declare first at the top. Then use it like this
                    Button(action: {
                        withAnimation { // This is how you add animation
                            let attendee = DailyScrum.Attendee(name: newAttendeeName)// This is how you initialize
                            data.attendees.append(attendee) // this is how you add an item in a list
                            newAttendeeName = "" // reset the TextField to empty String after appending to the list
                        }
                    }) {
                        Image(systemName: "plus.circle.fill")
                            .accessibilityValue("Add attendee")
                    }
                    .disabled(newAttendeeName.isEmpty) // this is how you disable a button with condition
                }
            }
        }
    }
}

struct DetailEditView_Previews: PreviewProvider {
    static var previews: some View {
        DetailEditView() // didn't have to initialize here because of data = DailyScrum.Data() and not data: Data. We did initialize data in Detail Edit View
    }
}
