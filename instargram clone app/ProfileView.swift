//
//  SearchView.swift
//  instargram clone app
//
//  Created by jsy on 5/29/25.
//

import SwiftUI

struct ProfileView: View {
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        let isDarkMode = colorScheme == .dark

        ScrollView(.vertical, showsIndicators: false) {
            HStack {
                Image(systemName: "person.crop.circle")
                    .resizable()
                    .frame(width: 100, height: 100)
                    .foregroundColor(.blue)
                VStack {
                    Text("username")
                        .font(.title2)
                        .foregroundColor(isDarkMode ? .white : .black)
                    HStack {
                        Text("posts: 0 followers: 0 following: 0")
                            .foregroundColor(.gray)
                    }
                }
            }
            ForEach(0..<88) { _ in
                HStack(alignment: .center) {
                    ForEach(0..<3) { _ in
                        VStack {
                            RoundedRectangle(cornerRadius: 10)
                                .fill(Color.gray)
                                .frame(width: 140, height: 140)
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    ProfileView()
}
