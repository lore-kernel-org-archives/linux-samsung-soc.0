From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Subject: Re: [PATCH v3 12/12] clocksource: samsung-time: Add Device Tree
 support
Date: Thu, 28 Mar 2013 12:30:50 +0000
Message-ID: <20130328123049.GX18316@opensource.wolfsonmicro.com>
References: <1362860601-18464-1-git-send-email-tomasz.figa@gmail.com>
 <1362860601-18464-13-git-send-email-tomasz.figa@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Oxb4CwPtu7fc4ajA"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from opensource.wolfsonmicro.com ([80.75.67.52]:35809 "EHLO
	opensource.wolfsonmicro.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1755321Ab3C1Maw (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 28 Mar 2013 08:30:52 -0400
Content-Disposition: inline
In-Reply-To: <1362860601-18464-13-git-send-email-tomasz.figa@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <tomasz.figa@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, Kukjin Kim <kgene.kim@samsung.com>, kyungmin.park@samsung.com, linux@simtec.co.uk, kwangwoo.lee@gmail.com, jacmet@sunsite.dk, augulis.darius@gmail.com, mcuelenaere@gmail.com, linux@arm.linux.org.uk, Sylwester Nawrocki <sylvester.nawrocki@gmail.com>, buserror@gmail.com, christer@weinigel.se, jekhor@gmail.com, ghcstop@gmail.com, Mark Rutland <mark.rutland@arm.com>, Heiko =?iso-8859-1?Q?St=FCbner?= <heiko@sntech.de>, Rob Herring <robherring2@gmail.com>, devicetree-discuss@lists.ozlabs.org, Arnd Bergmann <arnd@arndb.de>


--Oxb4CwPtu7fc4ajA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Mar 09, 2013 at 09:23:21PM +0100, Tomasz Figa wrote:

> +CLOCKSOURCE_OF_DECLARE(s3c24xx_timer,
> +				"samsung,s3c24xx-pwm", samsung_of_timer_init)
> +CLOCKSOURCE_OF_DECLARE(s3c64xx_timer,
> +				"samsung,s3c64xx-pwm", samsung_of_timer_init)

This doesn't build for me in a non-OF configuration, though this seems
to be something that CLOCKSOURCE_OF_DECLARE ought to fix rather than
your series - I've sent a patch for that. =20

It also won't build in an OF configuration with latest -next I think
since commit 4d10f054 (clocksource: make CLOCKSOURCE_OF_DECLARE type
safe) removed the semicolon the macro provided - we need them at the end
of each line here.

--Oxb4CwPtu7fc4ajA
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAEBAgAGBQJRVDfyAAoJELSic+t+oim9g30P/1hTjXx+tVlR0O5Z2NraZpjJ
2JZAuJ2P30kP5mvDYfoL/xMZ9KPiSbXg9Aq9cmnsiHkTvc47ULmZPr+4c07SAdzM
JTJfL3QYTksyhqcjjjQPNmdYIxANVL61frkMgqXbHFFScAhyfniJX4dfRLajS5Xn
qOPPVX0zF50zYslQZusbTYjj2dNvG6fmlJ3cnJlJBkj0npOMRSJ1ioDoLoPLUJNa
zhOQtHsIHJc6zHj9sMG2nJJ5i6OjXyLvp7zn1fv5tCx53ekuGUgO8+Qrty8yLRBZ
dvShQKQkUSPXJBUHtQNi0fE0Y+anP5JE04woC+JUr2ORuTj/E0TOHK7nNWzPZ/Bh
zhM+XoFHhzCW7koOFagiXNps5tt8GRMj6ABtoVchPu2Bok94rL35snGx6H7OIaGC
BpKE3EG9BYEBKcMRNcJ1XXrHcQhYJIGvQtZW23Tzcy9du4EPwrApfsc+BqmOwIkH
mmtIsm5wt5teu6RItJtSdkxF7b9VQVxUJrK4cELlRImXLihSLDzhds7ZkAUZ62ge
SgHgyzzUwQu7B+amavutKhnGDGzTEQRW2cZQVuAHoQ39Xes1KXnFsdsa82/GJKo1
SRBGfHjlAHih0m1z1zvY7zoGdc0Mb2jSP5O83OdeA9sQol1JFT8oBtIlDIQbxCV7
mBUlYv0bb1Nccm5/1+4O
=zu4+
-----END PGP SIGNATURE-----

--Oxb4CwPtu7fc4ajA--
