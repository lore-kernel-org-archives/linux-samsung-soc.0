From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 1/3 v5] spi: s3c64xx: fix broken "cs_gpios" usage in the
 driver
Date: Mon, 7 Jul 2014 08:32:44 +0100
Message-ID: <20140707073244.GC30458@sirena.org.uk>
References: <1402631992-500-1-git-send-email-ch.naveen@samsung.com>
 <20140702165651.GK410@sirena.org.uk>
 <CAHfPSqAXs=5VLLEV-XVw5YJo=-9QFn9KA8oG_A0CfNykcVwnCQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ALfTUftag+2gvp1h"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:50735 "EHLO
	mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750911AbaGGHfB (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 7 Jul 2014 03:35:01 -0400
Content-Disposition: inline
In-Reply-To: <CAHfPSqAXs=5VLLEV-XVw5YJo=-9QFn9KA8oG_A0CfNykcVwnCQ@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Naveen Krishna Ch <naveenkrishna.ch@gmail.com>
Cc: Naveen Krishna Chatradhi <ch.naveen@samsung.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, spi-devel-general@lists.sourceforge.net, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, grant.likely@secretlab.ca, jaswinder.singh@linaro.org, Kukjin Kim <kgene.kim@samsung.com>, cpgs@samsung.com, devicetree@vger.kernel.org, Tomasz Figa <t.figa@samsung.com>


--ALfTUftag+2gvp1h
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jul 07, 2014 at 11:51:38AM +0530, Naveen Krishna Ch wrote:
> On 2 July 2014 22:26, Mark Brown <broonie@kernel.org> wrote:
> > On Fri, Jun 13, 2014 at 09:29:50AM +0530, Naveen Krishna Chatradhi wrote:

> >> Hence, spi-s3c64xx.c is broken since "Jun 21 11:26:12 2013" and
> >> considering the time with no compliants about the breakage.

> > I'm not clear what the breakage is?  Some boards are broken but what's
> > the driver issue?

> ToT was broken for few boards
> exynos4412-trats2.dts, exynos4210-smdkv310.dts and exynos5250-smdk5250.dts

> With some DTS changes SPI works well, spi-s3c64xx.c driver had no issues.

No, you're not answering my question - to repeat, what is the breakage?

> > Also I'd need to check but are you sure that GPIO 0 is not valid?

> gpio_is_valid() returns true for
> "number >= 0 && number < ARCH_NR_GPIOS"

Right, so this means that any board that is using the internal chip
select with zero as default in their platform data is broken by this
change.

--ALfTUftag+2gvp1h
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJTuk0ZAAoJELSic+t+oim9BU8P/0ztbsHLuzJvzfRJ05gHhzUC
D9zgd4RBt+F/b49VT0iIOG7I4RuftFfHnq9xAWtjMlWyp3vnJmfP9O355jQIual0
1s/SElXqzMR5s+dIxbsUBOitvtasCKVOpad3nCGIuFvVceHyHn/xk5+g7TMGRy1X
+WeTDtdd5LDrzLmVHG7Ihimtxhd5kT7RnB153ydbxhyK+lZx1sbYZrRd1122Rr0P
g8oBQ3BoVv47gqe9iZ0XfJmB1ksrKsYOOt4zcT+eVeWIs85mWYegT2EET2r/MhAi
rtd5Zg1fZ6xI1eBU8PlQx6X61zcATVqS6tsfEykhc2eLAO72WKThLzQprM0i6Q5d
VROw53vY2Dck2gNkTMMsgxIUeQfdjTr2iGr3fs8M8M05h4ZDb3O11EoaN8sqAFz8
pAhgTA0l/k5zJ0rXQhI845qDLOJThN52tPvkHDHFSpHL5wBlQAw4dbdymB9yavwB
7JYmaexAJ6kd3IJu/hRWIQ+ie9NFAg7i0qDlZRM9mXZO005gWbgbwWi4zs99CxT+
EWjjkoY29oWwDHeVITlaioHMB0qjHYPim60eeR/sHF1eNc+0q5BYWntskNyELH8s
qBP2WQBDGAiAHmsqOh6DjtpyS0xzkNXNjyVcwJBDOWcnIEWNqlmfpN/7Dd4/XgnN
WceO6bTxLlgFz7dOB5pq
=Qbl5
-----END PGP SIGNATURE-----

--ALfTUftag+2gvp1h--
