From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH] regulator: core: Skip balancing of the enabled
 regulators in regulator_enable()
Date: Wed, 9 Oct 2019 15:13:52 +0100
Message-ID: <20191009141352.GC3929@sirena.co.uk>
References: <20191008124736.GJ4382@sirena.co.uk>
 <86b9b4b5-cca5-9052-7c87-c5679dfffff4@samsung.com>
 <be8d3280-9855-ed18-b2ab-d7fb28d80b82@gmail.com>
 <20191008161535.GN4382@sirena.co.uk>
 <4ad890b7-705e-94f9-2e61-1f3a60984c91@gmail.com>
 <20191008171747.GS4382@sirena.co.uk>
 <439154a4-1502-40af-7086-d4e3eb24025f@gmail.com>
 <CGME20191008180759epcas3p3c367142db499635c71d9601dd3e63956@epcas3p3.samsung.com>
 <20191008180750.GT4382@sirena.co.uk>
 <c9e3ff21-ec50-97c2-06cb-b2f44c70eac8@samsung.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="JgQwtEuHJzHdouWu"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <c9e3ff21-ec50-97c2-06cb-b2f44c70eac8@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Dmitry Osipenko <digetx@gmail.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, linux-kernel@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>, Lucas Stach <l.stach@pengutronix.de>, Krzysztof Kozlowski <krzk@kernel.org>, linux-samsung-soc@vger.kernel.org, Viresh Kumar <viresh.kumar@linaro.org>, Kamil Konieczny <k.konieczny@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org


--JgQwtEuHJzHdouWu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 09, 2019 at 12:29:00PM +0200, Marek Szyprowski wrote:

> Okay, then what is the conclusion, as I got lost a bit? How do you want=
=20
> this issue to be fixed?

We should revert the enable call, it shouldn't be required, and ideally
the default balancer could be updated to only make configuration changes
if they're actually required which would help avoid triggering any such
things in future if we don't absolutely have to.

--JgQwtEuHJzHdouWu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl2d6wkACgkQJNaLcl1U
h9BlRAf/YGiMG169n7MCXyjkc8bcLmLH7+9S3stdFllmTYuhOP/M1y/JQJmzzQwg
XDnAA2bX++oSN2E5ywHFEFnnEMStg5lUCHik0tZbf1SJNwS4O1XsuQaLS3tJajgQ
ForbctxszdR9Yb+PpwMsjeH1ke5L851Cxd6XjwIVhy8DMqY4vWhrriiojk6ZqniV
BLMMwT7B1fMwVqVqeLjOlwc7eZopT7cFim47sO1NfXizcuJ0eX9VthVh0HRnM294
92eCpqwgT1HTNmrkZgmnme9gWgbdB710n/G9w6Ez0/iC8fPp9S5OMyNA92ajbuMs
JpMjsKKdeYiEQe2ugez8CeAphm/pFg==
=ljBl
-----END PGP SIGNATURE-----

--JgQwtEuHJzHdouWu--
