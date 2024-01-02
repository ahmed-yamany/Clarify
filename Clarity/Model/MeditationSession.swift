//
//  MeditationSession.swift
//  Clarity
//
//  Created by Ahmed Yamany on 30/12/2023.
//

import Foundation

enum MeditationSessionStatus: String, Codable {
    case guided = "Guided"
    case unGuided = "Un-guided"
}

struct MeditationSession: Codable, Identifiable {
    let id: String
    let image: String
    let type: String
    let name: String
    let status: MeditationSessionStatus
    let time: String
    let rate: Double
    
}

struct MeditationSection: Codable, Identifiable {
    var id = UUID()
    let title: String
    let sessions: [MeditationSession]
}

// swiftlint: disable all
extension MeditationSession {
    static var sample: MeditationSession {
        .init(id: "1",
              image: "https://s3-alpha-sig.figma.com/img/2a38/ad1a/d9ffcda8b4ac57580fa368032f146aa7?Expires=1704672000&Signature=eCdDsI~SYzQ22ftwGkLUHZVl87ahelIYan9yi-qdiQu~9DzckgxBo0Untzp~eqhARm4zoY8kXGEMX0ssGKdJFEHWzFaepjvX0rfGNThwtoMR4xd-WWGXj0Ty4SwrfbCQ7nYYH9jA9tcN7UYvaf88i3JP~zd0ns2WYwlpTt93FeGACMNPhiDA95cQNOEqM9ZF9r7D2ukdYD3sdFqlAcT1aKODAyp6b99aY3R-p2QUl~w-Ht2KDYY3b-jkjJyHQYSHdQOhWPHDPoRZKfIvfzJsY65x-UyFz1rk5ibTGiPqwrMXkGrmZ02wQ6uWvEBoPy~XrYSDt8tzPrBRJMKdDgYOWQ__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4",
              type: "Beginner",
              name: "Wondering mind",
              status: .guided,
              time: "12 min",
              rate: 4.8)
    }
    
    static var samples: [MeditationSession] {
        [
            .init(id: "1",
                  image: "https://s3-alpha-sig.figma.com/img/d921/074c/170c9ac6e398c2bbe0265b9690594b7b?Expires=1704672000&Signature=GXSZA5Ly2zbUs9qQMBi~Wxw1MHFXFpDO5mxpot~b1RKgBNPnKbL-LbevD7uKtCRQ8G2oGp6wTuESF~EUeP8GGBSyf-nlbFA4lZS3-nzsRHkc9CnGWBOgEwiYic7ZuJ6dvLfDLaUaUZ43jAwW-MRQqoljhoYyy56PnDOfNMloPZXKHxiRyD4Pxs-3bbxgyz4FNXFD2BjavjNRVBOWv7CjbBYSyb1NBWM1rRxxLFo2-W1Sn4IUqd83Mk2HZ5prCEZ03djMcAu0IxCLrJMkK4TSIq7auWcoC-UL33hGBvxOChrBBAZQpu2Zt9fZhXsCgljQ1wOcgaFkvwbnO964mIsN4Q__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4",
                  type: "Beginner",
                  name: "Deep Sleep",
                  status: .unGuided,
                  time: "8 min",
                  rate: 4.8),
            
                .init(id: "2",
                      image: "https://s3-alpha-sig.figma.com/img/feec/a3cf/97811f08be8fabf650ee0b4104ac10e6?Expires=1704672000&Signature=mUrUidVb0WB3DwrKoTCtyCHQ-73NXoY76APzVQmbwnZeq4DvO1P2VYrqunNoULzj~sg~BMqNp2FEmxziSoYJkt0VqMlu1prwMUkv3tV~ev9Kq6Y6ggvhrE7g8-nmbiQLRJBQHyFDuv9hW5yI5PFhEc5QzuZcMm1-Ho8N1bQrIWZ75D7W0vFUg1wcrwzVBIJbU7ApQn25iY4BgJC8b0GIL~JKizJk~yNPlVodD2vpSjFplmvPnHzG0nCSMgmvCLz~~bel7YoPzZT51zKb3TDTir0nqeyG~A8RYuaHSbmpyTLDWdh4BYrcAvWDTWtljmhd7uOPO0d7tN~Iq8uz87fvLw__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4",
                      type: "Beginner",
                      name: "Fall asleep fast",
                      status: .guided,
                      time: "15 min",
                      rate: 4.8),
            .init(id: "3",
                  image: "https://s3-alpha-sig.figma.com/img/9562/93ff/5582ccc5ed0ed382a71d2c8e55c2d19e?Expires=1704672000&Signature=IbIzlSjM5jP1hfO6GyuVzqdpScV0Mp3OMx8y0oCcgP3yNLi0FcEvEhpkbs7S01t8N92m7yaXi09Oh8rMdCKULtRDt7KGKD8ZysHNKbGloS2eSPBMADbVLmjmNpQKTskTvdzCqTPzUzlhu~gR8Q5JO3AoTBuHg3xk3AV1Yy38kEPScjWzoYH2mwgJ86WC8BsxLS-4C570KR1xHgMbVTOL7oAv-ZUZSAdiGlNLHX7sIX8jQL8mVItCHDwYaQF~yYPuR9G8VhHwHTKAp71Spk~vYyl8rPtWdALM8rfGVRzhol3yWxSB596rjkon5C-8gvMbsdw~6JkN46BnGrpqEx9Gpw__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4",
                  type: "Intermediate",
                  name: "Sounds of Nature",
                  status: .guided,
                  time: "4:25 h",
                  rate: 4.8)
        ]
    }
    
