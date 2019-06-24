//
//  TaskList.swift
//  PersonalKanban
//
//  Created by Hunter Buxton on 6/20/19.
//  Copyright © 2019 Hunter Buxton. All rights reserved.
//


//        List(tasks) { task in
//            NavigationButton(destination: TaskDetail(task: task)) {
//                    TaskCell(task: task)
//                }
//            }


import SwiftUI

struct WorkflowView : View {
    @State var tasks: [TaskMO] = PersistenceManager.shared.fetchTasks()
    @Binding var visibleMode: Bool
    
    var body: some View {
        List {
            ForEach(tasks.identified(by: \.self)) { task in
                NavigationButton(destination: TaskHost(task: task)) {
                    TaskCell(task: task)
                }
            } .onDelete(perform: delete) //https://www.hackingwithswift.com/quick-start/swiftui/how-to-enable-editing-on-a-list-using-editbutton
        }
        .navigationBarItems(leading: EditButton(),
                                trailing: Button(action: { () -> Void in
                                print("add button tapped")
                                self.visibleMode = false
                                
                                }, label: { Text("add") }))
    }
    
    func delete(at offsets: IndexSet) {
        if let first = offsets.first {
            PersistenceManager.shared.delete(tasks[first])
            tasks.remove(at: first)
        }
    }
}

#if DEBUG
//struct TaskList_Previews : PreviewProvider {
//    static var previews: some View {
//       // TaskList(tasks: PersistenceManager.shared.fetchStoredTasks())
//    }
//}
#endif
