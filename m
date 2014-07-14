From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 1/3 v6] spi: s3c64xx: fix broken "cs_gpios" usage in the
 driver
Date: Mon, 14 Jul 2014 18:25:24 +0100
Message-ID: <20140714172524.GH6800@sirena.org.uk>
References: <1405316506-27855-1-git-send-email-ch.naveen@samsung.com>
 <1405316506-27855-2-git-send-email-ch.naveen@samsung.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="8/pVXlBMPtxfSuJG"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:37185 "EHLO
	mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751921AbaGNR0F (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 14 Jul 2014 13:26:05 -0400
Content-Disposition: inline
In-Reply-To: <1405316506-27855-2-git-send-email-ch.naveen@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Naveen Krishna Chatradhi <ch.naveen@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, spi-devel-general@lists.sourceforge.net, linux-samsung-soc@vger.kernel.org, naveenkrishna.ch@gmail.com, grant.likely@secretlab.ca, jaswinder.singh@linaro.org, kgene.kim@samsung.com, cpgs@samsung.com, devicetree@vger.kernel.org, Tomasz Figa <t.figa@samsung.com>


--8/pVXlBMPtxfSuJG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 14, 2014 at 11:11:44AM +0530, Naveen Krishna Chatradhi wrote:

> @@ -812,6 +800,10 @@ static int s3c64xx_spi_setup(struct spi_device *spi)
>  		spi->controller_data =3D cs;
>  	}
> =20
> +	/* For the non-DT platforms derive chip selects from controller data */
> +	if (!spi->dev.of_node)
> +		spi->cs_gpio =3D cs->line;
> +
>  	if (IS_ERR_OR_NULL(cs)) {
>  		dev_err(&spi->dev, "No CS for SPI(%d)\n", spi->chip_select);
>  		return -ENODEV;
> @@ -819,17 +811,16 @@ static int s3c64xx_spi_setup(struct spi_device *spi)
> =20
>  	if (!spi_get_ctldata(spi)) {
>  		/* Request gpio only if cs line is asserted by gpio pins */
> -		if (sdd->cs_gpio) {
> -			err =3D gpio_request_one(cs->line, GPIOF_OUT_INIT_HIGH,
> -					dev_name(&spi->dev));
> +		if (gpio_is_valid(spi->cs_gpio)) {

As previously mentioned gpio_is_valid() is *not* a direct substitute for
checking if the boolean flag cs_gpio has been set since 0 is a valid
GPIO on at least some of these platforms and as discussed several times
already some of the SoCs require the use of the built in chip select.

In general it's quite hard to tie the description in the patch to the
code changes, not helped by the decision to do separate refactorings
like this conversion to gpio_is_valid() as part of the one patch.  The
description of the patch now makes some statements about what the
problem that's intended to be fixed is but it still doesn't seem
entirely clear that everything has been thought through fully and tied
to the code.

The original code appears to be buggy which isn't helping anything but
it's hard to have confidence that this isn't going to break some other
use case that currently works given the lack of clarity and the number
of revisions that have been required so far.

I think some combination of smaller changes and a clearer working
through of the before and after states for both DT and non DT cases to
show that everything has been considered would help a lot.  I may have
another stare at this but it's worrying how hard I'm needing to think.

--8/pVXlBMPtxfSuJG
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJTxBKBAAoJELSic+t+oim9QP8P/RHc1G9eqFq4SLxSD/ihcMrv
HQ/QDv2y3sckHIEVOGNPG6KpqYPFL1FZkl6iehQ9IXXJcs+1yQ9n1oRzOz5Ymbfv
IPkX9vyM33q52Hrtrfnl2Sgv9P3fQRFPUn8mM3Y9V9bB0kvFANWt8ueF72oUTLkZ
t0sF/yGbvdRHMXCFQmYZqISKTvjiZrYZdjHmmlOADXymlNJh+LlN48YJeU+yMPP3
b+TGYtCwqYcfl3V1qjXapNnWi8TQJUczk5SiAsbs33U1tIFoavcQCpKisAtSgoBE
IArMoafrPxpP1KY1kGRD4FMM7/00cb7hziv/WlTlTRzaaoRuQA1h4M2wiogt/FLC
WfOAP1mjmk55o3kQ0YtrfQOCCsicPAAgDgDdYL9IRpJP0PnrQ7OdEUq0L02Rb4kl
dQS0qmnRlpF9pGxuuvpDWRmqJcviSGuWLS8HJvg+OFt/Z3K/plMAKKiI0Urv7uTy
cafFnN5+NUA4Z+4ND0RwDPnqSCG5g0arYs7fvX9JKyUGjvbxd9LaD821QtOg77WA
4jNFKvFyzykH5enHhmbllBa3gSFqdJfRcLEBThrG4GKco3Qygv4HJ5jF7jo/5wiP
SwjWqR9QuCuawgvKQzk71qyCavbVv09IpZEMdkH1oKO9uMwXCNOmL605KbqrVMSf
IcETCjuOa2Zwhl7iM2es
=9yH/
-----END PGP SIGNATURE-----

--8/pVXlBMPtxfSuJG--
