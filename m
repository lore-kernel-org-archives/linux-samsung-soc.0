From: Mark Brown <broonie@kernel.org>
Subject: Re: [RESEND PATCH v2 1/2] ASoC: samsung: s3c24{xx,12}-i2s: port to
 use generic dmaengine API
Date: Sun, 22 Jun 2014 11:53:41 +0100
Message-ID: <20140622105340.GN24291@sirena.org.uk>
References: <1401642958-6236-1-git-send-email-anarsoul@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="dPW7zu3hTOhZvCDO"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:53391 "EHLO
	mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751551AbaFVKyA (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 22 Jun 2014 06:54:00 -0400
Content-Disposition: inline
In-Reply-To: <1401642958-6236-1-git-send-email-anarsoul@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Vasily Khoruzhick <anarsoul@gmail.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, alsa-devel@alsa-project.org, Kukjin Kim <kgene.kim@samsung.com>, Sangbeom Kim <sbkim73@samsung.com>, Lars-Peter Clausen <lars@metafoo.de>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Tomasz Figa <t.figa@samsung.com>, Heiko =?iso-8859-1?Q?St=FCbner?= <heiko@sntech.de>


--dPW7zu3hTOhZvCDO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, Jun 01, 2014 at 08:15:57PM +0300, Vasily Khoruzhick wrote:
> Use dmaengine instead of legacy s3c24xx DMA API for s3c24xx and s3c2412

These fail to apply against current code, can you please check and
resend?

--dPW7zu3hTOhZvCDO
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJTprWxAAoJELSic+t+oim9e9QQAIbWT3LN0esWBkE2B8zKw/gJ
uJhX8SR/DH6Mc6QFDp55CxsWARw2Y4ZaTSxn7//rr9Lpr8u+gngltRcsGsp+ZfTz
Amq1cR696QLi7baU5ytqgirv6Ub018pSnlHFaQ2U8EBsQsu/36aSUF+AbiiwmdLH
A2rP/AgStrKtYZhogsPBBlVRVUlb4yDKrQ8cq4+XnUmECIOJuuMfugXws0KjcX0j
YolpKncvh1/UvFsDpDrdHxwK2mObw2HCspNjpmzc5mBEmPEYeAFHDrixIwTyt6mj
G4LQyHm9bwF97W49RUvB7IvPRQs51+MWiv1qJzqsE+8b3AujCaYTz9uqpDDuCK6q
XnJ9B7Y5ZzWqraxkGNCYgxrqQDrjRbfZuRz+k6uhTTkaX4Vse+Vqk3cnUgr/sS8E
BmW7KNE8sDhP5bgCY/VYVICprpWTRUIU3oD6VZ7CXEtB7OCnfhcNO6Pax8FbPRKe
pwoEx//QaW3F4eSTWKz2xR7hSn/UtlK/eLXH+AdfYnPaXMxOCbH9d9vbSGxMDNcT
qbZE0pxvRP+SeU8KlJHptDxa5sssGsJtb1h26/r3hR2R+L6w9/NSlSGrQQNzrwVh
GTwulvGJELVd2uB1CP5qvn1xgbw+7nM4XrMwIelJRN4M01am2uEQd1I/yDvtTMlQ
ZSI3GSqcxXCXsFu4dwIJ
=G+I+
-----END PGP SIGNATURE-----

--dPW7zu3hTOhZvCDO--
