//
//  CitiesListView.swift
//  Realm Intro-2
//
//  Created by Marcin Jędrzejak on 22/05/2023.
//

import SwiftUI
import RealmSwift

struct CitiesListView: View {
    @ObservedRealmObject var country: Country
    @State private var name = ""
    @FocusState private var isFocused: Bool?
    var body: some View {
        VStack {
            HStack {
                TextField("New City", text: $name)
                    .focused($isFocused, equals: true)
                    .textFieldStyle(.roundedBorder)
                Spacer()
                Button {
                    let newCity = City(name: name)
                    $country.cities.append(newCity)
                    name = ""
                    isFocused = nil
                } label: {
                    Image(systemName: "plus.circle.fill")
                }
                .disabled(name.isEmpty)
            }
            .padding()
            List {
                ForEach(country.cities) { city in
                    Text(city.name)
                }
                .onDelete(perform: $country.cities.remove)
                .onMove(perform: $country.cities.move)
                .listRowSeparator(.hidden)
            }
            .listStyle(.plain)
        }
        .animation(.default, value: country.cities)
        .navigationTitle("")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                EditButton()
            }
            ToolbarItemGroup(placement: .keyboard) {
                HStack {
                    // Bug in Xcode: HStack with Spacer and Button not show the button, only when first is the Button, and then Spacer
//                        Spacer()
                    Button {
                        isFocused = nil
                    } label: {
                        Image(systemName: "keyboard.chevron.compact.down")
                    }
                    Spacer()
                }
            }
        }
    }
}

struct CitiesListView_Previews: PreviewProvider {
    static var previews: some View {
        CitiesListView(country: Country(name: "Poland"))
    }
}
