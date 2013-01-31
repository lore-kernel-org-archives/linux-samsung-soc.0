From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Subject: Re: [PATCH] Fix compilation error on S3C2440
Date: Thu, 31 Jan 2013 14:49:43 +0800
Message-ID: <20130131064941.GE7663@opensource.wolfsonmicro.com>
References: <20130130021857.GF4945@opensource.wolfsonmicro.com>
 <1359538522-4738-1-git-send-email-agalakhov@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="phCU5ROyZO6kBE05"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from opensource.wolfsonmicro.com ([80.75.67.52]:50399 "EHLO
	opensource.wolfsonmicro.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751045Ab3AaGtu (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 31 Jan 2013 01:49:50 -0500
Content-Disposition: inline
In-Reply-To: <1359538522-4738-1-git-send-email-agalakhov@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Alexey Galakhov <agalakhov@gmail.com>
Cc: kgene.kim@samsung.com, linux-samsung-soc@vger.kernel.org, padma.v@samsung.com, bkim73@samsung.com


--phCU5ROyZO6kBE05
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jan 30, 2013 at 03:35:22PM +0600, Alexey Galakhov wrote:
> The commit a08485d8 ("ASoC: Samsung: Do not register samsung audio dma
> device as pdev") introduced compilation error.

Applied, thanks.  Please use subject lines appropriate for the
subsystem and in general follow SubmittingPatches.

--phCU5ROyZO6kBE05
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAEBAgAGBQJRChP2AAoJELSic+t+oim9j+sP/1vn1dF0xIYacv5tuBtaRI8U
/DPLcpkJUM6nFfrKygdukRJh8oLV+zN/tB1ZOB7e9Z3x3nyj9RzTEIkcZN8oBw4z
F/bgYu7dlTCvKTO61pRIDnA8G5fCWOGT6BiXVU5dPcftN4fZEgj5rv3PRlkC/771
X82EfoK6ke64sUBSy5nU5p+tSb7BuIvYv07z3jcOC1P/pK1oDajMy+Hk9XRJL96o
Wsf6wDFN0eMBJJggAYEthQ1k8Mom/YUDCiuSmb66iTJ5RmI/HI3ElTzgL+c7sTHf
of8/oI3ii2oa6bWPS/PJdZCjD4ISOtpjaqvOjN4rs3lCa73BxYOEjBJ2MM9Eshj3
/YFkPixJnAJPk5sRpjwXPizJmH0Ig1Sie0IC97rGbLwLKoNcUNvdTRfmFDmpwjTR
58ytJScunkCsBDudRJqBdvx5hS0PCcDe6tjzZ1G0+wEsRaTav/6wd+jFWbYv8Q1T
E/znSCvl++JsueBJVJ9rHYYVJEqtIzmIoHMcTJa21O/NcPXBlttEKqZ/lQlZNCe8
Hxme5MLbowRnLw9xHnYsTjICtxWLLplOeg6yUwIsy5bCcH/DLyuoncKAMgaDoR/e
NEfMmhxFBmfb7XTG76XmClwKQEW1j20jT3wFFb0iyuZmgb/yfJV0jDaa2wVbSAlF
DklDKXU+H2i5LguAUUkd
=zY2p
-----END PGP SIGNATURE-----

--phCU5ROyZO6kBE05--
