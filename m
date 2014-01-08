From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 1/2 v3] ARM: s3c24xx: get rid of custom <mach/gpio.h>
Date: Wed, 8 Jan 2014 17:08:08 +0000
Message-ID: <20140108170808.GH31886@sirena.org.uk>
References: <1386939220-12776-1-git-send-email-linus.walleij@linaro.org>
 <201401071215.06064.arnd@arndb.de>
 <CACRpkdacaskiv2R5YTB_9jFaOueXGEFxYQUEo4eq7aHkDLhjfw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="8XxSLmbBPFxpr3Sm"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:48745 "EHLO
	mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756531AbaAHRIe (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 8 Jan 2014 12:08:34 -0500
Content-Disposition: inline
In-Reply-To: <CACRpkdacaskiv2R5YTB_9jFaOueXGEFxYQUEo4eq7aHkDLhjfw@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Arnd Bergmann <arnd@arndb.de>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Kukjin Kim <kgene.kim@samsung.com>, Ben Dooks <ben-linux@fluff.org>, Sylwester Nawrocki <sylvester.nawrocki@gmail.com>, Tomasz Figa <tomasz.figa@gmail.com>


--8XxSLmbBPFxpr3Sm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jan 07, 2014 at 07:27:49PM +0100, Linus Walleij wrote:

> I think the S3C driver is a different piece of hardware unfortunately.

It's not, the IP is basically the same - the difference between s3c, s5p
and Exynos is a marketing one, Samsung have generally just reused IP
where that is reasonable.  There's a great deal of continuity in the
platforms.

--8XxSLmbBPFxpr3Sm
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJSzYX1AAoJELSic+t+oim91DUP/20Wrk9KvRtTqM02Po+6p3GB
OwbteaqQwziNybXhmFaU0v9cK6ci1WPiGzJbKcbyyUbeAcq3tXu7ov5D/bWCJnVC
K5h0L8YshnRV8VajtGbePddfkrRAu1E0alB1kgmzLMJ5I5VXADsZLsVNJBcqmeJY
QkbcYe8JLARfNOUzodJf0R+wLVpKoCrx1d/jxHo5UO4TeCPCVX6wuyhUkrRkAicC
pvzVkgENFAupYGQmT2KUrR0eNUphfYWyeregQm4jDWahZC5MY4WOP1GAre/51v5M
I79Z+Az8MhJI0f032aChBw30XALPs99tNiEIrgagSaVXYjq5ufM5ujgGfYsI3DAs
zhHCY0hTbbe3Vxkrq4glu6d/PFmOT/KrBfjycsxwOlSEockU4prbaA140wGNTiPb
29B2twTWrH54vbgg9S/rb8ogQkJuh88xrok+lJ1FcntqwTkme35+Jelu5kMWL4Nr
gxTedqtWfvCXP2ceV1WwJldyNUefq++sd/eZb5atYmIjKDDI7jY/MP4oCgKzwb2U
F6Eu7Z+UQsowvnR+O6U/jhMqSOj4tQj8x+O+venLdf5W/TJ7SXQScakxpLr4dVLm
hhdeyjolOBbCdqL6/1HO0VhCSJbqlW5Xgri03zbzEH3xK76Dc7EOgwkfUAhLAvAC
Ae17IwOQCzug0O/hrGjb
=38kd
-----END PGP SIGNATURE-----

--8XxSLmbBPFxpr3Sm--
