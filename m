From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH] regulator: core: Skip balancing of the enabled
 regulators in regulator_enable()
Date: Tue, 8 Oct 2019 17:21:15 +0100
Message-ID: <20191008162115.GO4382@sirena.co.uk>
References: <CGME20191008101720eucas1p2e0d1bca6e696848bf689067e05620679@eucas1p2.samsung.com>
 <20191008101709.13827-1-m.szyprowski@samsung.com>
 <20191008115025.GF4382@sirena.co.uk>
 <0e222fdd-4407-51ea-b75c-a62621cbe622@samsung.com>
 <20191008120611.GG4382@sirena.co.uk>
 <9268b455-ec66-97e1-909d-f964ac31c0ef@samsung.com>
 <20191008124736.GJ4382@sirena.co.uk>
 <86b9b4b5-cca5-9052-7c87-c5679dfffff4@samsung.com>
 <20191008154844.GM4382@sirena.co.uk>
 <86eb668d-7bcf-798b-dabb-95071d16cbb6@samsung.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="w6U88vdWm8UqIXvc"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <86eb668d-7bcf-798b-dabb-95071d16cbb6@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, linux-kernel@vger.kernel.org, Dmitry Osipenko <digetx@gmail.com>, Liam Girdwood <lgirdwood@gmail.com>, Lucas Stach <l.stach@pengutronix.de>, Krzysztof Kozlowski <krzk@kernel.org>, linux-samsung-soc@vger.kernel.org, Viresh Kumar <viresh.kumar@linaro.org>, Kamil Konieczny <k.konieczny@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org


--w6U88vdWm8UqIXvc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Oct 08, 2019 at 06:02:08PM +0200, Bartlomiej Zolnierkiewicz wrote:

> Taking into account your remark about enable operation on coupled
> regulators and Dmitry's mail about cpufreq issue I think now that just
> dropping opp change is the most straightforward fix.

It's certainly the most straightforward thing for the immediate problem.
I do think we probably need to improve how we're handling the coupling
though, we've got some fragility here that needs addressing.

--w6U88vdWm8UqIXvc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl2ct3oACgkQJNaLcl1U
h9Dj8gf/am+aDjhH0XOJytk0p4raEeJSTiqQjIosjRjvn4bWBbFEjKG4sA7Y4Lic
TbeAtFH9Gufpb9nzkff0yT8dH/rxZAb5VL3fPH59Q/4J7GyokfRg4j/0TX1+3V2x
DzPoSUY0fWgomFr/FoKPZaV3lxCFKuaCxfGSXkwoz8S+yr9rC2TrnehWsCux3F5V
wlLQzyjlno+RZRZV57Xgo/zSNNIWjHAEiLP71xABACYhQNSCSQ7iyotrOD8br5je
Fj7YEPNg0Z8qJrPxqjMbOhUJzQFxNuBbGbzHWj8+07YYAnKXYY5ItMcdmJSkC743
8QYm7pCKTBVlAP1hU2AgmJjOOvbfHg==
=hr4I
-----END PGP SIGNATURE-----

--w6U88vdWm8UqIXvc--