    static var trending: [MeditationSession] {
        [
            .init(id: "4",
                  image: "https://s3-alpha-sig.figma.com/img/e5fd/9b8f/20ff5d446b26c16b91a905d48458240c?Expires=1705276800&Signature=DXpJGDbqbWfUAt5OVNOvSzvHQjoiP5q35LfbxAjk3Iy5xg6C9ZJu4UxQsBovNKVcJnUmiWPbhWMQYmfT~GtjIRxCC-IUvnVjYnOjRxWRjex05iohlquDo8ZnUUN775V1MefGkVfBIPn1B~ZIxga4xRtuVdGgBrnL2wPUQF0ut1mzhLFS1o1kASoGJFPApTexEYFiFBkYTW8PuiGZ6PWR0682eLcBq2GONamtccPtZK5zc~62znzaNTGJCgvufUlpa8aOpaJLLqGgm6tXFY7UjwpXhBaRkuch-RH9-Ms03FfdXZxvBqEN5O6D~49t9MIaUPY5G6bAeEoaDpvbJNsSrw__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4",
                  type: "Beginner",
                  name: "On the Beach",
                  status: .guided,
                  time: "25 min",
                  rate: 4.8),
            .init(id: "5",
                  image: "https://s3-alpha-sig.figma.com/img/4ee4/101f/0aefe60e15d8315db07fb95c1fbc17c9?Expires=1705276800&Signature=boHkOSijtZ~-ZqD3L8AglSFYYZ3t6tlPx9FBZNtAMGS722zhtJK9EXqOwBNca8cttR~t92IWdvsLQ-tJCL54xRVausSe7W6m-KTmdlA7~KH0ntwYNQdzThvIXeu4jIHeOOd5v0CJlCy3twx-TIdwTMDtzKrqFij30GuYnsxCwi3FzOIHnlTPf3HOxMRH4eai-CT1tFS4NW4g7nMfzSsQYTFllthIiKr1LTuIEHqSqlf5jXENtO3-0kiHYOr~CD9k~P98mKp2elnvs1O07xepZMIw9mbhPp75xvyfEfjO0UHKjeQFFy9ooxvRptVBGRUdazPn9EE58sm312eyC9AiVg__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4",
                  type: "Advanced",
                  name: "Jungle Waterfall",
                  status: .guided,
                  time: "25 min",
                  rate: 4.8),
            .init(id: "6",
                  image: "https://s3-alpha-sig.figma.com/img/f2b7/90ee/45b8e67767bb94134ff7a598516c2a59?Expires=1705276800&Signature=Hf-utXT4Ue~4jCmmPS9bxkbZy-SEbZ2OZ-ciH36VdfrljXXcLUXUcLxgB7ansU8sRMVNqpDBsrjSnc6uyy9EhxeUfSSssyipdELBoUlA7iE6RuOUCYXtBYWJvtp3zXVhNEX7clGujT0DPirAy0tJ8btUvffZUv6bH5qYbfpbWXF5Tt-qywEh4gkOv50qxgR~pFgc6YvsLDdqrPtqfiXdVEyrB-rywWg18KyQhGVE5XCsj9iQP444~G6DAHa1OX0Rz7KMNlBoX~A3KxugSizmjNoWDc4Wa~ePFFvGFnl8ZAkQJcH3X2nHRbobJ83ZXsov8h1n7CP92Z3PN4F2Wr~O5w__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4",
                  type: "Advanced",
                  name: "Birds song",
                  status: .unGuided,
                  time: "25 min",
                  rate: 4.8)
            
        ]
    }
    
    
    static var rain: [MeditationSession] {
        [
            .init(id: "5",
                  image: "https://s3-alpha-sig.figma.com/img/7c6b/c0a8/ade6e1210718545efeb8991165767c81?Expires=1705276800&Signature=n1Ly0~uYXUp~E3uY0i0c3p6aL8iaUz08-WY96-zz2HSrRTQhxixcgq4GQ4ndKlYPHFmaxs840~VSjNYsjGX9BrTUNFonxGPgs9jfKUaw-KaQOy0myTC5Y-awOnlKv0JrpUtmsuJgP9T~KwinQoEe3p1K3ybMj9A3EQfxJmcfYTOrhU478~f9inF4buNag-VNm-eXPuWGs0C69MzN7EWF~aFAXfAvFPY6O3h1Ghk1PqrIjZN70FKoWoOGYZiorCo~N4zGwDG1r9NZMz5AipBb9zNSbK5YzviCyyvF1H14X4dKAL2UA2FiXo1Vl4u1IR3Chp44EQzFQ0Yim3abFoGKww__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4",
                  type: "Beginner",
                  name: "Gentle Rain",
                  status: .unGuided,
                  time: "25 min",
                  rate: 4.8),
            .init(id: "6",
                  image: "https://s3-alpha-sig.figma.com/img/a37c/4906/218f3a1f9c0a686c319290886efa41ce?Expires=1705276800&Signature=H6vxDUQaUBlSWYhYUJf4FDNS~d3Q1hweV9MfHgGS5Gh-A2ip1F13j6F9Km0jitn5tyvheFdg~OALDaNSo074ns0iQ~UHPSIr4agM5t5g1AKWh-3ywT2~Mdi2nUscyZkwTL~GIAYwmBlEwPpNf4s5g62z7aUwVgmjQufvN6ibfn00x0dH8RXhrQsMciF549nWZwhkZPZ1~et0ZUwdG4lpik1ftQ1ER7sx6SYIUwb-qkkSQULODoBxolSI~ggwlFmEsRcv1uggPVLGiaggxDHw-DFehfpLB86g-QFnsppe4fqrB~tKEI5pySJDlSv5d1a5VjhHv8PT29Ntbt4A2e-qRw__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4",
                  type: "Advanced",
                  name: "Heavy Rain",
                  status: .unGuided,
                  time: "25 min",
                  rate: 4.8),
            .init(id: "7",
                  image: "https://s3-alpha-sig.figma.com/img/37d0/5c39/1ea5ca399a6736b946d56845d9b7dd0f?Expires=1705276800&Signature=NMV1OFiH1E7c3YvWXXE1SJEpPKiZCHlporaO6qJAUQDwc8f2HA2HD5RChRrYvkIi0vs54PzsPaRHi1VBMXd2dE4Yv9vjDXyZnkixsfGvbMihNs-NRQGWQ01I-NhL0b4z4IqYYAeu4kY7xOOv6gtdNHzVFKtDcuu5iJ4jpiegA7TF9ZsegUAFHBT3XBIJ6CKu8RNsvzzhfVXTBlAZodbSyOmQsXo9gnKDxFkdvWnU6FL-afOVDtmhcMsBUCvVnrncOWU8S9Bjs6-6LxBRnC1k8f32HZP7724vOqGl5iRF0cwWR4gzF9fvTk7jdFEY3ewU7RL58Ou2nzIiszaDvzEvqw__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4",
                  type: "Advanced",
                  name: "Thunderstorm",
                  status: .unGuided,
                  time: "25 min",
                  rate: 4.8)
            
        ]
    }
    
