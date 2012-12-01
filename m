From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Subject: Re: [PATCH] ARM: SAMSUNG: Fix build of I2S driver
Date: Sat, 1 Dec 2012 23:05:13 +0900
Message-ID: <20121201140512.GF17981@opensource.wolfsonmicro.com>
References: <1353944420-3972-1-git-send-email-broonie@opensource.wolfsonmicro.com>
 <15c501cdcc36$db54cb00$91fe6100$%kim@samsung.com>
 <20121127064313.GV9411@opensource.wolfsonmicro.com>
 <1d7501cdcee9$ddefbb30$99cf3190$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="EgVrEAR5UttbsTXg"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from opensource.wolfsonmicro.com ([80.75.67.52]:42390 "EHLO
	opensource.wolfsonmicro.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751427Ab2LAOFU (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 1 Dec 2012 09:05:20 -0500
Content-Disposition: inline
In-Reply-To: <1d7501cdcee9$ddefbb30$99cf3190$%kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: 'Sangbeom Kim' <sbkim73@samsung.com>, 'Padmavathi Venna' <padma.v@samsung.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org


--EgVrEAR5UttbsTXg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Nov 30, 2012 at 08:00:10PM +0900, Kukjin Kim wrote:

> Mark, I'm holding on Padma's changes for Samsung audio.

> If any updates about this from your side?

> Is it ok to send current next/audio-samsung in my tree to upstream for v3.8?

They didn't seem to have broken anything in -next for me, though I
suspect you'll have bisection breakage for Exynos as the platform data
is being removed separately to the driver update to not look for it.

--EgVrEAR5UttbsTXg
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAEBAgAGBQJQug6PAAoJELSic+t+oim91FgP/Rh8MNJIWBxiU33ztXc+9dyx
htKMDOaFCe1hWPsg5lO4p5rREozhlSFFK2c2HaNFRprWMBw6zjIwqhz7tN7UvkqR
RFbeDZ9/csC4D5tra9oaHjw1Moa+eAPWxBPh5nAWqYGix14vFmcyOTDOaJCct7fA
4ZFqjlEqENSQTeia/RAqgQlUYolIHGyJ8xtHSqzTHYcgDla5T+VN6MUO3O4YkerV
okvmE0tZnGaxbKpvntY+FmDwuMQKFYWtl4iV9E3TSctoyGSP7Up6MYKHINfdqxzV
A+21AnYPfHfM0m8JgloQDX6QKGOrhwAS7zqPRLb4EcastiixF2OUq4txBeQPfN3Q
LVOhILfUK9VhA9Yf7RvRuzxSOHPmDVxJGARedA+oyoSYt+xPlzkNNYFVLz5EVO0s
RsuJpIIufVC0jvei6RJzRKXxM71olgvnwWUa+jLADkxMnxUYrKQYzEpXGBwF0h2J
0qOrMds+TDtVyYmrokcH2SwzTeRKx2w00/8ByguPeA4XTDwGliPTm3Q2FvuNgpxt
QOAuFYJZ4Hf4O2DpPIqEXRkEGtTUovqpoMfFqR7XAssTx906GK87nxUCQrPK9PIR
zOd/FHZgdgazippJ+k3yJPP416aa8l//wMFAcME8vWQyg1SgZYpx0UyYH75GOVIt
IjJ6/bES+NVtFfwCl9yx
=Oaw+
-----END PGP SIGNATURE-----

--EgVrEAR5UttbsTXg--
