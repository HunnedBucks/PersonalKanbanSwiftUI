//
//  TaskList.swift
//  PersonalKanban
//
//  Created by Hunter Buxton on 6/20/19.
//  Copyright © 2019 Hunter Buxton. All rights reserved.
//

import SwiftUI

struct TaskList : View {
    var body: some View {
        List(0..<5) { item in
            ListItem()
        }
    }
}

#if DEBUG
struct TaskList_Previews : PreviewProvider {
    static var previews: some View {
        TaskList()
    }
}
#endif
