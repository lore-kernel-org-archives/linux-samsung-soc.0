From: Wolfram Sang <wsa@the-dreams.de>
Subject: Re: [PATCH] i2c: exynos5: simplify timings calculation
Date: Fri, 21 Apr 2017 14:04:04 +0200
Message-ID: <20170421120404.xuuvcqcfjm22vhk5@ninjato>
References: <CGME20170223164733eucas1p11ad37a2334fe709a062ecc82b5224e1a@eucas1p1.samsung.com>
 <1487868446-5339-1-git-send-email-a.hajda@samsung.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="khtikcvfx7tb2jbk"
Return-path: <linux-i2c-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1487868446-5339-1-git-send-email-a.hajda@samsung.com>
Sender: linux-i2c-owner@vger.kernel.org
To: Andrzej Hajda <a.hajda@samsung.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Javier Martinez Canillas <javier@osg.samsung.com>, linux-i2c@vger.kernel.org, linux-samsung-soc@vger.kernel.org, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org


--khtikcvfx7tb2jbk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 23, 2017 at 05:47:26PM +0100, Andrzej Hajda wrote:
> Instead of using cryptic loop direct calculation of timings
> can be used.
>=20
> Signed-off-by: Andrzej Hajda <a.hajda@samsung.com>

Applied to for-next, thanks!


--khtikcvfx7tb2jbk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlj59TAACgkQFA3kzBSg
KbY1GQ//TD5KIL8hj1r7+ZrWFDwYfQiMM+jqroVTtRZ5V63sMBHlqSOAdzG5S1bT
dMtcZa8W5C1OHIKRFDcwAH2Ih6YxClgRyk7nbUjAc0qK/PC6T17SiDSIWO2BN9ce
iIe38x/LXg+jXkhWCz5DB0pfqP7eRk5mXOZaUdk0O2xp86EWqiw8NgqRy99ZrX2d
ZgxhxJDsA+WxF1oNBrcFuoy5q/gACc/OgY85PvFK6E0EyVQHsszG1BIG6vwf5e6f
bGgcLIA+wFNUBxfz3NgRkCnj1K58T+fxfqpWsuSji7Exd+t0zBA2lfxccZWVvugV
26KS7NAfRE842QL/aBAgGxNRM5mXqlDiQ9LTOefrGnCiNP+8dZRvElfUN76EUA3s
vN7uFFittmugvXYud1kJ484A1VRzW914fOJaO7r425OY1MWfl0N6VGmY13IP3olj
dE3/22nVokbBue0anIZwRrsr3KrJA0LS7MBRrZ3sqb2IzNuuTKcsl9Ux7x8Txw1f
oDiF2ecoqLBobvUkLpHbs/zlDag8wEjmm3JgofdfhVSFBkyMeolzmM/e+7jjxC3O
4SLIxms2tAKG9Cm+mxgtnPAato0kPX/c6aDpsXJxXcTWRnMWQt2UDag/4PLJNwlm
4WPuTbppMxslWcL1It2uZkgJRDDz8i9AFiAUKH/7+0lfHql1qsY=
=gyk5
-----END PGP SIGNATURE-----

--khtikcvfx7tb2jbk--
