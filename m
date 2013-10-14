From: Mark Brown <broonie@kernel.org>
Subject: Re: Re: Re: Ask for help on SPI slave side driver support
Date: Mon, 14 Oct 2013 12:25:19 +0100
Message-ID: <20131014112519.GQ2443@sirena.org.uk>
References: <23ff6b10.bf1d.1416a88321f.Coremail.youshenghui0322@163.com>
 <4025277.bhF6fFGQqq@flatron>
 <20130930093317.GX19304@sirena.org.uk>
 <4cd52b0c.af8e.14184497bb9.Coremail.youshenghui0322@163.com>
 <20131007113323.GL21581@sirena.org.uk>
 <4e8f3999.9132.141b335ef13.Coremail.youshenghui0322@163.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="yFH6hwN92mUA4HK5"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from cassiel.sirena.org.uk ([80.68.93.111]:45748 "EHLO
	cassiel.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755704Ab3JNLZr (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 14 Oct 2013 07:25:47 -0400
Content-Disposition: inline
In-Reply-To: <4e8f3999.9132.141b335ef13.Coremail.youshenghui0322@163.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: YouShenghui <youshenghui0322@163.com>
Cc: Tomasz Figa <tomasz.figa@gmail.com>, linux-samsung-soc@vger.kernel.org, linux-spi@vger.kernel.org, jassi.brar@samsung.com


--yFH6hwN92mUA4HK5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Oct 14, 2013 at 03:05:58AM +0800, YouShenghui wrote:

Please fix your mailer to word wrap within paragraphs, your messages are
very hard to read.

> Ok, I have one question when reading drivers/spi/spi-s3c64xx.c
> In s3c64xx_spi_setup, cs->line(S3C64XX_GPC(3)) is set to GPIOF_OUT_INIT_HIGH, that means an general output pin.
> But the other three(clk, mosi, miso) was set to 2 by s3c64xx_spi0_cfg_gpio. This is just what is needed by SPI.
> My question is why wasn't cs->line also set to 2 to use SPI CS0?

In common with many drivers this driver controls the chp select as a
GPIO.  Generally the hardware is less flexible than Linux can be if it
implements automatic chip select handling at all.

> When I want to use spi as slave side, should I set S3C64XX_GPC(3)'s cfg of  to 0(input) or 2?

I don't think the controller has any slave support natively so you'd
probably need to put it into GPIO mode.

--yFH6hwN92mUA4HK5
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJSW9ScAAoJELSic+t+oim9cuAP/iLe1ndDgGUDcU78Z7GcHzqt
SCXGUdEWMccfa/ol2CmjncibY2wpNHSENCs7GMvvCzKRh9080CfEa3Yq0jl2dYST
0mn7NFuFER3sb9XM5XX1dIsxkfRdOTakFikVKGtdZfTzbHCEcEJruV6pZPhHg5oI
6jaBXg7D0yrL1XW/Yjqn/uFMbSyHNZJG7G2Cd6ayCMPhXpeKNvGC+/jbI483K37s
c6p5gpUPsoakAMj4YhOIKir8S7GsraTPWpbXmitZ0hvlaI9+6/A+c6+VhG7lbXuX
NLv9NT3QCnByCkeFQl6BtsfWqWzicXcGJaJTZzIdgX9uFauZuWN9y0apu1wQ6ba3
sF93NdDiOLo3LWZ7EJN5llvu+P6Eh20ipI3v/r+EVJGL6FokLYLminOmtx1WDhwf
zM9nqyfd84Uhl60Mv0xJi4yNqDa/j6FDH9JRP1+RJzcMAaXy5hPrYyvj/aQl8UQ1
DbYvHjI8e6hDRgMbCNqjeoJfsQjMmy1CiqkTrC4GQkvZ1750AW7I0u24DZsynR9x
1uMSGepd4GkRYhrKdWjA0Tib6juhGpA9VPFmkGUNM9c+NXzC/tarFx33Tww2IV2r
KZa7UzUp2SAPdhXDQFUmollULwPTv4qKtl6B7goCoL2SnXrXpSodPvDzD98W6JvQ
EvXGgxKKiNis+57pEiGb
=jdlo
-----END PGP SIGNATURE-----

--yFH6hwN92mUA4HK5--
