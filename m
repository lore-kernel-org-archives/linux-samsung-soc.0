From: Mark Brown <broonie@kernel.org>
Subject: Exynos build failure in -next allmodconfig
Date: Mon, 15 Sep 2014 09:34:58 -0700
Message-ID: <20140915163458.GS7960@sirena.org.uk>
References: <E1XTTy1-0000vT-NC@cassiel.sirena.org.uk>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="BOY+hQj86lETlGFu"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:43002 "EHLO
	mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754172AbaIOQoJ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 15 Sep 2014 12:44:09 -0400
Content-Disposition: inline
In-Reply-To: <E1XTTy1-0000vT-NC@cassiel.sirena.org.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: kernel-build-reports@lists.linaro.org, linaro-kernel@lists.linaro.org
Cc: Kukjin Kim <kgene.kim@samsung.com>, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>


--BOY+hQj86lETlGFu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Sep 15, 2014 at 11:57:09AM +0100, Build bot for Mark Brown wrote:

Today's -next got a build failure in ARM allmodconfig due to platsmp.c:

| arch/arm/mach-exynos/platsmp.c:198:31: warning: incorrect type in return expression (different address spaces)
| arch/arm/mach-exynos/platsmp.c:198:31:    expected void [noderef] <asn:2>*
| arch/arm/mach-exynos/platsmp.c:198:31:    got void *
| arch/arm/mach-exynos/platsmp.c:198:31: warning: incorrect type in return expression (different address spaces)
| arch/arm/mach-exynos/platsmp.c:198:31:    expected void [noderef] <asn:2>*
| arch/arm/mach-exynos/platsmp.c:198:31:    got void *
|   CC      arch/arm/mach-exynos/platsmp.o
| /tmp/ccC9fkwF.s: Assembler messages:
| /tmp/ccC9fkwF.s:423: Error: selected processor does not support ARM mode `isb '
| /tmp/ccC9fkwF.s:428: Error: selected processor does not support ARM mode `isb '
| /tmp/ccC9fkwF.s:429: Error: selected processor does not support ARM mode `dsb '
| scripts/Makefile.build:257: recipe for target 'arch/arm/mach-exynos/platsmp.o' failed

Looks like we need a compiler flags override for that file.

--BOY+hQj86lETlGFu
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBAgAGBQJUFxUyAAoJECTWi3JdVIfQkgcH/0cPA3WlheHMtFTAM5Tu1YoM
nS6hCb4C16JBtdfvqQLJue8LCs3jMcUPvn1gkNLazfikfVVUrOSrpkA9UeY4S4U7
rNxPpeD91+kUB44+LtIfkC1cRFbBbirOsyfNcG61+OKDT1zb9vJZUL67MfmDkFQs
j/3zQnfr2Xtzi6wDmL/ZzuqzNbZgbuvQdFBmzaNdN54vZUmTGRloEM5tDFU1Woro
uXB64rZgYFxAOF6/95ASLE/F7Bkt+b1pmMfI9FuLxKHAWVbPvRMrmWyEb4Cb6kZt
uCvdy0dmwXnA0MyFVuGsUhuqI8Bxblut4AOU1A97iyuOzYA0nywYjbCJPnMvasM=
=4fU7
-----END PGP SIGNATURE-----

--BOY+hQj86lETlGFu--
