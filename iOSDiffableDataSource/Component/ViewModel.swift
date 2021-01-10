//
//  ViewModel.swift
//  iOSDiffableDataSource
//
//  Created by Ghazi Tozri on 9/1/2021.
//

import UIKit
import Combine

class ViewModel
{
    var cancellables: Set<AnyCancellable> = []

    let singleton = Service.sharedInstance
    @Published var keyWordSearch: String = ""

    init()
    {
        $keyWordSearch.receive(on: RunLoop.main).debounce(for: .seconds(1), scheduler: RunLoop.main)
            .sink { (_) in
                self.fetchMovies()
            }.store(in: &cancellables)
    }
    
    func fetchMovies()
    {
        singleton.fetchFilms(for: keyWordSearch) { (results) in
            print(results)
        }
    }
}
