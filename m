From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH] regulator: core: Skip balancing of the enabled
 regulators in regulator_enable()
Date: Tue, 8 Oct 2019 13:47:36 +0100
Message-ID: <20191008124736.GJ4382@sirena.co.uk>
References: <CGME20191008101720eucas1p2e0d1bca6e696848bf689067e05620679@eucas1p2.samsung.com>
 <20191008101709.13827-1-m.szyprowski@samsung.com>
 <20191008115025.GF4382@sirena.co.uk>
 <0e222fdd-4407-51ea-b75c-a62621cbe622@samsung.com>
 <20191008120611.GG4382@sirena.co.uk>
 <9268b455-ec66-97e1-909d-f964ac31c0ef@samsung.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="liqSWPDvh3eyfZ9k"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <9268b455-ec66-97e1-909d-f964ac31c0ef@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: linux-kernel@vger.kernel.org, Dmitry Osipenko <digetx@gmail.com>, Liam Girdwood <lgirdwood@gmail.com>, Lucas Stach <l.stach@pengutronix.de>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, linux-samsung-soc@vger.kernel.org, Viresh Kumar <viresh.kumar@linaro.org>, Kamil Konieczny <k.konieczny@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org


--liqSWPDvh3eyfZ9k
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 08, 2019 at 02:38:55PM +0200, Marek Szyprowski wrote:

> Then if I get it right, the issue is caused by the commit 7f93ff73f7c8=20
> ("opp: core: add regulators enable and disable"). I've checked and=20
> indeed reverting it fixes Peach Pi to boot properly. The question is if=
=20
> this is desired behavior or not?

That doesn't seem ideal - either it's redundant for regulators that need
to be marked as always-on anyway or it's going to force the regulators
on when a device could do runtime PM (eg, if the same code can run on
something like a GPU which can be turned off while the screen is off or
is displaying a static image).

--liqSWPDvh3eyfZ9k
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl2chWcACgkQJNaLcl1U
h9CXBQf/b+pmbUPYAhUShO4eVdxzuwWcxfei9CJpiBusJoaR/D523P4pH5wKHcU1
tuxCRGKqrO3Ty6SAttrXl6/8hPRkESeRnWXfCqeorDOC3LSC/wrTHR7UedCALn69
hmT7pqOJeD2130JqCuPKit1HxxjxgT8KZHMEamDgqFcB7nh2wU3VwMCWTGRl1VyK
GN9McMSpWCQeSSRRhrrlKGRf+UAiAeDo1MdDe7eO8cowlc4OWOHsaPyL6LU0Uvli
ou6lJxFBUH9ZVbYEX45741FGDAXZimtGkmnwoBgH7r3WB23D9G90L60auCMemmk+
pmMMDHYAfBOliiuDs57KsPnmbgDZDw==
=J/eq
-----END PGP SIGNATURE-----

--liqSWPDvh3eyfZ9k--
