//
//  ProfessionalProyectsRowView.swift
//  AprexiPraxis
//
//  Created by user245647 on 11/12/23.
//

import SwiftUI

struct ProfessionalProyectsRowView: View {
    let professionalProyectsUser: ProfessionalProyectsUser
    
    var body: some View {
        VStack(alignment: .leading) {
           
            Text(professionalProyectsUser.nameProyect )
                .font(.headline)
            Text(professionalProyectsUser.descriptionProyect)
            Text(professionalProyectsUser.initDate!)
        }
    }
}

#Preview {
    ProfessionalProyectsRowView(professionalProyectsUser: .example)
}
