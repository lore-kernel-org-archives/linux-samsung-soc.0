From: Mark Brown <broonie@kernel.org>
Subject: Re: [GIT PULL] Samsung cleanup for S5P SoCs for 3.17
Date: Sat, 12 Jul 2014 20:44:16 +0100
Message-ID: <20140712194416.GA6800@sirena.org.uk>
References: <53BB2658.4050808@samsung.com>
 <20140712165948.GA10012@quad.lixom.net>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="6TrnltStXW4iwmi0"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:34276 "EHLO
	mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751911AbaGLTo7 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 12 Jul 2014 15:44:59 -0400
Content-Disposition: inline
In-Reply-To: <20140712165948.GA10012@quad.lixom.net>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Olof Johansson <olof@lixom.net>
Cc: Kukjin Kim <kgene.kim@samsung.com>, "arm@kernel.org" <arm@kernel.org>, Arnd Bergmann <arnd@arndb.de>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>


--6TrnltStXW4iwmi0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, Jul 12, 2014 at 09:59:48AM -0700, Olof Johansson wrote:

> I've merged these in. I noticed lack of acked-by from Mark Brown, so I pinged
> him on IRC about it and the branch is currently at the top so it's easy to drop
> in case he has objections (cc:d here too).

Don't know if I've seen these changes (though IIRC they might've gone to
the work account).  I suspect we're going to get some conflicts since
we've also got other changes going on in ASoC so it is probably going to
be easier to merge at least that patch via ASoC.

--6TrnltStXW4iwmi0
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJTwZAHAAoJELSic+t+oim9BwkP/RwvLzgq5j5i0/rY9JwRp/uS
R1dXJh22LUTER3RD8Y6Wq8KavRPfdeMjVjReIISE8R2f53m+Es33whyU8mwVKIHU
NzDKIZT/HuZWDhr52qNESMeJ05yC+d0rLpOczNAGlv+qQtVxP5u7MXSNe8Kgegna
QY57m8KJsVOzJyftYR7YgWd41ynR3Wb8EUYN6YXCJQFfViSpfighDCnwd9elg+FP
6L/SfkjY1QaY6fMoJ10HKowvA8HpYxeaUJIdiPmK1lqgyV/z78CzSCPTetpmVE6P
vtkvispU+1jmia1lcWZFS+ATvheujq2wEVzoS03XbFXZqDAwcg9NAi1Z1lOXIAWA
54ichci1CFaYoYO5hbnL+J6m/rBw5Ow8ljnljSn50swmnepLa5olci5jsma1vELb
9SpnouSnuqgPCG87hoAwwSXWUhjfMTxlKYSajrnETjJkaySJz+X1up6Roj/Gjqsf
LaIk2PDIVNcW92QcKrHgtJfKZ9LWvovImPWiNLS1ImySXcbHaHZe8gLeG24vejkm
SbnK1JUuVuRdJ6U9lV+VuWdt/+Bn398BSf2GdOrnD81eF4DY+EUFhi3M1HbqzuxR
iShZoUpjA/fK8g9Clw0B53s68RN1C3maRuc6Y0L0a/S+7XE+8L8cuyitLfygzy45
71uMgafMOFOtc4aK9d+u
=Vyrv
-----END PGP SIGNATURE-----

--6TrnltStXW4iwmi0--
