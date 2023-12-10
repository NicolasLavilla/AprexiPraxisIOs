//
//  RequestOfferDetailRowView.swift
//  AprexiPraxis
//
//  Created by user245647 on 9/12/23.
//

import SwiftUI

struct RequestOfferDetailRowView: View {
    let detailRequestOffer: DetailRequestOffer
    
    var body: some View {
        VStack(alignment: .leading) {
           
            Text(detailRequestOffer.nameState)
                .font(.headline)
            Text(detailRequestOffer.descriptionActionRequest)
            Text(detailRequestOffer.dateRequest)
        }
    }
}

#Preview {
    RequestOfferDetailRowView(detailRequestOffer: .example)
}
