import SwiftUI

struct HeroCheckView: View {
    @State private var isSelectedNoise: Bool = false
    @State private var selectedNote: Note? = nil
    
    let notes: [Note] = [
        Note(id: 1, name: "Noise Level", desc: "The recommended noise level in the bedroom should not exceed 30-35 dB, which is equivalent to the sound of a whisper or the soft rustling of leaves.", icon: "speaker.wave.2.fill", subtext: "", tag: "30-35 decibels (db)"),
        Note(id: 2, name: "Temperature", desc: "The recommended temperature in the bedroom is between 16-19°C (60-67°F).", icon: "thermometer", subtext: "", tag: "16-19°C (60-67°F)"),
        Note(id: 3, name: "Lighting Level", desc: "It's recommended to have minimal or complete darkness in the bedroom for optimal sleep.", icon: "lightbulb.fill", subtext: "", tag: "Minimal or complete darkness"),
        Note(id: 4, name: "Ventilation", desc: "Ensure proper ventilation by opening windows for 10-15 minutes or using a fan.", icon: "fan.fill", subtext: "", tag: "Open windows or use a fan"),
    ]

    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            HeaderView(title: "Check before sleep")
            
            NoteGridView(notes: notes, isSelectedNoise: $isSelectedNoise, selectedNote: $selectedNote)
        }
        .sheet(isPresented: $isSelectedNoise) {
            if let selectedNote = selectedNote {
                CheckNoteView(note: selectedNote)
                    .presentationDetents([.medium])
            }
        }
    }
}

struct HeaderView: View {
    let title: String
    
    var body: some View {
        Text(title)
            .font(.headline)
            .fontWeight(.semibold)
            .foregroundStyle(.white)
            .padding(.horizontal)
            .padding(.top)
    }
}

struct NoteGridView: View {
    let notes: [Note]
    @Binding var isSelectedNoise: Bool
    @Binding var selectedNote: Note?
    
    let columns: [GridItem] = [GridItem(.fixed(180)), GridItem(.fixed(180))]
    
    var body: some View {
        LazyVGrid(columns: columns) {
            ForEach(notes) { note in
                CheckCard(note: note)
                    .onTapGesture {
                        selectedNote = note
                        isSelectedNoise = true
                    }
            }
        }
    }
}

#Preview {
    HeroCheckView()
}
