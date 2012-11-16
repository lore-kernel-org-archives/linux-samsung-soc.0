From: Wolfram Sang <w.sang@pengutronix.de>
Subject: Re: [PATCH 0/4] i2c-s3c2410: Fix a bug and optimize code
Date: Fri, 16 Nov 2012 13:05:35 +0100
Message-ID: <20121116120535.GG19028@pengutronix.de>
References: <1352981613-2098-1-git-send-email-ch.naveen@samsung.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="GUPx2O/K0ibUojHx"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from metis.ext.pengutronix.de ([92.198.50.35]:52725 "EHLO
	metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750957Ab2KPMFh (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 16 Nov 2012 07:05:37 -0500
Content-Disposition: inline
In-Reply-To: <1352981613-2098-1-git-send-email-ch.naveen@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Naveen Krishna Chatradhi <ch.naveen@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-i2c@vger.kernel.org, ben-linux@fluff.org, kgene.kim@samsung.com, khali@linux-fr.org, naveenkrishna.ch@gmail.com, djkurtz@chromium.org


--GUPx2O/K0ibUojHx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 15, 2012 at 05:43:29PM +0530, Naveen Krishna Chatradhi wrote:
> The following set of patches fixes a bug in i2c-s3c2410 driver
> with respect to the functioning of dedicated HDMIPHY channel.
> 1. Removing unwanted spinlock
> 2. Correcting the Stop sequence
> 3. Optimizing the wait loop for bus idle.
> 4. Removing unnecessary HDMI special cases
> Respectively.
>=20
> Daniel Kurtz (4):
>   i2c-s3c2410: grab adapter lock while changing i2c clock
>   i2c-s3c2410: do not generate STOP for QUIRK_HDMIPHY
>   i2c-s3c2410: use exponential back off while polling for bus idle
>   i2c-s3c2410: do not special case HDMIPHY stuck bus detection

Applied this series to for-next, thanks!

--=20
Pengutronix e.K.                           | Wolfram Sang                |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |

--GUPx2O/K0ibUojHx
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iEYEARECAAYFAlCmLA8ACgkQD27XaX1/VRuIUgCfYcINqG7AGrpf7XD7sQwXzH1V
6qIAoMskWwnamRHTwhLCLXbDusL+dYHK
=qJyU
-----END PGP SIGNATURE-----

--GUPx2O/K0ibUojHx--
