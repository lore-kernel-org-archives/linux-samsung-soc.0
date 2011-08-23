From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [PATCH V2 2/4] ARM: S5P64X0: Use soc_is_s5p64x0() to distinguish cpu at runtime
Date: Tue, 23 Aug 2011 10:39:12 +0900
Message-ID: <1314063552-27416-2-git-send-email-kgene.kim@samsung.com>
References: <1314063552-27416-1-git-send-email-kgene.kim@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from ganesha.gnumonks.org ([213.95.27.120]:53664 "EHLO
	ganesha.gnumonks.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754758Ab1HWBwX (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 22 Aug 2011 21:52:23 -0400
In-Reply-To: <1314063552-27416-1-git-send-email-kgene.kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: ben-linux@fluff.org, Kukjin Kim <kgene.kim@samsung.com>

Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
---
Changes since v1:
- soc_is_s5p64x0() is used instead of cpu_is_s5p64x0()

 arch/arm/mach-s5p64x0/dev-spi.c  |    8 +++-----
 arch/arm/mach-s5p64x0/dma.c      |    7 ++-----
 arch/arm/mach-s5p64x0/gpiolib.c  |    7 ++-----
 arch/arm/mach-s5p64x0/irq-eint.c |    3 ++-
 4 files changed, 9 insertions(+), 16 deletions(-)

diff --git a/arch/arm/mach-s5p64x0/dev-spi.c b/arch/arm/mach-s5p64x0/dev-spi.c
index ac825e8..1fd9c79 100644
--- a/arch/arm/mach-s5p64x0/dev-spi.c
+++ b/arch/arm/mach-s5p64x0/dev-spi.c
@@ -21,6 +21,7 @@
 #include <mach/regs-clock.h>
 #include <mach/spi-clocks.h>
 
+#include <plat/cpu.h>
 #include <plat/s3c64xx-spi.h>
 #include <plat/gpio-cfg.h>
 
@@ -185,11 +186,8 @@ struct platform_device s5p64x0_device_spi1 = {
 
 void __init s5p64x0_spi_set_info(int cntrlr, int src_clk_nr, int num_cs)
 {
-	unsigned int id;
 	struct s3c64xx_spi_info *pd;
 
-	id = __raw_readl(S5P64X0_SYS_ID) & 0xFF000;
-
 	/* Reject invalid configuration */
 	if (!num_cs || src_clk_nr < 0
 			|| src_clk_nr > S5P64X0_SPI_SRCCLK_SCLK) {
@@ -199,7 +197,7 @@ void __init s5p64x0_spi_set_info(int cntrlr, int src_clk_nr, int num_cs)
 
 	switch (cntrlr) {
 	case 0:
-		if (id == 0x50000)
+		if (soc_is_s5p6450())
 			pd = &s5p6450_spi0_pdata;
 		else
 			pd = &s5p6440_spi0_pdata;
@@ -207,7 +205,7 @@ void __init s5p64x0_spi_set_info(int cntrlr, int src_clk_nr, int num_cs)
 		s5p64x0_device_spi0.dev.platform_data = pd;
 		break;
 	case 1:
-		if (id == 0x50000)
+		if (soc_is_s5p6450())
 			pd = &s5p6450_spi1_pdata;
 		else
 			pd = &s5p6440_spi1_pdata;
diff --git a/arch/arm/mach-s5p64x0/dma.c b/arch/arm/mach-s5p64x0/dma.c
index d7ad944..0e5b3e6 100644
--- a/arch/arm/mach-s5p64x0/dma.c
+++ b/arch/arm/mach-s5p64x0/dma.c
@@ -28,6 +28,7 @@
 #include <mach/irqs.h>
 #include <mach/regs-clock.h>
 
+#include <plat/cpu.h>
 #include <plat/devs.h>
 #include <plat/s3c-pl330-pdata.h>
 
@@ -133,11 +134,7 @@ static struct platform_device s5p64x0_device_pdma = {
 
 static int __init s5p64x0_dma_init(void)
 {
-	unsigned int id;
-
-	id = __raw_readl(S5P64X0_SYS_ID) & 0xFF000;
-
-	if (id == 0x50000)
+	if (soc_is_s5p6450())
 		s5p64x0_device_pdma.dev.platform_data = &s5p6450_pdma_pdata;
 	else
 		s5p64x0_device_pdma.dev.platform_data = &s5p6440_pdma_pdata;
diff --git a/arch/arm/mach-s5p64x0/gpiolib.c b/arch/arm/mach-s5p64x0/gpiolib.c
index e7fb3b0..700dac6 100644
--- a/arch/arm/mach-s5p64x0/gpiolib.c
+++ b/arch/arm/mach-s5p64x0/gpiolib.c
@@ -19,6 +19,7 @@
 #include <mach/regs-gpio.h>
 #include <mach/regs-clock.h>
 
+#include <plat/cpu.h>
 #include <plat/gpio-core.h>
 #include <plat/gpio-cfg.h>
 #include <plat/gpio-cfg-helpers.h>
@@ -473,14 +474,10 @@ static void __init s5p64x0_gpio_add_rbank_4bit2(struct s3c_gpio_chip *chip,
 
 static int __init s5p64x0_gpiolib_init(void)
 {
-	unsigned int chipid;
-
-	chipid = __raw_readl(S5P64X0_SYS_ID);
-
 	s5p64x0_gpiolib_set_cfg(s5p64x0_gpio_cfgs,
 				ARRAY_SIZE(s5p64x0_gpio_cfgs));
 
-	if ((chipid & 0xff000) == 0x50000) {
+	if (soc_is_s5p6450()) {
 		samsung_gpiolib_add_2bit_chips(s5p6450_gpio_2bit,
 					ARRAY_SIZE(s5p6450_gpio_2bit));
 
diff --git a/arch/arm/mach-s5p64x0/irq-eint.c b/arch/arm/mach-s5p64x0/irq-eint.c
index 69ed454..94104c4 100644
--- a/arch/arm/mach-s5p64x0/irq-eint.c
+++ b/arch/arm/mach-s5p64x0/irq-eint.c
@@ -17,6 +17,7 @@
 #include <linux/irq.h>
 #include <linux/io.h>
 
+#include <plat/cpu.h>
 #include <plat/regs-irqtype.h>
 #include <plat/gpio-cfg.h>
 
@@ -67,7 +68,7 @@ static int s5p64x0_irq_eint_set_type(struct irq_data *data, unsigned int type)
 	__raw_writel(ctrl, S5P64X0_EINT0CON0);
 
 	/* Configure the GPIO pin for 6450 or 6440 based on CPU ID */
-	if (0x50000 == (__raw_readl(S5P64X0_SYS_ID) & 0xFF000))
+	if (soc_is_s5p6450())
 		s3c_gpio_cfgpin(S5P6450_GPN(offs), S3C_GPIO_SFN(2));
 	else
 		s3c_gpio_cfgpin(S5P6440_GPN(offs), S3C_GPIO_SFN(2));
-- 
1.7.1
