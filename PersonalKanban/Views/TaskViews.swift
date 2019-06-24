//
//  TaskEditor.swift
//  PersonalKanban
//
//  Created by Hunter Buxton on 6/21/19.
//  Copyright © 2019 Hunter Buxton. All rights reserved.
//

import SwiftUI

struct TaskHost: View {
    @State var task: TaskMO
    @Environment(\.editMode) var mode
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            if self.mode?.value == .inactive {
                TaskDetail(task: task)
            } else {
                TaskEditor(task: $task)
            }
        }.padding()
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
                TextField($task.info)
                Spacer()
            }
            Spacer()
            }
            .navigationBarItems(
                leading:  Button(action: { () -> Void in
                    //PersistenceManager.shared.save()
                    //self.visibleModeOff = true
                }) { Text("cancel") } ,
                trailing:
                Button(action: { () -> Void in
                    PersistenceManager.shared.save()
                    //self.visibleModeOff = true
                }) { Text("save") })
    }
}


struct AddTaskScreen : View {
    @State var task = TaskMO()
    @Binding var visibleModeOff: Bool
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                TextField($task.name)
                TextField($task.info)
                Spacer()
            }
            Spacer()
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
                }) { Text("save") })
    }
}



//struct TaskEditor : View {
//    @State var task: TaskMO
//    @State var isPresented = false
//
//    var body: some View {
//        VStack {
////            HStack {
////                Button(action: { self.isPresented = false }, label: Text("Cancel"))
////                Button(action: { saveItem() },
////                       label: { Text("save")) }
////            }
//            TextField($task.name)
//            TextField($task.info)
//            Spacer()
//        }
//        .presentation( isPresented ? Modal(modalPresentation, onDismiss: {self.isPresented.toggle() }) : nil )
//    }
//
//    func saveItem() {
//        PersistenceManager.shared.save()
//        self.isPresented = false
//    }
//
////    func cancelAction() {
////        self.pre
////    }
//}
//public struct BindedPresentationButton<label, destination="">: View where Label: View, Destination: View {
//    /// The state of the modal presentation, either `visibile` or `off`.
//    private var showModal: Binding
//
//
//    /// A `View` to use as the label of the button.
//    public var label: Label
//
//
//    /// A `View` to present.
//    public var destination: Destination
//
//
//    /// A closure to be invoked when the button is tapped.
//    public var onTrigger: (() -> Void)?
//
//
//    public init(
//        showModal: Binding,
//        label: Label,
//        destination: Destination,
//        onTrigger: (() -> Void)? = nil
//        ) {
//        self.showModal = showModal
//        self.label = label
//        self.destination = destination
//        self.onTrigger = onTrigger
//    }
//
//
//    public var body: some View {
//        Button(action: toggleModal) {
//            label
//            }
//            .presentation(
//                !showModal.value ? nil :
//                    Modal(
//                        destination, onDismiss: {
//                            self.toggleModal()
//                    }
//                )
//        )
//    }
//
//
//    private func toggleModal() {
//        showModal.value.toggle()
//        onTrigger?()
//    }
//}

#if DEBUG
//struct TaskEditor_Previews : PreviewProvider {
//    static var previews: some View {
//        TaskEditor()
//    }
//}
#endif
