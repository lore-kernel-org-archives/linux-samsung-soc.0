From: Heiko =?iso-8859-1?q?St=FCbner?= <heiko@sntech.de>
Subject: [PATCH 2/7] s3c-adc: describe features via quirk constants
Date: Thu, 8 Sep 2011 21:53:26 +0200
Message-ID: <201109082153.26567.heiko@sntech.de>
References: <201109082151.29076.heiko@sntech.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <201109082151.29076.heiko@sntech.de>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
	<mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
	<mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Kukjin Kim <kgene.kim@samsung.com>, 'Ben Dooks' <ben-linux@fluff.org>
Cc: linux-samsung-soc@vger.kernel.org, Heiko =?iso-8859-1?q?St=FCbner?= <heiko@sntech.de>, linux-arm-kernel@lists.infradead.org
List-Id: linux-samsung-soc@vger.kernel.org

The adc blocks of S3C2410 through S5P have a multitude of
quirks, i.e. moved bits or whole new registers.

This patch tries to describe these individual features
through constants which can be used to describe an adc.

As SoCs sometimes share only some of these quirks defining
TYPE_ADCVx values for each one wouldn't scale well when
adding more variants.

Signed-off-by: Heiko Stuebner <heiko@sntech.de>
---
 arch/arm/plat-samsung/adc.c |   29 +++++++++++++++++++++++++++++
 1 files changed, 29 insertions(+), 0 deletions(-)

diff --git a/arch/arm/plat-samsung/adc.c b/arch/arm/plat-samsung/adc.c
index ee8deef..ba21b6a 100644
--- a/arch/arm/plat-samsung/adc.c
+++ b/arch/arm/plat-samsung/adc.c
@@ -45,6 +45,35 @@ enum s3c_cpu_type {
 	TYPE_ADCV3, /* S5PV210, S5PC110, EXYNOS4210 */
 };
 
+/*
+ * Resolution of the ADC - 10 or 12 bit
+ */
+#define S3C_ADC_QUIRK_10BIT		0
+#define S3C_ADC_QUIRK_12BIT		(1<<0)
+
+/*
+ * 12bit ADC can switch resolution between 10 bit and 12 bit
+ * ADCCON bit 03 for S3C2416
+ * ADCCON bit 16 for S3C64XX and up
+ */
+#define S3C_ADC_QUIRK_RESSEL03		(1<<1)
+#define S3C_ADC_QUIRK_RESSEL16		(1<<2)
+
+/*
+ * Input channel select can either be in
+ * - reg ADCCON, bit for S3C24XX and S3C64XX
+ * - reg base+0x18 for 2443/2416/2450
+ * - reg base+0x1C for S5P
+ */
+#define S3C_ADC_QUIRK_MUXADCCON		(1<<3)
+#define S3C_ADC_QUIRK_MUX18		(1<<4)
+#define S3C_ADC_QUIRK_MUX1C		(1<<5)
+
+/*
+ * CLRINT register on S3C64xx
+ */
+#define S3C_ADC_QUIRK_CLRINT		(1<<6)
+
 struct s3c_adc_client {
 	struct platform_device	*pdev;
 	struct list_head	 pend;
-- 
1.7.2.3
