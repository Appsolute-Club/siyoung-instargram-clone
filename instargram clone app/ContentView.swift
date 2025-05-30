//
//  ContentView.swift
//  instargram clone app
//
//  Created by jsy on 5/29/25.
//

import SwiftUI

struct ContentView: View {
    
    let circleTitle: [String] = ["cntmdwn2","ye.hyun__","apple", "banana", "orange", "pineapple", "grape", "mango", "strawberry", "blueberry", "blackberry", "cherry", "kiwi", "lime", "lemon", "avocado", "peach", "plum", "apricot", "nectarine", "clementine", "watermelon","pineapple"]
    
    let UserName: [String] = ["ye.hyun__","cntmdwn2","Anna", "Jake", "Max", "Lilly", "John", "Emma", "Michael", "Olivia", "David", "Isabella", "Robert", "Ava", "William", "Sophia", "Charles", "Mia", "George", "Harper", "Joseph", "Charlotte"]
    
    var body: some View {
        NavigationStack {
            TabView {
                HomeView(texts: circleTitle, username: UserName)
                    .tabItem{
                        Image(systemName: "house")
                    }
                RealsView()
                    .tabItem{
                        Image(systemName: "movieclapper.fill")
                    }
                SearchView()
                    .tabItem{
                        Image(systemName: "magnifyingglass")
                    }
                ProfileView()
                    .tabItem{
                        Image(systemName: "person")
                    }
            }
            .navigationTitle(Text("Instagram"))
        }
    }
}

#Preview {
    ContentView()
}
