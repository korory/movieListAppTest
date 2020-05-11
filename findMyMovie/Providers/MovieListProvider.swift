//
//  MovieListProvider.swift
//  findMyMovie
//
//  Created by Arnau Rivas Rivas on 11/04/2020.
//  Copyright © 2020 Arnau Rivas Rivas. All rights reserved.
//

import Foundation

protocol MovieListProviderProtocol:class {
    func getDataFromItunesInProvider(completionHandler: @escaping([Result]) -> ())
}

class MovieListProviderImplementation: BaseProvider {
    
//    internal func getDataFromItunesInProvider(completionHandler: @escaping(MovieModels) -> ()) {
//
//
//        request(endPoint: CONSTANTS.BASEURL.ITUNESBASEURLMOVIE,
//                          method: .get,
//                          bodyObject: nil,
//                          type: MovieModels.self,
//                          completionHandler: { (data) in
//                            guard let dataDes = data else { return }
//                            completionHandler(dataDes)
//        })
//    }
}

extension MovieListProviderImplementation: MovieListProviderProtocol {
    func getDataFromItunesInProvider(completionHandler: @escaping ([Result]) -> ()) {
        
        request(endPoint: CONSTANTS.BASEURL.ITUNESBASEURLMOVIE,
                method: .get,
                bodyObject: nil,
                type: MovieModels.self,
                
                success: {response in
                    print("Succes")
                    let arrayMovies = response?.feed?.results
                    
                    if let arrayMovies = arrayMovies {
                         DispatchQueue.main.async {
                            completionHandler(arrayMovies)
                        }
                    } else {
                        print("Problem")
                    } 
        },
                failure: {
                    print("Error")
        })
    }
}

