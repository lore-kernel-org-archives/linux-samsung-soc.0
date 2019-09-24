From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH] ASoC: samsung: i2s: Add clocks' macros descriptions
Date: Tue, 24 Sep 2019 10:53:32 -0700
Message-ID: <20190924175332.GB2036@sirena.org.uk>
References: <CGME20190924114843eucas1p2ea9c36289d3912e022ad7c9070fc00ee@eucas1p2.samsung.com>
 <20190924114838.25482-1-m.szyprowski@samsung.com>
 <20190924115307.GA9188@pi3>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="FxQkOwrLuQ+yAGv2"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190924115307.GA9188@pi3>
Sender: linux-kernel-owner@vger.kernel.org
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, devicetree@vger.kernel.org, alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Liam Girdwood <lgirdwood@gmail.com>, Maciej Falkowski <m.falkowski@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org


--FxQkOwrLuQ+yAGv2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Sep 24, 2019 at 01:53:07PM +0200, Krzysztof Kozlowski wrote:
> On Tue, Sep 24, 2019 at 01:48:38PM +0200, Marek Szyprowski wrote:

> > +/* the CDCLK (CODECLKO) gate clock */
> > +#define CLK_I2S_CDCLK 0

> I do not find it more readable because of removal of indent
> after define name. Also the description is not accurate - you
> documented, not increased readability.

Yeah, I agree on both points.  How about putting everything on
one line more like:

   #define CLK_I2S_CDCLK	0	/* the CDCLK (CODECLKO) gate clock */

instead?

Please fix your mail client to word wrap within paragraphs at something
substantially less than 80 columns.  Doing this makes your messages much
easier to read and reply to.

--FxQkOwrLuQ+yAGv2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl2KWBsACgkQJNaLcl1U
h9AzoQf/S2ro+Bt+q/pyvdXc6kray/h1w3lBnrewElE9HPb9/fOERfjl4x4RFpXQ
X9F5NDh+4ol8uNUceRObxMYaYARZnLDeK3jG0/33Lu62lc0S7XkC9jMI8JlE//c1
vgIYN/qbJOSc4f7FJtQKrjt5SNVwE6Laeg/xwtobiBBnWc36Ptj8uGmacV5XcTBI
MAQ1DLWYyYdK12Cb1MgLrtgjVMXAPzfqpeXfnv6XrWL+yPfukYuQw9V6fkqjFEwc
qlsWasox6b+8qYO9DPwwaIATWH7rDctNHZPczQ4JQZKKTz/L42BrkwEIpxLgmLg2
3x+yOV+bhiZaX0VZWXOAkuGpR6d9uA==
=zvuY
-----END PGP SIGNATURE-----

--FxQkOwrLuQ+yAGv2--
