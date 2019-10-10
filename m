From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH] regulator: core: Skip balancing of the enabled
 regulators in regulator_enable()
Date: Thu, 10 Oct 2019 14:55:07 +0100
Message-ID: <20191010135507.GS2036@sirena.org.uk>
References: <be8d3280-9855-ed18-b2ab-d7fb28d80b82@gmail.com>
 <20191008161535.GN4382@sirena.co.uk>
 <4ad890b7-705e-94f9-2e61-1f3a60984c91@gmail.com>
 <20191008171747.GS4382@sirena.co.uk>
 <439154a4-1502-40af-7086-d4e3eb24025f@gmail.com>
 <CGME20191008180759epcas3p3c367142db499635c71d9601dd3e63956@epcas3p3.samsung.com>
 <20191008180750.GT4382@sirena.co.uk>
 <c9e3ff21-ec50-97c2-06cb-b2f44c70eac8@samsung.com>
 <20191009141352.GC3929@sirena.co.uk>
 <c1a50291-5260-357d-1701-47526dbcd62c@samsung.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="m2KU9Mr9JJKQaAoQ"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <c1a50291-5260-357d-1701-47526dbcd62c@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Dmitry Osipenko <digetx@gmail.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, linux-kernel@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>, Lucas Stach <l.stach@pengutronix.de>, Krzysztof Kozlowski <krzk@kernel.org>, linux-samsung-soc@vger.kernel.org, Viresh Kumar <viresh.kumar@linaro.org>, Kamil Konieczny <k.konieczny@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org


--m2KU9Mr9JJKQaAoQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 10, 2019 at 12:19:55PM +0200, Marek Szyprowski wrote:
> On 09.10.2019 16:13, Mark Brown wrote:

> > We should revert the enable call, it shouldn't be required, and ideally
> > the default balancer could be updated to only make configuration changes
> > if they're actually required which would help avoid triggering any such
> > things in future if we don't absolutely have to.

> Okay, Then in case of regulator core - do you accept the initial patch=20
> as it indeed forces the default balancer to avoid unnecessary changes,=20
> or do you want me to rewrite it to assume min_uV =3D current_uV for the=
=20
> already enabled regulators during the initial balancing, like suggested=
=20
> by Dmitry?

Neither, I'm suggesting you make the change above.

--m2KU9Mr9JJKQaAoQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl2fODoACgkQJNaLcl1U
h9CH9Af/a7DbnGwYMp29eLd4J6U14L9PHlZEslj/46R5/OmCgxVycQejbXAZRHwg
CLPcrsFx/1JnedK9CoxYw2Qo1WJvE5K0pxwnZ5zJLFfT4MZFofI468OHQcYqHAXX
ZyJw5iZAqJ9ATGInZoCvaBL3Tde2uXqazxPAOZRull7BdSgmc5noRIOOdqV8a1mv
n+tGJNiauaP7qAa7ZJtEdsJzPHjbNdtOWruKQxgPSE9KRLbq2fIQRG2ZtUo7fds7
+YzwfQtXOoX1XVD7aoqbWYyNAkl6taMDRzy7UhUbUiol7/knCoG4elvuMRRPAKrK
V7mXpb9I4a9jtCf5FW4akaeiqqkOmg==
=e3x+
-----END PGP SIGNATURE-----

--m2KU9Mr9JJKQaAoQ--
