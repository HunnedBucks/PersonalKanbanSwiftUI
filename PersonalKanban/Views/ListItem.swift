//
//  ListItem.swift
//  PersonalKanban
//
//  Created by Hunter Buxton on 6/20/19.
//  Copyright © 2019 Hunter Buxton. All rights reserved.
//

import SwiftUI

struct ListItem : View {
    
    var body: some View {
        NavigationButton(destination: TaskDetail()) {
            HStack {
                Image(systemName: "photo")
                VStack {
                    Text("Hello World")
                    Text("Hello World")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }
            }
        }
    }
}

#if DEBUG
struct ListItem_Previews : PreviewProvider {
    static var previews: some View {
        ListItem()
    }
}
#endif
