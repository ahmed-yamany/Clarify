//
//  MeditationType.swift
//  Clarity
//
//  Created by Ahmed Yamany on 06/01/2024.
//

import Foundation

struct MeditationType: Codable, Identifiable {
    let id: String
    let name: String
    let sessions: [MeditationSession]
    let image: String
}
// swiftlint: disable all
extension MeditationType {
    static var samples: [MeditationType] {
        [
            .init(id: "1", name: "Focus", sessions: MeditationSession.rain,
                  image: "https://s3-alpha-sig.figma.com/img/da1c/bc93/0dd05609e70cbe28888b402c248b49f5?Expires=1705276800&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=EKabJRvahNtv8H3XZHhrTkeayetF6hHR6s-orhFaR66BnMIm3qhIrbBSVIWtOtuAoKLWsH22Oip~dM1jDOWM1S0IDahfNo3sKc4AS3wa-wGoO9K8Mg6jVWRRI0vxIRXKnDLwzuofZWBLZ0xTHWdRQJgPb1JylL~FVLZqCDBb8mZzcb~DC9z0d0rTNxzHrYoH2Y9vH3HgCAGHPXEiv5FZzrsB524s-ONKhQvUS0~Z4F59XjFX3ivUXvo5bV97B9hy8JlmieQo8eYPWIh6yfcTuxINOoCYUAHgHAn-EfhYpPPqAOxzweRucBUjSztsXWAoqZ6Y2nB5gftBNw2tmBNVNw__"),
            .init(id: "2", name: "Sleep", sessions: MeditationSession.rain,
                  image: "https://s3-alpha-sig.figma.com/img/feec/a3cf/97811f08be8fabf650ee0b4104ac10e6?Expires=1705276800&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=OSO5SrO8PboUH8APZDVXgmIBV3qyhpcOC7ySr-2MqZPKeQ2h5N~Jfh-RaVij5m5~8B20jm1VSeuiUyHkYkeVdcyXMJTgNTgU9xUFiDXAWolp-8-Z~8Qp34wrRhS5uF~sy1y9q43fmbw8Rn3pLbkWffaYOJsQAMzr2xN61kzBvwYQdsZS9RdasbP0wSKBM5ob-J0PorLk2g62CsYsJh5pDc1QC5HkLv7zUXwR~trViyHLX1JtY~7rNn8GvfUjkDNCn0QaEEfkodauNLnCIi4s90dP3TeUk91jfdT28OOiIfNWEw1j1xz24hpkUi6ZGtHofKISlyB4UVWeymJIcNXm8g__"),
            .init(id: "3", name: "Relaxation", sessions: MeditationSession.rain,
                  image: "https://s3-alpha-sig.figma.com/img/6446/df36/dbe74bc35c40fe7e774d6fde81bc03fd?Expires=1705276800&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=Cs7lz2a-85IebY3QT1eJ1yD4cYX-O3BvzEAnJ~c8DdNyDlSl81XX3IZlOF52UNH0dBs17Eo3wCwLc8U7MgD8CbdDKsy5yXFhKq6sozKWmZrQiC0fcv9Fi6YoTd-AsTJ1i4rsqBUHw~jSWIbNGl34QSkWADN4nmIaFOFC9MWAAdLK~OsKYuUJO0zRO92wH0qLVlbndRrCOjnoAxjP5DtKNSUUcCxcC6KGWJhbXV1BubeV20taih6LSJ8vmt05MEdeqHFfrkiPDiniWt4t-AkncZRfMSAf2V15bFRuPw7UWPi0YcC68YR67QdjN5ANczMe~AIHp-lVOGmL5ceXXLy7vg__"),
            .init(id: "4", name: "Music", sessions: MeditationSession.rain,
                  image: "https://s3-alpha-sig.figma.com/img/4578/1da8/130b713a4dfb93b876f1e47933c17a9a?Expires=1705276800&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=bOlQxXwn2iE6QastUPMb4eGkDVKOWzoE6ojejdLXdAYcT7xJ1v3vvDWpiv60oYkePNY-QZg9oCL-Lw32n4H-QgQzaIbOmAoOpsQhFPYrY6lXU5GaSGADAVo8Zn1kmRThcqsLNkN9IxLA2iZwNSmQbMihjgaMXjSUvFBMZXNpry1pMR0vclKkLtMOykVgmyZ9nBR5sPPVpwO-q9~cVGnNt8DnUrRiJvl6iI1hKCkqZwVSkfhCdoF92KdrTjevF8R4HVDIH1XO4t9nIZXZNO1dHsWIu-8GZaM3GCKu9F8kHA3U6LcXzbl~2ZKnBB8bew~v6JFLe4QVwu~nr9RZg3YEHA__"),
            .init(id: "5", name: "Wisdom", sessions: MeditationSession.rain,
                  image: "https://s3-alpha-sig.figma.com/img/a4a0/2628/cabd302ddee9cc5565d23c4c13f71025?Expires=1705276800&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=iOHcsL1Rtnw-6Pfb3gexDeTbxpIY9msK6FdAtTinTerSPc660517fJ-vVIN4p9FtmfnYUOHuN1kBCGFBaWoagZF2A-9hmpuzjONW2lkfghs0Q9FwlEldVbOeKBmwT66X3EAsG7NpnClUne5~p17a8PUiGxwxfIAVEiw0hCGLaquWCGrGOqNMzSUvQYSzUP7JwrqCHRLZtBNpIfDVQKCkE9oajJBoKlkS331GEJ61K0uAxpZaq4EOG5EPKm8~J1q81Ddv4lndi0gORB0p1jkkhaLl3c8dDzzdS-I6LTGm4L8sUgnBMMhujq7jSBVw58Yw1-cPO5CqLwd7HY-vrNKBtQ__"),
            .init(id: "6", name: "Lo Fi", sessions: MeditationSession.rain,
                  image: "https://s3-alpha-sig.figma.com/img/8c8c/2df2/8296447f70cedc508095e220eb7ba1db?Expires=1705276800&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=bVGaRskoqTDMRESyAJ3xd-4B6g58sYIpPL4ZfquRFSXZtE4eTeiiWgUYrKH3PkfabA4dV0uxOxNbf44iQhBGfQWdz4LB0yW986xEdfxEu9uYsvAUv0aDk4FCf-qFLtD0By9W1Fb8vsc0gh0bxr1HENli6YmSN3CPWMqZgczIyblDTquNGaGw09GXj-RDTWqcQdQXQehEeOZl7QdM3g7xAM~NLD32BVEwUtlA1TpE6d--ghEkEoRxNQ8rFYDWSz01xIJeCTy2TdiE~DjB~9-Lih~fPeToFGDUo0OtVaGW0z71OXdTPY-FGDZ7E0yHMzCuugWohXJVTeX6jjjmt03w8g__"),
            .init(id: "7", name: "Nature", sessions: MeditationSession.rain,
                  image: "https://s3-alpha-sig.figma.com/img/9562/93ff/5582ccc5ed0ed382a71d2c8e55c2d19e?Expires=1705276800&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=RVunY8szyfGD7bSTv6iBrHyYg7FErExf6MskEXWWVC18c0kieNxA91KaNynkovPV~zs1mExfKJJRbZaOgedNy8EoSrkTDntRbL46F2vMycO9vnl0tV36Ec8w1KWa0ka8gb2EHj6~iAFgw6f41I4EFtUEG1qMGYZsyHDIRgCHMNM8~kzmnn7WCySloRO-0X6ty82Pxbmpkdx7xOOy7Gyl7j9U9lSmbu1T7JCNqXLHtNOpRHh3OtMqB4QuTMeSVfnUvpCGtpYAZGcY79CF5S6EJO4LCAJI4h6PnYBt9sN8HYrVUO8BOCJOWT0ZMVvp4qpckWCsXN-gsHtr4pabDtgjzQ__"),
            .init(id: "8", name: "Binural", sessions: MeditationSession.rain,
                  image: "https://s3-alpha-sig.figma.com/img/bf59/d6a4/c6ea26180a2dadc56f5d247f91e7c13e?Expires=1705276800&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=RiCjYQ-leK5FRlFHDM9Bdrtt6sTwrB2Z4NftFm7bvKMIyxdjUlmnwRuHYf0glbC3AhkdeIMWh-j9sf7JFMQsBEb7y0OWpUoaUIgu0w0qfV6BkjAcS3FC8uz3bHAtwcEi23oVab-LMbhzbGqUw8NjDcqiHwTe-wLf9qGOr0pwTIlYSOejN48x2eRw~GGOr-PWEltl8zYmLGjfRh~cW05sfsyeUpjWdxa1MTPldGX~5IAcPcmmiR~Rhrztm57E-7hvQ0ecOt5T2uhn7mUszj04GTvs~tvQJ8P-u8fh2FoZpKwnPnN8m96KNSLri~CX-QpeJM127YN8W-2Z1NB-sM0CWw__")
        ]
    }
}
// swiftlint: enable all
