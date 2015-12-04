From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 2/3] dt-bindings: regulator/mfd: Reorganize S5M8767
 bindings
Date: Fri, 4 Dec 2015 12:07:07 +0000
Message-ID: <20151204120707.GY26072@sirena.org.uk>
References: <1449191405-3344-1-git-send-email-k.kozlowski@samsung.com>
 <1449191405-3344-3-git-send-email-k.kozlowski@samsung.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="LGr9gtkSK9ARF7Ax"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1449191405-3344-3-git-send-email-k.kozlowski@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Cc: Sangbeom Kim <sbkim73@samsung.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Lee Jones <lee.jones@linaro.org>, Kukjin Kim <kgene@kernel.org>, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Liam Girdwood <lgirdwood@gmail.com>, linux-clk@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org


--LGr9gtkSK9ARF7Ax
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Dec 04, 2015 at 10:10:04AM +0900, Krzysztof Kozlowski wrote:
> The regulator/s5m8767-regulator.txt duplicates some of the information
> about bindings with old mfd/s2mps11.txt. Now common part exists entirely
> in mfd/samsung,sec-core.txt so:

Acked-by: Mark Brown <broonie@kernel.org>

--LGr9gtkSK9ARF7Ax
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJWYYHqAAoJECTWi3JdVIfQ1fYH/A5IVBc/KWx1Ic1JeeMYTXtE
YsBgbCHo5OAXtzLFItwlD6a+Upi+oisOEglQ8aGSmKwEEUjmjIeBaHsNuMwx13c/
IimlHBHoMNEA5tN9ORiRvgL23qPvRBD9UMnxtLJ21R2WQvhrJkakkGZ600RppEju
/pZw4RQCQ9yvekHnGT8kxGa5hMfkjO5PwJJ0yRyitYWViSJTYvcD7eTNgSKTKiBH
2szrtZiRIpRPrXSDmNCINYT1RqNUz1uG4S3kxsHJVUvbdLLAP3T/G1BAqlsemR5d
qX0Vuzg8+DdaeRPk9MRaAz1NhY09hoUjmxD3R4ZZDil2vYLLbpsXej3r2Bd13lM=
=nBOU
-----END PGP SIGNATURE-----

--LGr9gtkSK9ARF7Ax--
