From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH] regulator: core: Skip balancing of the enabled
 regulators in regulator_enable()
Date: Tue, 8 Oct 2019 17:15:35 +0100
Message-ID: <20191008161535.GN4382@sirena.co.uk>
References: <CGME20191008101720eucas1p2e0d1bca6e696848bf689067e05620679@eucas1p2.samsung.com>
 <20191008101709.13827-1-m.szyprowski@samsung.com>
 <20191008115025.GF4382@sirena.co.uk>
 <0e222fdd-4407-51ea-b75c-a62621cbe622@samsung.com>
 <20191008120611.GG4382@sirena.co.uk>
 <9268b455-ec66-97e1-909d-f964ac31c0ef@samsung.com>
 <20191008124736.GJ4382@sirena.co.uk>
 <86b9b4b5-cca5-9052-7c87-c5679dfffff4@samsung.com>
 <be8d3280-9855-ed18-b2ab-d7fb28d80b82@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="IoFIGPN1N3g1Ryqz"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <be8d3280-9855-ed18-b2ab-d7fb28d80b82@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Osipenko <digetx@gmail.com>
Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, linux-kernel@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>, Lucas Stach <l.stach@pengutronix.de>, Krzysztof Kozlowski <krzk@kernel.org>, linux-samsung-soc@vger.kernel.org, Viresh Kumar <viresh.kumar@linaro.org>, Kamil Konieczny <k.konieczny@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org


--IoFIGPN1N3g1Ryqz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Oct 08, 2019 at 06:02:36PM +0300, Dmitry Osipenko wrote:

Please fix your mail client to word wrap within paragraphs at something
substantially less than 80 columns.  Doing this makes your messages much
easier to read and reply to.

> That OPP patch caused the same problem for the NVIDIA Tegra20 CPUFreq
> driver (in-progress) and I resolved it in the coupler's code [0].
> Perhaps the generic coupler could do the same thing by assuming that
> min_uV=current_uV until any consumer sets the voltage, i.e. if
> regulator_check_consumers(min_uV=0) returns min_uV=0.

That sounds like it might just postpone the inevitable - if you set the
wrong voltage first it might decide to drop down some voltage that
wasn't expected.  There's a bit of a bootstrapping issue.  I think it
would be safer to just say that anything that is within spec won't get
changed any time we balance, we'd only change things if needed to bring
them back into spec.

--IoFIGPN1N3g1Ryqz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl2ctiYACgkQJNaLcl1U
h9B9Dwf9H4iGhCAWwJNTDbatBXn8dqoVVD/+nsb3TOY+jEfTdPWisLQO+V2VORVu
OYB0ber9TDqFC0U1r0Jegg/DKOBgZPDMlZexQoqP/DVQ23K0mJei3vzSV4QxILN1
d5xALvgn1Z7Y1UiLVwWjy3UIBYqnkiEVTjiynL26zCEd7Edu4WJ/TpWs5ZYgxNKm
Tz/q38O9KTrYl+g+kfvJGzR/Neqm50DtBGB7yY5KiAH1bMOINxcwy6to3gPmanDw
KbhxnVq/gY0Ihu6jouU0NpBTDp9tVSY+f3PqglkRTBUMHfbFjNT/YQIZ/gY+0b+c
KGdYiGW0xgUBMRghlERJPD7U9hNCEg==
=FYvm
-----END PGP SIGNATURE-----

--IoFIGPN1N3g1Ryqz--
