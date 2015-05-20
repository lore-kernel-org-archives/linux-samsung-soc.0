From: Mark Brown <broonie@kernel.org>
Subject: Re: [RFC PATCH 1/4] spi: spidev: Add Google SPI flash compatible
 string
Date: Wed, 20 May 2015 12:41:58 +0100
Message-ID: <20150520114158.GF21577@sirena.org.uk>
References: <1432042454-19234-1-git-send-email-javier.martinez@collabora.co.uk>
 <1432042454-19234-2-git-send-email-javier.martinez@collabora.co.uk>
 <20150520101318.GB21577@sirena.org.uk>
 <555C5F65.7010204@collabora.co.uk>
 <20150520103746.GD21577@sirena.org.uk>
 <555C6E51.5030601@collabora.co.uk>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="2FkSFaIQeDFoAt0B"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:48502 "EHLO
	mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751682AbbETLmR (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 20 May 2015 07:42:17 -0400
Content-Disposition: inline
In-Reply-To: <555C6E51.5030601@collabora.co.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Cc: Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Olof Johansson <olof@lixom.net>, Doug Anderson <dianders@chromium.org>, David Hendricks <dhendrix@google.com>, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org


--2FkSFaIQeDFoAt0B
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, May 20, 2015 at 01:21:53PM +0200, Javier Martinez Canillas wrote:

> The ChromeOS user-space just uses flashrom to send a raw stream of bytes
> via spidev to the SPI NOR flash chip. There is drivers/mtd/spi-nor/spi-nor.c
> but AFAIU there are some limitations when interfacing the flash through
> the MTD layer, for example there isn't a way to set the SPI flash write
> protection through MTD. But I'll do some investigation before re-spinning
> the patches.

OK, that's a bit concerning - perhaps what's needed here is to extend
MTD and so on (if only to find some way for it to coexist with spidev
for the time being)?

> BTW, the other "rohm,dh2228fv" compatible string in spidev added by commit
> 8fad805bdc52 ("spi: spidev: Add Rohm DH2228FV DAC compatible string"), also
> does not have a documented DT binding so that should be fixed as well.

wv :)

--2FkSFaIQeDFoAt0B
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJVXHMFAAoJECTWi3JdVIfQu6IH/232pUm3HWOrIjFBSL1rduzT
eTGGZDu2m0jYeGqMdtdSX4uutH+CTi3MKl2jRBzKAa1HRGqhAnBQkEZ6H9n9ZIIx
j+R0wDbeiSJ8MqxPemqb1+2zSXsPz2tgeQdDrTBJxJJrSTsP1xoCe2K10uwqRvcf
+6lrbG89Bjq5LWoLduSBJv4PKCqYTgZxVzyQPu4SOj3K9PuSqoa7UpJKrjMRTsGX
+EV4b3lqZb2hADZF8zUynuH9Ddma6wFqYvZZsZ6Yxxo83GJcn4VkbV9+J2kbijmv
5cN9VhjFiOUy7Ari4xx6ivx1Z+kxJSMjblHp9gqJL8ivOfDVrAiVIMk7ZkbJ15I=
=4o9R
-----END PGP SIGNATURE-----

--2FkSFaIQeDFoAt0B--
