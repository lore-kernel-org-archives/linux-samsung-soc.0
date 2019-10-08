From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH] regulator: core: Skip balancing of the enabled
 regulators in regulator_enable()
Date: Tue, 8 Oct 2019 16:48:44 +0100
Message-ID: <20191008154844.GM4382@sirena.co.uk>
References: <CGME20191008101720eucas1p2e0d1bca6e696848bf689067e05620679@eucas1p2.samsung.com>
 <20191008101709.13827-1-m.szyprowski@samsung.com>
 <20191008115025.GF4382@sirena.co.uk>
 <0e222fdd-4407-51ea-b75c-a62621cbe622@samsung.com>
 <20191008120611.GG4382@sirena.co.uk>
 <9268b455-ec66-97e1-909d-f964ac31c0ef@samsung.com>
 <20191008124736.GJ4382@sirena.co.uk>
 <86b9b4b5-cca5-9052-7c87-c5679dfffff4@samsung.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="QqzFzR/RUlLahzby"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <86b9b4b5-cca5-9052-7c87-c5679dfffff4@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, linux-kernel@vger.kernel.org, Dmitry Osipenko <digetx@gmail.com>, Liam Girdwood <lgirdwood@gmail.com>, Lucas Stach <l.stach@pengutronix.de>, Krzysztof Kozlowski <krzk@kernel.org>, linux-samsung-soc@vger.kernel.org, Viresh Kumar <viresh.kumar@linaro.org>, Kamil Konieczny <k.konieczny@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org


--QqzFzR/RUlLahzby
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Oct 08, 2019 at 03:24:17PM +0200, Bartlomiej Zolnierkiewicz wrote:

> Commit 7f93ff73f7c8 ("opp: core: add regulators enable and disable")
> currently can be safely reverted as all affected users use always-on
> regulators. However IMHO it should be possible to enable always-on
> regulator without side-effects.

With coupled regulators you might have something kicking in because a
change was made on a completely different regulator...  If we don't take
account of coupling requirements we'd doubtless have issues with that at
some point.

> When it comes to setting regulator constraints before doing enable
> operation, it also seems to be possible solution but would require
> splitting regulator_set_voltage() operation on two functions:

> - one for setting constraints (before regulator_enable() operation)

> - the other one actually setting voltage (after enable operation)

I don't follow?  What would a "constraint" be in this context and how
would it be different to the voltage range you'd set in normal operation?

--QqzFzR/RUlLahzby
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl2cr9sACgkQJNaLcl1U
h9BXUAf/RIbUmUSu6zGVv3srXuV8KnuydZCjPiPMkIelBiSu7RSvLATKLqNqlwBY
x1g4Juy1G+35SyaWtq/xZLRG+ZuPkM/LVhIgS1Um3fwnmtAVzV0LfJwwYcGrBQgu
r+/jh59o7qvEwIJb96cbQZLAaEEnKgK2IbbUknyVVa/YMLKKK/uivkFAeVP/t4Rc
fnG9lsDLZYkK8IdyJjFnZf96l1ONZVPUQ8GgI52bxl6szXy588MSzhERreQ8h9kg
BDsxxlGGPYG8vM17fFbzQ4E1SUwEZmWHo7otFKIJSl2ctuurcGpJpp/mCfYl0wl7
qVOA1l/WDyWdvk6L+gCNfkhWmtgSKQ==
=KF++
-----END PGP SIGNATURE-----

--QqzFzR/RUlLahzby--
