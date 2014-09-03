From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH v2 5/7] arm64: dts: Add initial device tree support for
 EXYNOS7
Date: Thu, 04 Sep 2014 01:31:21 +0900
Message-ID: <043401cfc794$7f228650$7d6792f0$@samsung.com>
References: <1409672143-8574-1-git-send-email-ch.naveen@samsung.com>
 <1409672143-8574-6-git-send-email-ch.naveen@samsung.com>
 <036a01cfc792$422271e0$c66755a0$@samsung.com> <3382034.5ADO0F7naY@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:54293 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752645AbaICQbY (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 3 Sep 2014 12:31:24 -0400
In-reply-to: <3382034.5ADO0F7naY@wuerfel>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Arnd Bergmann' <arnd@arndb.de>
Cc: 'Naveen Krishna Chatradhi' <ch.naveen@samsung.com>, linux-arm-kernel@lists.infradead.org, naveenkrishna.ch@gmail.com, linux-samsung-soc@vger.kernel.org, catalin.marinas@arm.com, robh@kernel.org, devicetree@vger.kernel.org, t.figa@samsung.com

Arnd Bergmann wrote:
> 
Hi, Arnd

> On Thursday 04 September 2014 01:15:20 Kukjin Kim wrote:
> > Naveen Krishna Chatradhi wrote:
> >
> > > diff --git a/arch/arm64/boot/dts/exynos/exynos7-espresso.dts b/arch/arm64/boot/dts/exynos/exynos7-
> > > espresso.dts
> > > new file mode 100644
> > > index 0000000..f6a8879
> > > --- /dev/null
> > > +++ b/arch/arm64/boot/dts/exynos/exynos7-espresso.dts
> > > @@ -0,0 +1,31 @@
> > > +/*
> > > + * SAMSUNG Exynos7 Espresso board device tree source
> > > + *
> > > + * Copyright (c) 2014 Samsung Electronics Co., Ltd.
> > > + *		http://www.samsung.com
> > > + *
> > > + * This program is free software; you can redistribute it and/or modify
> > > + * it under the terms of the GNU General Public License version 2 as
> > > + * published by the Free Software Foundation.
> > > +*/
> > > +
> > > +/dts-v1/;
> > > +#include "exynos7.dtsi"
> > > +
> > > +/ {
> > > +	model = "Samsung Exynos7 Espresso board based on EXYNOS7";
> > > +	compatible = "samsung,exynos7-espresso", "samsung,exynos7";
> > > +
> > > +	chosen {
> > > +		linux,stdout-path = &serial_2;
> >
> > Well...
> >
> > > +	};
> > > +
> > > +	memory@40000000 {
> > > +		device_type = "memory";
> > > +		reg = <0x0 0x40000000 0x0 0xC0000000>;
> >
> > The base address of system memory is depending on each board, actually some of
> > them are 0x20000000.
> 
> This is the board specific file, so it seems ok.
> 
I mean there are many espresso boards are having different exynos7 SoC. I mean
exynos7-espresso cannot represent all of espresso boards.

- Kukjin
