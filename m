From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH] regulator: core: Skip balancing of the enabled
 regulators in regulator_enable()
Date: Tue, 8 Oct 2019 19:07:50 +0100
Message-ID: <20191008180750.GT4382@sirena.co.uk>
References: <0e222fdd-4407-51ea-b75c-a62621cbe622@samsung.com>
 <20191008120611.GG4382@sirena.co.uk>
 <9268b455-ec66-97e1-909d-f964ac31c0ef@samsung.com>
 <20191008124736.GJ4382@sirena.co.uk>
 <86b9b4b5-cca5-9052-7c87-c5679dfffff4@samsung.com>
 <be8d3280-9855-ed18-b2ab-d7fb28d80b82@gmail.com>
 <20191008161535.GN4382@sirena.co.uk>
 <4ad890b7-705e-94f9-2e61-1f3a60984c91@gmail.com>
 <20191008171747.GS4382@sirena.co.uk>
 <439154a4-1502-40af-7086-d4e3eb24025f@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="IQvoI1rdlCKiYEYW"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <439154a4-1502-40af-7086-d4e3eb24025f@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Osipenko <digetx@gmail.com>
Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, linux-kernel@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>, Lucas Stach <l.stach@pengutronix.de>, Krzysztof Kozlowski <krzk@kernel.org>, linux-samsung-soc@vger.kernel.org, Viresh Kumar <viresh.kumar@linaro.org>, Kamil Konieczny <k.konieczny@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org


--IQvoI1rdlCKiYEYW
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 08, 2019 at 09:00:29PM +0300, Dmitry Osipenko wrote:
> 08.10.2019 20:17, Mark Brown =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> > On Tue, Oct 08, 2019 at 08:05:03PM +0300, Dmitry Osipenko wrote:

> >> Maybe it won't hurt to disallow a non always-on regulators to be coupl=
ed
> >> until there will be a real user for that case.

> > I thought that coupling with the CPU core and main SoC power regulators
> > was one of the main use cases for this feature?

> Properly handling case of a disabled coupled regulator certainly will be
> useful, but looks like there are no real users for that feature right
> now and thus no real testing is done.

Right, sorry - I missed the double negative there.

--IQvoI1rdlCKiYEYW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl2c0HUACgkQJNaLcl1U
h9BXzAf/a3jMX/noo6ORXwZCbU0W+bEKFBdN0mIzQnIFx2Ztn/BAEBMPD7Lj/5dn
xIHLvwI1LkQri9I8YKdz6iZPiHIvzsyg64X4aAdU9D6WPXg26pPUHc23/Z30x67h
tXk27uWLLLoYY45UXNoO3puKiLDB6UAyrQwLs1O3GnykKtr1BxUELCOZDnv7CH+v
YrmK0uB/jMC+/VuWGVYdrCvjT67v5BJTdFFvM3e+1+ecI708d+04fauscefUHScL
zTqOh42idqE1gbm3M052pwJ07A0UPBQUBjL0olVLhc6uH9DcjRTp8NNxPo1EMBCG
1L8pkjVtrS51Fx4Z0m9fAfIuCYhWig==
=hJR4
-----END PGP SIGNATURE-----

--IQvoI1rdlCKiYEYW--
