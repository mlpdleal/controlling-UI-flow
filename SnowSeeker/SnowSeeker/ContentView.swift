//
//  ContentView.swift
//  SnowSeeker
//
//  Created by Manoel Leal on 31/07/22.
//

import SwiftUI

extension View {
    
    @ViewBuilder func phoneOnlynavigationView() -> some View {
        if UIDevice.current.userInterfaceIdiom == .phone {
            self.navigationViewStyle(.stack)
        } else {
            self
        }
    }
}

enum SortType{
    case name, country, main
}

struct ContentView: View {
    
    let resorts: [Resort] = Bundle.main.decode("resorts.json")
    
    @StateObject var favorites = Favorites()
    @State private var searchText = ""
    @State private var showingFilter = false
    @State private var selectedFilter = SortType.main
    
    var body: some View {
        NavigationView{
            Group{
                switch selectedFilter {
                case .name:
                    List(filteredResorts.sorted()) { resort in
                        NavigationLink{
                            ResortView(resort: resort)
                        } label: {
                            HStack{
                                Image(resort.country)
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 40, height: 25)
                                    .clipShape(RoundedRectangle(cornerRadius: 5))
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 5)
                                            .stroke(.black, lineWidth: 1)
                                    )
                                
                                VStack(alignment: .leading){
                                    Text(resort.name)
                                        .font(.headline)
                                    Text("\(resort.runs)")
                                        .foregroundColor(.secondary)
                                }
                                
                                if favorites.contains(resort){
                                    Spacer()
                                    Image(systemName: "heart.fill")
                                        .accessibilityLabel("This is a favorite resort")
                                        .foregroundColor(.red)
                                }
                                
                            }
                        }
                    }
                    .searchable(text: $searchText, prompt: "Search for a resort")
                case .country:
                    List(filteredResorts.sorted(by: { $0.country < $1.country })) { resort in
                        NavigationLink{
                            ResortView(resort: resort)
                        } label: {
                            HStack{
                                Image(resort.country)
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 40, height: 25)
                                    .clipShape(RoundedRectangle(cornerRadius: 5))
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 5)
                                            .stroke(.black, lineWidth: 1)
                                    )
                                
                                VStack(alignment: .leading){
                                    Text(resort.name)
                                        .font(.headline)
                                    Text("\(resort.runs)")
                                        .foregroundColor(.secondary)
                                }
                                
                                if favorites.contains(resort){
                                    Spacer()
                                    Image(systemName: "heart.fill")
                                        .accessibilityLabel("This is a favorite resort")
                                        .foregroundColor(.red)
                                }
                                
                            }
                        }
                    }
                    .searchable(text: $searchText, prompt: "Search for a resort")
                case .main:
                    List(filteredResorts) { resort in
                        NavigationLink{
                            ResortView(resort: resort)
                        } label: {
                            HStack{
                                Image(resort.country)
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 40, height: 25)
                                    .clipShape(RoundedRectangle(cornerRadius: 5))
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 5)
                                            .stroke(.black, lineWidth: 1)
                                    )
                                
                                VStack(alignment: .leading){
                                    Text(resort.name)
                                        .font(.headline)
                                    Text("\(resort.runs)")
                                        .foregroundColor(.secondary)
                                }
                                
                                if favorites.contains(resort){
                                    Spacer()
                                    Image(systemName: "heart.fill")
                                        .accessibilityLabel("This is a favorite resort")
                                        .foregroundColor(.red)
                                }
                                
                            }
                        }
                    }
                    .searchable(text: $searchText, prompt: "Search for a resort")
                }
            }
            .navigationTitle("Resorts")
            .toolbar{
                ToolbarItem(placement: .navigationBarTrailing){
                    Button{
                        showingFilter = true
                    } label: {
                        Image(systemName: "arrow.up.arrow.down.square")
                    }
                }
            }
            .confirmationDialog("Sort by", isPresented: $showingFilter){
                Group{
                    Button("Default") { selectedFilter = .main}
                    Button("Name") { selectedFilter = .name}
                    Button("Country") { selectedFilter = .country }
                    Button("Cancel", role: .cancel) { }
                }
            }

            
            WelcomeView()
        }
        .phoneOnlynavigationView()
        .environmentObject(favorites)
    }
    
    var filteredResorts: [Resort]{
        if searchText.isEmpty{
            return resorts
        } else {
            return resorts.filter{
                $0.name.localizedCaseInsensitiveContains(searchText)
            }
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
