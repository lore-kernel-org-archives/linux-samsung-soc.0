From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: [PATCH 2/4] mach-s5pv310: Add resource definitions for mipi-csis
Date: Thu, 02 Dec 2010 17:37:40 +0100
Message-ID: <1291307862-8125-3-git-send-email-s.nawrocki@samsung.com>
References: <1291307862-8125-1-git-send-email-s.nawrocki@samsung.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:56844 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757744Ab0LBQjP (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 2 Dec 2010 11:39:15 -0500
Received: from spt2.w1.samsung.com (mailout1.w1.samsung.com [210.118.77.11])
 by mailout1.w1.samsung.com
 (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTP id <0LCT0092Y7LENV@mailout1.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 02 Dec 2010 16:39:14 +0000 (GMT)
Received: from linux.samsung.com ([106.116.38.10])
 by spt2.w1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14
 2004)) with ESMTPA id <0LCT00JZL7LDI8@spt2.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 02 Dec 2010 16:39:14 +0000 (GMT)
In-reply-to: <1291307862-8125-1-git-send-email-s.nawrocki@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, ben-linux@fluff.org, m.szyprowski@samsung.com, kyungmin.park@samsung.com, s.nawrocki@samsung.com

Add IRQ and register base address definitions for mipi-csis devices.

Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
---
 arch/arm/mach-s5pv310/include/mach/irqs.h |    3 +++
 arch/arm/mach-s5pv310/include/mach/map.h  |    5 +++++
 2 files changed, 8 insertions(+), 0 deletions(-)

diff --git a/arch/arm/mach-s5pv310/include/mach/irqs.h b/arch/arm/mach-s5pv310/include/mach/irqs.h
index 99e7dad..db63773 100644
--- a/arch/arm/mach-s5pv310/include/mach/irqs.h
+++ b/arch/arm/mach-s5pv310/include/mach/irqs.h
@@ -83,6 +83,9 @@
 #define IRQ_HSMMC2		COMBINER_IRQ(29, 2)
 #define IRQ_HSMMC3		COMBINER_IRQ(29, 3)
 
+#define IRQ_MIPICSI0		COMBINER_IRQ(30, 0)
+#define IRQ_MIPICSI1		COMBINER_IRQ(30, 1)
+
 #define IRQ_ONENAND_AUDI	COMBINER_IRQ(34, 0)
 
 #define IRQ_EINT4		COMBINER_IRQ(37, 0)
diff --git a/arch/arm/mach-s5pv310/include/mach/map.h b/arch/arm/mach-s5pv310/include/mach/map.h
index 7acf4e7..9905bfe 100644
--- a/arch/arm/mach-s5pv310/include/mach/map.h
+++ b/arch/arm/mach-s5pv310/include/mach/map.h
@@ -56,6 +56,9 @@
 #define S5PV310_PA_GPIO2		(0x11000000)
 #define S5PV310_PA_GPIO3		(0x03860000)
 
+#define S5PV310_PA_CSIS0		(0x11880000)
+#define S5PV310_PA_CSIS1		(0x11890000)
+
 #define S5PV310_PA_HSMMC(x)		(0x12510000 + ((x) * 0x10000))
 
 #define S5PV310_PA_SROMC		(0x12570000)
@@ -95,5 +98,7 @@
 #define S3C_PA_IIC7			S5PV310_PA_IIC(7)
 #define S3C_PA_RTC			S5PV310_PA_RTC
 #define S3C_PA_WDT			S5PV310_PA_WATCHDOG
+#define S5P_PA_CSIS0			S5PV310_PA_CSIS0
+#define S5P_PA_CSIS1			S5PV310_PA_CSIS1
 
 #endif /* __ASM_ARCH_MAP_H */
-- 
1.7.1
