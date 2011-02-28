From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [PATCH 2/3] ARM: EXYNOS4: Add irq definition for kernel global timer
Date: Mon, 28 Feb 2011 14:16:46 +0900
Message-ID: <1298870207-1850-2-git-send-email-kgene.kim@samsung.com>
References: <1298870207-1850-1-git-send-email-kgene.kim@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from ganesha.gnumonks.org ([213.95.27.120]:46890 "EHLO
	ganesha.gnumonks.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751109Ab1B1Fri (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 28 Feb 2011 00:47:38 -0500
In-Reply-To: <1298870207-1850-1-git-send-email-kgene.kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: ben-linux@fluff.org, Changhwan Youn <chaos.youn@samsung.com>, Kukjin Kim <kgene.kim@samsung.com>

From: Changhwan Youn <chaos.youn@samsung.com>

This patch adds IRQ_MCT_G0 to irq map. IRQ_MCT_G0 is an interrupt of MCT
comparator and used for kernel global timer.

Signed-off-by: Changhwan Youn <chaos.youn@samsung.com>
Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
---
 arch/arm/mach-exynos4/include/mach/irqs.h |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/arch/arm/mach-exynos4/include/mach/irqs.h b/arch/arm/mach-exynos4/include/mach/irqs.h
index 2dc5900..e3556d4 100644
--- a/arch/arm/mach-exynos4/include/mach/irqs.h
+++ b/arch/arm/mach-exynos4/include/mach/irqs.h
@@ -131,6 +131,7 @@
 #define IRQ_MCT_L0		COMBINER_IRQ(51, 0)
 
 #define IRQ_WDT			COMBINER_IRQ(53, 0)
+#define IRQ_MCT_G0		COMBINER_IRQ(53, 4)
 
 #define MAX_COMBINER_NR		54
 
-- 
1.7.1
