From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: RE: Samsung SoCs: preparation for single kernel
Date: Wed, 23 Jun 2010 08:25:45 +0200
Message-ID: <002301cb129c$ec59fe30$c50dfa90$%szyprowski@samsung.com>
References: <AANLkTinGwWzIAOe2tj6V2kCrMiPT7PHlYs1kFS-IsiN4@mail.gmail.com>
 <AANLkTil-AOEqhMOXydaiA1X_v0rjoNQxALrO0UY638AS@mail.gmail.com>
 <AANLkTil1i_ZGI8bY14HhjrAk9RooVreAJsTteqqrMgqJ@mail.gmail.com>
 <AANLkTikDml6gQAsiRrCjIt4bUD3hnpAATr1erqCGOJMd@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:36016 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751066Ab0FWG06 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 23 Jun 2010 02:26:58 -0400
Received: from epmmp2 (mailout3.samsung.com [203.254.224.33])
 by mailout3.samsung.com
 (Sun Java(tm) System Messaging Server 7u3-15.01 64bit (built Feb 12 2010))
 with ESMTP id <0L4G002UEF8WJK30@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 23 Jun 2010 15:26:56 +0900 (KST)
Received: from AMDC159 ([106.116.37.153])
 by mmp2.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0L4G001SYF8J2E@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 23 Jun 2010 15:26:56 +0900 (KST)
In-reply-to: <AANLkTikDml6gQAsiRrCjIt4bUD3hnpAATr1erqCGOJMd@mail.gmail.com>
Content-language: pl
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Eric Miao' <eric.y.miao@gmail.com>, 'Kyungmin Park' <kmpark@infradead.org>
Cc: linux-samsung-soc@vger.kernel.org, 'Russell King - ARM Linux' <linux@arm.linux.org.uk>, 'arm-linux' <linux-arm-kernel@lists.infradead.org>, 'Ben Dooks' <ben-linux@fluff.org>

Hello,

On Wednesday, June 23, 2010 3:55 AM Eric Miao wrote:

> ...

> >>> e.g., cpu_is_* usage at OMAP tree
> >>>
> >>> static void omap_init_mcspi(void)
> >>> {
> >>>        if (cpu_is_omap44xx())
> >>>                omap4_mcspi_fixup();
> >>>
> >>>        platform_device_register(&omap2_mcspi1);
> >>>        platform_device_register(&omap2_mcspi2);
> >>>
> >>>        if (cpu_is_omap2430() || cpu_is_omap343x() || cpu_is_omap44xx())
> >>>                omap2_mcspi3_init();
> >>>
> >>>        if (cpu_is_omap343x() || cpu_is_omap44xx())
> >>>                omap2_mcspi4_init();
> >>> }
> >>
> >> Just my two cents: cpu_is_*() can be used, but only when absolutely
> necessary.
> >> The s3c does a CPU detection at startup, so I guess the usage of
> cpu_is_*()
> >> can be even reduced.
> >
> > My concern is that most device resources use the S3C_* or S5P_* prefix
> > and defined at each arch differently.
> >
> > E.G., mmc resource drivers use the S3C_PA_HSMMC0. but each mach has
> > different base address.
> > then how to handle this or make it possible?
> >
> 
> Now you have
> 
> s5pv210_device_hsmmc0
> s5pc100_device_hsmmc0
> s3c64xx_device_hsmmc0
> ....
> 
> each with a different base.

There is no need for such code duplication. Ben is working on a solution for
a single kernel which supports multiple SoCs. Some of his work in progress can
be found here: git://git.fluff.org/bjdooks/linux branch wip-samsung-dev and
wip-samsung-dev2.

> ...

> >> I'm not sure if the above case is a good reference or not. The
> omap_init_mcspi
> >> is called from omap2_init_devices(), while the registration can actually
> be
> >> made into the board init code when that device is used (some of the
> McSPIs are
> >> not used, and it's not necessary to register them), and the differences
> be
> >> handled in the driver.
> >
> > that's just example how to use cpu_is_* in others. the current schme
> > in samsung SoCs. we passed the different platform name for each arch.
> > e.g., s3c2410_i2c or s3c2440_i2c then i2c driver detect it and handle
> > properly. of course it assume base address is set correctly as above.
> 
> For the device driver, when you register two different i2c devices:
> 
> struct platform_device s3c2410_device_i2c {
> 	.name	= "s3c2410-i2c",
> 	...
> };
> 
> struct platform_device s3c2440_device_i2c {
> 	.name	= "s3c2440-i2c",
> 	...
> };
> 
> And register the corresponding one in your board code (your board code
> knows exactly which one to register, no? )

Yes, this is a recommended way.

Best regards
--
Marek Szyprowski
Samsung Poland R&D Center
