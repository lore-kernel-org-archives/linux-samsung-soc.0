From: Heiko =?iso-8859-1?q?St=FCbner?= <heiko@sntech.de>
Subject: Re: [RFC 2/4] dma: add dmaengine driver for Samsung s3c24xx SoCs
Date: Wed, 15 May 2013 23:48:31 +0200
Message-ID: <201305152348.32171.heiko@sntech.de>
References: <201305111330.05046.heiko@sntech.de> <201305152231.52423.heiko@sntech.de> <5193FC08.5040002@gmail.com>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from gloria.sntech.de ([95.129.55.99]:42129 "EHLO gloria.sntech.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752486Ab3EOVso (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 15 May 2013 17:48:44 -0400
In-Reply-To: <5193FC08.5040002@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sylwester Nawrocki <sylvester.nawrocki@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Dan Williams <djbw@fb.com>, Vinod Koul <vinod.koul@intel.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Kukjin Kim <kgene.kim@samsung.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Russell King - ARM Linux <linux@arm.linux.org.uk>

Am Mittwoch, 15. Mai 2013, 23:20:08 schrieb Sylwester Nawrocki:
> On 05/15/2013 10:31 PM, Heiko St=FCbner wrote:
> >>> +       BUG();
> >>>=20
> >> >  Isn't that a bit nasty. This macro should be used with care and=
 we
> >> >  should recover if possible. dev_err()?
> >=20
> > runtime_config already denies any settings not in the 1,2 or 4bytes=
 range
> > - the default-part should therefore never be reached. So if any oth=
er
> > value magically appears in the register and triggers the default-pa=
rt,
> > something is seriously wrong. So my guess is, the BUG might be
> > appropriate.
> >=20
> > On the other hand the whole default+BUG part could also simply go a=
way,
> > for the same reasons.
>=20
> IMHO BUG() is not needed at all. As Linus suggested dev_err() is such=
 case
> or WARN_ON() would be more appropriate. This has been discussed in th=
e past
> extensively, not sure if you are aware of the other Linus' opinion on
> BUG()/BUG_ON() proliferation: https://lkml.org/lkml/2012/9/27/461

Very interesting read and I'll keep this in mind in the future. What ab=
out the=20
other option ... i.e. simply getting rid of the whole "error handling",=
 as the=20
other code paths should already make sure that only valid values get wr=
itten=20
into the register.

Can the value change in the register somehow on its own without kernel=20
intervention, or does this not happen?


Thanks
Heiko
