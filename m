From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 1/3 v5] spi: s3c64xx: fix broken "cs_gpios" usage in the
 driver
Date: Wed, 2 Jul 2014 17:56:51 +0100
Message-ID: <20140702165651.GK410@sirena.org.uk>
References: <1402631992-500-1-git-send-email-ch.naveen@samsung.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="d6d1KVhp94hk3Jrm"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:43924 "EHLO
	mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S964769AbaGBQ5Y (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 2 Jul 2014 12:57:24 -0400
Content-Disposition: inline
In-Reply-To: <1402631992-500-1-git-send-email-ch.naveen@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Naveen Krishna Chatradhi <ch.naveen@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, spi-devel-general@lists.sourceforge.net, linux-samsung-soc@vger.kernel.org, naveenkrishna.ch@gmail.com, grant.likely@secretlab.ca, jaswinder.singh@linaro.org, kgene.kim@samsung.com, cpgs@samsung.com, devicetree@vger.kernel.org, Tomasz Figa <t.figa@samsung.com>


--d6d1KVhp94hk3Jrm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jun 13, 2014 at 09:29:50AM +0530, Naveen Krishna Chatradhi wrote:

> Hence, spi-s3c64xx.c is broken since "Jun 21 11:26:12 2013" and
> considering the time with no compliants about the breakage.

I'm not clear what the breakage is?  Some boards are broken but what's
the driver issue?

>  	if (!spi_get_ctldata(spi)) {
>  		/* Request gpio only if cs line is asserted by gpio pins */
> -		if (sdd->cs_gpio) {
> -			err = gpio_request_one(cs->line, GPIOF_OUT_INIT_HIGH,
> -					dev_name(&spi->dev));
> +		if (gpio_is_valid(spi->cs_gpio)) {
> +			err = gpio_request_one(spi->cs_gpio,
> +						GPIOF_OUT_INIT_HIGH,
> +						dev_name(&spi->dev));
>  			if (err) {
>  				dev_err(&spi->dev,
>  					"Failed to get /CS gpio [%d]: %d\n",
> -					cs->line, err);
> +					spi->cs_gpio, err);
>  				goto err_gpio_req;
>  			}
> -
> -			spi->cs_gpio = cs->line;
> +		} else {
> +			dev_err(&spi->dev, "chip select gpio is invalid\n");
> +			return -EINVAL;
>  		}

This appears to be making it mandatory to specify a GPIO when previously
it was not mandatory which I believe breaks some SoCs - the native chip
select has to be used on some devices as there is no pinmux option to
make it a GPIO (this was why the native chip select support was added).

Also I'd need to check but are you sure that GPIO 0 is not valid?

--d6d1KVhp94hk3Jrm
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJTtDnPAAoJELSic+t+oim9dCwP/0hLN5l2CNp2YeupNQ5L4pGa
UnIJLuovAICJDzeqh1PrKPlX7iArMZ4G3JPoExDZ8Mr3ng7mK1+8aiIhXfy+ZMre
H8imblIh5VE1vx83yb6M1oh8uyh4VcUq+xvS6W92KtS+w3VihZDcc3wpfZHO0qEf
WzaeLXPhzSd6fpfAdueTOwOEX12lFVnpXGcbveeLaqX8whiiI7sd5YphiYoh6N8U
VYtt1PP443l3JRJy3v4ZW6WOU4lQWRxdUND7mt4klPENe7C8TRW3lvD8mZfbeDq6
mcvJG0y20tQWrFZKPHcH+JTXugTFCRzPEGulZ20E0xH9G7Rd28SA8co4wnBV0PZ7
F8HUC03SuXaqzf7zuJq5k1Y6z93plEQ5r/UCAMjIapi1oQwBM3ArYPVALHApXAp9
eFJCaTbGR0ijXafOTP8Brq7PCNPXTgPuw/7sKDNUY6yIIDREILY/Ka1nUiL73cSu
mhJ8/Q3RgRDn139gDOL1RYzfKASwrnD/z5NziVmkoOlQO4oC6QSYuCvqw1/2Q6DI
8e02KNktszNIheIY3u6gxkgnLPwHwz3gFZPw9NVQNKF2U9Qc0Y0gMYoR+SyHhm1q
gyl6FUzTaLDYALa54Kk1XtGL3Y38UOePlzkU7q1WylgpdIyXAN3hb2ydIQF+pCQT
h/KGLvsC5cJFo8DtYJj7
=xynw
-----END PGP SIGNATURE-----

--d6d1KVhp94hk3Jrm--
