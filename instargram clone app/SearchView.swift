//
//  SwiftUIView.swift
//  instargram clone app
//
//  Created by jsy on 5/29/25.
//

import SwiftUI

struct SearchView: View {
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack {
                TextField("Search", text: .constant(""))
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .frame(width: 300, height: 50)
                ForEach(0..<88) { _ in
                    HStack(alignment:.center) {
                        ForEach(0..<3) { _ in
                            VStack{
                                RoundedRectangle(cornerRadius: 10)
                                    .fill(Color.gray)
                                    .frame(width: 140, height: 140)
                            }
                        }
                    }
                }
            }
        }
        .onAppear {
            UIScrollView.appearance().isPagingEnabled = false
            }
    }
}

#Preview {
    SearchView()
}
        
