//
//  FakeArticleData.swift
//  NYArticlesTests
//
//  Created by Muhammad Qasim Majeed on 06/05/2023.
//

import Foundation
@testable import NYArticles

struct FakeArticleData {
    static let fakeData: FamousArticlesResponse = try! JSONDecoder().decode(FamousArticlesResponse.self, from: jsonData.data(using: .utf8)!)

    private static let jsonData: String = """
      {
        "status": "OK",
        "copyright": "Copyright (c) 2023 The New York Times Company.  All Rights Reserved.",
        "num_results": 20,
        "results": [
          {
            "uri": "nyt://article/da2b091b-9cf3-572c-8dd7-443977a9f097",
            "url": "https://www.nytimes.com/2023/05/02/us/texas-shooting-suspect-arrested.html",
            "id": 100000008888648,
            "asset_id": 100000008888648,
            "source": "New York Times",
            "published_date": "2023-05-02",
            "updated": "2023-05-03 23:42:18",
            "section": "U.S.",
            "subsection": "",
            "nytdsection": "u.s.",
            "adx_keywords": "Murders, Attempted Murders and Homicides;Fugitives;Cleveland (Tex)",
            "column": null,
            "byline": "By J. David Goodman",
            "type": "Article",
            "title": "Man Accused of Killing 5 in Texas Had Help Evading Capture, Officials Say",
            "abstract": "The man, Francisco Oropesa, was caught a few miles from the site of the shooting, hiding under a pile of laundry, the county sheriff said.",
            "des_facet": [
              "Murders, Attempted Murders and Homicides",
              "Fugitives"
            ],
            "org_facet": [],
            "per_facet": [],
            "geo_facet": [
              "Cleveland (Tex)"
            ],
            "media": [
              {
                "type": "image",
                "subtype": "photo",
                "caption": "",
                "copyright": "Raquel Natalicchio/Houston Chronicle, via Associated Press",
                "approved_for_syndication": 1,
                "media-metadata": [
                  {
                    "url": "https://static01.nyt.com/images/2023/05/02/multimedia/02nat-texas-arrest-1-mgct/02nat-texas-arrest-1-mgct-thumbStandard.jpg",
                    "format": "Standard Thumbnail",
                    "height": 75,
                    "width": 75
                  },
                  {
                    "url": "https://static01.nyt.com/images/2023/05/02/multimedia/02nat-texas-arrest-1-mgct/02nat-texas-arrest-1-mgct-mediumThreeByTwo210.jpg",
                    "format": "mediumThreeByTwo210",
                    "height": 140,
                    "width": 210
                  },
                  {
                    "url": "https://static01.nyt.com/images/2023/05/02/multimedia/02nat-texas-arrest-1-mgct/02nat-texas-arrest-1-mgct-mediumThreeByTwo440.jpg",
                    "format": "mediumThreeByTwo440",
                    "height": 293,
                    "width": 440
                  }
                ]
              }
            ],
            "eta_id": 0
          }
        ]
      }
    """
}
