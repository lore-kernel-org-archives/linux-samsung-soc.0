From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH 0/3] ARM: EXYNOS: Fix Exynos5410 boot
Date: Mon, 28 Jul 2014 09:39:53 +0900
Message-ID: <00c901cfa9fc$727b4e10$5771ea30$@samsung.com>
References: <1406463725-4208-1-git-send-email-afaerber@suse.de>
 <53D4EFBB.6000404@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:60124 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751250AbaG1Ajz convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 27 Jul 2014 20:39:55 -0400
In-reply-to: <53D4EFBB.6000404@suse.de>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: =?UTF-8?Q?'Andreas_F=C3=A4rber'?= <afaerber@suse.de>, linux-samsung-soc@vger.kernel.org
Cc: 'Tarek Dakhran' <t.dakhran@samsung.com>, 'Kevin Hilman' <khilman@linaro.org>, 'Pankaj Dubey' <pankaj.dubey@samsung.com>, 'Tomasz Figa' <t.figa@samsung.com>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org

Andreas F=C3=A4rber wrote:
>=20
> Am 27.07.2014 14:22, schrieb Andreas F=C3=A4rber:
> > Hello,
> >
> > This mini-series unbreaks booting on 5410 based ODROID-XU.
> >
> > Since I do not have access to a TRM, the address is a guess based o=
n
> > 5250 and 5410. Such a node was not present in the 3.14 downstream t=
ree.
>=20
> s/5410/5420/
>=20
OK.

> >
> > Regards,
> > Andreas
> >
> > Andreas F=C3=A4rber (3):
> >   Documentation: devicetree: Document exynos5410 PMU
> >   ARM: dts: exynos: Add PMU to Exynos5410
> >   ARM: EXYNOS: Add support for Exynos5410 PMU
> >
> >  Documentation/devicetree/bindings/arm/samsung/pmu.txt | 1 +
> >  arch/arm/boot/dts/exynos5410.dtsi                     | 5 +++++
> >  arch/arm/mach-exynos/exynos.c                         | 1 +
> >  3 files changed, 7 insertions(+)
>=20
Andreas, thanks.

I'll apply this whole series.

- Kukjin
