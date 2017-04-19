From: Wolfram Sang <wsa@the-dreams.de>
Subject: Re: [PATCH] i2c: exynos5: simplify timings calculation
Date: Wed, 19 Apr 2017 21:42:59 +0200
Message-ID: <20170419194259.wqx4vnzczlnws3aj@ninjato>
References: <CGME20170223164733eucas1p11ad37a2334fe709a062ecc82b5224e1a@eucas1p1.samsung.com>
 <1487868446-5339-1-git-send-email-a.hajda@samsung.com>
 <0e74abb3-9706-b5e4-2428-553d33a61ef4@samsung.com>
 <20170419191719.bzp2nt3l7nxwdzfn@ninjato>
 <41071a5a-5a13-2bdc-a36c-909f15abadf3@osg.samsung.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="3pcm76uxsyazfomo"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from sauhun.de ([88.99.104.3]:44830 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S935553AbdDSTnB (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 19 Apr 2017 15:43:01 -0400
Content-Disposition: inline
In-Reply-To: <41071a5a-5a13-2bdc-a36c-909f15abadf3@osg.samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Javier Martinez Canillas <javier@osg.samsung.com>
Cc: Andrzej Hajda <a.hajda@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, linux-i2c@vger.kernel.org, linux-samsung-soc@vger.kernel.org, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>


--3pcm76uxsyazfomo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 19, 2017 at 03:36:39PM -0400, Javier Martinez Canillas wrote:
> Hello Wolfram,
>=20
> On 04/19/2017 03:17 PM, Wolfram Sang wrote:
> > On Fri, Apr 14, 2017 at 11:24:16AM +0200, Andrzej Hajda wrote:
> >> Hi Wolfram,
> >>
> >> Ping, 7 weeks passed.
> >=20
> > Known issue, there are not enough reviewers for I2C for a timely
> > response. I was hoping for some tags from other users of this hardware,
> > but that didn't happen. And I don't know this hardware, at all. So, I'll
> > apply your patches early in the next cycle, and we will see what happens
> > once they are in -next. Best would be if you could find other people to
> > donate tags.
> >
>=20
> I got a try to this patch on an Exynos5800 Peach Pi Chromebook and all
> the I2C devices are working properly, so:
>=20
> Tested-by: Javier Martinez Canillas <javier@osg.samsung.com>

Cool, can you test his other patches as well?

http://patchwork.ozlabs.org/project/linux-i2c/list/?submitter=3D47122


--3pcm76uxsyazfomo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlj3vcMACgkQFA3kzBSg
KbYPbA/8CkOr1DPFT2DBFj6sySsbFqkvkexeeeDzefHZBSq9BKww00/B/r+ABtYc
eDbRWEKVCVPzaf7UqLQ8w7JZCB674M82dwF0SQIo5z6WWCVqx+ub8ySVZWzxnjJb
sjcuuow+ZiTPlO6x4kMvMzBXdpwoxjfdp/U30E8tJ0JPdFWtyrZw1mkVMg/XgaGe
9HAf5vpm9viKg6W7h3StOuE9t7uSnQAWTov1K0oWLCS4XDhqzzkw/JO74UF9GmgT
DPGE4WfcWrBbhd/LZlzuVZsMj0nCZ30sZ9gIdPJLfyBAY1WU5L4v3hfEVFzihvEm
4QChNxG4w1W4cPDdly85uI2IdU3emmdVk5AAh5Z1VEohNP4dBv25KnkjPKOyfpB9
d8P2naOGk9kJToM6cQN67EOUF0rEo304tLOnAgmMWxWfEdNdplarhKQIwjPCdGgJ
RbtVh/DQ3h1LaFBapq/J47BMNBEPsF5yQ2kwJC9tHCg07z2VLnBTz3Gm8jljckGV
d3M456OfLPI6ZzEcjxYzCa8mG/VE7qecRMQZXFCUreBMmphDaMclFE3hkSTroOP/
RzGQvYV/WBEQkh4TXcxodTIOVTYchp0ZSHW7RI3zF0GQAWrZZabTwOSwA4/ZdXmi
jUZThiOdXOBOg/2fEXubUErXrQjQtjpNS2hVOaAyj8dVxTTVw1U=
=Ow0V
-----END PGP SIGNATURE-----

--3pcm76uxsyazfomo--
