From: Wolfram Sang <wsa@the-dreams.de>
Subject: Re: [PATCH 2/2] i2c: exynos5: de-duplicate error logs on clock setup
Date: Fri, 21 Apr 2017 14:04:15 +0200
Message-ID: <20170421120415.3w5agz6txiemlzm5@ninjato>
References: <1487934962-8703-1-git-send-email-a.hajda@samsung.com>
 <CGME20170224111634eucas1p28938c94c566c0aadf6dc7766b4eb96d9@eucas1p2.samsung.com>
 <1487934962-8703-2-git-send-email-a.hajda@samsung.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="6b53tlmnndjdbarg"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from sauhun.de ([88.99.104.3]:55322 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1038154AbdDUMES (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 21 Apr 2017 08:04:18 -0400
Content-Disposition: inline
In-Reply-To: <1487934962-8703-2-git-send-email-a.hajda@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Andrzej Hajda <a.hajda@samsung.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Javier Martinez Canillas <javier@osg.samsung.com>, linux-i2c@vger.kernel.org, linux-samsung-soc@vger.kernel.org, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>


--6b53tlmnndjdbarg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 24, 2017 at 12:16:02PM +0100, Andrzej Hajda wrote:
> In case of clock setup error it is enough to log it once.
> Moreover patch simplifies clock setup routines.
>=20
> Signed-off-by: Andrzej Hajda <a.hajda@samsung.com>

Applied to for-next, thanks!


--6b53tlmnndjdbarg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlj59T8ACgkQFA3kzBSg
Kbb3aQ/+Ni6ISigMnaMevvfIFrR9oR3a+6eWsX2vDdwrS5yEgnJzNrbCtgOWzH8Q
N0xQLCShqpKWz0cduLR9gPwgN2c6xGbxID0BAoFLggfWJyQvPRU0jQ+svf52CDeF
Coy54t0F1JLJr5UelE+rVKDq5m6wegr8C+qEE08iF9XBvSJDqrqkLlDVosuxg5cJ
pw9jXOhAcQVFTegT78lDPQ05S1ucLCATpgtgnjd9cp0Wh05wdinUv2rOBEHZ5WX1
Te2goX5cjCkGBuoa7A6FfSnVkCS7a+MmRN4eHHC5+T8fO4WSp/GNOuZiHzb9LPQ0
m54yOhOuQZ250B7BTo1FCeQ/NSZGvRiDE7HM/8TMxe1UflKMZh3jshmp7VvXdM3s
tPGLBuWQoW3IsxPaPoXzBbJPu3QE5ZUC5L24gZmWoq6KY2Fs4VUocCUcNW+5krSd
IRS9B4qY+g+WzNoQt8YEyKenmQbF5YyPglTZjMa2Na1G8Ge5LYGHLkEJFAFl9FH4
tSq7zbXvts6IQG+OMobAAiPFiPgafQFwBknJzSAoHpf+4H/fFXv5SmywnNAgemq3
cQwLJl7dVYIOCP1PchCSKxoFLajtu88iR2BT0jF0+iITsDdUhO5SIILcRy6uarKN
34hdBr0qr1/oxvC5TMnHFBZgT7O85TJ89GhFoH6uHkvK8JVgRog=
=dC6K
-----END PGP SIGNATURE-----

--6b53tlmnndjdbarg--
