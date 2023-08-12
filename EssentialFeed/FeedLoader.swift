//
//  FeedLoader.swift
//  EssentialFeed
//
//  Created by Hamid on 8/12/23.
//

import Foundation

enum LoadFeedResult {
    case success([FeedItem])
    case error(Error)
}

protocol FeedLoader {
    func load(completion: @escaping (LoadFeedResult) -> Void)
}
