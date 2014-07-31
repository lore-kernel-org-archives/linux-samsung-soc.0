From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH 0/3] ARM: EXYNOS: Fix Exynos5410 boot
Date: Thu, 31 Jul 2014 10:10:09 +0900
Message-ID: <03f501cfac5c$2c69be90$853d3bb0$@samsung.com>
References: <1406463725-4208-1-git-send-email-afaerber@suse.de>
 <53D4EFBB.6000404@suse.de> <00c901cfa9fc$727b4e10$5771ea30$@samsung.com>
 <CAOesGMjh=xMZ3vB45ofh=CLjTFDMQxSxus5q_P67XQSbwg6-+A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:11254 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755063AbaGaBKN convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 30 Jul 2014 21:10:13 -0400
In-reply-to: <CAOesGMjh=xMZ3vB45ofh=CLjTFDMQxSxus5q_P67XQSbwg6-+A@mail.gmail.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Olof Johansson' <olof@lixom.net>
Cc: =?UTF-8?Q?'Andreas_F=C3=A4rber'?= <afaerber@suse.de>, linux-samsung-soc@vger.kernel.org, 'Tarek Dakhran' <t.dakhran@samsung.com>, 'Kevin Hilman' <khilman@linaro.org>, 'Pankaj Dubey' <pankaj.dubey@samsung.com>, 'Tomasz Figa' <t.figa@samsung.com>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org

Olof Johansson wrote:
>=20
> Hi,
>=20
Hi Olof,

> On Sun, Jul 27, 2014 at 5:39 PM, Kukjin Kim <kgene.kim@samsung.com> w=
rote:
> > Andreas F=C3=A4rber wrote:
> >>
> >> Am 27.07.2014 14:22, schrieb Andreas F=C3=A4rber:
> >> > Hello,
> >> >
> >> > This mini-series unbreaks booting on 5410 based ODROID-XU.
> >> >
> >> > Since I do not have access to a TRM, the address is a guess base=
d on
> >> > 5250 and 5410. Such a node was not present in the 3.14 downstrea=
m tree.
> >>
> >> s/5410/5420/
> >>
> > OK.
> >
> >> >
> >> > Regards,
> >> > Andreas
> >> >
> >> > Andreas F=C3=A4rber (3):
> >> >   Documentation: devicetree: Document exynos5410 PMU
> >> >   ARM: dts: exynos: Add PMU to Exynos5410
> >> >   ARM: EXYNOS: Add support for Exynos5410 PMU
> >> >
> >> >  Documentation/devicetree/bindings/arm/samsung/pmu.txt | 1 +
> >> >  arch/arm/boot/dts/exynos5410.dtsi                     | 5 +++++
> >> >  arch/arm/mach-exynos/exynos.c                         | 1 +
> >> >  3 files changed, 7 insertions(+)
> >>
> > Andreas, thanks.
> >
> > I'll apply this whole series.
>=20
> We're getting close to the merge window. I'd prefer not to have to
> start reverting samsung code to recover from these regressions, so
> please send this up very soon.
>=20
Thanks for your gentle reminder.

BTW I'm waiting for exynos5250-spring support from Andreas and I'd like=
 to get
confirmation about that from Doug. And I'm looking at s2r related patch=
es now.

OK, I will send out current samsung tree tonight in my time anyway.

- Kukjin
