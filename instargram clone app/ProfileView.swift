//
//  SearchView.swift
//  instargram clone app
//
//  Created by jsy on 5/29/25.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        HStack {
            Image(systemName: "person.crop.circle")
                .resizable()
                .frame(width: 100, height: 100)
                .foregroundColor(.blue)
            VStack{
                Text("username")
                    .font(.title2)
                    .foregroundColor(.black)
                HStack{
                    Text("posts: 0 followers: 0 following: 0")
                        .foregroundColor(.gray)
                }
            }
        }
    }
}

#Preview {
    ProfileView()
}
