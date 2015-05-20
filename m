From: Mark Brown <broonie@kernel.org>
Subject: Re: [RFC PATCH 1/4] spi: spidev: Add Google SPI flash compatible
 string
Date: Wed, 20 May 2015 11:37:46 +0100
Message-ID: <20150520103746.GD21577@sirena.org.uk>
References: <1432042454-19234-1-git-send-email-javier.martinez@collabora.co.uk>
 <1432042454-19234-2-git-send-email-javier.martinez@collabora.co.uk>
 <20150520101318.GB21577@sirena.org.uk>
 <555C5F65.7010204@collabora.co.uk>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="DiL7RhKs8rK9YGuF"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:48423 "EHLO
	mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751504AbbETKiA (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 20 May 2015 06:38:00 -0400
Content-Disposition: inline
In-Reply-To: <555C5F65.7010204@collabora.co.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Cc: Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Olof Johansson <olof@lixom.net>, Doug Anderson <dianders@chromium.org>, David Hendricks <dhendrix@google.com>, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org


--DiL7RhKs8rK9YGuF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, May 20, 2015 at 12:18:13PM +0200, Javier Martinez Canillas wrote:
> On 05/20/2015 12:13 PM, Mark Brown wrote:

> > This is adding a binding with no documentation, documentation is
> > mandatory for all bindings.

> Yes, I missed... sorry about that. Do you agree with the approach
> though so I can re-spin the patches adding the missing DT binding?

It's probably OK but I didn't really drill through since the binding was
missing.  If these parts are commodity as described it seems surprising
that they aren't compatible with any existing kernel driver.

--DiL7RhKs8rK9YGuF
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJVXGP5AAoJECTWi3JdVIfQvtgH/A+yMrLrTumAtOtKUuP0enVJ
OemnTkHyQUnz5rCCuxlstmsdP80nDCSMbqTdzpK5BqonXTLb2bZZNiivK7eMA+Cv
nFlB7UyhbyUuxgWLktfrgBOOFB2ioAZPoRsCzYI4KcGyA14KddZVHOq0RR3S0hLc
7J5T2QgdaEYRH3Bc33UIADviHg/xpyOS5aJ27PdVUz1KR+HVrZ0IXOfaK8O1pFho
LYCU1TKAKejX/JHyRHD6weWe7GUjNm2LfXTjLB/S07EOaf+cuclpEAi6a0UJejr2
6g1SGv1WSfG97ZeKwNzU1n+wESxo9syr0/liOLHus0hgtkSSxB5fBunciK5+A0s=
=yuQu
-----END PGP SIGNATURE-----

--DiL7RhKs8rK9YGuF--
