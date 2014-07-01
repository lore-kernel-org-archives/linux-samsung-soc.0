From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH 08/17] ARM: S5PC100: no more support S5PC100 SoC
Date: Tue, 01 Jul 2014 21:18:07 +0900
Message-ID: <03ef01cf9526$83e93b70$8bbbb250$@samsung.com>
References: <1404210076-2362-1-git-send-email-kgene.kim@samsung.com>
 <1404210076-2362-2-git-send-email-kgene.kim@samsung.com>
 <5806444.UHVgoFeOY3@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:28795 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751171AbaGAMSK (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 1 Jul 2014 08:18:10 -0400
Received: from epcpsbgr5.samsung.com
 (u145.gpu120.samsung.co.kr [203.254.230.145])
 by mailout2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0N81003IC8U7KU80@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 01 Jul 2014 21:18:07 +0900 (KST)
In-reply-to: <5806444.UHVgoFeOY3@wuerfel>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Arnd Bergmann' <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org
Cc: linux-samsung-soc@vger.kernel.org, 'Russell King' <rmk+kernel@arm.linux.org.uk>, t.figa@samsung.com

Arnd Bergmann wrote:
> 
> On Tuesday 01 July 2014 19:21:16 Kukjin Kim wrote:
> > --- a/arch/arm/plat-samsung/Kconfig
> > +++ b/arch/arm/plat-samsung/Kconfig
> > @@ -15,7 +15,7 @@ config PLAT_SAMSUNG
> >
> >  config PLAT_S5P
> >         bool
> > -       depends on (ARCH_S5PC100 || ARCH_S5PV210)
> > +       depends on ARCH_S5PV210
> >         default y
> >         select ARCH_REQUIRE_GPIOLIB
> >         select ARM_VIC
> > @@ -78,14 +78,14 @@ config SAMSUNG_CLKSRC
> >           used by newer systems such as the S3C64XX.
> >
> >  config S5P_CLOCK
> > -       def_bool (ARCH_S5PC100 || ARCH_S5PV210)
> > +       def_bool ARCH_S5PV210
> >         help
> >           Support common clock part for ARCH_S5P and ARCH_EXYNOS SoCs
> >
> >  # options for IRQ support
> >
> >  config S5P_IRQ
> > -       def_bool (ARCH_S5PC100 || ARCH_S5PV210)
> > +       def_bool ARCH_S5PV210
> >         help
> >           Support common interrupt part for ARCH_S5P SoCs
> >
> > @@ -142,7 +142,7 @@ config S3C_GPIO_TRACK
> >
> >  config S5P_DEV_UART
> >         def_bool y
> > -       depends on (ARCH_S5PC100 || ARCH_S5PV210)
> > +       depends on ARCH_S5PV210
> >
> >  # ADC driver
> >
> 
> I guess the next logical step would be to either remove these entirely
> after the move to DT-only ARCH_S5PV210 obsoletes them, or to move the
> code back to mach-s5pv210, right?
> 
Yeah both are possible, but the latter would be more possible at this moment,
I think. I will cleanup stuff in plat-samsung as you suggested :-)

> 
> >  config SAMSUNG_DMADEV
> >        bool "Use legacy Samsung DMA abstraction"
> > -       depends on CPU_S5PV210 || CPU_S5PC100 || ARCH_S3C64XX
> > +       depends on CPU_S5PV210 || ARCH_S3C64XX
> >         select DMADEVICES
> >         default y
> >        help
> 
> It would be good to just kill this one off now, as nothing uses it
> any more, but that's also a separate patch.
> 
Maybe it is still used for s5pv210 and s3c64xx? If I misunderstand your
comments, please kindly let me know.

Thanks,
Kukjin
