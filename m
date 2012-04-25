From: Kukjin Kim <kgene.kim@samsung.com>
Subject: Re: [PATCH] ARM: EXYNOS: add the definition for IRQ_DWMCI
Date: Tue, 24 Apr 2012 17:20:14 -0700
Message-ID: <4F97433E.2040004@samsung.com>
References: <4F8E400E.3000300@samsung.com> <4F8F5858.4060804@samsung.com> <4F8F6C34.1090308@samsung.com> <4F8F78EC.8030602@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pz0-f51.google.com ([209.85.210.51]:60500 "EHLO
	mail-pz0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757132Ab2DYAUS (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 24 Apr 2012 20:20:18 -0400
Received: by dadz8 with SMTP id z8so1574132dad.10
        for <linux-samsung-soc@vger.kernel.org>; Tue, 24 Apr 2012 17:20:17 -0700 (PDT)
In-Reply-To: <4F8F78EC.8030602@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: Jaehoon Chung <jh80.chung@samsung.com>, linux-samsung-soc@vger.kernel.org, Kyungmin Park <kyungmin.park@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>


Should be EXYNOS4_IRQ_DWMCI instead of IRQ_DWMCI,
and use DEFINE_RES_{MEM,IRQ}.

Reported-by: Jaehoon Chung <jh80.chung@samsung.com>
Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
---
  arch/arm/mach-exynos/dev-dwmci.c |   13 +++----------
  1 files changed, 3 insertions(+), 10 deletions(-)

diff --git a/arch/arm/mach-exynos/dev-dwmci.c 
b/arch/arm/mach-exynos/dev-dwmci.c
index b025db4..7903501 100644
--- a/arch/arm/mach-exynos/dev-dwmci.c
+++ b/arch/arm/mach-exynos/dev-dwmci.c
@@ -16,6 +16,7 @@
  #include <linux/dma-mapping.h>
  #include <linux/platform_device.h>
  #include <linux/interrupt.h>
+#include <linux/ioport.h>
  #include <linux/mmc/dw_mmc.h>

  #include <plat/devs.h>
@@ -33,16 +34,8 @@ static int exynos4_dwmci_init(u32 slot_id, 
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
