//
//  ContentView.swift
//  SnowSeeker
//
//  Created by Ken Muyesu on 08/03/2022.
//

import SwiftUI

struct ContentView: View {
    @State private var searchText = ""
    let allModels = ["4-Runner", "Auris", "Avensis", "Avensis Combi", "Avensis Van Verso", "Aygo", "Camry", "Carina", "Celica", "Corolla", "Corolla Combi", "Corolla sedan", "Corolla Verso", "FJ Cruiser", "GT86", "Hiace", "Hiace Van", "Highlander", "Hilux", "Land Cruiser", "MR2", "Paseo", "Picnic", "Prius", "RAV4", "Sequoia", "Starlet", "Supra", "Tundra", "Urban Cruiser", "Verso", "Yaris", "Yaris Verso"]

        var body: some View {
            NavigationView {
                List(filteredNames, id: \.self) { name in
                    Text(name)
                }
                .searchable(text: $searchText, prompt: "Search model")
                .navigationTitle("Search Models")
            }
        }
    
    var filteredNames: [String] {
        if searchText.isEmpty {
            return allModels
        } else {
            //return allModels.filter { $0.contains(searchText) }
            return allModels.filter { $0.localizedCaseInsensitiveContains(searchText) }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
