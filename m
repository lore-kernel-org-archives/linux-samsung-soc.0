From: Tomasz Figa <t.figa@samsung.com>
Subject: Re: [PATCH 0/6] Various Samsung fixes for v3.16-rc3
Date: Tue, 01 Jul 2014 15:54:33 +0200
Message-ID: <53B2BD99.5080704@samsung.com>
References: <1403618235-19353-1-git-send-email-t.figa@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:59839 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751854AbaGANzE (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 1 Jul 2014 09:55:04 -0400
In-reply-to: <1403618235-19353-1-git-send-email-t.figa@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Kukjin Kim <kgene.kim@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Tomasz Figa <tomasz.figa@gmail.com>

Hi,

On 24.06.2014 15:57, Tomasz Figa wrote:
> This series inteds to fix various issues spotted while testing v3.16-rc2.
> The patches should be reasonably independent from each other and so could be
> picked to respective trees. See descriptions of individual patches for more
> information.
> 
> Tested on Exynos4412-based Trats2 and Exynos4210-based Trats boards.
> 
> AFAIK there is no need to backport those fixes to stable.
> 
> Tomasz Figa (6):
>   mmc: sdhci-s3c: Fix local I/O clock gating
>   ARM: EXYNOS: Fix core ID used by platsmp and hotplug code
>   clk: samsung: exynos4: Remove SRC_MASK_ISP gates
>   ARM: SAMSUNG: Restore Samsung PM Debug functionality
>   ARM: EXYNOS: Fix suspend/resume sequencies
>   ARM: EXYNOS: Register cpuidle device only on Exynos4210 and 5250
> 
>  arch/arm/mach-exynos/exynos.c     |  6 ++----
>  arch/arm/mach-exynos/hotplug.c    | 10 ++++++----
>  arch/arm/mach-exynos/platsmp.c    | 34 +++++++++++++++++++---------------
>  arch/arm/mach-exynos/pm.c         | 20 ++++----------------
>  arch/arm/plat-samsung/Kconfig     |  8 +++++++-
>  arch/arm/plat-samsung/pm-debug.c  |  1 +
>  drivers/clk/samsung/clk-exynos4.c | 16 ++++------------
>  drivers/mmc/host/sdhci-s3c.c      | 17 ++++++++++-------
>  8 files changed, 53 insertions(+), 59 deletions(-)
> 

Gentle ping.

Best regards,
Tomasz
