From: Heiko =?iso-8859-1?q?St=FCbner?= <heiko@sntech.de>
Subject: [PATCH 4/5] s3c-adc: Add support for S3C2443
Date: Mon, 10 Oct 2011 21:50:12 +0200
Message-ID: <201110102150.12450.heiko@sntech.de>
References: <201110102146.51694.heiko@sntech.de>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from s15407518.onlinehome-server.info ([82.165.136.167]:57614 "EHLO
	s15407518.onlinehome-server.info" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1753627Ab1JJTuT (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 10 Oct 2011 15:50:19 -0400
In-Reply-To: <201110102146.51694.heiko@sntech.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>, 'Ben Dooks' <ben-linux@fluff.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, Heiko =?iso-8859-1?q?St=FCbner?= <heiko@sntech.de>

The S3C2443-adc is 10 bit wide and has its mux-select
in an extra register at base+0x18

Signed-off-by: Heiko Stuebner <heiko@sntech.de>
---
 arch/arm/mach-s3c2443/s3c2443.c |    3 +++
 arch/arm/plat-samsung/adc.c     |   17 ++++++++++++-----
 2 files changed, 15 insertions(+), 5 deletions(-)

diff --git a/arch/arm/mach-s3c2443/s3c2443.c b/arch/arm/mach-s3c2443/s3c2443.c
index e6a28ba..11dae3e 100644
--- a/arch/arm/mach-s3c2443/s3c2443.c
+++ b/arch/arm/mach-s3c2443/s3c2443.c
@@ -41,6 +41,7 @@
 #include <plat/cpu.h>
 #include <plat/fb-core.h>
 #include <plat/nand-core.h>
+#include <plat/adc-core.h>
 
 static struct map_desc s3c2443_iodesc[] __initdata = {
 	IODESC_ENT(WATCHDOG),
@@ -70,6 +71,8 @@ int __init s3c2443_init(void)
 	s3c_nand_setname("s3c2412-nand");
 	s3c_fb_setname("s3c2443-fb");
 
+	s3c_adc_setname("s3c2443-adc");
+
 	/* change WDT IRQ number */
 	s3c_device_wdt.resource[1].start = IRQ_S3C2443_WDT;
 	s3c_device_wdt.resource[1].end   = IRQ_S3C2443_WDT;
diff --git a/arch/arm/plat-samsung/adc.c b/arch/arm/plat-samsung/adc.c
index 7821055a..266544b 100644
--- a/arch/arm/plat-samsung/adc.c
+++ b/arch/arm/plat-samsung/adc.c
@@ -41,6 +41,7 @@
 
 enum s3c_cpu_type {
 	TYPE_ADCV1, /* S3C24XX */
+	TYPE_ADCV11, /* S3C2443 */
 	TYPE_ADCV2, /* S3C64XX, S5P64X0, S5PC100 */
 	TYPE_ADCV3, /* S5PV210, S5PC110, EXYNOS4210 */
 };
@@ -106,6 +107,9 @@ static inline void s3c_adc_select(struct adc_device *adc,
 	if (!client->is_ts) {
 		if (cpu == TYPE_ADCV3)
 			writel(client->channel & 0xf, adc->regs + S5P_ADCMUX);
+		else if (cpu == TYPE_ADCV11)
+			writel(client->channel & 0xf,
+						adc->regs + S3C2443_ADCMUX);
 		else
 			con |= S3C2410_ADCCON_SELMUX(client->channel);
 	}
@@ -294,13 +298,13 @@ static irqreturn_t s3c_adc_irq(int irq, void *pw)
 
 	client->nr_samples--;
 
-	if (cpu != TYPE_ADCV1) {
+	if (cpu == TYPE_ADCV1 || cpu == TYPE_ADCV11) {
+		data0 &= 0x3ff;
+		data1 &= 0x3ff;
+	} else {
 		/* S3C64XX/S5P ADC resolution is 12-bit */
 		data0 &= 0xfff;
 		data1 &= 0xfff;
-	} else {
-		data0 &= 0x3ff;
-		data1 &= 0x3ff;
 	}
 
 	if (client->convert_cb)
@@ -321,7 +325,7 @@ static irqreturn_t s3c_adc_irq(int irq, void *pw)
 	}
 
 exit:
-	if (cpu != TYPE_ADCV1) {
+	if (cpu == TYPE_ADCV2 || cpu == TYPE_ADCV3) {
 		/* Clear ADC interrupt */
 		writel(0, adc->regs + S3C64XX_ADCCLRINT);
 	}
@@ -493,6 +497,9 @@ static struct platform_device_id s3c_adc_driver_ids[] = {
 		.name           = "s3c24xx-adc",
 		.driver_data    = TYPE_ADCV1,
 	}, {
+		.name           = "s3c2443-adc",
+		.driver_data    = TYPE_ADCV11,
+	}, {
 		.name           = "s3c64xx-adc",
 		.driver_data    = TYPE_ADCV2,
 	}, {
-- 
1.7.2.3
