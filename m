From: Tomasz Figa <t.figa@samsung.com>
Subject: [PATCH 16/28] ARM: SAMSUNG: Compile s5p-irq-pm only with ATAGS support
Date: Fri, 14 Jun 2013 21:32:52 +0200
Message-ID: <1371238384-1504-17-git-send-email-t.figa@samsung.com>
References: <1371238384-1504-1-git-send-email-t.figa@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:31659 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753892Ab3FNTd3 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 14 Jun 2013 15:33:29 -0400
Received: from eucpsbgm1.samsung.com (unknown [203.254.199.244])
 by mailout1.w1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MOE00FZSE9PI770@mailout1.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 14 Jun 2013 20:33:25 +0100 (BST)
In-reply-to: <1371238384-1504-1-git-send-email-t.figa@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, Kukjin Kim <kgene.kim@samsung.com>, Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, Marek Szyprowski <m.szyprowski@samsung.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Thomas Abraham <thomas.abraham@linaro.org>, Tomasz Figa <t.figa@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>

This patch adds new Kconfig symbol, S5P_IRQ_PM that gets selected
by S5P_PM, but only if SAMSUNG_ATAGS is selected.

Signed-off-by: Tomasz Figa <t.figa@samsung.com>
Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
---
 arch/arm/plat-samsung/Kconfig  | 6 ++++++
 arch/arm/plat-samsung/Makefile | 2 +-
 2 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/arch/arm/plat-samsung/Kconfig b/arch/arm/plat-samsung/Kconfig
index c0f0542..1c607da 100644
--- a/arch/arm/plat-samsung/Kconfig
+++ b/arch/arm/plat-samsung/Kconfig
@@ -421,6 +421,12 @@ config S3C_DMA
 	help
 	  Internal configuration for S3C DMA core
 
+config S5P_IRQ_PM
+	bool
+	default y if S5P_PM
+	help
+	  Legacy IRQ power management for S5P platforms
+
 endif
 
 config SAMSUNG_DMADEV
diff --git a/arch/arm/plat-samsung/Makefile b/arch/arm/plat-samsung/Makefile
index 8d95c15..0c9f3cd 100644
--- a/arch/arm/plat-samsung/Makefile
+++ b/arch/arm/plat-samsung/Makefile
@@ -58,5 +58,5 @@ obj-$(CONFIG_SAMSUNG_PM_CHECK)	+= pm-check.o
 obj-$(CONFIG_SAMSUNG_WAKEMASK)	+= wakeup-mask.o
 
 obj-$(CONFIG_S5P_PM)		+= s5p-pm.o
-obj-$(CONFIG_S5P_PM)		+= s5p-irq-pm.o
+obj-$(CONFIG_S5P_IRQ_PM)	+= s5p-irq-pm.o
 obj-$(CONFIG_S5P_SLEEP)		+= s5p-sleep.o
-- 
1.8.2.1
