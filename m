From: Heiko =?iso-8859-1?q?St=FCbner?= <heiko@sntech.de>
Subject: [PATCH v2 2/2] s3c-adc: describe features via quirk constants
Date: Wed, 28 Sep 2011 08:43:15 +0200
Message-ID: <201109280843.16984.heiko@sntech.de>
References: <201109182241.48858.heiko@sntech.de> <201109182243.40440.heiko@sntech.de> <005801cc785a$7e46a310$7ad3e930$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from h1778886.stratoserver.net ([85.214.133.74]:38222 "EHLO
	h1778886.stratoserver.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751668Ab1I1GnU (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 28 Sep 2011 02:43:20 -0400
In-Reply-To: <005801cc785a$7e46a310$7ad3e930$%kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>, 'Ben Dooks' <ben-linux@fluff.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, heiko@sntech.de

The adc blocks of S3C2410 through S5P have a multitude of
quirks, i.e. moved bits or whole new registers.

This patch tries to describe these individual features
through constants which can be used to describe an adc.

As SoCs sometimes share only some of these quirks defining
TYPE_ADCVx values for each one wouldn't scale well when
adding more variants.

Signed-off-by: Heiko Stuebner <heiko@sntech.de>
---
changes since v1: add spaces around <<
 arch/arm/plat-samsung/adc.c |   29 +++++++++++++++++++++++++++++
 1 files changed, 29 insertions(+), 0 deletions(-)

diff --git a/arch/arm/plat-samsung/adc.c b/arch/arm/plat-samsung/adc.c
index ee8deef..4fc4deb 100644
--- a/arch/arm/plat-samsung/adc.c
+++ b/arch/arm/plat-samsung/adc.c
@@ -45,6 +45,35 @@ enum s3c_cpu_type {
 	TYPE_ADCV3, /* S5PV210, S5PC110, EXYNOS4210 */
 };
 
+/*
+ * Resolution of the ADC - 10 or 12 bit
+ */
+#define S3C_ADC_QUIRK_10BIT		0
+#define S3C_ADC_QUIRK_12BIT		(1 << 0)
+
+/*
+ * 12bit ADC can switch resolution between 10 bit and 12 bit
+ * ADCCON bit 03 for S3C2416
+ * ADCCON bit 16 for S3C64XX and up
+ */
+#define S3C_ADC_QUIRK_RESSEL03		(1 << 1)
+#define S3C_ADC_QUIRK_RESSEL16		(1 << 2)
+
+/*
+ * Input channel select can either be in
+ * - reg ADCCON, bit for S3C24XX and S3C64XX
+ * - reg base+0x18 for 2443/2416/2450
+ * - reg base+0x1C for S5P
+ */
+#define S3C_ADC_QUIRK_MUXADCCON		(1 << 3)
+#define S3C_ADC_QUIRK_MUX18		(1 << 4)
+#define S3C_ADC_QUIRK_MUX1C		(1 << 5)
+
+/*
+ * CLRINT register on S3C64xx
+ */
+#define S3C_ADC_QUIRK_CLRINT		(1 << 6)
+
 struct s3c_adc_client {
 	struct platform_device	*pdev;
 	struct list_head	 pend;
-- 
1.7.5.4
