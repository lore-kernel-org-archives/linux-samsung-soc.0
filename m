From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH 0/4] ARM: EXYNOS4: Support generic Power domain framework
 for EXYNOS4210
Date: Fri, 19 Aug 2011 23:15:54 +0900
Message-ID: <005101cc5e7a$81ffae60$85ff0b20$%kim@samsung.com>
References: <4E4360B2.2060508@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:59420 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751685Ab1HSOP4 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 19 Aug 2011 10:15:56 -0400
Received: from epcpsbgm2.samsung.com (mailout1.samsung.com [203.254.224.24])
 by mailout1.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LQ600AIEIA30O20@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 19 Aug 2011 23:15:55 +0900 (KST)
Received: from kgenekim (12-23-120-114.csky.net [12.23.120.114])
 by mmp1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0LQ600241IAJX3@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 19 Aug 2011 23:15:55 +0900 (KST)
In-reply-to: <4E4360B2.2060508@samsung.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Chanwoo Choi' <cw00.choi@samsung.com>, "'Rafael J. Wysocki'" <rjw@sisk.pl>, 'Russell King - ARM Linux' <linux@arm.linux.org.uk>
Cc: 'Kyungmin Park' <kyungmin.park@samsung.com>, linux-pm@lists.linux-foundation.org, 'linux-arm-kernel' <linux-arm-kernel@lists.infradead.org>, 'linux-samsung-soc' <linux-samsung-soc@vger.kernel.org>

Chanwoo Choi wrote:
> 
> The following patch set use the generic Power domain Framework instead of
> power domain code depend of Samsung SoC.
> 
> Chanwoo Choi (4):
>   ARM: EXYNOS4: Support for generic I/O power domains on EXYNOS4210
>   ARM: EXYNOS4: Support for generic Clock manipulation PM callbacks
>   ARM: EXYNOS4: Delete the power-domain code depend on Samsung SoC
>   ARM: EXYNOS4: Add power domain to use generic Power domain Framework
> 
>  arch/arm/mach-exynos4/Kconfig                      |   10 +-
>  arch/arm/mach-exynos4/Makefile                     |    4 +-
>  arch/arm/mach-exynos4/dev-pd.c                     |  139 --------------
>  arch/arm/mach-exynos4/include/mach/pm-exynos4210.h |   52 ++++++
>  arch/arm/mach-exynos4/include/mach/regs-clock.h    |    8 +
>  arch/arm/mach-exynos4/mach-nuri.c                  |   21 ++-
>  arch/arm/mach-exynos4/mach-smdkc210.c              |   26 ++-
>  arch/arm/mach-exynos4/mach-smdkv310.c              |   23 ++-
>  arch/arm/mach-exynos4/mach-universal_c210.c        |   21 ++-
>  arch/arm/mach-exynos4/pm-exynos4210.c              |  189
> ++++++++++++++++++++
>  arch/arm/mach-exynos4/pm-runtime.c                 |   56 ++++++
>  arch/arm/plat-samsung/Kconfig                      |    8 -
>  arch/arm/plat-samsung/Makefile                     |    4 -
>  arch/arm/plat-samsung/include/plat/pd.h            |   30 ---
>  arch/arm/plat-samsung/pd.c                         |   95 ----------
>  15 files changed, 377 insertions(+), 309 deletions(-)
>  delete mode 100644 arch/arm/mach-exynos4/dev-pd.c
>  create mode 100644 arch/arm/mach-exynos4/include/mach/pm-exynos4210.h
>  create mode 100644 arch/arm/mach-exynos4/pm-exynos4210.c
>  create mode 100644 arch/arm/mach-exynos4/pm-runtime.c
>  delete mode 100644 arch/arm/plat-samsung/include/plat/pd.h
>  delete mode 100644 arch/arm/plat-samsung/pd.c

Hi Chanwoo,

Basically looks ok.
I will review this in detail in the next week.
Then if no problems, will apply.

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
