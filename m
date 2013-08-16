From: Mark Brown <broonie@kernel.org>
Subject: Re: Broken device trees for exynos in linux-next
Date: Fri, 16 Aug 2013 19:03:59 +0100
Message-ID: <20130816180359.GO30073@sirena.org.uk>
References: <CAOesGMgv9gTQ_NtaKZY_ZfLD1NBU19E-vaLaWwmvGJJB1MQrwg@mail.gmail.com>
 <13b101ce9a14$2cebd700$86c38500$@org>
 <CAOesGMiyNM6VdNzKQU3XwoiacJV8hc60mcLiH+vHoS6xJM6q-A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="lCFQJunhLz1tFGpX"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from cassiel.sirena.org.uk ([80.68.93.111]:54856 "EHLO
	cassiel.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754207Ab3HPSEF (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 16 Aug 2013 14:04:05 -0400
Content-Disposition: inline
In-Reply-To: <CAOesGMiyNM6VdNzKQU3XwoiacJV8hc60mcLiH+vHoS6xJM6q-A@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Olof Johansson <olof@lixom.net>
Cc: Kukjin Kim <kgene@kernel.org>, Arnd Bergmann <arnd@arndb.de>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>


--lCFQJunhLz1tFGpX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Aug 16, 2013 at 09:04:41AM -0700, Olof Johansson wrote:

> Really, what we want is to just turn on the LPAE functionality and
> keep everything else common. Forking into two defconfigs seems like

There's issues with that at the minute due to the DMA mask fun breaking
stuff, though Russell's work has resolved that it should work fine.

--lCFQJunhLz1tFGpX
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.20 (GNU/Linux)

iQIcBAEBAgAGBQJSDmmMAAoJELSic+t+oim97t0P/1v5qFDGHiBHYvwXddlrTP97
pzlFLwugnSs/mh885j+T8zYOVkd0niLTKLNR7zZHihXnXLkmvetcm9ejktaP2snV
rvXhI4h6pdxVRJaEpOACKTRy78agjr2PP1T39yA71iArEZqDucJUoQwuSbtx0Mme
77SVmW5UHI2iv/tv/ZaSkeNng/s6/UaBO95tsrBEUba3EOb6r2cC1BQ9u5k/GL3r
4jTjBC+1LUqBPLsBQZfgBRPcb8MK5fjludEvDxAk5wYWLReey20ZMtmKvpqKn8Uw
nu4+whRhxmQ6oVCYlP2F11xdvTqkI4F3vfQUAjYgTp+HuHUcOobA7b71VKtTvzzI
NNnU5cPd20MpV3gx0TrDuAYwX1vlO/6icFTCk9kk1GYdPqtisOXLhORLsMdSr5VA
itlc5RtzJ2lTA2YtE057D9uRqTg8mcO6WIrd7j/w0s2aXmodByyvXNeYutGZ8+pM
UyOQA+RIqstZnB/qIcBOklSC26AhNDZgJ9hYJCllLU/HRs4B0t2Auj3MqXK+0v+f
/LXfXljpplh7yOdTj/faA6/++xJvfZ5qwQLHs94W0t2MQjA0F3X0YTJMGiKHoeqE
JG80KzpXDWwXoYmq0tUX3/EwmwizC3XrJjBv44e/LRTDkkqosgl6sp2tjnG/29l6
KtNAblLDp4/kBe//1rQ2
=Dy0O
-----END PGP SIGNATURE-----

--lCFQJunhLz1tFGpX--
