//
//  OfferCompanyRowView.swift
//  AprexiPraxis
//
//  Created by user245647 on 8/12/23.
//

import SwiftUI

struct OfferCompanyRowView: View {
    let offer: Offer
    
    var body: some View {
        /*VStack(alignment: .leading) {
            Text(offer.offerTitle)
                .font(.headline)
            Text(offer.nameCompany)
            Image(offer.logoCompany)
        }*/
        AsyncImage(url: URL(string: offer.logoCompany)) { phase in
                switch phase {
                case .empty:
                    // Puedes agregar una imagen de placeholder o un indicador de carga
                    ProgressView()
                case .success(let image):
                    // La imagen cargada exitosamente
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 50, height: 50) // Ajusta el tamaño según sea necesario
                        .cornerRadius(8) // Opcional: agregar esquinas redondeadas
                case .failure:
                    // Manejo de error si la imagen no se carga
                    Image(systemName: "exclamationmark.triangle") // Puedes usar un ícono de error
                        .frame(width: 50, height: 50)
                        .foregroundColor(.red)
                @unknown default:
                    // Manejo por defecto
                    ProgressView()
                }
            }
            .frame(width: 50, height: 50)
            .clipShape(Circle()) // Opcional: para que la imagen tenga forma circular
            
            VStack(alignment: .leading) {
                Text(offer.offerTitle)
                    .font(.headline)
                Text(offer.nameCompany)
            }
    }
}

#Preview {
    OfferCompanyRowView(offer: .example)
}
