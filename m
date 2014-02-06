From: Tomasz Figa <t.figa@samsung.com>
Subject: [PATCH v2 04/12] ARM: SAMSUNG: pm: Use debug_ll_addr() to get UART
 base address
Date: Thu, 06 Feb 2014 20:12:49 +0100
Message-ID: <1391713977-22300-5-git-send-email-t.figa@samsung.com>
References: <1391713977-22300-1-git-send-email-t.figa@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:13291 "EHLO
	mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756842AbaBFTNI (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 6 Feb 2014 14:13:08 -0500
Received: from eucpsbgm2.samsung.com (unknown [203.254.199.245])
 by mailout4.w1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0N0L009Z69DVSJA0@mailout4.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 06 Feb 2014 19:13:07 +0000 (GMT)
In-reply-to: <1391713977-22300-1-git-send-email-t.figa@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, Kukjin Kim <kgene.kim@samsung.com>, Arnd Bergmann <arnd@arndb.de>, Doug Anderson <dianders@chromium.org>, Olof Johansson <olof@lixom.net>, Kyungmin Park <kyungmin.park@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Tomasz Figa <t.figa@samsung.com>

This patch modifies Samsung PM debug helpers to use a multiplatform
friendly way of getting base address of debug UART port, so instead
of using a per-mach static macro, a generic debug_ll_addr() helper
is used.

Signed-off-by: Tomasz Figa <t.figa@samsung.com>
Acked-by: Kyungmin Park <kyungmin.park@samsung.com>
---
 arch/arm/plat-samsung/pm.c | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/arch/arm/plat-samsung/pm.c b/arch/arm/plat-samsung/pm.c
index 5d9daf6..53b3d67 100644
--- a/arch/arm/plat-samsung/pm.c
+++ b/arch/arm/plat-samsung/pm.c
@@ -21,6 +21,7 @@
 #include <linux/io.h>
 
 #include <asm/cacheflush.h>
+#include <asm/mach/map.h>
 #include <asm/suspend.h>
 
 #include <plat/cpu.h>
@@ -74,9 +75,19 @@ static inline void s3c_pm_debug_init(void)
 
 static struct pm_uart_save uart_save;
 
+static inline void __iomem *s3c_pm_uart_base(void)
+{
+	unsigned long paddr;
+	unsigned long vaddr;
+
+	debug_ll_addr(&paddr, &vaddr);
+
+	return (void __iomem *)vaddr;
+}
+
 static void s3c_pm_save_uart(unsigned int uart, struct pm_uart_save *save)
 {
-	void __iomem *regs = S3C_VA_UARTx(uart);
+	void __iomem *regs = s3c_pm_uart_base();
 
 	save->ulcon = __raw_readl(regs + S3C2410_ULCON);
 	save->ucon = __raw_readl(regs + S3C2410_UCON);
@@ -98,7 +109,7 @@ static void s3c_pm_save_uarts(void)
 
 static void s3c_pm_restore_uart(unsigned int uart, struct pm_uart_save *save)
 {
-	void __iomem *regs = S3C_VA_UARTx(uart);
+	void __iomem *regs = s3c_pm_uart_base();
 
 	s3c_pm_arch_update_uart(regs, save);
 
-- 
1.8.5.2
