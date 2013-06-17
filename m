From: Tomasz Figa <t.figa@samsung.com>
Subject: [PATCH v2 16/38] ARM: SAMSUNG: Compile legacy IRQ and GPIO PM code
 only with ATAGS support
Date: Mon, 17 Jun 2013 18:34:01 +0200
Message-ID: <1371486863-12398-17-git-send-email-t.figa@samsung.com>
References: <1371486863-12398-1-git-send-email-t.figa@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:41745 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751538Ab3FQQex (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 17 Jun 2013 12:34:53 -0400
Received: from eucpsbgm2.samsung.com (unknown [203.254.199.245])
 by mailout3.w1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MOJ00MBNQ1N6260@mailout3.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 17 Jun 2013 17:34:47 +0100 (BST)
In-reply-to: <1371486863-12398-1-git-send-email-t.figa@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, Kukjin Kim <kgene.kim@samsung.com>, Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, Marek Szyprowski <m.szyprowski@samsung.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Thomas Abraham <thomas.abraham@linaro.org>, Tomasz Figa <t.figa@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>

This patch adds new Kconfig symbols, SAMSUNG_PM_GPIO and S5P_IRQ_PM that
get enabled when GPIO_SAMSUNG, PM and S5P_PM are enabled, but only if
SAMSUNG_ATAGS is selected.

Signed-off-by: Tomasz Figa <t.figa@samsung.com>
Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
---
 arch/arm/plat-samsung/Kconfig  | 13 +++++++++++++
 arch/arm/plat-samsung/Makefile |  5 +++--
 2 files changed, 16 insertions(+), 2 deletions(-)

diff --git a/arch/arm/plat-samsung/Kconfig b/arch/arm/plat-samsung/Kconfig
index c0f0542..7b08b26 100644
--- a/arch/arm/plat-samsung/Kconfig
+++ b/arch/arm/plat-samsung/Kconfig
@@ -421,6 +421,19 @@ config S3C_DMA
 	help
 	  Internal configuration for S3C DMA core
 
+config S5P_IRQ_PM
+	bool
+	default y if S5P_PM
+	help
+	  Legacy IRQ power management for S5P platforms
+
+config SAMSUNG_PM_GPIO
+	bool
+	default y if GPIO_SAMSUNG && PM
+	help
+	  Include legacy GPIO power management code for platforms not using
+	  pinctrl-samsung driver.
+
 endif
 
 config SAMSUNG_DMADEV
diff --git a/arch/arm/plat-samsung/Makefile b/arch/arm/plat-samsung/Makefile
index b549ea9..6348ae2 100644
--- a/arch/arm/plat-samsung/Makefile
+++ b/arch/arm/plat-samsung/Makefile
@@ -52,10 +52,11 @@ obj-$(CONFIG_SAMSUNG_DMADEV)	+= dma-ops.o
 # PM support
 
 obj-$(CONFIG_PM)		+= pm.o
-obj-$(CONFIG_PM)		+= pm-gpio.o
+obj-$(CONFIG_SAMSUNG_PM_GPIO)	+= pm-gpio.o
 obj-$(CONFIG_SAMSUNG_PM_CHECK)	+= pm-check.o
 
 obj-$(CONFIG_SAMSUNG_WAKEMASK)	+= wakeup-mask.o
 
-obj-$(CONFIG_S5P_PM)		+= s5p-pm.o s5p-irq-pm.o
+obj-$(CONFIG_S5P_PM)		+= s5p-pm.o
+obj-$(CONFIG_S5P_IRQ_PM)	+= s5p-irq-pm.o
 obj-$(CONFIG_S5P_SLEEP)		+= s5p-sleep.o
-- 
1.8.2.1
