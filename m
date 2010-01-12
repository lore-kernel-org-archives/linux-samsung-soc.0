From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: RE: [PATCH] ARM: S5PC1XX: Move to using standard timer IRQ handling
 code
Date: Tue, 12 Jan 2010 09:04:55 +0100
Message-ID: <000101ca935d$efc1af50$cf450df0$%szyprowski@samsung.com>
References: <1263273657-27986-1-git-send-email-ben@trinity.fluff.org>
 <1263273657-27986-2-git-send-email-ben@trinity.fluff.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:54451 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750948Ab0ALIF4 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 12 Jan 2010 03:05:56 -0500
Received: from epmmp1 (mailout3.samsung.com [203.254.224.33])
 by mailout1.samsung.com
 (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTP id <0KW400EOVJTUCS@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 12 Jan 2010 17:05:55 +0900 (KST)
Received: from AMDC159 ([106.116.37.153])
 by mmp1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0KW400BLSJTQYU@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 12 Jan 2010 17:05:54 +0900 (KST)
In-reply-to: <1263273657-27986-2-git-send-email-ben@trinity.fluff.org>
Content-language: pl
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Ben Dooks' <ben@trinity.fluff.org>, linux-samsung-soc@vger.kernel.org
Cc: kyungmin.park@samsung.com, Marek Szyprowski <m.szyprowski@samsung.com>

Hello,

On Tuesday, January 12, 2010 6:21 AM Ben Dooks wrote:

> Move to using the standard VIC/Timer IRQ handling code added previously\
> to avoid duplicating code.
> 
> Signed-off-by: Ben Dooks <ben-linux@fluff.org>
> ---
>  arch/arm/mach-s5pc100/include/mach/tick.h |    2 +-
>  arch/arm/plat-s5pc1xx/Kconfig             |    2 +
>  arch/arm/plat-s5pc1xx/include/plat/irqs.h |   19 ++++--
>  arch/arm/plat-s5pc1xx/irq.c               |   88 ++--------------------------
>  4 files changed, 23 insertions(+), 88 deletions(-)
> 
> diff --git a/arch/arm/mach-s5pc100/include/mach/tick.h b/arch/arm/mach-s5pc100/include/mach/tick.h
> index d3de0f3..f338c9e 100644
> --- a/arch/arm/mach-s5pc100/include/mach/tick.h
> +++ b/arch/arm/mach-s5pc100/include/mach/tick.h
> @@ -21,7 +21,7 @@
>  static inline u32 s3c24xx_ostimer_pending(void)
>  {
>  	u32 pend = __raw_readl(S3C_VA_VIC0 + VIC_RAW_STATUS);
> -	return pend & 1 << (IRQ_TIMER4 - S5PC1XX_IRQ_VIC0(0));
> +	return pend & 1 << (IRQ_TIMER4_VIC - S5PC1XX_IRQ_VIC0(0));
>  }
> 
>  #define TICK_MAX	(0xffffffff)
> diff --git a/arch/arm/plat-s5pc1xx/Kconfig b/arch/arm/plat-s5pc1xx/Kconfig
> index 5d97b1c..6438bcd 100644
> --- a/arch/arm/plat-s5pc1xx/Kconfig
> +++ b/arch/arm/plat-s5pc1xx/Kconfig
> @@ -12,11 +12,13 @@ config PLAT_S5PC1XX
>  	select NO_IOPORT
>  	select ARCH_REQUIRE_GPIOLIB
>  	select SAMSUNG_CLKSRC
> +	select SAMSUNG_IRQ_VIC_TIMER
>  	select S3C_GPIO_TRACK
>  	select S3C_GPIO_PULL_UPDOWN
>  	select S3C_GPIO_CFG_S3C24XX
>  	select S3C_GPIO_CFG_S3C64XX
>  	select S5P_GPIO_CFG_S5PC1XX
> +	select SAMSUNG_IRQ_VIC_TIMER
>  	help
>  	  Base platform code for any Samsung S5PC1XX device

Double entry (probably a consequence of automatic merge or so).

> ...

Best regards
--
Marek Szyprowski
Samsung Poland R&D Center
