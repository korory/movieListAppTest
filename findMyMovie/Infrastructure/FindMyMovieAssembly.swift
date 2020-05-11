//
//  FindMyMovieAssembly.swift
//  findMyMovie
//
//  Created by Arnau Rivas Rivas on 11/04/2020.
//  Copyright © 2020 Arnau Rivas Rivas. All rights reserved.
//

import Foundation

final public class FindMyMovieAssembly {
    
    static func movieListViewController()-> MovieListViewController {
        let vc = MovieListViewController(nibName: "MovieListViewController", bundle: nil)
        
        vc.presenter = presentMovieList(vc: vc)
        
        return vc
    }
    
    private static func presentMovieList(vc: MovieListViewController) -> MovieListPresenterProtocol {
        let presenter = MovieListPresenterImplementation(viewController: vc)
        
        presenter.router = routerMovieList(vc: vc, presenter: presenter)
        presenter.interactor = interactorMovieList(presenter: presenter)
        
        return presenter
    }
    
    private static func routerMovieList(vc: MovieListViewController, presenter: MovieListPresenterProtocol) -> MovieListRouterProtocol {
        
        let router = MovieListRouterImplementation(viewController: vc, presenter: presenter)
        
        return router
    }
    
    private static func interactorMovieList(presenter: MovieListPresenterProtocol)-> MovieListInteractorProtocol {
        
        let interactor = MovieListInteractorImplementation()
        
        interactor.provider = self.providerMovieList()
        
        interactor.presenter = presenter
        
        return interactor
        
    }
    
    private static func providerMovieList() -> MovieListProviderProtocol {
        
        let provider = MovieListProviderImplementation()
        
        return provider
    }
}


