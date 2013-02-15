From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Subject: Re: [PATCH V6 02/10] ASoC: SAMSUNG: Add DT support for i2s
Date: Fri, 15 Feb 2013 12:01:45 +0000
Message-ID: <20130215120145.GC22283@opensource.wolfsonmicro.com>
References: <1358509629-20471-1-git-send-email-padma.v@samsung.com>
 <1358509629-20471-3-git-send-email-padma.v@samsung.com>
 <511CC11B.5030700@samsung.com>
 <20130214114337.GD13249@opensource.wolfsonmicro.com>
 <511D49FC.4080402@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="raC6veAxrt5nqIoY"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from opensource.wolfsonmicro.com ([80.75.67.52]:49078 "EHLO
	opensource.wolfsonmicro.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751018Ab3BOMBs (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 15 Feb 2013 07:01:48 -0500
Content-Disposition: inline
In-Reply-To: <511D49FC.4080402@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sylwester Nawrocki <sylvester.nawrocki@gmail.com>
Cc: Padmavathi Venna <padma.v@samsung.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, padma.kvr@gmail.com, linux-samsung-soc@vger.kernel.org, alsa-devel@alsa-project.org, devicetree-discuss@lists.ozlabs.org, sbkim73@samsung.com, vinod.koul@intel.com, grant.likely@secretlab.ca, swarren@nvidia.com, boojin.kim@samsung.com, kgene.kim@samsung.com, jassisinghbrar@gmail.com, thomas.abraham@linaro.org, lrg@ti.com, tiwai@suse.de, ben-linux@fluff.org


--raC6veAxrt5nqIoY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Feb 14, 2013 at 09:33:00PM +0100, Sylwester Nawrocki wrote:

> My apologies for the late review. It's already sixth version of this patch
> series... But I noticed it just now when applying it for Exynos4. The GPIO
> part of the bindings is now incompatible with Exynos4 and the bindings will
> need to be changed. Leaving the compatibility code in the I2S driver, when
> we could have it done well right from the beginning. If I'm not mistaken
> a file similar to arch/arm/boot/dts/exynos4x12-pinctrl.dtsi with at least
> entries for the I2S devices is needed and an addition of related pinctrl
> nodes in exynos5250.dtsi. But I guess this is not something that could be
> fixed in the -rc period ?

Yes, and incremental fix would be fine.

--raC6veAxrt5nqIoY
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAEBAgAGBQJRHiOTAAoJELSic+t+oim9GPEP/AtrJRFWIHCLk4NEnjR/2P+2
7mppHqMPnc2/7vWPnawjUzwULGLTiJl7WwMtyGcCD82KQJnoLv6kvgRfAiBUwOf+
lC/P0WPjWHtbEpa9Fi2Z6j1GmpdNorggPTiRFhvoZ+TKxhKRgQyhqxuC8Pgg1rVm
Kq7HXwg8lDW/6d32luN7jkCT+F2kBg7hhTicSyWpnR1+tbGW1cWdj8qDeY5K46Iz
H/L1POHTnLVCEb8PmwAithPeHJXYi6hZ69npeob+FvG8MQCtZj3LI2zninincEpE
F5wt3Gp9N2o5bxtPZFv9XTKJZum0Hsl7hpFHHHvqDKMnX/LZ2pSPnQlNaz6pII69
XY/rTNYsN71k3LJ+m7DXD1dgEM5z2Bv202ycrQ3OHlFmNqUN9uXQStywnum4qejb
Lo86uC9mn6sn8ab3TiV793RgkS/2kVq9QU0zAsHjclH3zDBz3WV0ispUyYwEAGp+
erez1A475WN7QarKpFveHCglz1/nkBpvnnSNsXmdFA8cDhpQXnki3IcLMijjsiWZ
B7P2Kam5HwJBpt16e20F0yXn1hNOmY0hfwMo9S787ZobwZ5VWMpatw6pWVgDFfCu
851CcJ4Bh3Mq/lnkdWEGrU8DATTTIJfAgg4z/6IG1lTc+E9uI1MLfKgWEU89Qloj
bn8sT8HH7WzJ1oDyHTTE
=hMEl
-----END PGP SIGNATURE-----

--raC6veAxrt5nqIoY--
