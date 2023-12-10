//
//  ExperienceRowView.swift
//  AprexiPraxis
//
//  Created by user245647 on 11/12/23.
//

import SwiftUI

struct ExperienceRowView: View {
    let experienceJobUser: ExperienceJobUser
    
    var body: some View {
        VStack(alignment: .leading) {
           
            Text(experienceJobUser.nameJobs )
                .font(.headline)
            Text(experienceJobUser.nameCompany)
     
        }
    }
}

#Preview {
    ExperienceRowView(experienceJobUser: .example)
}

