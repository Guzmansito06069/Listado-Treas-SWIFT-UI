//
//  ContentView.swift
//  CRUD
//
//  Created by MAC on 16/05/22.
//

import SwiftUI

struct ContentView: View {
    @State var descriptionNote: String = ""
    @StateObject var notesViewModel = NotesViewModel()
    
    var body: some View {
        NavigationView {
            
            VStack {
                Text("Añade una tarea")
                    .underline()
                    .foregroundColor(.gray)
                    .padding(.horizontal, 16)
                TextEditor(text: $descriptionNote)
                    .foregroundColor(.gray)
                    .frame(height: 100)
                    .overlay(
                        RoundedRectangle(cornerRadius: 8)
                            .stroke( lineWidth: 2)
                    )
                    .padding(.horizontal, 12)
                    .cornerRadius(3.0)
                Button("Crear") {
                    notesViewModel.saveNote(description: descriptionNote)
                    descriptionNote = ""
                }
               
                Spacer()
                List {
                    ForEach(notesViewModel.notes, id: \.id) { nota in
                        HStack {
                            Text(nota.description)
                        }
                    }
                }
            }
            .navigationTitle("TODO")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().preferredColorScheme(/*@START_MENU_TOKEN@*/.dark/*@END_MENU_TOKEN@*/)
    }
}
