From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v4 4/7] regulator: Use ena_gpio supplied with generic
 regulator bindings
Date: Fri, 28 Nov 2014 11:38:59 +0000
Message-ID: <20141128113859.GH7712@sirena.org.uk>
References: <1417087253-12306-1-git-send-email-k.kozlowski@samsung.com>
 <1417087253-12306-5-git-send-email-k.kozlowski@samsung.com>
 <20141127184342.GC7712@sirena.org.uk>
 <1417170655.18249.24.camel@AMDC1943>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ScuMXZMgs/D5yjJ+"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1417170655.18249.24.camel@AMDC1943>
Sender: linux-kernel-owner@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Cc: Lee Jones <lee.jones@linaro.org>, Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Kukjin Kim <kgene@kernel.org>, Kyungmin Park <kyungmin.park@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org


--ScuMXZMgs/D5yjJ+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Nov 28, 2014 at 11:30:55AM +0100, Krzysztof Kozlowski wrote:
> On czw, 2014-11-27 at 18:43 +0000, Mark Brown wrote:

> > Why do we need some special magic operation for GPIO based enables
> > that's separate to any other enable operation?  This seems really
> > confusing, if the constraint setting doesn't work somehow for GPIO based
> > enables we should fix that.  Though since this operation takes no
> > parameters it's hard to see how it's supposed to apply constraints
> > unless it reparses them which doesn't seem like a good idea...

> The regulator driver no longer parses GPIO control from DTS. So somehow
> it should be notified that regulator core parsed this and GPIO should be
> enabled.

> That is the purpose of ops->set_ena_gpio() call.

This sort of thing is a sign that we're not saving much by moving the
parsing to the core and perhaps there's more flexiblity here...  It's
also not something that should be in the constraints handling, it's not
something that constrains the regulator.

> > > +static int regulator_ena_gpio_setup(struct regulator_dev *rdev,
> > > +			const struct regulator_config *config,
> > > +			const struct regulator_init_data *init_data)

> > Why is setting up the GPIO different to requesting it, especially given
> > that we have an existing function called _request() which still exists?

> Maybe the name was not a best choice. The setup calls request.

> My patchset here tried to retain the compatibility with
> "config.ena_gpio" way so the core would accept GPIOs passed in one of
> two ways:
> 1. old: config.ena_gpio,
> 2. new: parsed by core from DTS.

> The request function previously worked only on "config.ena_gpio" and I
> changed it here to accept any GPIO. The setup uses one of GPIO methods
> (old or new) and calls request with appropriate GPIO.

We need to support both methods since not all the world is DT.  What I
can't tell is how this code achieves these objectives - it seems to be
an awfully big patch if that's all it's supposed to be doing, I'd expect
just a conditional where we try the two methods in turn.  It may be that
there's a good reason for all this but that needs to be made clear.

--ScuMXZMgs/D5yjJ+
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBAgAGBQJUeF7TAAoJECTWi3JdVIfQyvwH/RFpPZTq1t0dYc2BooTWqlJn
GcSLw7QM3Mt99G3Rfq4Jyaf2oL+XPvwwtEVTUkVhoA6cJ03tbGYiouy/42y7iRJV
RYGyDrBq4ydPm1aGJzPZ05j8KSG09cFnpWYVwZl1iLQBcHzySyI5j2YbNE6dQGii
nUHIEQzls4HFs+MhNkQaApCr0odo9Bs43/mESWnFCUYF+1xFKXnGWaI9KL5cNFGn
F6gKNcPhasquVNXVruSdqWA9mTo4YjBVYqs7Z9sXjlcIzr/vO1cVXKZxfpWgpJc9
ZbYSydEUKK9VrXiDSjC2M3n7T4aJsWMHRUTiNhhxWNTsR4O1TGXbl9eDVSWjVMI=
=kzoo
-----END PGP SIGNATURE-----

--ScuMXZMgs/D5yjJ+--
