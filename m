From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH 2/4] mach-s5pv310: Add resource definitions for mipi-csis
Date: Fri, 03 Dec 2010 13:36:20 +0900
Message-ID: <012401cb92a3$a46443b0$ed2ccb10$%kim@samsung.com>
References: <1291307862-8125-1-git-send-email-s.nawrocki@samsung.com>
 <1291307862-8125-3-git-send-email-s.nawrocki@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:47783 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758338Ab0LCEhB (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 2 Dec 2010 23:37:01 -0500
Received: from epmmp1 (mailout1.samsung.com [203.254.224.24])
 by mailout1.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LCU00IMG4SOKMB0@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 03 Dec 2010 13:36:24 +0900 (KST)
Received: from DOKGENEKIM02 ([12.23.103.104])
 by mmp1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0LCU007XW4SO25@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 03 Dec 2010 13:36:24 +0900 (KST)
In-reply-to: <1291307862-8125-3-git-send-email-s.nawrocki@samsung.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Sylwester Nawrocki' <s.nawrocki@samsung.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: ben-linux@fluff.org, m.szyprowski@samsung.com, kyungmin.park@samsung.com

Sylwester Nawrocki wrote:
> 
> Add IRQ and register base address definitions for mipi-csis devices.
> 
> Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
> Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
> ---
>  arch/arm/mach-s5pv310/include/mach/irqs.h |    3 +++
>  arch/arm/mach-s5pv310/include/mach/map.h  |    5 +++++
>  2 files changed, 8 insertions(+), 0 deletions(-)
> 
> diff --git a/arch/arm/mach-s5pv310/include/mach/irqs.h b/arch/arm/mach-
> s5pv310/include/mach/irqs.h
> index 99e7dad..db63773 100644
> --- a/arch/arm/mach-s5pv310/include/mach/irqs.h
> +++ b/arch/arm/mach-s5pv310/include/mach/irqs.h
> @@ -83,6 +83,9 @@
>  #define IRQ_HSMMC2		COMBINER_IRQ(29, 2)
>  #define IRQ_HSMMC3		COMBINER_IRQ(29, 3)
> 
> +#define IRQ_MIPICSI0		COMBINER_IRQ(30, 0)
> +#define IRQ_MIPICSI1		COMBINER_IRQ(30, 1)
> +
>  #define IRQ_ONENAND_AUDI	COMBINER_IRQ(34, 0)
> 
>  #define IRQ_EINT4		COMBINER_IRQ(37, 0)
> diff --git a/arch/arm/mach-s5pv310/include/mach/map.h b/arch/arm/mach-
> s5pv310/include/mach/map.h
> index 7acf4e7..9905bfe 100644
> --- a/arch/arm/mach-s5pv310/include/mach/map.h
> +++ b/arch/arm/mach-s5pv310/include/mach/map.h
> @@ -56,6 +56,9 @@
>  #define S5PV310_PA_GPIO2		(0x11000000)
>  #define S5PV310_PA_GPIO3		(0x03860000)
> 
> +#define S5PV310_PA_CSIS0		(0x11880000)
> +#define S5PV310_PA_CSIS1		(0x11890000)
> +
>  #define S5PV310_PA_HSMMC(x)		(0x12510000 + ((x) * 0x10000))
> 
>  #define S5PV310_PA_SROMC		(0x12570000)
> @@ -95,5 +98,7 @@
>  #define S3C_PA_IIC7			S5PV310_PA_IIC(7)
>  #define S3C_PA_RTC			S5PV310_PA_RTC
>  #define S3C_PA_WDT			S5PV310_PA_WATCHDOG
> +#define S5P_PA_CSIS0			S5PV310_PA_CSIS0
> +#define S5P_PA_CSIS1			S5PV310_PA_CSIS1
> 
>  #endif /* __ASM_ARCH_MAP_H */
> --

Please refer to previous my comment about the naming.

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
