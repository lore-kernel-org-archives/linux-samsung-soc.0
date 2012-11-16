From: Tomasz Figa <t.figa@samsung.com>
Subject: Re: [PATCH] ARM: dts: add board dts file for Exynos4412 based SMDK
 board
Date: Fri, 16 Nov 2012 12:11:21 +0100
Message-ID: <3179451.csXCh8vt1v@amdc1227>
References: <1351954172-13645-1-git-send-email-thomas.abraham@linaro.org>
 <1629120.eNASZVgxGi@amdc1227>
 <CAJuYYwTRnjKPm7fopVOjBVtHEEV2TQhv6OFzQG6hqhHwq4BT+g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:65176 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750817Ab2KPLL1 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 16 Nov 2012 06:11:27 -0500
Received: from epcpsbgm1.samsung.com (epcpsbgm1 [203.254.230.26])
 by mailout1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MDK00GWUV32A501@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 16 Nov 2012 20:11:26 +0900 (KST)
Received: from amdc1227.localnet ([106.116.147.199])
 by mmp1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0MDK00MDIV2ZPZ10@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 16 Nov 2012 20:11:26 +0900 (KST)
In-reply-to: <CAJuYYwTRnjKPm7fopVOjBVtHEEV2TQhv6OFzQG6hqhHwq4BT+g@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Thomas Abraham <thomas.abraham@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, devicetree-discuss@lists.ozlabs.org, grant.likely@secretlab.ca, rob.herring@calxeda.com, linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, chaos.youn@samsung.com

On Thursday 15 of November 2012 13:48:55 Thomas Abraham wrote:
> Hi Tomasz,
> 
> Thanks for your comments.
> 
> On 12 November 2012 19:37, Tomasz Figa <t.figa@samsung.com> wrote:
> > Hi Thomas,
> > 
> > On Saturday 03 of November 2012 20:19:32 Thomas Abraham wrote:
> >> Add a minimal board dts file for Samsung Exynos4412 based SMDK board.
> >> 
> >> Signed-off-by: Thomas Abraham <thomas.abraham@linaro.org>
> >> ---
> >> This patch depends the on the following patch posted by Tomasz Figa.
> >> "ARM: dts: exynos4: Add support for Exynos4x12 SoCs"
> >> 
> >>  arch/arm/boot/dts/Makefile                |    1 +
> >>  arch/arm/boot/dts/exynos4412-smdk4412.dts |   45
> >> 
> >> +++++++++++++++++++++++++++++ 2 files changed, 46 insertions(+), 0
> >> deletions(-)
> >> 
> >>  create mode 100644 arch/arm/boot/dts/exynos4412-smdk4412.dts
> >> 
> >> diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
> >> index f37cf9f..36488a5 100644
> >> --- a/arch/arm/boot/dts/Makefile
> >> +++ b/arch/arm/boot/dts/Makefile
> >> @@ -23,6 +23,7 @@ dtb-$(CONFIG_ARCH_DOVE) += dove-cm-a510.dtb \
> >> 
> >>  dtb-$(CONFIG_ARCH_EXYNOS) += exynos4210-origen.dtb \
> >>  
> >>       exynos4210-smdkv310.dtb \
> >>       exynos4210-trats.dtb \
> >> 
> >> +     exynos4412-smdk4412.dtb \
> >> 
> >>       exynos5250-smdk5250.dtb
> >>  
> >>  dtb-$(CONFIG_ARCH_HIGHBANK) += highbank.dtb
> >>  dtb-$(CONFIG_ARCH_INTEGRATOR) += integratorap.dtb \
> >> 
> >> diff --git a/arch/arm/boot/dts/exynos4412-smdk4412.dts
> >> b/arch/arm/boot/dts/exynos4412-smdk4412.dts new file mode 100644
> >> index 0000000..f05bf57
> >> --- /dev/null
> >> +++ b/arch/arm/boot/dts/exynos4412-smdk4412.dts
> >> @@ -0,0 +1,45 @@
> >> +/*
> >> + * Samsung's Exynos4412 based SMDK board device tree source
> >> + *
> >> + * Copyright (c) 2012-2013 Samsung Electronics Co., Ltd.
> >> + *           http://www.samsung.com
> >> + *
> >> + * Device tree source file for Samsung's SMDK4412 board which is
> >> based
> >> on + * Samsung's Exynos4412 SoC.
> >> + *
> >> + * This program is free software; you can redistribute it and/or
> >> modify + * it under the terms of the GNU General Public License
> >> version 2 as + * published by the Free Software Foundation.
> >> +*/
> >> +
> >> +/dts-v1/;
> >> +/include/ "exynos4412.dtsi"
> >> +
> >> +/ {
> >> +     model = "Samsung SMDK evaluation board based on Exynos4412";
> >> +     compatible = "samsung,smdk4412", "samsung,exynos4412";
> >> +
> >> +     memory {
> >> +             reg = <0x40000000 0x40000000>;
> >> +     };
> > 
> > This will not boot, because section size limit is set to 256 MiB.
> > 
> > It might work with CONFIG_ARM_ATAG_DTB_COMPAT enabled, because the
> > memory configuration from DT is ignored and values from ATAGs are
> > taken instead.
> > 
> > I suggest you to change it to 4 banks of 256 MiB.
> 
> Thanks for pointing this out. So are there any existing exynos based
> platforms that use sparse mem? If not, we should probably remove the
> section length configuration itself for mach-exynos. I suspect this
> setting might not help with the single kernel image support as well.

Isn't sparse memory the only configuration available for ARCH_EXYNOS?

Best regards,
-- 
Tomasz Figa
Samsung Poland R&D Center
SW Solution Development, Linux Platform
