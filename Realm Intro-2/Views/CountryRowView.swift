//
//  CountryRowView.swift
//  Realm Intro-2
//
//  Created by Marcin Jędrzejak on 21/05/2023.
//

import SwiftUI
import RealmSwift

struct CountryRowView: View {
    @ObservedRealmObject var country: Country
    @FocusState var isFocused: Bool?
    var body: some View {
        HStack {
            TextField("New Country", text: $country.name)
                .focused($isFocused, equals: true)
                .textFieldStyle(.roundedBorder)
            Spacer()
            Text("\(country.cities.count) cities")
        }
        .padding()
        .frame(height: 30)
    }
}

struct CountryRowView_Previews: PreviewProvider {
    static var previews: some View {
        CountryRowView(country: Country(name: "Poland"))
    }
}
