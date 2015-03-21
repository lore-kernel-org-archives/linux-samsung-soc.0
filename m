From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 05/10] ARM: s3c64xx: enable sparse IRQ support
Date: Sat, 21 Mar 2015 18:22:59 +0000
Message-ID: <20150321182259.GV2869@sirena.org.uk>
References: <1425299763-4066822-1-git-send-email-arnd@arndb.de>
 <1425299763-4066822-6-git-send-email-arnd@arndb.de>
 <20150306174316.GA26692@opensource.wolfsonmicro.com>
 <6643361.dhtMagqMYZ@wuerfel>
 <20150318000234.GU28806@sirena.org.uk>
 <20150321163821.GE23705@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="nk27jClX7wGPY2hW"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:44868 "EHLO
	mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751670AbbCUSXO (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 21 Mar 2015 14:23:14 -0400
Content-Disposition: inline
In-Reply-To: <20150321163821.GE23705@opensource.wolfsonmicro.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>
Cc: Arnd Bergmann <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, padma.v@samsung.com, dmitry.torokhov@gmail.com, Maurus Cuelenaere <mcuelenaere@gmail.com>, Liam Girdwood <lgirdwood@gmail.com>, Tomasz Figa <tomasz.figa@gmail.com>, cw00.choi@samsung.com, Kukjin Kim <kgene@kernel.org>, a.kesavan@samsung.com, ch.naveen@samsung.com, jic23@kernel.org


--nk27jClX7wGPY2hW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, Mar 21, 2015 at 04:38:21PM +0000, Charles Keepax wrote:

> So adding a bit of an offset into the PMIC with the fixed IRQ
> base fixes the problem. Although I am not sure if it would be
> better to move both PMICs onto a fixed IRQ base so there is no
> chance of the clashing. Any thoughts?

Yes, that sounds like the safest thing.

--nk27jClX7wGPY2hW
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJVDbcDAAoJECTWi3JdVIfQKq8H/jzHuTP1boJw1M26r6kfYNg+
IcZIDP3g+EGdz+xug9Jp1Cc5VtJArWoyhyDOndBZnlwOCmUbNca5iy7XC1xCa+B6
Yir6QZfLxhlZuMIRRtrzxu4NPEyX9X2TejCap3z74YyjzeoL++hreioVQHzz7QqM
RrUdnKg5sVuIllITQYRg7ARBUPXZ5+u19zqPeAvjmLlrA8126rmf0Icqf3BOpQfi
tnENR//1Loc5tbpdS9wtI8QsZ6Q+2yXPEZ+jmFIZkDAxlPaOSZnmYeaBNJAMan69
FBiVUXguApwtZR7TMOTul8q4dwl27hgE4rvf3QRIiL0Zxj5NCvHfxVTrbTNbAfc=
=9yVG
-----END PGP SIGNATURE-----

--nk27jClX7wGPY2hW--
