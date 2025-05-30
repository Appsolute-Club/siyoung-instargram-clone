//
//  RealsView.swift
//  instargram clone app
//
//  Created by jsy on 5/30/25.
//

import SwiftUI

struct RealsView: View {
    let pages = Array(0..<999)  // 예시 콘텐츠 수
    
    var body: some View {
        GeometryReader { geometry in
            PagingScrollView(pages: pages.map { index in
                ZStack {
                    RoundedRectangle(cornerRadius: 30)
                        .fill(Color.gray)
                    Text("Reel \(index + 1)")
                        .foregroundColor(.white)
                        .font(.largeTitle.bold())
                }
                .frame(width: geometry.size.width,
                       height: geometry.size.height)
            })
        }
        .ignoresSafeArea()
        .background(Color.black)
    }
}

// 수직 페이징 ScrollView 구현
struct PagingScrollView<Content: View>: View {
    let pages: [Content]
    @State private var offset: CGFloat = 0
    
    var body: some View {
        GeometryReader { geo in
            ScrollView(.vertical, showsIndicators: false) {
                VStack(spacing: 0) {
                    ForEach(pages.indices, id: \.self) { index in
                        pages[index]
                            .frame(width: geo.size.width,
                                   height: geo.size.height)
                    }
                }
            }
            .content.offset(y: -self.offset)
            .frame(height: geo.size.height, alignment: .top)
            .gesture(
                DragGesture()
                    .onEnded { value in
                        let dragThreshold: CGFloat = 50
                        let pageHeight = geo.size.height
                        let predictedEndOffset = self.offset + value.translation.height
                        
                        let newIndex: Int
                        if value.translation.height < -dragThreshold {
                            newIndex = min(Int((self.offset + pageHeight) / pageHeight), pages.count - 1)
                        } else if value.translation.height > dragThreshold {
                            newIndex = max(Int((self.offset - pageHeight) / pageHeight), 0)
                        } else {
                            newIndex = Int(self.offset / pageHeight)
                        }
                        
                        withAnimation {
                            self.offset = CGFloat(newIndex) * pageHeight
                        }
                    }
            )
        }
    }
}

#Preview {
    RealsView()
}
