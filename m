From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 3/3] ARM: dts: Disable I2C controllers by default on
 Exynos5250
Date: Fri, 13 Sep 2013 00:42:25 +0100
Message-ID: <20130912234225.GZ29403@sirena.org.uk>
References: <1378982427-5802-1-git-send-email-broonie@kernel.org>
 <1657964.f1bIFjAZ98@amdc1227>
 <20130912200013.GU29403@sirena.org.uk>
 <1462876.u3JagxpM84@flatron>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="18II17TkgouCCESf"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from cassiel.sirena.org.uk ([80.68.93.111]:41672 "EHLO
	cassiel.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753406Ab3ILXme (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 12 Sep 2013 19:42:34 -0400
Content-Disposition: inline
In-Reply-To: <1462876.u3JagxpM84@flatron>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <tomasz.figa@gmail.com>
Cc: Tomasz Figa <t.figa@samsung.com>, Kukjin Kim <kgene.kim@samsung.com>, Rob Herring <rob.herring@calxeda.com>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Stephen Warren <swarren@wwwdotorg.org>, devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linaro-kernel@vger.kernel.org


--18II17TkgouCCESf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 13, 2013 at 01:02:11AM +0200, Tomasz Figa wrote:
> On Thursday 12 of September 2013 21:00:13 Mark Brown wrote:

> > > i2c@12CA0000 does look like a normal hardware I2C controller, which
> > > needs some extra properties like samsung,i2c-sda-delay or
> > > samsung,i2c-max-bus-

> > Shouldn't these have sane defaults?

> AFAIK those parameters are highly board specific so it would be hard to=
=20
> set any reasonable default for them.

At least the maximum bus frequency should be able to be set to 100Hz by
default, that's the minimum from the I2C spec though pretty much
everything does at least 400Hz.  sda-delay should really be able to
default to either zero or something per-SoC, I don't remember having to
tune it when using board files and I2C is generally pretty robust so
it'd be surprising if it were that sensitive to system design.

--18II17TkgouCCESf
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.21 (GNU/Linux)

iQIcBAEBAgAGBQJSMlFeAAoJELSic+t+oim9i74P/0YEIR+jiGrQvHn3XlDpDHyY
qyD/Wpavhdyciv7wEiXzsY3VHlSJeGtSFZd3OIIXZ8SOJDLpdDwAKqW8MYbkmku5
xoMqRWO66wW4aHHeIlKcRxlb5/uYmw54G65hOxpUYMH9G/iCgC6kuacrGrGpVAX6
gI6+Dfcr7tUS1vmJmrrHWoEEEZDwBJM5kYiKLh8pewhwUFJtCU6fqEJ41Zrkc8VO
LPflMBh37Mtj2leA/JPNxUOOSlSUcJy7FBn+uq1nh+qR0cPiyPmylNM5UJlQpRIu
g23Cr/nfxyw/Rw9KuY05UjjObdV32h2NHWbaVfDXAOCnNTTINygKU36M7J0xTbiu
NpiOJHFcDkv63+p+CL2m5ezjn+RHwDhZQnyOLAX3muOhD9iShEfvAnn5phdhsPnn
wunA0QcB+qe1egdKkVHO4p36E+km5hmfTbXsJEChRcSj+g+jN5Gr8733ttxX9xdM
YQwsdHdaLRzU20TVvU0zLYqr/c2aBAmdz77t/NshqRdq9xfcMJsxjn5ZCOz1D87c
HwKLjjq4hBSWagOFdhUxgoQhT/gYDODKunPD3jy5NmeQf9tuKRQ93Npq4QKS+DgQ
2xWFGyanMz/efugkBLSs64MLMQ8qQq+FtJDccCofktACYsHJ7bZeKrdtNcJoD4ys
D012RfkpJ9lR4HhYDrkK
=zSkz
-----END PGP SIGNATURE-----

--18II17TkgouCCESf--
