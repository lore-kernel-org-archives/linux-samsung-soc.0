From: Tomasz Figa <t.figa@samsung.com>
Subject: [PATCH v2 05/12] ARM: SAMSUNG: pm: Consolidate PM debug functions
Date: Thu, 06 Feb 2014 20:12:50 +0100
Message-ID: <1391713977-22300-6-git-send-email-t.figa@samsung.com>
References: <1391713977-22300-1-git-send-email-t.figa@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:11026 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756845AbaBFTNL (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 6 Feb 2014 14:13:11 -0500
Received: from eucpsbgm2.samsung.com (unknown [203.254.199.245])
 by mailout3.w1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0N0L00IQZ9DVXJA0@mailout3.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 06 Feb 2014 19:13:07 +0000 (GMT)
In-reply-to: <1391713977-22300-1-git-send-email-t.figa@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, Kukjin Kim <kgene.kim@samsung.com>, Arnd Bergmann <arnd@arndb.de>, Doug Anderson <dianders@chromium.org>, Olof Johansson <olof@lixom.net>, Kyungmin Park <kyungmin.park@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Tomasz Figa <t.figa@samsung.com>

This patch removes one-line functions that was used just to pass
constant arguments to lower level functions. After previous patches the
need for those constants has been eliminated, so the main functions can
be called directly.

Signed-off-by: Tomasz Figa <t.figa@samsung.com>
Acked-by: Kyungmin Park <kyungmin.park@samsung.com>
---
 arch/arm/plat-samsung/pm.c | 20 ++++++--------------
 1 file changed, 6 insertions(+), 14 deletions(-)

diff --git a/arch/arm/plat-samsung/pm.c b/arch/arm/plat-samsung/pm.c
index 53b3d67..7c1d4385 100644
--- a/arch/arm/plat-samsung/pm.c
+++ b/arch/arm/plat-samsung/pm.c
@@ -85,9 +85,10 @@ static inline void __iomem *s3c_pm_uart_base(void)
 	return (void __iomem *)vaddr;
 }
 
-static void s3c_pm_save_uart(unsigned int uart, struct pm_uart_save *save)
+static void s3c_pm_save_uarts(void)
 {
 	void __iomem *regs = s3c_pm_uart_base();
+	struct pm_uart_save *save = &uart_save;
 
 	save->ulcon = __raw_readl(regs + S3C2410_ULCON);
 	save->ucon = __raw_readl(regs + S3C2410_UCON);
@@ -98,18 +99,14 @@ static void s3c_pm_save_uart(unsigned int uart, struct pm_uart_save *save)
 	if (!soc_is_s3c2410())
 		save->udivslot = __raw_readl(regs + S3C2443_DIVSLOT);
 
-	S3C_PMDBG("UART[%d]: ULCON=%04x, UCON=%04x, UFCON=%04x, UBRDIV=%04x\n",
-		  uart, save->ulcon, save->ucon, save->ufcon, save->ubrdiv);
-}
-
-static void s3c_pm_save_uarts(void)
-{
-	s3c_pm_save_uart(CONFIG_DEBUG_S3C_UART, &uart_save);
+	S3C_PMDBG("UART[%p]: ULCON=%04x, UCON=%04x, UFCON=%04x, UBRDIV=%04x\n",
+		  regs, save->ulcon, save->ucon, save->ufcon, save->ubrdiv);
 }
 
-static void s3c_pm_restore_uart(unsigned int uart, struct pm_uart_save *save)
+static void s3c_pm_restore_uarts(void)
 {
 	void __iomem *regs = s3c_pm_uart_base();
+	struct pm_uart_save *save = &uart_save;
 
 	s3c_pm_arch_update_uart(regs, save);
 
@@ -122,11 +119,6 @@ static void s3c_pm_restore_uart(unsigned int uart, struct pm_uart_save *save)
 	if (!soc_is_s3c2410())
 		__raw_writel(save->udivslot, regs + S3C2443_DIVSLOT);
 }
-
-static void s3c_pm_restore_uarts(void)
-{
-	s3c_pm_restore_uart(CONFIG_DEBUG_S3C_UART, &uart_save);
-}
 #else
 #define s3c_pm_debug_init() do { } while (0)
 
-- 
1.8.5.2
