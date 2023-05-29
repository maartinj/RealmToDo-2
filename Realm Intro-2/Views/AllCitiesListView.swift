//
//  AllCitiesListView.swift
//  Realm Intro-2
//
//  Created by Marcin Jędrzejak on 29/05/2023.
//

import SwiftUI
import RealmSwift

struct AllCitiesListView: View {
    @ObservedResults(City.self, sortDescriptor: SortDescriptor(keyPath: "name")) var cities
    var body: some View {
        NavigationView {
            List {
                ForEach(cities) { city in
                    HStack {
                        Text(city.name)
                        Spacer()
                        Text(city.country.first?.name ?? "No Country")
                    }
                }
                .onDelete(perform: $cities.remove)
            }
            .navigationTitle("All Cities")
        }
    }
}

struct AllCitiesListView_Previews: PreviewProvider {
    static var previews: some View {
        AllCitiesListView()
    }
}