    static var breathing: [MeditationSession] {
        [
            .init(id: "5",
                  image: "https://s3-alpha-sig.figma.com/img/5075/aee1/4a4a32584307fd3265238217290ea6d0?Expires=1705276800&Signature=bjgbBnd1T~pD3pAAX3gjbZQOSIJ731HUDlJhwLFbEs0jANxiRzcW7XDsSFXSgfel337UUKFPCb2Rb2bT~EpT7EkYlinV6mKfwyNHXXvyCvmoDbqkfCEds0ccGcRkQnY~bGGDmlHinv79fQyDkRT~0tfabLEklm2yw7xFQIib3~RS5QuUzwYknicmzM831S3vQ6ydITXltBJWIwfVv-CB0U1IcXcJ0yuIvGXFjaoSUEz3lwXLkq5h9~D9xWov--Ie~q2a1I8KeJ3Y0PA2kbSwAXJpc4aOFcjCMik4o3~nnRvyCziZNMj6JtwbkK4aiOrllKxipzLNF7skV354MT5qfg__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4",
                  type: "Beginner",
                  name: "Lion’s breath",
                  status: .unGuided,
                  time: "02:27 min",
                  rate: 4.8),
            .init(id: "6",
                  image: "https://s3-alpha-sig.figma.com/img/400d/861a/100901d40d386ebc86e1ba1808f025c8?Expires=1705276800&Signature=afwFAAmhmF0A~9U3hUshdBzZfJuiKByY2CB1vdLyDAW8DfhRraXzgcJrWc2G8nlHtW3wZoE46mBpkVu13qPsArll5vwPWn5nPo3rwXmSQM9s7v2RDk2DaV2-x45UIhmTrBV3FU9ZO~NA47c7vIiNQpV~QFTwGIx6s5VePPwZvY-z4OFziFkHTSqvHvb8VIUdab8SQCq9NQ2s2dM~sUPo-4-uHzNryeg-XwKnlwr1Z4dijGdPN9Czndi6rqnQXSCHf3kmRYDjYBt2uQO~~MjIAUMc1sFLMxv7Q3SjRw7rz8he-TuVTtUCKzqaP9Wy7HC~bOg6j~xw2DamDB8wFlmQEA__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4",
                  type: "Beginner",
                  name: "Sitali breath",
                  status: .guided,
                  time: "11 min",
                  rate: 4.8),
            .init(id: "7",
                  image: "https://s3-alpha-sig.figma.com/img/7ad5/d22d/1577c913655d7edcf2a349274cc7c991?Expires=1705276800&Signature=NM7loIMymMY9YO3UKxzB2~c01ZCOUe2j1ES08M7wY4SfJDMhmqlrIih76~8jN9IWdhNtoTZU7DfB15Y12WZ~yFL1p0qpoLLg1bIHW0xUKj8VNBL88kV~SR7BWW346jiEerg9RBZj~DnA8ZyqZ1~Gekn5gsfrVMePfGd9SATGQYgu11CVL1IMpU7ybOYPo5LhIqmdNXCbTGVicLTt-SiUqpln79t80eDl-VJvfioRkl5bBo7PGl3ECpUzbBgxkreBTgqtU48CG9Uy8UgLS2~69SLNf4-skSeScZtBWFwgvT0osR-tFK5egKuSRyyd7ccqo~HvRDF1WVKKmvh54H-axQ__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4",
                  type: "Intermediate",
                  name: "Diaphragmatic breathing",
                  status: .unGuided,
                  time: "02:00 min",
                  rate: 4.8)
            
        ]
    }

}

extension MeditationSection {
    static var sections: [MeditationSection] {
        [
            .init(title: "Rain and Storm Sounds", sessions: MeditationSession.rain),
            .init(title: "Wandering in Nature", sessions: MeditationSession.trending),
            .init(title: "At the Beach", sessions: MeditationSession.breathing)
        ]
    }
}

// swiftlint: enable all
