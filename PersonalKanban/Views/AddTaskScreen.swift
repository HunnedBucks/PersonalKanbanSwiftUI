//
//  AddTaskScreen.swift
//  PersonalKanban
//
//  Created by Hunter Buxton on 6/23/19.
//  Copyright © 2019 Hunter Buxton. All rights reserved.
//

import SwiftUI

struct AddTaskScreen : View {
    @State var task = TaskMO()
    @Binding var shouldDismiss: Bool
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                TextField($task.name)
                TextField($task.info)
                Spacer()
            }
            Spacer()
            }
            .navigationBarItems(trailing:
                Button(action: { () -> Void in
                    PersistenceManager.shared.save()
                    self.shouldDismiss = true
                }) {
                    Text("save")
            })
    }
}

//#if DEBUG
//struct AddTaskScreen_Previews : PreviewProvider {
//    static var previews: some View {
//        AddTaskScreen()
//    }
//}
//#endif
