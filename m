From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Subject: [PATCH 2/2] ARM: S3C64XX: Dynamically assign interrupts for CPU PMIC on Cragganmore
Date: Sun,  3 Jun 2012 13:42:41 +0100
Message-ID: <1338727361-25243-2-git-send-email-broonie@opensource.wolfsonmicro.com>
References: <1338727361-25243-1-git-send-email-broonie@opensource.wolfsonmicro.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from opensource.wolfsonmicro.com ([80.75.67.52]:45699 "EHLO
	opensource.wolfsonmicro.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751072Ab2FCMmp (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 3 Jun 2012 08:42:45 -0400
In-Reply-To: <1338727361-25243-1-git-send-email-broonie@opensource.wolfsonmicro.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, Mark Brown <broonie@opensource.wolfsonmicro.com>

Now that the WM831x driver uses irq_domain we can happily allow it to
assign its own IRQs.

Signed-off-by: Mark Brown <broonie@opensource.wolfsonmicro.com>
---
 arch/arm/mach-s3c64xx/include/mach/crag6410.h |    3 +--
 arch/arm/mach-s3c64xx/mach-crag6410.c         |    1 -
 2 files changed, 1 insertion(+), 3 deletions(-)

diff --git a/arch/arm/mach-s3c64xx/include/mach/crag6410.h b/arch/arm/mach-s3c64xx/include/mach/crag6410.h
index ec97c15..4c3c999 100644
--- a/arch/arm/mach-s3c64xx/include/mach/crag6410.h
+++ b/arch/arm/mach-s3c64xx/include/mach/crag6410.h
@@ -13,8 +13,7 @@
 
 #include <linux/gpio.h>
 
-#define BANFF_PMIC_IRQ_BASE		IRQ_BOARD_START
-#define GLENFARCLAS_PMIC_IRQ_BASE	(IRQ_BOARD_START + 64)
+#define GLENFARCLAS_PMIC_IRQ_BASE	IRQ_BOARD_START
 
 #define PCA935X_GPIO_BASE		GPIO_BOARD_START
 #define CODEC_GPIO_BASE			(GPIO_BOARD_START + 8)
diff --git a/arch/arm/mach-s3c64xx/mach-crag6410.c b/arch/arm/mach-s3c64xx/mach-crag6410.c
index d0c352d..161c3b6 100644
--- a/arch/arm/mach-s3c64xx/mach-crag6410.c
+++ b/arch/arm/mach-s3c64xx/mach-crag6410.c
@@ -525,7 +525,6 @@ static struct wm831x_touch_pdata touch_pdata __initdata = {
 
 static struct wm831x_pdata crag_pmic_pdata __initdata = {
 	.wm831x_num = 1,
-	.irq_base = BANFF_PMIC_IRQ_BASE,
 	.gpio_base = BANFF_PMIC_GPIO_BASE,
 	.soft_shutdown = true,
 
-- 
1.7.10
