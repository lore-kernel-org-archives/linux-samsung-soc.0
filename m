From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Subject: Re: [PATCH 2/2] ASoC: Samsung: Do not register samsung audio dma
 device as pdev
Date: Sun, 2 Dec 2012 13:33:50 +0900
Message-ID: <20121202043349.GX17981@opensource.wolfsonmicro.com>
References: <1354356447-16784-1-git-send-email-padma.v@samsung.com>
 <1354356447-16784-3-git-send-email-padma.v@samsung.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="+rRWuC8ZLvVekNoN"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from opensource.wolfsonmicro.com ([80.75.67.52]:43439 "EHLO
	opensource.wolfsonmicro.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751722Ab2LBEdz (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 1 Dec 2012 23:33:55 -0500
Content-Disposition: inline
In-Reply-To: <1354356447-16784-3-git-send-email-padma.v@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Padmavathi Venna <padma.v@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, alsa-devel@alsa-project.org, devicetree-discuss@lists.ozlabs.org, padma.kvr@gmail.com, sbkim73@samsung.com, lrg@ti.com, tiwai@suse.de, ben-linux@fluff.org, kgene.kim@samsung.com


--+rRWuC8ZLvVekNoN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, Dec 01, 2012 at 03:37:27PM +0530, Padmavathi Venna wrote:

>  sound/soc/samsung/dma.c         |   24 ++++++------------------
>  sound/soc/samsung/dma.h         |    3 +++
>  sound/soc/samsung/i2s.c         |    3 +++
>  sound/soc/samsung/smdk_wm8994.c |    7 +++++--
>  4 files changed, 17 insertions(+), 20 deletions(-)

This is fine in principle but it's going to break every Samsung based
platform except the SMDK with WM8994 as only machine driver updated to
reflect the changed DAI name is that one, the others need updating too.

This includes pretty much all the platforms I actively work on...

--+rRWuC8ZLvVekNoN
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAEBAgAGBQJQutomAAoJELSic+t+oim93mMP/AlxtiZUA0Kz1t/E8Tpj8b0M
KTFP6uTk/uO/CWohCJ72Ju7uJkB21Ui88RIL54DxZ9Gdupm1R0iNYW1599JqhY+p
lf0j/Pm74V8DUuDK1wBKqt+bW33eFC+K+TkVMOoYJQ+FSU+kb34G5+YBEJPFyDJE
zY0NM+RESCRccKw1xGKV0ledlAXT5wiVCRhStOMXOFthEf8+mG2dClCF6pGlhLXy
BHetzWtk3ZSRcv94d24L6+xLulWaBY2C0q0rm3usaqRfbNdCAcTIiW6qNbKiWgnb
6y7dkyqL41KV2ZjF7kQoAYGLtyRfdy1D9BYVCeCjeMJ74XS5vGG2nqCYCaU8vx3A
IrK/lLGhNr7SoBqTJ2m8Fcdr8uo+WgDlVvhBDAnSxvWjKSTaiBqsuTDHdYB4fBq4
oEv1Sj9MRzOE7DmoP8LL9avWBxvyqbBpXWJGXToz0VfudzMGrw3oTGNhDjFcIsCQ
HxsDn7rJddzuSkWRft7x+rvj/ma+5V1XBPWdiw9n5EiYTKE52nl60jV/19pJ+u5F
8IvTRCl7uG1XcCwiOMpwBftscWTAq8Nx9aqDJw/4nT3qGkEubMvY1QeSNhLfJMCN
5wh5qfPxVBtyBhfOaEOkkpVEI3bL8uJGsU0zB+KCWGLN28pOBOzxIsoPyvfGKjex
W3b8tmyMv5bycbJjVkeR
=aXqc
-----END PGP SIGNATURE-----

--+rRWuC8ZLvVekNoN--
