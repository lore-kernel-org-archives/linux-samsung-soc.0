From: Jaehoon Chung <jh80.chung@samsung.com>
Subject: [PATCH] ARM: EXYNOS: add the definition for IRQ_DWMCI
Date: Wed, 18 Apr 2012 13:16:14 +0900
Message-ID: <4F8E400E.3000300@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:65402 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750748Ab2DREQc (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 18 Apr 2012 00:16:32 -0400
Received: from epcpsbgm2.samsung.com (mailout1.samsung.com [203.254.224.24])
 by mailout1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0M2N009D6QI5HB40@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 18 Apr 2012 13:16:31 +0900 (KST)
Received: from [165.213.219.108] by mmp2.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTPA id <0M2N00I3PQJI8F10@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 18 Apr 2012 13:16:30 +0900 (KST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: 'kgene kim' <kgene.kim@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>

In dev-dwmci.c, IRQ_DWMCI is referenced.
But there is no defined anywhere.
This patch is added the missing definition for IRQ_DWMCI.

Signed-off-by: Jaehoon Chung <jh80.chung@samsung.com>
Signed-off-by: Kyungmin Park <Kyungmin.park@samsung.com>
---
 arch/arm/mach-exynos/include/mach/irqs.h |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/arch/arm/mach-exynos/include/mach/irqs.h b/arch/arm/mach-exynos/include/mach/irqs.h
index 1161675..ed2295f 100644
--- a/arch/arm/mach-exynos/include/mach/irqs.h
+++ b/arch/arm/mach-exynos/include/mach/irqs.h
@@ -201,6 +201,7 @@
 #define IRQ_HSMMC1			EXYNOS4_IRQ_HSMMC1
 #define IRQ_HSMMC2			EXYNOS4_IRQ_HSMMC2
 #define IRQ_HSMMC3			EXYNOS4_IRQ_HSMMC3
+#define IRQ_DWMCI			EXYNOS4_IRQ_DWMCI
 
 #define IRQ_MIPI_CSIS0			EXYNOS4_IRQ_MIPI_CSIS0
 
