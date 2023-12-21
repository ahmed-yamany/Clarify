//
//  Promo.swift
//  Clarity
//
//  Created by Ahmed Yamany on 21/12/2023.
//

import SwiftUI

struct Promo: Hashable, Identifiable {
    let id: String
    let title: String
    let subtitle: String
    let image: String
    
    var imageUrl: URL? {
        URL(string: image)
    }
}

// swiftlint: disable all
extension Promo {
    static var samples: [Promo] {
        [
            Promo(id: "1", title: "STRESS LESS.", subtitle: "Make mindfulness a daily habit and be kind to your mind.", image: "https://s3-alpha-sig.figma.com/img/3f0b/4dea/4fc1338bd8c53bf51a7d5f218b9720d8?Expires=1704067200&Signature=Q86qaRBfOKxzLmDoflGcLv0hdyf0X5-FWR~50m8-WKaTR33aXFiuyKUvu7CvF~XSbSbAYU~Y47YcRvZJOi8IONN6iCDxzN2fgVPA8LpqeRD1g1eyx8HVHHw5Y2JZW8ibYv3OkzXQ2nSVjV1~2xQSnWguq4gPvaGYbSuflXsMviTjLoS46qlAUqAcYvODegrT-Y6RbsAcwA~zcY5mgmMep90zpyL1PdWTEofBPwSiM4kECrbzx9sZBj1-fdd59lrCPG4nQTD7TH62o4Q9C-sDWW1I61ZjZ5buXZEYFAvcqdEXcq8o1Cwq68L2JsW2MKWIXv3Vp6tJt-as37Deq8rGPQ__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4"),
            Promo(id: "2", title: "RELAX MORE.", subtitle: "Unwind and find serenity in a guided meditation sessions", image: "https://s3-alpha-sig.figma.com/img/c909/c60c/8ec9c4bf7dcf0ca84e03c7adab61831f?Expires=1704067200&Signature=cLbJVWGF1AgzomnAbqaPxUGxmBWHhFQgrAxJF~T0YXuhuBagY4q3JiM7oayt8tjbs4dq8s3stRMKi0WQle7I70fNe22~sLIbtYSlALnN4Zdm2EQLOLhP~0AZQBjz6UTs2SqkyoURtzhQzh7AwkE0f7oGR3bWSVBt~VYKd-IywnVJeiLy4G5SumTjpnyk3xp1K8OkhPnzDEgqDxZY~by3l2OiFqUJBZaRIIYc4edfJCUwjotselrJxuCk2VYvFQ-8TSQshBvpE3eshZ5nrhx5rwGMZP~sxQ-3sYhflc45UsSHhIbJcUT0RUIpOKfHbxFmrhcPbnZx4stDFDIC-bkCVA__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4"),
            Promo(id: "3", title: "SLEEP LONGER.", subtitle: "Calm racing mind and prepare your body for deep sleep.", image: "https://s3-alpha-sig.figma.com/img/65a2/0e06/fddee9dca622c8c08cc306d9f193e7b1?Expires=1704067200&Signature=Ftj1LLfwKVsOAf9c75COaZ1IqO~4vbaQIJC4p8xuFajKPOpO~ds-AT8j0-MYkWWgh3fysFqb2NgX8hkGA0-R~Z5GSszmNsWdxQdDy6KE3h5KLhB~5ZzvTWEW9au-rqYQja~imldl41K-QWmxL2nRjsVSvW-UJF7XdCiXfH1~5OvcZICtD1zKOCxF3HgURM2WN4yCe4SUhBjb5VRWKRpyXGzRiF15-zbRlJDMrX4fmMQOk3xhpxSCwf5TOv-ZOFGCVARXy3gMSLqhCwmdKeaoanjVokEIsgDujWBsMZZm~nhlMj5mbxkoHaCaOxzcNk3rjcIFr79bMSjJlDduiioYsw__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4"),
            Promo(id: "4", title: "LIVE BETTER.", subtitle: "Invest in personal sense of inner peace and balance.", image: "https://s3-alpha-sig.figma.com/img/7840/bee2/4da1027028a6f470c3cf99c7b4c668a9?Expires=1704067200&Signature=kdAglHxnU8L5VAARkAt7-pCg9qZ~Q7-cO4U3prL7DiiDrQUDzPF8g2Q2nef4Ia06xSAl07pKxAcpXTabwHsWffTbOzYtYVLHeYroAkXc6mhLWEAbeTD748A03XbdwPlVkmrE1WNtthir2Dd2CJ3~LI7gNaWRB1d6hdLBzh8AE6syVAIPXKZoUaXHXQK9N2O7nqh5M04vJ0HP9pv5X40QkCOntYkvg~mufg1hVbXOMbAdjCJzRKqteqeNXlPxs-Twmx7ImDRIo~wtGQbJK-GQ1EmFf4FV7~iTkVV-EpUeWjDpXPNxdQ~GVN0tIr6j3KQ~3OjJ7eggl54oSPurFOaljw__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4")
        ]
    }
}
// swiftlint: enable all
