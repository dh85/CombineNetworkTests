//
//  PostCell.swift
//  CombineNetworkTests
//
//  Created by David Hughes on 13/12/2020.
//

import SwiftUI

struct PostCell: View {
    private let post: Post
    
    init(with post: Post) {
        self.post = post
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(post.title)
                .font(.headline)
            Text(post.body)
                .font(.subheadline)
        }
    }
}

struct PostCell_Previews: PreviewProvider {
    static var previews: some View {
        PostCell(with: .init(id: 1, title: "Test title", body: "This is a test body to test this is working okay and can wrap onto multiple lines."))
            .previewLayout(.sizeThatFits)
    }
}
