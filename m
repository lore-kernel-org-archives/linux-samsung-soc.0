From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH] ARM: EXYNOS: Add platform resource definitions for
 FIMC-LITE
Date: Thu, 10 May 2012 18:56:00 +0900
Message-ID: <038401cd2e93$1a571fc0$4f055f40$%kim@samsung.com>
References: <1336148260-19952-1-git-send-email-s.nawrocki@samsung.com>
 <017b01cd2cdd$4e4ff570$eaefe050$%kim@samsung.com>
 <4FA8CCC9.9030601@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:25738 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758120Ab2EJJ4D (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 10 May 2012 05:56:03 -0400
Received: from epcpsbgm1.samsung.com (mailout1.samsung.com [203.254.224.24])
 by mailout1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0M3S00065WXCO2O0@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 10 May 2012 18:56:00 +0900 (KST)
Received: from DOKGENEKIM03 ([12.23.119.152])
 by mmp2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0M3S00K0OWXB4X60@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 10 May 2012 18:56:00 +0900 (KST)
In-reply-to: <4FA8CCC9.9030601@samsung.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Sylwester Nawrocki' <s.nawrocki@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 'Kyungmin Park' <kyungmin.park@samsung.com>

Sylwester Nawrocki wrote:

> 
> On 05/08/2012 07:42 AM, Kukjin Kim wrote:
> > Sylwester Nawrocki wrote:
> >>
> >> Add the gate clocks and register region address definition for
> >> FIMC-LITE devices available in Exynos4x12 and Exynos5 SoCs.
> >>
> > This is right description? I can't find your changes for EXYNOS4412 and
> > EXYNOS5 here. Only this is for EXYNOS4212 SoC.
> 
> Sorry, I wasn't precise enough. EXYNOS4_PA_FIMC_LITE is for EXYNOS4212
> and EXYNOS4412 though. Please note it is initially needed for DT
platforms,
> until we get proper clock DT bindings for EXYNOS. Is there, BTW, anyone
> known to work on converting EXYNOS to the common clock framework ?
> 
Yes, my colleague is working on common clock for all of exynos stuff.

> This patch was intended for EXYNOS4212/4412. AFAICS clock code in
> mach-exynos/clock-exynos4412.c is a subset of the EXYNOS4412 platform:
> 
OK.

> static void __init exynos4_init_clocks(int xtal)
> {
> 	...
> 	if (soc_is_exynos4210())
> 		exynos4210_register_clocks();
> 	else if (soc_is_exynos4212() || soc_is_exynos4412())
> 		exynos4212_register_clocks();
> 
> 	exynos4_register_clocks();
> 	...
> }
> 
> Should I resend the patch or could you remove " and Exynos5 SoCs"
> from the description ?
> 
I see, let me fix it when I apply this.

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
