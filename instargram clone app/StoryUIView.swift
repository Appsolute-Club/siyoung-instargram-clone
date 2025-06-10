//
//  SwiftUIView.swift
//  instargram clone app
//
//  Created by jsy on 6/10/25.
//

import SwiftUI

struct StoryUIView: View {
    @Binding var currentIndex: Int
    let titles: [String]
    let title: String

    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            
            GeometryReader { geo in
                HStack(spacing: 0) {
                    Rectangle()
                        .fill(Color.clear)
                        .contentShape(Rectangle())
                        .onTapGesture {
                            if currentIndex > 0 {
                                currentIndex -= 1
                            }
                        }
                    Rectangle()
                        .fill(Color.clear)
                        .contentShape(Rectangle())
                        .onTapGesture {
                            if currentIndex < titles.count - 1 {
                                currentIndex += 1
                            }
                        }
                }
                .frame(width: geo.size.width, height: geo.size.height)
                .ignoresSafeArea()
            }
            
            VStack(alignment: .leading) {
                HStack(spacing: 12) {
                    Circle()
                        .fill(Color.gray)
                        .frame(width: 44, height: 44)
                    Text(title)
                        .foregroundColor(.white)
                        .font(.headline)
                    Spacer()
                }
                .padding(.top, 20)
                .padding(.horizontal)
                Spacer()
            }
        }
    }
}

#Preview {
    struct PreviewWrapper: View {
        @State var index = 0
        let titles = ["Story1", "Story2", "Story3"]
        var body: some View {
            StoryUIView(currentIndex: $index, titles: titles, title: titles[index])
        }
    }
    return PreviewWrapper()
}
