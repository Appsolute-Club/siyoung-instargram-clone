//
//  CommentView.swift
//  instargram clone app
//
//  Created by jsy on 6/2/25.
//

import SwiftUI

struct CommentView: View {
    var body: some View {
        VStack {
            Spacer()
        Text("아직 댓글이 없어요 ;(")
            Spacer()
            TextField("댓글 쓰기", text: .constant(""))
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .frame(width: 300, height: 50)
        }
    }
}

#Preview {
    CommentView()
}
