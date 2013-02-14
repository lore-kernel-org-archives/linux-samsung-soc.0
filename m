From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Subject: Re: [PATCH V6 02/10] ASoC: SAMSUNG: Add DT support for i2s
Date: Thu, 14 Feb 2013 11:43:37 +0000
Message-ID: <20130214114337.GD13249@opensource.wolfsonmicro.com>
References: <1358509629-20471-1-git-send-email-padma.v@samsung.com>
 <1358509629-20471-3-git-send-email-padma.v@samsung.com>
 <511CC11B.5030700@samsung.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="NklN7DEeGtkPCoo3"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from opensource.wolfsonmicro.com ([80.75.67.52]:50419 "EHLO
	opensource.wolfsonmicro.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S934013Ab3BNLnk (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 14 Feb 2013 06:43:40 -0500
Content-Disposition: inline
In-Reply-To: <511CC11B.5030700@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc: Padmavathi Venna <padma.v@samsung.com>, padma.kvr@gmail.com, linux-samsung-soc@vger.kernel.org, alsa-devel@alsa-project.org, devicetree-discuss@lists.ozlabs.org, sbkim73@samsung.com, vinod.koul@intel.com, grant.likely@secretlab.ca, swarren@nvidia.com, boojin.kim@samsung.com, kgene.kim@samsung.com, jassisinghbrar@gmail.com, thomas.abraham@linaro.org, lrg@ti.com, tiwai@suse.de, ben-linux@fluff.org


--NklN7DEeGtkPCoo3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Feb 14, 2013 at 11:48:59AM +0100, Sylwester Nawrocki wrote:

> NAK.

> Why we should leave with this temporary code when there is already
> pinctrl support for Exynos SoCs ?

> If the pinctrl driver for Exynos5 was updated you could instead just do

> devm_pinctrl_get_select_default(&i2s->pdev->dev);

Too late, this stuff is already merged and on its way upstream.

--NklN7DEeGtkPCoo3
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAEBAgAGBQJRHM26AAoJELSic+t+oim9NcIP+wanj2BTlz9EE+bBunN5I+dF
Ur8aRzClB4rjyRdIM9aoyBAPn7VRZ5F9dbAsSKvMuzV7gNOGujeCSv5kLIONNFvk
DitZX+fxVDLOfMcSOJGsmI773/rRXPiQHv37M9AzOgt4BIb1+m2x7NBnM17raKKx
FhakOGQyGYNDw/NUCFTx/psD1F4yR8SnFoaMTAoLCiiQLJ6QXvlFLRg5LEsLUtoq
j6/x1dnm8kK5gHXG90pg4/f0pO3wOT42RfeK+QgFBpbvxgQBWeaWBnFetm/ew7iC
eNsTG1EUGWsQtMUCTAKLDCQhOvqbFVxS4Udi7znHqM3ZCRuChayxSKPvYHC5TaVk
6EkB5SsuJKsPgXBCg0NJQCgBZPO+kS/dXe4E3KsD25JPFe2HMthqDL6ctVEJCJkp
CluyJbkPeKf7GpdJ3ayO0UVwi8f+1QEh1rZd5oj5ydc2HJmkeVlNE4567Iv4Skk0
CvXXJ6giDAz+u6pc3GIqLrzESwe/UR83260+eNaPOFiQzKvV8g1aYz5K8KOiW21m
G5WVJPlFX08V6OTW0m1vLyy3qmUgD1ewom1nXXv+FacG22cbPry4wB2mQXzF6FwE
dwz8W3187cWXtIFIsYEDml3IlnLD99H10wAiuoFrRiGyxdpDcqSqD1mZeEM4CiFa
FlqyGOJXpKqR6QgdERE0
=fImz
-----END PGP SIGNATURE-----

--NklN7DEeGtkPCoo3--
