/*
See LICENSE folder for this sample’s licensing information.
*/

import Foundation

struct DailyScrum: Identifiable {
    let id: UUID
    var title: String
    var attendees: [Attendee] //Nagaramid ka ti struct nga Attendees
    var lengthInMinutes: Int
    var theme: Theme
    
    init(id: UUID = UUID(), title: String, attendees: [String], lengthInMinutes: Int, theme: Theme) {
        self.id = id
        self.title = title
        self.attendees = attendees.map { Attendee(name: $0)} // Kastoy nu kasatnu agiterate ijjay data
        self.lengthInMinutes = lengthInMinutes
        self.theme = theme
    }
}

extension DailyScrum {
    static let sampleData: [DailyScrum] =
    [
        DailyScrum(title: "Design", attendees: ["Cathy", "Daisy", "Simon", "Jonathan"], lengthInMinutes: 10, theme: .yellow),
        DailyScrum(title: "App Dev", attendees: ["Katie", "Gray", "Euna", "Luis", "Darla"], lengthInMinutes: 5, theme: .orange),
        DailyScrum(title: "Web Dev", attendees: ["Chella", "Chris", "Christina", "Eden", "Karla", "Lindsey", "Aga", "Chad", "Jenn", "Sarah"], lengthInMinutes: 5, theme: .poppy)
    ]
}

extension DailyScrum { // Nagaramid ka extension tapnu maikabil mo ijjay DetailView nga kalla list
    struct Attendee: Identifiable {//Datoy nu kasatnu
        let id: UUID
        var name: String
        
        init(id: UUID = UUID(), name: String) {
            self.id = id
            self.name = name
        }
    }
    
    struct Data { // nu naginitialize ka ti values da, no need kanon nga agited arguments if you call Data()
        var title: String = ""
        var attendees: [Attendee] = []
        var lengthInMinutes: Double = 10
        var theme: Theme = .seafoam
    }
    
    var data: Data { // computed data property ------- probably because you initialized values? if not, you might need to do init() like on top
        Data(title: title, attendees: attendees, lengthInMinutes: Double(lengthInMinutes), theme: theme)
    }
    
    mutating func update(from data: Data) {
        title = data.title
        attendees = data.attendees
        lengthInMinutes = Int(data.lengthInMinutes)
        theme = data.theme
    }
}
