//
//  RequestOfferRowView.swift
//  AprexiPraxis
//
//  Created by user245647 on 9/12/23.
//

import SwiftUI

struct RequestOfferRowView: View {
    let requestOffer: RequestOffer
    
    var body: some View {
        /*VStack(alignment: .leading) {
            Text(requestOffer.offerTitle)
                .font(.headline)
            Text(requestOffer.nameCompany)
        }*/
        AsyncImage(url: URL(string: requestOffer.logoCompany)) { phase in
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
                Text(requestOffer.offerTitle)
                    .font(.headline)
                Text(requestOffer.nameCompany)
            }
    }
}

#Preview {
    RequestOfferRowView(requestOffer: .example)
}
