//
//  ContentView.swift
//  PersonalKanban
//
//  Created by Hunter Buxton on 6/20/19.
//  Copyright © 2019 Hunter Buxton. All rights reserved.
//

import SwiftUI

struct ContentView : View {
    var body: some View {
        NavigationView {
            HStack {
                TaskList()
            }
        }
    }
}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
