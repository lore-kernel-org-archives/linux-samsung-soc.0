From: Wolfram Sang <wsa@the-dreams.de>
Subject: Re: [PATCH v2] i2c: exynos5: fix arbitration lost handling
Date: Thu, 23 Feb 2017 13:03:15 +0100
Message-ID: <20170223120315.htz7gcfmtudmt224@ninjato>
References: <CGME20170222110438eucas1p2329ece7afd9e22ba185da64ccf4b2981@eucas1p2.samsung.com>
 <1487761474-11547-1-git-send-email-a.hajda@samsung.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="guxdo44meikh2ajj"
Return-path: <linux-i2c-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1487761474-11547-1-git-send-email-a.hajda@samsung.com>
Sender: linux-i2c-owner@vger.kernel.org
To: Andrzej Hajda <a.hajda@samsung.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Javier Martinez Canillas <javier@osg.samsung.com>, linux-i2c@vger.kernel.org, linux-samsung-soc@vger.kernel.org, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Andi Shyti <andi.shyti@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org


--guxdo44meikh2ajj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 22, 2017 at 12:04:34PM +0100, Andrzej Hajda wrote:
> In case of arbitration lost adequate interrupt sometimes is not signaled.
> As a result transfer timeouts and is not retried, as it should. To avoid
> such cases code is added to check transaction status in case of every
> interrupt.
>=20
> Signed-off-by: Andrzej Hajda <a.hajda@samsung.com>

Applied to for-next (will be in this merge window), thanks!

--guxdo44meikh2ajj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAliuz4MACgkQFA3kzBSg
KbZ++w/+JYY7F/EO5p9oHCZuexfcREYGDH5RbAVr+CBybokQKY5DHtk6as2yKJDN
jX4dDRr2OaQ76CirpUdOaK8t5/EWYR6JVplL7mnmJwwUpQCRz3FdRRX+/SLkSMYf
HBovnbGUjMYahILoF5pLSGkLd6QOdLvMekIXHXrK49+wQSIC0LHTcR849uHO3KNH
trMejRJ1aNVJUDP3x8udIMKAGOd8niRu62uh8GcsF4TtCSXYdupYDDsaadecHUBd
SVHJHvHRyNJv8E/sAC27upSAqtPgY+Zmc4U4rbDzGKEjxzroAsvyVMtJbrEyCEj8
czIahaNxhQiYv/L8T/aR8ruUV45NBlyUOl3GLiCM58W8Vz6q0ph973mPrcVg/zJG
f83HUBqJ0haWCwFG4XqSuSfkzLbx44uQ5Z1xT3Zbayy12Qp9JP01xs3X3AYO64Nb
ayOnYTGuR9Pvvbbx7vdfQIfONgtOChXDfSfrQpUQ+QJ5HT6anqZnrqIAbZ6U8iiQ
aYu+FvNjNS9PAlF3rP9o4ttfjqFxP7tABatjOKHmwGUrhTVCAFlXmJgOu9CMW6xz
IWvHjXzSlA10ZcWS7ge3PCrfjjoe04ZUj1iUyIkSTbFL3X2AzVGmMM44lR3k1pt2
/8L6RnrAqzMsB7XB/KDAnroSCu+Xi/H4rvv9qkZzS0mTRWKv8Bg=
=47aA
-----END PGP SIGNATURE-----

--guxdo44meikh2ajj--
