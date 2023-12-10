//
//  StudiesRowView.swift
//  AprexiPraxis
//
//  Created by user245647 on 11/12/23.
//

import SwiftUI

struct StudiesRowView: View {
    let studiesUser: StudiesUser
    
    var body: some View {
        VStack(alignment: .leading) {
           
            Text(studiesUser.nameStudies )
                .font(.headline)
            Text(studiesUser.nameSchool)
     
        }
    }
}

#Preview {
    StudiesRowView(studiesUser: .example)
}
