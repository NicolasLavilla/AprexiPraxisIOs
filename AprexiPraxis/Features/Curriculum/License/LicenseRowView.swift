//
//  LicenseRowView.swift
//  AprexiPraxis
//
//  Created by user245647 on 11/12/23.
//

import SwiftUI

struct LicenseRowView: View {
    let licenseUser: LicenseUser
    
    var body: some View {
        VStack(alignment: .leading) {
           
            Text(licenseUser.nameLicense )
                .font(.headline)
        
        }
    }
}

#Preview {
    LicenseRowView(licenseUser: .example)
}
