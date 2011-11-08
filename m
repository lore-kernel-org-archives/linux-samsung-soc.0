From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [GIT PULL] Samsung Exynos for v3.2
Date: Tue, 08 Nov 2011 14:00:19 +0900
Message-ID: <04e901cc9dd3$50487d50$f0d977f0$%kim@samsung.com>
References: <02dd01cc9b4e$0cb27c80$26177580$%kim@samsung.com>
 <4EB61826.4070601@samsung.com> <201111061619.36283.arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:64894 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750710Ab1KHFAV (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 8 Nov 2011 00:00:21 -0500
Received: from epcpsbgm2.samsung.com (mailout2.samsung.com [203.254.224.25])
 by mailout2.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LUB00ETTSK9UW00@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 08 Nov 2011 14:00:19 +0900 (KST)
Received: from kgenekim ([12.23.120.114])
 by mmp1.samsung.com (Oracle Communications Messaging Exchange Server 7u4-19.01
 64bit (built Sep  7 2010)) with ESMTPA id <0LUB00DZZSKJ7F50@mmp1.samsung.com>
 for linux-samsung-soc@vger.kernel.org; Tue, 08 Nov 2011 14:00:19 +0900 (KST)
In-reply-to: <201111061619.36283.arnd@arndb.de>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Arnd Bergmann' <arnd@arndb.de>
Cc: 'Russell King' <rmk+kernel@arm.linux.org.uk>, linux-samsung-soc@vger.kernel.org, ben-linux@fluff.org, linux-arm-kernel@lists.infradead.org

Arnd Bergmann wrote:
> 
> On Sunday 06 November 2011, Kukjin Kim wrote:
> > As I replied, I re-based 'next-samsung-exynos' based on latest mainline.
> >
> > So changes since previous pull request:
> >
> > The following changes since commit
> c861cd3e92d92ae946e19099f198018fcb4fd887:
> >
> >    Merge branch 'next/devel2' of
> > git://git.linaro.org/people/arnd/arm-soc (2011-11-05 18:21:21 -0700)
> >
> > are available in the git repository at:
> >
> >    git://github.com/kgene/linux-samsung.git next-samsung-exynos
> >
> > Others same, if any problems, please kindly let me know.
> 
> Ok, looks good. I'll forward the pull request right away.
> 
Thanks and I checked they are in mainline now :)

> One thing that I noticed in your new Kconfig file is this however:
> 
> | choice
> |         prompt "EXYNOS System Type"
> |         default ARCH_EXYNOS4
> | config ARCH_EXYNOS4
> |         bool "SAMSUNG EXYNOS4"
> |         help
> |           Samsung EXYNOS4 SoCs based systems
> | endchoice
> 
> This looks like the idea is to make the future EXYNOS5 and later SoCs a
> separate "choice" that is mutually exclusive with EXYNOS4.
> 
> This seems to be a significant limitation considering that we are working
> hard on making all platforms coexist in the same kernel binary.
> 
> Are there strong technical reasons why you could not build EXYNOS4 and
> EXYNOS5 into a combined kernel? If this is at all possible, I would
> recommend trying hard to do it when you add EXYNOS5.
> 
Yes, as you pointed out, I need to sort out the physical addresses
(mach/map.h) and interrupt numbers (mach/irqs.h) for single zImage on exynos
now. But I think, the 'choice' will be changed to just 'config' for
multi-selecting when EXYNOS5 is supported.

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
