//
//  RemoteFeedLoader.swift
//  EssentialFeed
//
//  Created by Hamid on 8/13/23.
//

import Foundation

protocol HttpClient {
    func get(from url: URL)
}

class RemoteFeedLoader {
    let client: HttpClient
    let url: URL
    
    init(url: URL, client: HttpClient) {
        self.url = url
        self.client = client
    }
    
    func load() {
        client.get(from: url)
    }
}
