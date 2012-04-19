From: Kukjin Kim <kgene.kim@samsung.com>
Subject: Re: [PATCH] ARM: EXYNOS: add the definition for IRQ_DWMCI
Date: Wed, 18 Apr 2012 17:12:08 -0700
Message-ID: <4F8F5858.4060804@samsung.com>
References: <4F8E400E.3000300@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pb0-f46.google.com ([209.85.160.46]:41772 "EHLO
	mail-pb0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751605Ab2DSAMJ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 18 Apr 2012 20:12:09 -0400
Received: by pbcun15 with SMTP id un15so9554209pbc.19
        for <linux-samsung-soc@vger.kernel.org>; Wed, 18 Apr 2012 17:12:08 -0700 (PDT)
In-Reply-To: <4F8E400E.3000300@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Jaehoon Chung <jh80.chung@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, 'kgene kim' <kgene.kim@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>

Jaehoon Chung wrote:
> In dev-dwmci.c, IRQ_DWMCI is referenced.
> But there is no defined anywhere.
> This patch is added the missing definition for IRQ_DWMCI.
>
> Signed-off-by: Jaehoon Chung<jh80.chung@samsung.com>
> Signed-off-by: Kyungmin Park<Kyungmin.park@samsung.com>
> ---
>   arch/arm/mach-exynos/include/mach/irqs.h |    1 +
>   1 files changed, 1 insertions(+), 0 deletions(-)
>
> diff --git a/arch/arm/mach-exynos/include/mach/irqs.h b/arch/arm/mach-exynos/include/mach/irqs.h
> index 1161675..ed2295f 100644
> --- a/arch/arm/mach-exynos/include/mach/irqs.h
> +++ b/arch/arm/mach-exynos/include/mach/irqs.h
> @@ -201,6 +201,7 @@
>   #define IRQ_HSMMC1			EXYNOS4_IRQ_HSMMC1
>   #define IRQ_HSMMC2			EXYNOS4_IRQ_HSMMC2
>   #define IRQ_HSMMC3			EXYNOS4_IRQ_HSMMC3
> +#define IRQ_DWMCI			EXYNOS4_IRQ_DWMCI

Yeah, we need fix it but I have no idea need re-mapping. Just following 
can do it. If you're ok on following, let me pick this up.

---
diff --git a/arch/arm/mach-exynos/dev-dwmci.c 
b/arch/arm/mach-exynos/dev-dwmci.c
index b025db4..c78daf2 100644
--- a/arch/arm/mach-exynos/dev-dwmci.c
+++ b/arch/arm/mach-exynos/dev-dwmci.c
@@ -33,16 +31,8 @@ static int exynos4_dwmci_init(u32 slot_id, 
irq_handler_t handler, void *data)
  }

  static struct resource exynos4_dwmci_resource[] = {
-	[0] = {
-		.start	= EXYNOS4_PA_DWMCI,
-		.end	= EXYNOS4_PA_DWMCI + SZ_4K - 1,
-		.flags	= IORESOURCE_MEM,
-	},
-	[1] = {
-		.start	= IRQ_DWMCI,
-		.end	= IRQ_DWMCI,
-		.flags	= IORESOURCE_IRQ,
-	}
+	[0] = DEFINE_RES_MEM(EXYNOS4_PA_DWMCI, SZ_4K),
+	[1] = DEFINE_RES_IRQ(EXYNOS4_IRQ_DWMCI),
  };

  static struct dw_mci_board exynos4_dwci_pdata = {
-- 

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
