From: "Rafael J. Wysocki" <rjw@sisk.pl>
Subject: Re: [PATCH 0/4] ARM: EXYNOS4: Support generic Power domain framework for EXYNOS4210
Date: Sat, 13 Aug 2011 23:24:07 +0200
Message-ID: <201108132324.08137.rjw@sisk.pl>
References: <4E4360B2.2060508@samsung.com>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from ogre.sisk.pl ([217.79.144.158]:39335 "EHLO ogre.sisk.pl"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751066Ab1HMVW3 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 13 Aug 2011 17:22:29 -0400
In-Reply-To: <4E4360B2.2060508@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Chanwoo Choi <cw00.choi@samsung.com>
Cc: Kukjin Kim <kgene.kim@samsung.com>, Russell King - ARM Linux <linux@arm.linux.org.uk>, Kyungmin Park <kyungmin.park@samsung.com>, linux-pm@lists.linux-foundation.org, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>

On Thursday, August 11, 2011, Chanwoo Choi wrote:
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
>  arch/arm/mach-exynos4/pm-exynos4210.c              |  189 ++++++++++++++++++++
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

The patchset looks good to me, but please note that some code it
is based on will most likely change in 3.2 due to this patchset:

https://lkml.org/lkml/2011/8/8/420

Thanks,
Rafael
