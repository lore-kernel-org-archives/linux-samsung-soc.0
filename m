From: =?UTF-8?q?Pawe=C5=82=20Chmiel?= <pawel.mikolaj.chmiel@gmail.com>
Subject: [PATCH 1/3] iio: adc: exynos-adc: Add S5PV210 variant
Date: Fri,  7 Dec 2018 20:11:34 +0100
Message-ID: <20181207191136.5464-2-pawel.mikolaj.chmiel@gmail.com>
References: <20181207191136.5464-1-pawel.mikolaj.chmiel@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181207191136.5464-1-pawel.mikolaj.chmiel@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: jic23@kernel.org
Cc: knaack.h@gmx.de, lars@metafoo.de, pmeerw@pmeerw.net, kgene@kernel.org, krzk@kernel.org, xc-racer2@live.ca, pawel.mikolaj.chmiel@gmail.com, broonie@kernel.org, arnaud.pouliquen@st.com, baolin.wang@linaro.org, smohanad@codeaurora.org, eugen.hristev@microchip.com, rdunlap@infradead.org, vilhelm.gray@gmail.com, freeman.liu@spreadtrum.com, marcus.folkesson@gmail.com, geert@linux-m68k.org, robh+dt@kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org, linux-iio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

From: Jonathan Bakker <xc-racer2@live.ca>

S5PV210's ADC variant is almost the same as v1 except that it has 10
channels and doesn't require the pmu register

Signed-off-by: Jonathan Bakker <xc-racer2@live.ca>
Signed-off-by: Paweł Chmiel <pawel.mikolaj.chmiel@gmail.com>
---
 drivers/iio/adc/exynos_adc.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/iio/adc/exynos_adc.c b/drivers/iio/adc/exynos_adc.c
index f10443f92e4c..fa2d2b5767f3 100644
--- a/drivers/iio/adc/exynos_adc.c
+++ b/drivers/iio/adc/exynos_adc.c
@@ -115,6 +115,7 @@
 #define MAX_ADC_V2_CHANNELS		10
 #define MAX_ADC_V1_CHANNELS		8
 #define MAX_EXYNOS3250_ADC_CHANNELS	2
+#define MAX_S5PV210_ADC_CHANNELS	10
 
 /* Bit definitions common for ADC_V1 and ADC_V2 */
 #define ADC_CON_EN_START	(1u << 0)
@@ -282,6 +283,16 @@ static const struct exynos_adc_data exynos_adc_v1_data = {
 	.start_conv	= exynos_adc_v1_start_conv,
 };
 
+static const struct exynos_adc_data exynos_adc_s5pv210_data = {
+	.num_channels	= MAX_S5PV210_ADC_CHANNELS,
+	.mask		= ADC_DATX_MASK,	/* 12 bit ADC resolution */
+
+	.init_hw	= exynos_adc_v1_init_hw,
+	.exit_hw	= exynos_adc_v1_exit_hw,
+	.clear_irq	= exynos_adc_v1_clear_irq,
+	.start_conv	= exynos_adc_v1_start_conv,
+};
+
 static void exynos_adc_s3c2416_start_conv(struct exynos_adc *info,
 					  unsigned long addr)
 {
@@ -478,6 +489,9 @@ static const struct of_device_id exynos_adc_match[] = {
 	}, {
 		.compatible = "samsung,s3c6410-adc",
 		.data = &exynos_adc_s3c64xx_data,
+	}, {
+		.compatible = "samsung,s5pv210-adc",
+		.data = &exynos_adc_s5pv210_data,
 	}, {
 		.compatible = "samsung,exynos-adc-v1",
 		.data = &exynos_adc_v1_data,
-- 
2.17.1
