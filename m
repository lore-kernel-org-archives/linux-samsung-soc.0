From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Subject: Re: [PATCH V6 04/10] spi: s3c64xx: Modify SPI driver to use generic
 DMA DT support
Date: Tue, 29 Jan 2013 13:19:46 +0800
Message-ID: <20130129051943.GE6878@opensource.wolfsonmicro.com>
References: <1358509629-20471-1-git-send-email-padma.v@samsung.com>
 <1358509629-20471-5-git-send-email-padma.v@samsung.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Rgf3q3z9SdmXC6oT"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from opensource.wolfsonmicro.com ([80.75.67.52]:37836 "EHLO
	opensource.wolfsonmicro.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1752877Ab3A2FUB (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 29 Jan 2013 00:20:01 -0500
Content-Disposition: inline
In-Reply-To: <1358509629-20471-5-git-send-email-padma.v@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Padmavathi Venna <padma.v@samsung.com>
Cc: padma.kvr@gmail.com, linux-samsung-soc@vger.kernel.org, alsa-devel@alsa-project.org, devicetree-discuss@lists.ozlabs.org, sbkim73@samsung.com, vinod.koul@intel.com, grant.likely@secretlab.ca, swarren@nvidia.com, boojin.kim@samsung.com, kgene.kim@samsung.com, jassisinghbrar@gmail.com, thomas.abraham@linaro.org, lrg@ti.com, tiwai@suse.de, ben-linux@fluff.org


--Rgf3q3z9SdmXC6oT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jan 18, 2013 at 05:17:03PM +0530, Padmavathi Venna wrote:
> This patch modifies the SPI driver to use generic dma dt bindings
> support. This passes all the required arguments to dma dev request
> functon which in turn calls the dma_request_slave_channel or dma__
> request_channel based on DT or non-DT respectively.

This loooks OK and I'm actually applying SPI patches so I could apply it
but I'm not sure I see the relevance of this patch to the rest of the
series (which is about ASoC).  Is there some reason why it's included in
this patch series or can it be applied to the SPI tree?  The SMDKs use
I2C for their CODEC control rather than SPI.

Also is there a binding document update or device tree file update to go
with this?

> +	if (!sdd->pdev->dev.of_node) {
> +		res = platform_get_resource(pdev, IORESOURCE_DMA,  0);
> +		if (!res) {
> +			dev_err(&pdev->dev, "Unable to get SPI tx dma "
> +					"resource\n");

I appreciate that this is cut'n'paste from the code you're refactoring
but please don't split error messages over lines, it makes it hard to
grep for them in the kernel source.

--Rgf3q3z9SdmXC6oT
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAEBAgAGBQJRB1vTAAoJELSic+t+oim9b2UP/RWygjy50b9hux8CIRbD7Iv8
TgraLNnL4RdJwBL3AKDGdRAa28A3zN5ssSlU21bj9hUsPuw/FR6j0xBE32VS2ERw
y0J0Zk6fab/QWP0FeNLyZHPaIRFmfMfSfFoXAhLnoDb67w3IGxr00awKgMqlr6Dt
DBWKQ2fP+IZAq41ejf7J1QtPJyv6Tj8T1zKdSPOmrxECJBolY9YCUD3mExxWHzvK
Tc28/hO6K7qFstHYK2LvDeLT7AGxoCfpeJZYlKXphH5tY7xp11WJjmj14JXbJfGc
+kVFcjuOGeaBKlgfchYY96a2kZlIuZ3Tqy/aD9fxH7YuctFCi/C3UiGZgn+aBpFu
akn+S5dMMVcU8rSMIfNUQl1RjYnDQdBWDtmrOxlNaatlj7iFB24tSM/nwMQBL7zQ
Q9L4XXB+QrwRvzKAr19stbgBSR30yoBn4bxjyjFi51ZUunRyLo+yXA2vL01IWrUA
fokRTGvtO+oqe5C5Vft6sdCixtNukwOIZVR0b9YvsVlFzDa94Rn4eATmyi0rwnT3
NzOaG599ZYXEPwbt+ZO1BHTb5QFqaWh80KQ33XvGzTZWzAXMWBW4WNgaJBTy1r3n
jaO0fIqF1BPwZfH7sSZzbq/YX7dpLM3sGYJmIzJlF5kC2HzIwavCe+3+gmwsaCyT
rVe55qCv9Hp7EfQrc/TZ
=YEaM
-----END PGP SIGNATURE-----

--Rgf3q3z9SdmXC6oT--
