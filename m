From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH 1/7] ARM: S5PV210: add support for software reset
Date: Thu, 20 May 2010 15:21:46 +0900
Message-ID: <010101caf7e4$bd6ef490$384cddb0$%kim@samsung.com>
References: <1274079195-18105-1-git-send-email-m.szyprowski@samsung.com>
 <1274079195-18105-2-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:57047 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752345Ab0ETGVy (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 20 May 2010 02:21:54 -0400
Received: from epmmp2 (mailout3.samsung.com [203.254.224.33])
 by mailout1.samsung.com
 (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTP id <0L2P00BN4GCF2Q@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 20 May 2010 15:21:51 +0900 (KST)
Received: from kgenekim ([12.23.103.96])
 by mmp2.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0L2P00IF7GCEF5@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 20 May 2010 15:21:51 +0900 (KST)
In-reply-to: <1274079195-18105-2-git-send-email-m.szyprowski@samsung.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Marek Szyprowski' <m.szyprowski@samsung.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: kyungmin.park@samsung.com, ben-linux@fluff.org

Marek Szyprowski wrote:
> 
> Add missing call for software reset (system reboot).

Yes, missed.

But Samsung SoC hardware engineer recommends to use the reset of watchdog
instead of software reset by restriction of Hardware environment.

> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
> ---
>  arch/arm/mach-s5pv210/include/mach/regs-clock.h |    2 ++
>  arch/arm/mach-s5pv210/include/mach/system.h     |    7 ++++++-
>  2 files changed, 8 insertions(+), 1 deletions(-)
> 
> diff --git a/arch/arm/mach-s5pv210/include/mach/regs-clock.h
b/arch/arm/mach-
> s5pv210/include/mach/regs-clock.h
> index e56e0e4..40dd24f 100644
> --- a/arch/arm/mach-s5pv210/include/mach/regs-clock.h
> +++ b/arch/arm/mach-s5pv210/include/mach/regs-clock.h
> @@ -91,6 +91,8 @@
>  #define S5P_CLKDIV0_PCLK66_MASK		(0x7 <<
> S5P_CLKDIV0_PCLK66_SHIFT)
> 
>  /* Registers related to power management */
> +#define S5P_SWRESET		S5P_CLKREG(0x2000)
> +
>  #define S5P_PWR_CFG		S5P_CLKREG(0xC000)
>  #define S5P_EINT_WAKEUP_MASK	S5P_CLKREG(0xC004)
>  #define S5P_WAKEUP_MASK 	S5P_CLKREG(0xC008)
> diff --git a/arch/arm/mach-s5pv210/include/mach/system.h b/arch/arm/mach-
> s5pv210/include/mach/system.h
> index 1ca04d5..ba39203 100644
> --- a/arch/arm/mach-s5pv210/include/mach/system.h
> +++ b/arch/arm/mach-s5pv210/include/mach/system.h
> @@ -13,6 +13,10 @@
>  #ifndef __ASM_ARCH_SYSTEM_H
>  #define __ASM_ARCH_SYSTEM_H __FILE__
> 
> +#include <linux/io.h>
> +#include <mach/map.h>
> +#include <mach/regs-clock.h>
> +
>  static void arch_idle(void)
>  {
>  	/* nothing here yet */
> @@ -20,7 +24,8 @@ static void arch_idle(void)
> 
>  static void arch_reset(char mode, const char *cmd)
>  {
> -	/* nothing here yet */
> +	__raw_writel(0x1, S5P_SWRESET);
> +	return;
>  }
> 
>  #endif /* __ASM_ARCH_SYSTEM_H */
> --

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
