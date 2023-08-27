//
//  RemoteFeedLoader.swift
//  EssentialFeed
//
//  Created by Hamid on 8/13/23.
//

import Foundation

public protocol HttpClient {
    func get(from url: URL)
}

public final class RemoteFeedLoader {
    private let client: HttpClient
    private let url: URL
    
   public init(url: URL, client: HttpClient) {
        self.url = url
        self.client = client
    }
    
    public func load() {
        client.get(from: url)
    }
}
