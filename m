From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 1/3] dt-bindings: regulator/clock/mfd: Reorganize
 S2MPS-family bindings
Date: Fri, 4 Dec 2015 12:06:28 +0000
Message-ID: <20151204120628.GX26072@sirena.org.uk>
References: <1449191405-3344-1-git-send-email-k.kozlowski@samsung.com>
 <1449191405-3344-2-git-send-email-k.kozlowski@samsung.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="/Kwy1es1GwkEJhNg"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1449191405-3344-2-git-send-email-k.kozlowski@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Cc: Sangbeom Kim <sbkim73@samsung.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Lee Jones <lee.jones@linaro.org>, Kukjin Kim <kgene@kernel.org>, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Liam Girdwood <lgirdwood@gmail.com>, linux-clk@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org


--/Kwy1es1GwkEJhNg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Dec 04, 2015 at 10:10:03AM +0900, Krzysztof Kozlowski wrote:
> Bindings for Samsung S2M and S5M family PMICs are in mess. They are
> spread over different files and subdirectories in a non-consistent way.
> The devices and respective drivers for them share a lot in common so
> everything could be organized in a more readable way.

Acked-by: Mark Brown <broonie@kernel.org>

--/Kwy1es1GwkEJhNg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJWYYHDAAoJECTWi3JdVIfQ4CoH/A/nCU65TYVWgjUZDnKobol1
uNeSvBXaNfvP10fonQZGxozdEkSKjR4enT+Y69C7ykR54/0ZidliOZNjPPno+Q43
le3/VIVI5mEIkOJ+o8pB/wLzFH8PpGycyhFK5g6h1r1B08N1bD/74l46JdivJaKj
qNhuZO5g5Gbn5N9JGq88cOtHu8oJcZjCcZuiHy5gGirtdYPVCJHgHPkB7smJmMFH
QIbcSX2n3tW00N+OXYW2dCxmwcLth+LkTR4ZM21kNKX+LFatKDeUQVFXyxLp1ot6
aSOdCHL5MZUY941xjrDzlkmCssqkwQNAeu7XqBy2GRTfMRv4AOHbKcuQqHFbDEY=
=yyl8
-----END PGP SIGNATURE-----

--/Kwy1es1GwkEJhNg--
