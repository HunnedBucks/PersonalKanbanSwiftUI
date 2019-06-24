//
//  ContentView.swift
//  PersonalKanban
//
//  Created by Hunter Buxton on 6/20/19.
//  Copyright © 2019 Hunter Buxton. All rights reserved.
//

import SwiftUI
import CoreData

struct ContentView : View {
   // @State var addScreenVisible = false
    @State var tasks: [TaskMO]
    
//    init() {
//        tasks = PersistenceManager.shared.fetchTasks()
//    }
    
    var body: some View {
        NavigationView {
            NavigationButton(destination: AddTaskScreen()) {
                Text("Add")
            }
            Button(action: {self.tasks = PersistenceManager.shared.fetchTasks()}) {
                Text("reload tasks")
            }
            Button(action: { print("tasks are : ") }) {
                Text("display")
            }
            Text("the kanban board will appear here")
        }
       
    }
}


//struct TaskList : View {
//    @State var popupIsVisible = false
//    @State var newTask: TaskMO = TaskMO()
//    var body: some View {
//        HStack {
//            List(0..<5) { item in
//                ListItem()
//
//                }
//
//        .presentation(popupIsVisible ? Modal(EditorContent(isPresented: $popupIsVisible,
//                toEdit: $newTask,
//                doneBtn: TogglePresentationButton(isOn: $popupIsVisible),
//                saveBtn: SaveDataButton(isOn: $popupIsVisible)), onDismiss: { self.newTask = TaskMO() } ) : nil )
//        }
//        .navigationBarItems(trailing: TogglePresentationButton(isOn: $popupIsVisible))
//    }
//}
//
//struct TogglePresentationButton: View {
//    @Binding var isOn: Bool
//    var body: some View {
//        Button(
//            action: { self.isOn.toggle() },
//            label: { Text("cancel") }
//        )
//    }
//}
//
//struct SaveDataButton: View {
//    @Binding var isOn: Bool
//    func savePersistentDataStore() {
//        PersistenceManager.shared.save()
//        self.isOn.toggle()
//    }
//    var body: some View {
//        Button(
//            action: { self.savePersistentDataStore() },
//            label: { Text("save") }
//        )
//    }
//}
//
//
//struct EditorContent: View {
//    @Binding var isPresented: Bool
//    @Binding var toEdit: TaskMO
//
//    var doneBtn: TogglePresentationButton
//    var saveBtn: SaveDataButton
//
//    var body: some View {
//        VStack {
//            HStack {
//                doneBtn
//                Spacer()
//                saveBtn
//            }
//
//            TextField($toEdit.name)
//
//            TextField($toEdit.info)
//
//            Spacer()
//
//        }
//    }
//
//    func makeFalse() {
//        isPresented = false
//    }
//}
//
//
//
//
////struct ContentView : View {
////    @State var isPresented = false
////
////    var body: some View {
////        NavigationView {
////            NavigationButton(destination: Text("Hello World")
////                .font(.caption)
////                .navigationBarTitle(Text("Detail View Contents"))
////            ) {
////                Text("Show Detail View")
////                }
////                .navigationBarTitle(Text("Welcome"))
////                .navigationBarItems(trailing:
////                    Button(action: { self.isPresented = true }) { Text("Show Modal") })
////            }
////            .presentation( isPresented ? Modal(EditorContent(isPresented: $isPresented), onDismiss: { }) : nil )
////    }
////}
////
////
////struct EditorContent: View {
////    @Binding var isPresented: Bool
////
////    var body: some View {
////        NavigationView {
////            Text("Hello World")
////
////            .font(.caption)
////            .navigationBarTitle(Text("Modal Contents"))
////            .navigationBarItems(trailing: Button(action: { self.makeFalse() } ) { Text("Done") })
////        }
////    }
////
////    func makeFalse() {
////        isPresented = false
////    }
////}
