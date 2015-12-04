From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 3/3] dt-bindings: regulator/mfd: Reorganize S2MPA01
 bindings
Date: Fri, 4 Dec 2015 12:11:53 +0000
Message-ID: <20151204121153.GZ26072@sirena.org.uk>
References: <1449191405-3344-1-git-send-email-k.kozlowski@samsung.com>
 <1449191405-3344-4-git-send-email-k.kozlowski@samsung.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="tpXmNJJzF/fVXUEg"
Return-path: <linux-clk-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1449191405-3344-4-git-send-email-k.kozlowski@samsung.com>
Sender: linux-clk-owner@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Cc: Sangbeom Kim <sbkim73@samsung.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Lee Jones <lee.jones@linaro.org>, Kukjin Kim <kgene@kernel.org>, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Liam Girdwood <lgirdwood@gmail.com>, linux-clk@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org


--tpXmNJJzF/fVXUEg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Dec 04, 2015 at 10:10:05AM +0900, Krzysztof Kozlowski wrote:
> The mfd/s2mpa01.txt duplicates some of the information about bindings
> with old mfd/s2mps11.txt. Now common part exists entirely in
> mfd/samsung,sec-core.txt so:

Acked-by: Mark Brown <broonie@kernel.org>

>  - add company prefix to file name (regulator/samsung,s2mpa01.txt),

I'm not 100% convinced about these prefixes BTW, the duplication isn't
usually an issue within a subsystem.  They don't do any harm either
though.

--tpXmNJJzF/fVXUEg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJWYYMJAAoJECTWi3JdVIfQ3r8H/AyPs8jtf+628DyPNyCBZOZZ
83KlYFo/jeNYNrZibcg1Zl61/3CpobBB9t9osYhvrVwj/oo4xYDDXR2FjLDB7Q9r
Olx8bMi5UKgmUeC2LzTEZzEQ3GB3L/kC/IEnpJ3UUgGXXWSxt7NjHX6LhgyVsVG2
sGqUc7MxISBWK5SvEMkXJC+L4C+2na2NqHzWGG921djWkiWw19gjldjCssC1mq2z
wUeup2TcKCNPzwl5xek3lLtum45EkWDJJCcxw+NJAit3enhNR2BHv6btRcCY3+lq
dVXQExMovGtP2BYnCRlg5wimbnhCUGfLD/P1bNNF7vCTW0L2zMeFOUcC5npAddI=
=PGvF
-----END PGP SIGNATURE-----

--tpXmNJJzF/fVXUEg--
