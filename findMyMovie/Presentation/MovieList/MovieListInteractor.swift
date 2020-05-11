//
//  MovieListInteractor.swift
//  findMyMovie
//
//  Created by Arnau Rivas Rivas on 11/04/2020.
//  Copyright © 2020 Arnau Rivas Rivas. All rights reserved.
//

import Foundation

protocol MovieListInteractorProtocol:class {
    func getDataFromItunes() -> [Result]
    //var arrayAllMovies: [Result] {get}
}

class MovieListInteractorImplementation: BaseInteractor<MovieListPresenterProtocol>, MovieListInteractorProtocol{
    var provider: MovieListProviderProtocol?
    var arrayAllMovies: [Result] = []
    
    internal func getDataFromItunes() -> [Result] {
        
        self.provider?.getDataFromItunesInProvider(completionHandler: { (data) in
            self.presenter?.reloadDataArray(data: data)
            self.presenter?.reloadTableview()
        })
        return self.arrayAllMovies
    }
}
