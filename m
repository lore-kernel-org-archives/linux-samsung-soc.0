From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCHv2 0/4] Updated s5p-mfc platform definitions
Date: Thu, 21 Jul 2011 16:37:07 +0900
Message-ID: <006601cc4779$026bb5d0$07432170$%kim@samsung.com>
References: <1311229879-14818-1-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:39579 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752554Ab1GUHhQ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 21 Jul 2011 03:37:16 -0400
Received: from epcpsbgm1.samsung.com (mailout4.samsung.com [203.254.224.34])
 by mailout4.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LOO00D6PAGYD4N0@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 21 Jul 2011 16:37:14 +0900 (KST)
Received: from kgenekim ([12.23.119.139])
 by mmp1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0LOO009ZZAI2OR@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 21 Jul 2011 16:37:15 +0900 (KST)
In-reply-to: <1311229879-14818-1-git-send-email-m.szyprowski@samsung.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Marek Szyprowski' <m.szyprowski@samsung.com>, linux-samsung-soc@vger.kernel.org
Cc: 'Kamil Debski' <k.debski@samsung.com>, 'Kyungmin Park' <kyungmin.park@samsung.com>

Marek Szyprowski wrote:
> 
> Hello,
> 
> This patch series contains platform definitions for s5p-mfc driver
> rebased onto latest for-next branch (including generic GIC and clockdev
> changes). Errors reported by check patch have been fixed.
> 
OK, applied.
Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.


> Best regards
> --
> Marek Szyprowski
> Samsung Poland R&D Center
> 
> 
> Patch summary:
> 
> Kamil Debski (3):
>   ARM: S5P: Add support for MFC device to plat-s5p, mach-s5pv210 and
>     mach-exynos4
>   ARM: S5PV210: Enable MFC on Goni
>   ARM: EXYNOS4: Enable MFC on universal_c210
> 
> Marek Szyprowski (1):
>   ARM: EXYNOS4: Enable MFC on Samsung NURI
> 
>  arch/arm/Kconfig                            |    2 +
>  arch/arm/mach-exynos4/Kconfig               |    4 +
>  arch/arm/mach-exynos4/clock.c               |   61 +++++++++++++
>  arch/arm/mach-exynos4/include/mach/map.h    |    2 +
>  arch/arm/mach-exynos4/mach-nuri.c           |   13 +++
>  arch/arm/mach-exynos4/mach-universal_c210.c |   13 +++
>  arch/arm/mach-s5pv210/Kconfig               |    1 +
>  arch/arm/mach-s5pv210/clock.c               |    7 ++
>  arch/arm/mach-s5pv210/include/mach/map.h    |    3 +
>  arch/arm/mach-s5pv210/mach-goni.c           |   10 ++
>  arch/arm/plat-s5p/Kconfig                   |    5 +
>  arch/arm/plat-s5p/Makefile                  |    2 +-
>  arch/arm/plat-s5p/dev-mfc.c                 |  123
> +++++++++++++++++++++++++++
>  arch/arm/plat-s5p/include/plat/mfc.h        |   27 ++++++
>  arch/arm/plat-samsung/include/plat/devs.h   |    3 +
>  15 files changed, 275 insertions(+), 1 deletions(-)
>  create mode 100644 arch/arm/plat-s5p/dev-mfc.c
>  create mode 100644 arch/arm/plat-s5p/include/plat/mfc.h
> 
> --
> 1.7.1.569.g6f426
