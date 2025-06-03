//
//  SwiftUIView.swift
//  instargram clone app
//
//  Created by jsy on 5/29/25.
//

import SwiftUI

struct HomeView: View {
    struct Item: Identifiable {
        let id = UUID()
        var isLiked: Bool = false
    }
    
    @State private var items: [Item]
    @State private var showingCommentView = false
    
    let texts: [String]
    let username: [String]
    
    init(texts: [String], username: [String]) {
        self.texts = texts
        self.username = username
        _items = State(initialValue: Array(repeating: Item(), count: username.count))
    }
    
    var body: some View {
        ScrollView {
            VStack {
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 16) {
                        ForEach(texts, id: \.self) { text in
                            VStack {
                                Circle()
                                    .fill(Color.blue.opacity(0.3))
                                    .frame(width: 80, height: 80)
                                Text(text.capitalized)
                                    .font(.headline)
                                }
                            }
                        }
                    }
                    .padding(.horizontal)
                }
                
                // 피드
                VStack(spacing: 16) {
                    ForEach(username.indices, id: \.self) { index in
                        let name = username[index]
                        VStack(spacing: 12) {
                            HStack {
                                Circle()
                                    .fill(Color.blue.opacity(0.3))
                                    .frame(width: 32, height: 32)
                                Text(name.capitalized)
                                    .font(.headline)
                            }
                            RoundedRectangle(cornerRadius: 10)
                                .fill(Color.gray.opacity(0.2))
                                .frame(width: 200, height: 200)
                            
                            HStack(spacing: 12) {
                                Spacer()
                                Button {
                                    items[index].isLiked.toggle()
                                } label: {
                                    Image(systemName: items[index].isLiked ? "heart.fill" : "heart")
                                        .foregroundColor(items[index].isLiked ? .red : .gray)
                                        .font(.title)
                                }
                                
                                Text(items[index].isLiked ? "1" : "0")
                                    .font(.headline)
                                Spacer()
                                Image(systemName: "text.bubble")
                                    .onTapGesture {
                                        showingCommentView = true
                                    }
                                Text("0")
                                Spacer()
                            }
                        }
                    }
                    .onAppear {
                        UIScrollView.appearance().isPagingEnabled = false
                        
                    }
                    .padding()
                }
                .sheet(isPresented: $showingCommentView) {
                    CommentView()
                        .presentationDragIndicator(.visible)
                        .presentationDetents([.fraction(0.45)]) 
                }
            }
        }
    }
