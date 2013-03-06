From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Subject: Re: [PATCH] ASoC: samsung: let device core setup the default pin
 configuration
Date: Wed, 6 Mar 2013 19:37:43 +0800
Message-ID: <20130306113741.GA19556@opensource.wolfsonmicro.com>
References: <1362570951-14403-1-git-send-email-thomas.abraham@linaro.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="7AUc2qLy4jB3hD7Z"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from opensource.wolfsonmicro.com ([80.75.67.52]:38690 "EHLO
	opensource.wolfsonmicro.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1756051Ab3CFLiY (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 6 Mar 2013 06:38:24 -0500
Content-Disposition: inline
In-Reply-To: <1362570951-14403-1-git-send-email-thomas.abraham@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Thomas Abraham <thomas.abraham@linaro.org>
Cc: alsa-devel@alsa-project.org, lrg@ti.com, jassisinghbrar@gmail.com, linus.walleij@linaro.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, t.figa@samsung.com, heiko@sntech.de, patches@linaro.org


--7AUc2qLy4jB3hD7Z
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Mar 06, 2013 at 05:25:51PM +0530, Thomas Abraham wrote:

> With device core now able to setup the default pin configuration,
> the pin configuration code based on the deprecated Samsung specific
> gpio bindings in i2s driver is removed.

There's rather a lot of non-DT Samsung platforms...

--7AUc2qLy4jB3hD7Z
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAEBAgAGBQJRNyp8AAoJELSic+t+oim9sOgP/AmblvvaG4Ghds0Q01vMWN86
ATb4JRELve0eUNuhyzU5xg7duZNk667UU8duV2rls35mlkOMB91w4K3kV1hIu6xO
5Kjq8WeaL1oGC0aggPFs/jQ4XXJU8cOWHfDfDI2TI7jvZjJXp3/FisWCdIQHLbKB
4zjQLTNRtaXzb+01OpWxeCGnwCMKRSlDtOrD0bmsT6afYC164Ls9pirncTgNqy0E
KStvfwtccFdqIW+QhDsuhzuhL7fXrxUEcWbNCyAi4ugpfG1az/44tm5nnC2k4RGc
YAvQNYZBIDRBAy+s61Cxf6lMe+9P/fFGqcGN3bBC74NjoZtsUsOm/P0q65Pm1PGJ
02sE+1Lw/U79W8qEVPYO8iWiAuqzI2FVgI8rKK1pSuyVRTc+M03NWxhmebvAlKhz
1trKmSmYCpHVLSoIDTam+V4wjWvthJJNlcUEAuiP9Is/gBaPCMJfKfYXV5zf3JTL
DstXgjPSnEwFuL2w57umsv/dcgQn3xQjEUDRwMZAf92Ro7PwcZc6h/niIOUaD68n
oCMBYr8UuUHCSEONLtmaWOIPcTKDirBBEN19UplbeJjPuMCyJ/1r2HENfWhEzJoh
HefeHpkyCxOegFNwF1vkKWmNSZInExfpVWOtvuAVU9+Y1nEIafpFEDpTiHJbuHXF
cCutRX8Yr7MNgzWQ5IS3
=eWY0
-----END PGP SIGNATURE-----

--7AUc2qLy4jB3hD7Z--
