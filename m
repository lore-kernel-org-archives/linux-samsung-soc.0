From: Mark Brown <broonie@kernel.org>
Subject: Re: Exynos build failure in -next allmodconfig
Date: Tue, 16 Sep 2014 08:54:49 -0700
Message-ID: <20140916155449.GK7960@sirena.org.uk>
References: <E1XTTy1-0000vT-NC@cassiel.sirena.org.uk>
 <20140915163458.GS7960@sirena.org.uk>
 <20140915175709.GE12361@n2100.arm.linux.org.uk>
 <541822AC.8040805@samsung.com>
 <5418267E.8070501@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="60m8Ey44SH8YQcXf"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:45216 "EHLO
	mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753393AbaIPPzM (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 16 Sep 2014 11:55:12 -0400
Content-Disposition: inline
In-Reply-To: <5418267E.8070501@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <tomasz.figa@gmail.com>
Cc: Krzysztof =?utf-8?Q?Koz=C5=82owski?= <k.kozlowski@samsung.com>, Russell King - ARM Linux <linux@arm.linux.org.uk>, linux-samsung-soc@vger.kernel.org, linaro-kernel@lists.linaro.org, linux-arm-kernel@lists.infradead.org, kernel-build-reports@lists.linaro.org, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>


--60m8Ey44SH8YQcXf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Sep 16, 2014 at 02:01:02PM +0200, Tomasz Figa wrote:

> I think the problematic case here is v6+v7 multiplatform, where even
> though CONFIG_ARCH_EXYNOS is defined, compiler flags for lowest common
> denominator (v6) must be used. Using appropriate macros should fix the
> problem indeed.

Right, multiplatform ends up generating such a configuration.

--60m8Ey44SH8YQcXf
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBAgAGBQJUGF1EAAoJECTWi3JdVIfQ7UAH/AtywIiwr+flRMG/K+aSJhu/
+GvbAMFKdpGrh21SIJFKIF5NIQGS3gQaVz2y6nxhgHwme71QBVpfbkE/yM2Lu9y3
Jvlf1ryocW2uu8JSq8iyOsfaTOPFy0n19dGeCuShAGjbV3Hil3CyjVDPLxfwKSpf
9ECOwaqfEVX2BrTglw84HXJ9g1bWfrsSCDFDTNf8e//f+tFEugDh49G7qE2TzhI/
I7aUR/m+VrfSY3o9cnZM9Wob5NHbVi6Hj34NMm5hELeQfHC3NXZqOstVFzF/Xhny
vjfl5iWhbO8mtM80gwN7Z8wbVS4rGcJvgQXhEKrRNP2j/4LkelIA8uxjxJQ5LhQ=
=KWVs
-----END PGP SIGNATURE-----

--60m8Ey44SH8YQcXf--
