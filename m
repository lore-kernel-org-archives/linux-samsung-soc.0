From: Heiko =?iso-8859-1?q?St=FCbner?= <heiko@sntech.de>
Subject: [PATCH 6/7] s3c-adc: Add support for S3C2443
Date: Thu, 8 Sep 2011 21:56:25 +0200
Message-ID: <201109082156.25526.heiko@sntech.de>
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

The S3C2443-adc is 10 bit wide and has its mux-select
in an extra register at base+0x18

Signed-off-by: Heiko Stuebner <heiko@sntech.de>
---
 arch/arm/mach-s3c2443/mach-smdk2443.c |    3 +++
 arch/arm/plat-samsung/adc.c           |    6 ++++++
 2 files changed, 9 insertions(+), 0 deletions(-)

diff --git a/arch/arm/mach-s3c2443/mach-smdk2443.c b/arch/arm/mach-s3c2443/mach-smdk2443.c
index bec107e..45d3b93 100644
--- a/arch/arm/mach-s3c2443/mach-smdk2443.c
+++ b/arch/arm/mach-s3c2443/mach-smdk2443.c
@@ -44,6 +44,7 @@
 #include <plat/clock.h>
 #include <plat/devs.h>
 #include <plat/cpu.h>
+#include <plat/adc-core.h>
 
 #include <plat/common-smdk.h>
 
@@ -129,6 +130,8 @@ static void __init smdk2443_machine_init(void)
 {
 	s3c_i2c0_set_platdata(NULL);
 
+	s3c_adc_setname("s3c2443-adc");
+
 #ifdef CONFIG_SND_SOC_SMDK2443_WM9710
 	s3c24xx_ac97_setup_gpio(S3C24XX_AC97_GPE0);
 #endif
diff --git a/arch/arm/plat-samsung/adc.c b/arch/arm/plat-samsung/adc.c
index be4e643..4fb26c6 100644
--- a/arch/arm/plat-samsung/adc.c
+++ b/arch/arm/plat-samsung/adc.c
@@ -129,6 +129,8 @@ static inline void s3c_adc_select(struct adc_device *adc,
 	if (!client->is_ts) {
 		if (cpu & S3C_ADC_QUIRK_MUX1C)
 			writel(client->channel & 0xf, adc->regs + S5P_ADCMUX);
+		else if (cpu & S3C_ADC_QUIRK_MUX18)
+			writel(client->channel & 0xf, adc->regs + S3C2443_ADCMUX);
 		else
 			con |= S3C2410_ADCCON_SELMUX(client->channel);
 	}
@@ -517,6 +519,10 @@ static struct platform_device_id s3c_adc_driver_ids[] = {
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
