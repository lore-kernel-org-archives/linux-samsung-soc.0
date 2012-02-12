From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Subject: Re: [PATCH] i2c-s3c2410: move resume state flag to end of resume
Date: Sun, 12 Feb 2012 13:12:31 +0000
Message-ID: <20120212131230.GB3395@opensource.wolfsonmicro.com>
References: <018401cce86c$5df94130$19ebc390$@samsung.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="hQiwHBbRI9kgIhsi"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from opensource.wolfsonmicro.com ([80.75.67.52]:42335 "EHLO
	opensource.wolfsonmicro.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1753946Ab2BLNMe (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 12 Feb 2012 08:12:34 -0500
Content-Disposition: inline
In-Reply-To: <018401cce86c$5df94130$19ebc390$@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Huisung Kang <hs1218.kang@samsung.com>
Cc: linux-i2c@vger.kernel.org, linux-samsung-soc@vger.kernel.org, ben-linux@fluff.org, kgene.kim@samsung.com


--hQiwHBbRI9kgIhsi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, Feb 11, 2012 at 12:22:21PM +0900, Huisung Kang wrote:
> From: Kisoo Yu <ksoo.yu@samsung.com>

> need to set flag after finishing its work

> -	i2c->suspended = 0;
>  	clk_enable(i2c->clk);
>  	s3c24xx_i2c_init(i2c);
>  	clk_disable(i2c->clk);
> +	i2c->suspended = 0;

Why is this needed - given that there's no locking involved anywhere
here does this mean that we've got a race somewhere?

--hQiwHBbRI9kgIhsi
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQIcBAEBAgAGBQJPN7qqAAoJEBus8iNuMP3dae0P/1t9ap40yF79bYIo09MRiElk
rFH68IVUu6RhBDuFw1MVLxSM+D+enMWmYExNmC619FixkCsDfd/9JmqUX9LQBsV8
zI+Op2BZTNaOVoz+s2CmHqVmXPbCZCl6anZLabp/vqsNpHin/IbpLnItmNvGdnzt
OqMr5f9nA2XsODHaHi+gtgL1IjlxhQWv6eObKUh7d3ieqjzNO1jLlmIPA7EqCnPJ
jJX9BiSxYgffwqIgkTiLvKYd1JoGssuRxJk6zKCFpxlMwqBHV7ZUFLb0OO7y0mxr
n+1UhDDX18VUdp/Derka4EZsv+DqNVpXaLBpgZkBGfvOFoS4/qYQiL88s7tiGgNJ
H0gKA2zJHRt1C0ePlTp0LNB86BowWOBK5BhTNb47rS6L4gOsoOAcYcZIUAFSbP0j
tXTaUEqoJw3CX2o2N4/tOgLyuT66zykDvLVvg5s5CfoHwNxGZNTiBs42OH/J0JtN
JpXn/aI8+dqTyV6KNJS6a1Gwb5lfDsVFbhQQcjEKUzOnr6JiHv4rCBe4DO21hFb/
PAJHSXIQbW+xp5KBWXl6GORY5mWidCkvRSvBDm8qhjQ+S/ZEIHOtHhQT7JxodTWN
5wXGMYSlviZRlB/+/xFlFCV456hMKFobnfQW04HDfEtulDQiot5hfW4mU9ki9UrO
8tDj3JZUSrkfIVZSiCpW
=tRSG
-----END PGP SIGNATURE-----

--hQiwHBbRI9kgIhsi--
