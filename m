From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 2/2] ASoC: samsung: add support for exynos7 I2S controller
Date: Fri, 7 Nov 2014 10:41:42 +0000
Message-ID: <20141107104142.GF8509@sirena.org.uk>
References: <1415343280-18916-1-git-send-email-padma.v@samsung.com>
 <1415343280-18916-3-git-send-email-padma.v@samsung.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="d9BE6hEQsVwTEwBv"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:48232 "EHLO
	mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751281AbaKGKlz (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 7 Nov 2014 05:41:55 -0500
Content-Disposition: inline
In-Reply-To: <1415343280-18916-3-git-send-email-padma.v@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Padmavathi Venna <padma.v@samsung.com>
Cc: padma.kvr@gmail.com, alsa-devel@alsa-project.org, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, sbkim73@samsung.com, kgene.kim@samsung.com


--d9BE6hEQsVwTEwBv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Nov 07, 2014 at 12:24:40PM +0530, Padmavathi Venna wrote:
> Exynos7 I2S controller has no internal dma, supports more
> no. of root clock sampling frequencies and has more no.of Rx
> fifos to support 7.1CH recording in TDM mode. Due to more no.

Applied, thanks.

--d9BE6hEQsVwTEwBv
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBAgAGBQJUXKHlAAoJECTWi3JdVIfQ4jAH/0JGLKi3iLbqOHFulo9alb/z
sAwXi4zApxL/zUH2A3bgiHoZrxO4ZdJ19wz1eGVdJ0/Cp7W6BWaqc4wPvJuqr/fx
z/ScPHq7Qm+OjdbSkkJHIvG2f1+2H08BNFxkk3QYMPzD3Rq54vRIk7A1qrKaamgI
BcmGRceREaz5dyqAv2llfALDDIhUAUS8c3V9aTCdNCWjUyBVhJFsbqEO2xZvmFdr
/lW55kcEiO4GbIpz2sODbdfAMJv2g/Sw/6gGLgsdftHfiYlbNC7JCY0057e9R5oU
JqB+YqL9E7aM0pxq0bNpBwtSMjLE7EttajuPlO4LF8xuaKK1ak5zp6gqEyPPUDc=
=Iazz
-----END PGP SIGNATURE-----

--d9BE6hEQsVwTEwBv--
