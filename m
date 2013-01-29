From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Subject: Re: [PATCH V6 03/10] ARM: SAMSUNG: Make dma request compatible to
 generic dma bindings.
Date: Tue, 29 Jan 2013 14:20:11 +0800
Message-ID: <20130129061958.GF6878@opensource.wolfsonmicro.com>
References: <1358509629-20471-1-git-send-email-padma.v@samsung.com>
 <1358509629-20471-4-git-send-email-padma.v@samsung.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="1Y7d0dPL928TPQbc"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from opensource.wolfsonmicro.com ([80.75.67.52]:44678 "EHLO
	opensource.wolfsonmicro.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1753523Ab3A2GUf (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 29 Jan 2013 01:20:35 -0500
Content-Disposition: inline
In-Reply-To: <1358509629-20471-4-git-send-email-padma.v@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Padmavathi Venna <padma.v@samsung.com>
Cc: padma.kvr@gmail.com, linux-samsung-soc@vger.kernel.org, alsa-devel@alsa-project.org, devicetree-discuss@lists.ozlabs.org, sbkim73@samsung.com, vinod.koul@intel.com, grant.likely@secretlab.ca, swarren@nvidia.com, boojin.kim@samsung.com, kgene.kim@samsung.com, jassisinghbrar@gmail.com, thomas.abraham@linaro.org, lrg@ti.com, tiwai@suse.de, ben-linux@fluff.org


--1Y7d0dPL928TPQbc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jan 18, 2013 at 05:17:02PM +0530, Padmavathi Venna wrote:
> This patch make the dma dev request operation compatible for both
> DT and non-DT cases. It takes the all the arguments required for
> dma_request_slave_channel and dma_request_channel. If the driver
> is initiated via DT or non-DT the corresponding call will be made.

OK, so this is where the SPI change came from - the API has been changed
incompatibly and SPI needs updating.  For bisection this API update
ought to be done in a single commit, otherwise there will be steps in
the bisection where nothing will work.

Anyway, I'll go ahead and apply this, the SPI and the ASoC ones but this
is something to bear in mind for the future.

--1Y7d0dPL928TPQbc
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAEBAgAGBQJRB2n8AAoJELSic+t+oim9GgUP/2aPCUUCEzzZ84pZU/YE0x7k
P6yNjLxF9nCd3VnQ1skcw4Avmc/Z9oWAoBzqrWtSO2j9HrvHNw26shCZ/vcUY85q
9B7SmXO+Ig7kao9bjguCD4ofQ6NKU5ijo4j8oGg7+ASZqfi29Kjvc1Y48ay4Xgad
mnFrBrapuF+FeHJ793emSX1l6m54vMcxUu6cR4aTJStCHwogGiT218n4n5Tbfb9K
SLCuJxkoUdiZR4kH6IipOp/jb3zJUoKXRnVDB56CHslF+EAYAL5andk8zxUb3S5+
8cwpuVIn9tKEdvHvnEn0NN6I+QGM9YdQX3KkhcgRLJjXs/HIAhx98UZdXm1R8Xl+
KkQlyTP8vkZhh7lV6SSYe2rjJtP5yyfPPHNjJMxCjr47pF9HkHzfAS1UNz95Z0en
PAo4z/WPOl6xbbV3a37LD1YSuw7/TxxHObveIp+VHjYhFaD3fGJbseGem+qc8Lfm
kqk9nTNBHyKneLhl2BZyr4ZIrg55zru2/Utz56yQWW3Uv6wcwXLMPzq+FJz4KQpG
vNlYSa1laVeD9wnvPBGubx9f9cLoWVCTaheb7nEo0b/dIoCS8www11kU8WmYdnWM
s6i2cIag/5eti5YjNK22viZEp2OcsZT00NhRF65b1EP89DSxHPzLOk/aftHEfCoJ
YJlm0eElFpXJBl923UJa
=gZTf
-----END PGP SIGNATURE-----

--1Y7d0dPL928TPQbc--
