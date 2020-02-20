//
//  FilteredListView.swift
//  Bookworm
//
//  Created by Alejandro Vicente Milán on 20/02/2020.
//  Copyright © 2020 Alejandro Vicente Milán. All rights reserved.
//

import CoreData
import SwiftUI

struct FilteredListView: View {
    var fetchRequest: FetchRequest<Singer>
    var singers: FetchedResults<Singer> { fetchRequest.wrappedValue }
    
    var body: some View {
        List(fetchRequest.wrappedValue, id: \.self) { singer in
            Text("\(singer.wrappedFirstName) \(singer.wrappedLastName)")
        }
    }
    
    init(filter: String) {
        fetchRequest = FetchRequest<Singer>(entity: Singer.entity(), sortDescriptors: [], predicate: NSPredicate(format: "lastName BEGINSWITH %@", filter))
    }
}
