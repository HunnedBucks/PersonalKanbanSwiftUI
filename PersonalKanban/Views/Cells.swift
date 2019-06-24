//
//  AddTaskScreen.swift
//  PersonalKanban
//
//  Created by Hunter Buxton on 6/23/19.
//  Copyright © 2019 Hunter Buxton. All rights reserved.
//

import SwiftUI


struct TaskCell: View {
    @State var task: TaskMO
    var body: some View {
        HStack {
            Image(systemName: "photo")
            
            VStack(alignment: .leading) {
                Text(task.name)
                Text(task.info)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
        }
    }
}

//#if DEBUG
//struct AddTaskScreen_Previews : PreviewProvider {
//    static var previews: some View {
//        AddTaskScreen()
//    }
//}
//#endif
