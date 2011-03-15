From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH v2] ARM: EXYNOS4: add a placeholder for board specific
	interrupts
Date: Tue, 15 Mar 2011 21:55:20 +0900
Message-ID: <011301cbe310$41381f10$c3a85d30$%kim@samsung.com>
References: <1300086405-9895-1-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:48174 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757462Ab1COMz1 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 15 Mar 2011 08:55:27 -0400
Received: from epmmp2 (mailout4.samsung.com [203.254.224.34])
 by mailout4.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LI300NAZNWE0TE0@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 15 Mar 2011 21:55:26 +0900 (KST)
Received: from DOKGENEKIM02 ([12.23.103.104])
 by mmp2.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0LI300FCCNWE03@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 15 Mar 2011 21:55:26 +0900 (KST)
In-reply-to: <1300086405-9895-1-git-send-email-m.szyprowski@samsung.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Marek Szyprowski' <m.szyprowski@samsung.com>, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: kyungmin.park@samsung.com

Marek Szyprowski wrote:
> 
> This patch adds a placeholder for board specific interrupts on S5PC210
> platform.
> 
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
> ---
>  arch/arm/mach-exynos4/include/mach/irqs.h |    6 +++++-
>  1 files changed, 5 insertions(+), 1 deletions(-)
> 
> diff --git a/arch/arm/mach-exynos4/include/mach/irqs.h b/arch/arm/mach-
> exynos4/include/mach/irqs.h
> index 5d03730..cc2186d 100644
> --- a/arch/arm/mach-exynos4/include/mach/irqs.h
> +++ b/arch/arm/mach-exynos4/include/mach/irqs.h
> @@ -154,7 +154,11 @@
>  #define IRQ_GPIO2_NR_GROUPS	9
>  #define IRQ_GPIO_END		(S5P_GPIOINT_BASE + S5P_GPIOINT_COUNT)
> 
> +/* optional board specific irqs */
> +#define IRQ_BOARD_START		IRQ_GPIO_END
> +#define IRQ_NR_BOARD		16
> +
>  /* Set the default NR_IRQS */
> -#define NR_IRQS			(IRQ_GPIO_END)
> +#define NR_IRQS			(IRQ_GPIO_END + IRQ_NR_BOARD)
> 
>  #endif /* __ASM_ARCH_IRQS_H */
> --
> 1.7.1.569.g6f426

I have no idea that we need specific interrupt on EXYNOS4 now.
As you know, this can affect all machines of EXYNOS4 SoC even though there
is EXYNOS4210 now.

If required, we need something like SAMSUNG_GPIO_EXTRA for compatibility.
Anyway need more discussion on this :)

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
