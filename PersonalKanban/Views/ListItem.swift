//
//  ListItem.swift
//  PersonalKanban
//
//  Created by Hunter Buxton on 6/20/19.
//  Copyright © 2019 Hunter Buxton. All rights reserved.
//

import SwiftUI


//struct ProfileHost: View {
//    @Environment(\.editMode) var mode
//  //  @State var profile = Profile.default
//  //  @State var draftProfile = Profile.default
//    
//    var body: some View {
//        VStack {//}(alignment: .leading, spacing: 20) {
//            HStack {
//                if self.mode?.value == .active {
//                    Button(action: {
//                        self.profile = self.draftProfile
//                        self.mode?.animation().value = .inactive
//                    }) {
//                        Text("Done")
//                    }
//                }
//                
//                Spacer()
//                
//                EditButton()
//            }
//            if self.mode?.value == .inactive {
//                ProfileSummary(profile: profile)
//            } else {
//                ProfileEditor(profile: $draftProfile)
//                    .onDisappear {
//                        self.draftProfile = self.profile
//                }
//            }
//            }
//            .padding()
//    }
//}


//struct ListItem : View {
//    @State var task:
//    var body: some View {
//        NavigationButton(destination: TaskDetail()) {
//            HStack {
//                Image(systemName: "photo")
//                VStack {
//                    Text("Hello World")
//                    Text("Hello World")
//                        .font(.subheadline)
//                        .foregroundColor(.secondary)
//                }
//            }
//        }
//    }
//}
//
//#if DEBUG
//struct ListItem_Previews : PreviewProvider {
//    static var previews: some View {
//        ListItem()
//    }
//}
//#endif
