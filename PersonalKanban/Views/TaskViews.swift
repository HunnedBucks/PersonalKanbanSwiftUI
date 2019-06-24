//
//  TaskEditor.swift
//  PersonalKanban
//
//  Created by Hunter Buxton on 6/21/19.
//  Copyright © 2019 Hunter Buxton. All rights reserved.
//

import SwiftUI

struct TaskHost: View {
    @Environment(\.editMode) var mode
    @State var task: TaskMO
    var body: some View {
        VStack {
            if self.mode?.value == .active {
                TaskDetail(task: task)
            } else {
                TaskEditor(task: $task)
            }
        }
        .navigationBarItems(trailing: EditButton())
    }
}

struct TaskDetail: View {
    var task: TaskMO
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(task.name)
                    .font(.headline)
                Text(task.info)
                Spacer()
            }
            .padding()
            Spacer()
        }
    }
}

struct TaskEditor: View {
    @Binding var task: TaskMO

    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                TextField($task.name)
                    .font(.headline)
                TextField($task.info)
                Spacer()
            }
            .padding()
            Spacer()
        }
    }
}

struct AddTaskScreen : View {
    @State var task = TaskMO()
    @Binding var visibleModeOff: Bool
    
    var body: some View {
        Form {
            Section {
                TextField($task.name, placeholder: Text("name"))
                    .font(.headline)
            }
            Section {
                TextField($task.info, placeholder: Text("info"))
                    .frame(height: 100)
                    .lineLimit(6) //https://stackoverflow.com/questions/56471973/how-do-i-create-a-multiline-textfield-in-swiftui this guy says the line limit not giving longer textFields is a bug
                    .font(.subheadline)
            }
        }

        .navigationBarItems(
            leading:  Button(action: { () -> Void in
                //PersistenceManager.shared.save()
                self.visibleModeOff = true
            }) { Text("cancel") } ,
            trailing:
            Button(action: { () -> Void in
                PersistenceManager.shared.save()
                self.visibleModeOff = true
            }) { Text("save") }
        )
    }
}
