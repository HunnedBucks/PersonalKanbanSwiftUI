//
//  EpicDetail.swift
//  PersonalKanban
//
//  Created by Hunter Buxton on 6/21/19.
//  Copyright © 2019 Hunter Buxton. All rights reserved.
//

import SwiftUI

struct EpicDetail : View {
    
    @Environment(\.isPresented) var isPresented: Binding<Bool>?
    
    var body: some View {
        VStack {
            Rectangle()
                .fill(Color.orange)
                .edgesIgnoringSafeArea(.top)
                .frame(height: 300)
            Text("Hello World")
            Button(action: {
                self.isPresented?.value = false
            }) {
                Text("Pop")
            }
            Spacer()
            }
            .edgesIgnoringSafeArea(.top)
    }
}

#if DEBUG
//struct EpicDetail_Previews : PreviewProvider {
//    static var previews: some View {
//        EpicDetail()
//    }
//}
#endif
