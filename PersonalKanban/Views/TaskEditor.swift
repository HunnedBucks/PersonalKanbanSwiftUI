//
//  TaskEditor.swift
//  PersonalKanban
//
//  Created by Hunter Buxton on 6/21/19.
//  Copyright © 2019 Hunter Buxton. All rights reserved.
//

import SwiftUI

struct TaskEditor : View {
    @State var tasks: [TaskMO]
    
    var body: some View {
        Text("name: ")
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
