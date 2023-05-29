//
//  CountriesListView.swift
//  Realm Intro-2
//
//  Created by Stewart Lynch on 2022-03-07.
//
// Link - One Many Relationship Part 1: https://www.youtube.com/watch?v=I6Yl9p_9WwE&ab_channel=StewartLynch
// Link - One Many Relationship Part 2: https://www.youtube.com/watch?v=XrmOR_Qv9Aw&ab_channel=StewartLynch

import SwiftUI
import RealmSwift

struct CountriesListView: View {
    @ObservedResults(Country.self) var countries
    @FocusState private var isFocused: Bool?
    @State private var presentAlert = false
    var body: some View {
        NavigationView {
            VStack {
                if countries.isEmpty {
                    Text("Tap on the \(Image(systemName: "plus.circle.fill")) button above to create a new Country.")
                } else {
                    List {
                        ForEach(countries.sorted(byKeyPath: "name")) { country in
                            NavigationLink {
                                CitiesListView(country: country)
                            } label: {
                                CountryRowView(country: country, isFocused: _isFocused)
                            }
                        }
                        .onDelete(perform: deleteCountry)
                        .listRowSeparator(.hidden)
                    }
                    .listStyle(.plain)
                }
                Spacer()
            }
            .animation(.default, value: countries)
            .navigationTitle("Countries")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        $countries.append(Country())
                    } label: {
                        Image(systemName: "plus.circle.fill")
                            .font(.title2)
                    }
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
        .alert("You must first delete all of the cities in this country.", isPresented: $presentAlert, actions: {})
    }
    func deleteCountry(indexSet: IndexSet) {
        guard let index = indexSet.first else { return }
        let selectedCountry = Array(countries.sorted(byKeyPath: "name"))[index]
        guard selectedCountry.cities.isEmpty else {
            // show alert
            presentAlert.toggle()
            return
        }
        $countries.remove(selectedCountry)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        CountriesListView()
    }
}
