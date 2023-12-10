//
//  LanguagesRowView.swift
//  AprexiPraxis
//
//  Created by user245647 on 11/12/23.
//

import SwiftUI

struct LanguagesRowView: View {
    let languagesUser: LanguagesUser
    
    var body: some View {
        VStack(alignment: .leading) {
           
            Text(languagesUser.nameLanguages )
                .font(.headline)
            Text(languagesUser.nameExperience)
     
        }
    }
}

#Preview {
    LanguagesRowView(languagesUser: .example)
}
