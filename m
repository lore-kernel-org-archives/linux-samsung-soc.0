From: Wolfram Sang <wsa@the-dreams.de>
Subject: Re: [PATCH] i2c: s3c2410: Properly handle interrupts of number 0
Date: Fri, 2 Mar 2018 14:58:54 +0100
Message-ID: <20180302135854.76ue5jzsg7lvxjxw@katana>
References: <1519936484-23132-1-git-send-email-krzk@kernel.org>
 <20180302111931.GX9418@n2100.armlinux.org.uk>
 <20180302124647.sfhnto77wgdh5sv6@katana>
 <20180302125907.GA9418@n2100.armlinux.org.uk>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="qduyl4kuhqqt64zz"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180302125907.GA9418@n2100.armlinux.org.uk>
Sender: linux-kernel-owner@vger.kernel.org
To: Russell King - ARM Linux <linux@armlinux.org.uk>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Kukjin Kim <kgene@kernel.org>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org, Ben Dooks <ben-linux@fluff.org>, Dan Carpenter <dan.carpenter@oracle.com>
List-Id: linux-samsung-soc@vger.kernel.org


--qduyl4kuhqqt64zz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> It needs platform maintainers to be motivated to fix it, and one way to
> provide that motivation is for subsystem maintainers to say no to patches
> like this.  If patches like this get accepted, then the "problem" gets
> solved, and there is very little motivation to fix the platform itself.

Yes, I can see this. I will drop / revert the patch.


--qduyl4kuhqqt64zz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlqZWJoACgkQFA3kzBSg
KbbwWA//QJ9t2r/ZctCbRotFORB7QcXSS64fK5vjCKr9VutQG6McyfbKRh4jqbkm
KaE1RWdz1pMqMVRqc+gRfOM626ehi6skfbDC36SBi5DjuMhyi/JarkOBkhIOmeEt
dHhuLGzRZYTG4ZRVMJNlk8Jbji/CZoq30b4ZZc4koQ5Eg2uT254gfAzFhgRkK8OH
D73o1AYqA544eyMWOiaIVMPaPaywwoYWWXYlVD0tc5KbjkYXe/kcPFi4aRfBvzoU
U6v6+TfRMjQYITpth93nJtr4RAy+2wiCBLRgTwf8SK6u30wtUXSks9jOEfK1/ZaN
VReruiSYOlztKIj1jUYnRXw8XLdpKYBKweTti7LQWfCmTfl3eVUwGNRneZdrSPBG
3+L0bIXesKuvmTHTZMYN7E43Qdt+nNh0sokKmR1ePmex62iV/jhlXVoWLK/2R+r3
eLgp21NpTd3TnXgPsVQeEbBnaG9BaAg0zzhIQXlVa/GTZ/74Wvnvn+oh16FnDnQ3
Fm5Zequ2guDJeVYTL3ApN8pxoKIzpysZBarc1FWjSXRL6nomduanIxk6YWz3yD5H
uG7nVw/TQU4np2v1E/vZBhV7PxO62W1ljVAtK322ACHTWrDoAEfTk8xFLGavrzZX
RbYuHJk9mi+M57Bw18EyclLFuqBkdnSzI1gSqQrAyT4LruehgdA=
=5sEx
-----END PGP SIGNATURE-----

--qduyl4kuhqqt64zz--
