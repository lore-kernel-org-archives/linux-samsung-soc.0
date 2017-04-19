From: Wolfram Sang <wsa@the-dreams.de>
Subject: Re: [PATCH] i2c: exynos5: simplify timings calculation
Date: Wed, 19 Apr 2017 21:17:19 +0200
Message-ID: <20170419191719.bzp2nt3l7nxwdzfn@ninjato>
References: <CGME20170223164733eucas1p11ad37a2334fe709a062ecc82b5224e1a@eucas1p1.samsung.com>
 <1487868446-5339-1-git-send-email-a.hajda@samsung.com>
 <0e74abb3-9706-b5e4-2428-553d33a61ef4@samsung.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="bdkaqahf7az3gbhc"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from sauhun.de ([88.99.104.3]:44647 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S969218AbdDSTRV (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 19 Apr 2017 15:17:21 -0400
Content-Disposition: inline
In-Reply-To: <0e74abb3-9706-b5e4-2428-553d33a61ef4@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Andrzej Hajda <a.hajda@samsung.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Javier Martinez Canillas <javier@osg.samsung.com>, linux-i2c@vger.kernel.org, linux-samsung-soc@vger.kernel.org, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>


--bdkaqahf7az3gbhc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 14, 2017 at 11:24:16AM +0200, Andrzej Hajda wrote:
> Hi Wolfram,
>=20
> Ping, 7 weeks passed.

Known issue, there are not enough reviewers for I2C for a timely
response. I was hoping for some tags from other users of this hardware,
but that didn't happen. And I don't know this hardware, at all. So, I'll
apply your patches early in the next cycle, and we will see what happens
once they are in -next. Best would be if you could find other people to
donate tags.

Thanks,

   Wolfram


--bdkaqahf7az3gbhc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlj3t7sACgkQFA3kzBSg
KbbSDBAAmifYPqEHrgYGDfN1wSIXvMkxEKmST2ica8fzwDAtd2cLrZvgnRhFdVev
2jwjX0rot31ftKrRkilAc9CbrgRadtoqP+O90s9w7wu9rdhPf0kftuulvdAslXeO
RWTFKkXeIQKv540VNTWjtR3Gh41bd4khxU/zpjizceV9fhrRYjiXJct2PiFmNBLx
Z8HGnKzzlRI3DXuZwi8/FsEkgNpfQ/CWrs+b1gvZ8Y2NEyfs5yNl1MBlVBtelJ29
ZXr6yS0C+15xWT+HmjAqUNVAbh7v1k39813J/3rHhx5YWzDXeenoKfiem6YsyiUr
wMbD4pUUYaC/GjPfBRthC5jT+uqXMiTB+qeH5HLl04/gvwZxHYcNNdVLHaF2WYqX
zHVms7ReKjnjQ2yGwCetMKP1PXT57Tj6M3znVI4CshcdZLxsu65QgugdxswJNZwP
/yvSaIkOzgOAZkn4dtGJvUHFBl8hqDH92vv6ZcTCPt+UfjSLu27Qm0KkaciAVqoi
77Ymj2A3WZmQYY6tKLkIFlCpAIAX8p6fosweOR1Ng6dra12MkifOOr+4WVvusGld
C/XhJk5IdPndzTJlrbDezLwZxTIiFGGKJOy1cbdVBzZPqnacbyzEjpAZKFpMQUTs
Md0GZUE2xiUCYrRu897psWCqtsJo2HPOxRuzmqyDSj9vLoyYvtU=
=aB9a
-----END PGP SIGNATURE-----

--bdkaqahf7az3gbhc--
