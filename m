From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 02/10] ASoC: samsung/smartq: use dynamic registration
Date: Tue, 3 Mar 2015 14:14:03 +0000
Message-ID: <20150303141403.GR21293@sirena.org.uk>
References: <1425299763-4066822-1-git-send-email-arnd@arndb.de>
 <1425299763-4066822-3-git-send-email-arnd@arndb.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="y62i5p+dJyqelKOt"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:33928 "EHLO
	mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756509AbbCCOOT (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 3 Mar 2015 09:14:19 -0500
Content-Disposition: inline
In-Reply-To: <1425299763-4066822-3-git-send-email-arnd@arndb.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: linux-arm-kernel@lists.infradead.org, Kukjin Kim <kgene@kernel.org>, linux-samsung-soc@vger.kernel.org, Maurus Cuelenaere <mcuelenaere@gmail.com>, Liam Girdwood <lgirdwood@gmail.com>, dmitry.torokhov@gmail.com, ch.naveen@samsung.com, a.kesavan@samsung.com, cw00.choi@samsung.com, jic23@kernel.org, Tomasz Figa <tomasz.figa@gmail.com>, padma.v@samsung.com


--y62i5p+dJyqelKOt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Mar 02, 2015 at 01:35:55PM +0100, Arnd Bergmann wrote:
> As a prerequisite for moving s3c64xx into multiplatform configurations,
> we need to change the smartq audio driver to stop using hardcoded
> gpio numbers from the header file, and instead pass the gpio data
> through platform_data.

Acked-by: Mark Brown <broonie@kernel.org>

--y62i5p+dJyqelKOt
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJU9cGrAAoJECTWi3JdVIfQWqQH/RseZcEzYwlUNS4ERrYkmyEd
ep2OgBGvJ5uwc387JvFqsbv58V/RANETNCFaNKBb3+12K+PJe9ZQcDskmrGcDrsl
rq3+dje2kG9L4zmfoZ0cG5za1EKDqqCEO/60ll6qJHeNR8t89w93DztP+iBQwVab
muXiDxyFWUQJCXopmmKhjZVixpHS3S8HPGoJ0xuxreDwAIZScGpa3HY1K4UHihC9
DDT2iMUugrKvLY8YKFul4A5VJPSXDVMZWUw16aSOKFoSp8mo05AuwMYWfgNwbDPo
JyX7AU+LF1ZUcoOR2ExnD5iVCf5QPnwYZB41k9MhAkg4Tg47mO0XpbpsaV2TvpQ=
=D04b
-----END PGP SIGNATURE-----

--y62i5p+dJyqelKOt--
