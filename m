From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v5 0/6] Initial Device Tree support for S3C64xx
Date: Tue, 16 Apr 2013 17:33:32 +0100
Message-ID: <20130416163331.GP26958@opensource.wolfsonmicro.com>
References: <1366060483-20342-1-git-send-email-tomasz.figa@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="vzUQzca511KWT6Hk"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from opensource.wolfsonmicro.com ([80.75.67.52]:59756 "EHLO
	opensource.wolfsonmicro.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S935717Ab3DPQde (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 16 Apr 2013 12:33:34 -0400
Content-Disposition: inline
In-Reply-To: <1366060483-20342-1-git-send-email-tomasz.figa@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <tomasz.figa@gmail.com>
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree-discuss@lists.ozlabs.org, kgene.kim@samsung.com, kwangwoo.lee@gmail.com, jacmet@sunsite.dk, augulis.darius@gmail.com, mcuelenaere@gmail.com, linux@arm.linux.org.uk, Rob Herring <robherring2@gmail.com>, Mark Rutland <mark.rutland@arm.com>


--vzUQzca511KWT6Hk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 15, 2013 at 11:14:37PM +0200, Tomasz Figa wrote:
> This series adds Device Tree support for Samsung S3C64xx SoC series.
>=20
> It fixes several problems preventing from booting an S3C64xx-based system
> using Device Tree, adds all the infrastructure for Device Tree-based board
> support, including mach-s3c64xx-dt and dts include files for S3C64xx SoCs,
> and basic device tree source for FriendlyARM Mini6410 board.

I tried to test this but the pinctrl driver doesn't build in -next
(drivers/pinctrl/pinctrl-s3c64xx.c:418:9: error: undefined identifier
'chained_irq_enter') - will check properly tomorrow, need to leave now.
But that's separate anyway. :P

Reviewed-by: Mark Brown <broonie@opensource.wolfsonmicro.com>

--vzUQzca511KWT6Hk
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAEBAgAGBQJRbX1QAAoJELSic+t+oim9QIcP/ih4mRAa5H0sqkPSE6rKC9qH
BP6HvUdLVxGoPUPU1n+YwbCVQneOInPmBojfiWAo8IlFm7daK3X90ki+RQQlND+U
SGKfw0mxVcvIQUJM/UJmnJPKSnZBLkWUePQv+QpON9M0dMnqTRg8dHdLPDAU/lgq
C0aysXU9dZOM4qALX31GVzCMx5udxmLLtcLBb84NlnipOiCRE/zMePn7PBe46xZr
t6UtIIBYx9q3WYtB2wvlzVI1R+3XDJj7wVWppayXwYrzgPhJWr91zwJari0ujxhX
YlXchZ3FcTorgxvhIEbPBnHlUlwh7C9cmEPEd0EiGO3Y2A6TXEYi0nVnCzBIwUYH
SrDh/p3S1awPUEGfO363C7KQUj4suAk8aW664rGxj4qTwNMW90N0MLWQxWxeIDA9
JwhJwVV7KHkuVPuOIYk2+mqMrPHD+0MrqWR6zk2X2j4yK6tCvSVIa9/N9wN8StvZ
d1HRmlsmOcx2aN6v9y/ZSE16bopl775D5I3mmg38MYTuhCdqc8FR/5rr/Tw1ROjP
qwh0CVNXTu10BcSBUURWO5ZcMYxLhag6Y+yUtpspSOh+ChmfWDvmbEysVLfIf9pt
T+h6MEG1FwHkkUFQ/0jeWZx3YB1fBp0ReQc7F1nLxxOWoQMBtL8pDOYHLkYJ0Q4D
21ivNy65KiJweTQW1pCC
=Exoq
-----END PGP SIGNATURE-----

--vzUQzca511KWT6Hk--
