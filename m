From: Heiko =?iso-8859-1?q?St=FCbner?= <heiko@sntech.de>
Subject: [PATCH v2 6/7] s3c-adc: Add support for S3C2443
Date: Sun, 18 Sep 2011 22:47:52 +0200
Message-ID: <201109182247.52632.heiko@sntech.de>
References: <201109182241.48858.heiko@sntech.de>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from s15407518.onlinehome-server.info ([82.165.136.167]:59312 "EHLO
	s15407518.onlinehome-server.info" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1755416Ab1IRUr7 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 18 Sep 2011 16:47:59 -0400
In-Reply-To: <201109182241.48858.heiko@sntech.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>, 'Ben Dooks' <ben-linux@fluff.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, Heiko =?iso-8859-1?q?St=FCbner?= <heiko@sntech.de>

The S3C2443-adc is 10 bit wide and has its mux-select
in an extra register at base+0x18

Signed-off-by: Heiko Stuebner <heiko@sntech.de>
---
changes since v1:
 wrap line over 80 chars and move setname call

 arch/arm/mach-s3c2443/s3c2443.c |    3 +++
 arch/arm/plat-samsung/adc.c     |    7 +++++++
 2 files changed, 10 insertions(+), 0 deletions(-)

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
index 05030ca..af16957 100644
--- a/arch/arm/plat-samsung/adc.c
+++ b/arch/arm/plat-samsung/adc.c
@@ -129,6 +129,9 @@ static inline void s3c_adc_select(struct adc_device *adc,
 	if (!client->is_ts) {
 		if (cpu & S3C_ADC_QUIRK_MUX1C)
 			writel(client->channel & 0xf, adc->regs + S5P_ADCMUX);
+		else if (cpu & S3C_ADC_QUIRK_MUX18)
+			writel(client->channel & 0xf,
+				adc->regs + S3C2443_ADCMUX);
 		else
 			con |= S3C2410_ADCCON_SELMUX(client->channel);
 	}
@@ -517,6 +520,10 @@ static struct platform_device_id s3c_adc_driver_ids[] = {
 		.driver_data    = S3C_ADC_QUIRK_10BIT |
 					S3C_ADC_QUIRK_MUXADCCON,
 	}, {
+		.name           = "s3c2443-adc",
+		.driver_data    = S3C_ADC_QUIRK_10BIT |
+					S3C_ADC_QUIRK_MUX18,
+	}, {
 		.name           = "s3c64xx-adc",
 		.driver_data    = S3C_ADC_QUIRK_12BIT |
 					S3C_ADC_QUIRK_MUXADCCON |
-- 
1.7.2.3
