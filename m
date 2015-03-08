From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 05/10] ARM: s3c64xx: enable sparse IRQ support
Date: Sun, 8 Mar 2015 18:56:27 +0000
Message-ID: <20150308185627.GU28806@sirena.org.uk>
References: <1425299763-4066822-1-git-send-email-arnd@arndb.de>
 <1425299763-4066822-6-git-send-email-arnd@arndb.de>
 <20150306174316.GA26692@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="V4yrq4dHtCqH+JvC"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:58968 "EHLO
	mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750894AbbCHS4u (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 8 Mar 2015 14:56:50 -0400
Content-Disposition: inline
In-Reply-To: <20150306174316.GA26692@opensource.wolfsonmicro.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>
Cc: Arnd Bergmann <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, padma.v@samsung.com, dmitry.torokhov@gmail.com, Maurus Cuelenaere <mcuelenaere@gmail.com>, Liam Girdwood <lgirdwood@gmail.com>, Tomasz Figa <tomasz.figa@gmail.com>, cw00.choi@samsung.com, Kukjin Kim <kgene@kernel.org>, a.kesavan@samsung.com, ch.naveen@samsung.com, jic23@kernel.org


--V4yrq4dHtCqH+JvC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Mar 06, 2015 at 05:43:16PM +0000, Charles Keepax wrote:

> Cragganmore, I need to look into it a bit more but it looks like
> one of the PMICs can't allocate its IRQs:

> [    0.961455] wm831x 1-0034: WM8311 revision C
> [    0.965066] wm831x 1-0034: Failed to allocate IRQs: -17

> And the CODEC can't request its IRQ:

> [    4.252735] arizona spi0.1: WM5102 revision C
> [    4.269763] arizona spi0.1: Failed to request primary IRQ 263: -22

> Hopefully I can look into this a little more next week.

The second is a knock on from the first - the CODEC interrupt line is
connected to the PMIC so since the PMIC can't allocate its IRQ range the
CODEC can't request it.

--V4yrq4dHtCqH+JvC
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJU/JtbAAoJECTWi3JdVIfQduIH/iax+XszscTcQxZ5zj5lVRGt
RG0dWdzIF4vyGDcVinciGKumTe6MQSKy00b38FFSebUVOd5aFF1dCSk0fT75jJSa
6vgjNTQpB7Z+hItwHPfNaNq3CvbNjyZfIJX0fHKAjDduS/NPEaXEZK/JcA6IQQBv
HXe4JICZPG/KJqGa2l1yEl8F5RTeSJ1LoPkJzmgI6KMpPT38VEhCaXdAEW1CVLmB
8cQq2HC+jA5722INJD9MuBEFuHAxLHunOOW6omewLCTJRc0xUb8tS92cGkaxdwGU
zj+Gj8Ran2Sb5oNc0IkmiJ8upcQX68vEQ5omSGGoS1oNV0wLkMBq3yuKFuyScsY=
=LchU
-----END PGP SIGNATURE-----

--V4yrq4dHtCqH+JvC--
