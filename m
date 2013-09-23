From: Tomasz Figa <t.figa@samsung.com>
Subject: Re: [PATCH] spi: s3c64xx: Add missing compatibles
Date: Mon, 23 Sep 2013 16:03:48 +0200
Message-ID: <1668307.AS5AU6asQx@amdc1227>
References: <1379929545-27517-1-git-send-email-m.krawczuk@partner.samsung.com>
 <20130923135042.GH21013@sirena.org.uk>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary=nextPart5657219.y94VlvC6mD;
 micalg=pgp-sha1; protocol="application/pgp-signature"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:17798 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753780Ab3IWOEE (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 23 Sep 2013 10:04:04 -0400
In-reply-to: <20130923135042.GH21013@sirena.org.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: Mateusz Krawczuk <m.krawczuk@partner.samsung.com>, kgene.kim@samsung.com, ben-linux@fluff.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Kyungmin Park <kyungmin.park@samsung.com>


--nextPart5657219.y94VlvC6mD
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Mark,

On Monday 23 of September 2013 14:50:42 Mark Brown wrote:
> On Mon, Sep 23, 2013 at 11:45:45AM +0200, Mateusz Krawczuk wrote:
> > Add compatibles for s3c6410, s5pc100 and s5pc110/s5pv210 boards.
> 
> >  static const struct of_device_id s3c64xx_spi_dt_match[] = {
> > +	{ .compatible = "samsung,s3c2443-spi",
> > +			.data = (void *)&s3c2443_spi_port_config,
> > +	},
> > +	{ .compatible = "samsung,s3c6410-spi",
> > +			.data = (void *)&s3c6410_spi_port_config,
> > +	},
> 
> This is missing s3c6400 and at least one other s3c24xx I think.  They
> can be added later though so applied, thanks.

I think after this patch the table lists all the SoC variants supported
by the driver, at least it's what I can tell from a quick look at
s3c64xx_spi_driver_ids[] array.

The compatible for S3C64xx should be probably called "samsung,s3c6400",
though, as it's the first SoC with this variant.

Best regards,
Tomasz

--nextPart5657219.y94VlvC6mD
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.21 (GNU/Linux)

iQIcBAABAgAGBQJSQEpIAAoJEIv3Hb8G/XrulM4P/1FIUNOQh25SYRWzfAcdTsCc
qxPWnRKb4TQ+sYBHSGi7YGadLgOgGmDILdQFzDzOB1ANEmqvKCD/xhYSzNKYSjju
hQTM/biX5i/qqdaZ6pedrXlnE+QBBcVvPJ5Wq5aGtJNAtegHyARvVDQU/rQK0Ake
wbqsd5QJbQHgvVtoKKeY/GFqYk9aLOzWUpHkbwg2gzy2Pb4gPqk4HJGRwH8xoEdY
1t6qR7gKDiCgnjO1I4QTTZjuCwE+l5aWhXq49aSo/T+BryEF7qDaY3As31m86QI4
m06SnXiaUvem7H/hpIw9v4STy7Vy9IqQvFY5kSkmRGvXsoIw+0aDmhA4azpohAKn
buccNWXlhkIK8p21O3RwykIUGcE2hCioMkpKvvrytOSQEwKqOA5E0FO1u8/AV5RG
vIOOjLkAAnasdlspC3WiWcVfNsTzon8U226Xbs9zV/fyFK7Byq8H0g+/29BWzVs9
3oVyxMNyVUnB99EUIQV3cG4xqERgOGeMdEhAzYfzPTCB1mhzBJX+yVUB+6IpLnbL
9tLmaXFNLWDS67BpIYcJrbMl8kJ867DIFgJ69xg95RLGgfAbZxFg7G+okwKFrld6
pbPOJjeYSMYmVDOINgrAQ48DgTm1A6NRpfoHvIaKEdEbRYTwtMlDmLebPe5oysoB
Z9ND2tR5pebkaDBufjl0
=taVC
-----END PGP SIGNATURE-----

--nextPart5657219.y94VlvC6mD--
