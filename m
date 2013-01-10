From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Subject: Re: [RFC PATCH 3/7] ARM: s3c64xx: Add support for OF-based VIC
 initialization
Date: Thu, 10 Jan 2013 11:10:37 +0000
Message-ID: <20130110111037.GJ20956@opensource.wolfsonmicro.com>
References: <1357774909-29938-1-git-send-email-tomasz.figa@gmail.com>
 <1357774909-29938-4-git-send-email-tomasz.figa@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="1ou9v+QBCNysIXaH"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from opensource.wolfsonmicro.com ([80.75.67.52]:54794 "EHLO
	opensource.wolfsonmicro.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1753592Ab3AJLKj (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 10 Jan 2013 06:10:39 -0500
Content-Disposition: inline
In-Reply-To: <1357774909-29938-4-git-send-email-tomasz.figa@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <tomasz.figa@gmail.com>
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree-discuss@lists.ozlabs.org, kgene.kim@samsung.com, kwangwoo.lee@gmail.com, jacmet@sunsite.dk, augulis.darius@gmail.com, mcuelenaere@gmail.com, linux@arm.linux.org.uk


--1ou9v+QBCNysIXaH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jan 10, 2013 at 12:41:45AM +0100, Tomasz Figa wrote:
> This patch modifies IRQ initialization code of S3C64xx to support
> Device Tree-based initialization of VICs.

Reviewed-by: Mark Brown <broonie@opensource.wolfsonmicro.com>

--1ou9v+QBCNysIXaH
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAEBAgAGBQJQ7qGnAAoJELSic+t+oim9F9AQAIe1COQ1uZOeNdExLfQWrtbA
2DdPIkQrCbHjhxgZe5F9uKlzj8TSox8EpV1HcLyNm9JlGzdtcu7KwmtnZrqh/kap
G2N8bVa8K0HHk3M46hV+zZsBIceOVxLj4KBkMuS3r7QuKZJGbYEKeoPwGpk/HExO
ihKT6I0vvYpYuynvH4nhT1dT/R1kOVg815LyTat1uFVfFH7sHNfU7ghc7Lp5xxP7
/pwshLbEtcdOHW6Ksm2g6K+1/yCIM8Hktr1qAARBQZ4eSKxQPRcLWNTr0t21N9Nz
OnGJA7wgKHgiczErWsYoZ6/m4eQpvi0gaHzjogcgYSNhXGV6CW326eb7wKPz8xM+
Wvy9CbNu/ELMuOspTEZgeEI7b3ku86HA+lcNb3BQheR7o0SSfg2YC8tzZGcYxKiq
l4nGEkKktmQ3FE8Z5+mzc7NYYXon2f0XDG2rSyTfrZxzEnuG6YlcvLgcEZNTc4G0
HE9Khfx1JyLF5agmrUu0vIAd3jqfZ83N1ZIqSke1dRmP9SNMszR7eaBHQysLBkFM
gVlHzRmuIHGWHVg5o4t2Y/vNyZcKMHEIU1G3X3Qyfr1XYuSns34M365BFdDSOue8
DRtIC16rSaprOtqnaSnBKiEK3Vpq0PKwaGLZkafpuXI5vrBx1cs8Le4fRgy2HvzF
wcFfMYe6RHkYQD0NoYXO
=sYwd
-----END PGP SIGNATURE-----

--1ou9v+QBCNysIXaH--
