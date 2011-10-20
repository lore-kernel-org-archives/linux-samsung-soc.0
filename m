From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: [PATCH 0/4] ARM: EXYNOS4: Support generic Power domain framework
 for EXYNOS4210
Date: Thu, 20 Oct 2011 20:30:57 +0200
Message-ID: <4EA068E1.7040503@samsung.com>
References: <4E4360B2.2060508__44948.0910123841$1313038619$gmane$org@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:26643 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751042Ab1JTSbB (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 20 Oct 2011 14:31:01 -0400
Received: from euspt2 (mailout2.w1.samsung.com [210.118.77.12])
 by mailout2.w1.samsung.com
 (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTP id <0LTD00FUTNFMH3@mailout2.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 20 Oct 2011 19:30:58 +0100 (BST)
Received: from linux.samsung.com ([106.116.38.10])
 by spt2.w1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14
 2004)) with ESMTPA id <0LTD00F2JNFM8T@spt2.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 20 Oct 2011 19:30:58 +0100 (BST)
In-reply-to: <4E4360B2.2060508__44948.0910123841$1313038619$gmane$org@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: "Rafael J. Wysocki" <rjw@sisk.pl>
Cc: Chanwoo Choi <cw00.choi@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, linux-pm@lists.linux-foundation.org

Hello Rafael,

On 08/11/2011 06:55 AM, Chanwoo Choi wrote:
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

I'm having some trouble after applying these patches, with s5p_device_fimc0..3
devices added to exynos4210_pd_cam power domain.

When pm_runtime_get_sync() is called in s5p_device_fimc0 device driver probe()
the driver's runtime_resume helper isn't called.
In __pm_genpd_restore_device() dle->need_restore is 0 and thus the function
exits, not calling drv->pm->runtime_resume().

I would expect the driver's runtime_resume helper to be invoked since the device 
is initially in suspended state.

In rpm_resume() if dev->pm_domain is not null its ops.runtime_resume will
get called, and nothing else.

I observed that after fimc0 device is probed, it gets suspended and then all other
devices are attempted to be suspended as well, through __pm_genpd_save_device().
But at that time only fimc0 device has non null dev->driver, and its driver
runtime_suspend helper is called (without prior runtime_resume call).
Remaining devices in the power domain (fimc1..3) only get 'need_restore' 
set to 1.

So at the time the fimc1 device probe() is invoked, its corresponding need_restore
is set to 1, and driver's runtime_resume helper is called as expected. Then the
runtime_suspend follows.

Is this intended behaviour ? 

I'd like to avoid any reference counters for runtime_suspend/resume helpers.
As for now the clock is controlled there and the driver need to ensure balanced
calls to clk_enable()/clk_disable().



Thanks,
-- 
Sylwester Nawrocki
Samsung Poland R&D Center
