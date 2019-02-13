From: Anand Moon <linux.amoon@gmail.com>
Subject: [RFC 2/2] soc: samsung: pmu: Add the PMU data of exynos4412 to support low-power state
Date: Wed, 13 Feb 2019 21:40:52 +0000
Message-ID: <20190213214052.2427-3-linux.amoon@gmail.com>
References: <20190213214052.2427-1-linux.amoon@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190213214052.2427-1-linux.amoon@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Rob Herring <robh+dt@kernel.org>, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, Marek Szyprowski <m.szyprowski@samsung.com>, Tomasz Figa <tomasz.figa@gmail.com>, Chanwoo Choi <cw00.choi@samsung.com>, Pankaj Dubey <pankaj.dubey@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

This patch adds configration for PMU (Power Management Unit) state
tuning for exynos4412 SoC in order to enter low-power mode during
suspend power modes and help resume from suspend state.

Fixes: bfce552d0b1 ("drivers: soc: Add support for Exynos PMU driver")
Cc: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Chanwoo Choi <cw00.choi@samsung.com>
Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---

Changes from previous patch.
New patch to this series to support suspend and resume state

Changes have been tested on microSD card but fails to resume on cMMC.
It need to be investigated and more debuging
---
 drivers/soc/samsung/exynos4-pmu.c           | 83 +++++++++++++++++++++
 include/linux/soc/samsung/exynos-regs-pmu.h | 21 ++++++
 2 files changed, 104 insertions(+)

diff --git a/drivers/soc/samsung/exynos4-pmu.c b/drivers/soc/samsung/exynos4-pmu.c
index a7cdbf1aac0c..d261a0d2371e 100644
--- a/drivers/soc/samsung/exynos4-pmu.c
+++ b/drivers/soc/samsung/exynos4-pmu.c
@@ -200,10 +200,93 @@ static const struct exynos_pmu_conf exynos4412_pmu_config[] = {
 	{ PMU_TABLE_END,},
 };
 
+static unsigned int const exynos4412_list_feed[] = {
+	EXYNOS4_ARM_CORE0_OPTION,
+	EXYNOS4_ARM_CORE1_OPTION,
+	EXYNOS4_ARM_CORE2_OPTION,
+	EXYNOS4_ARM_CORE3_OPTION,
+	EXYNOS4_ARM_COMMON_OPTION,
+	EXYNOS4_CAM_OPTION,
+	EXYNOS4_TV_OPTION,
+	EXYNOS4_MFC_OPTION,
+	EXYNOS4_G3D_OPTION,
+	EXYNOS4_LCD0_OPTION,
+	EXYNOS4_ISP_OPTION,
+	EXYNOS4_MAUDIO_OPTION,
+	EXYNOS4_GPS_OPTION,
+	EXYNOS4_GPS_ALIVE_OPTION,
+};
+
+static void exynos4412_pmu_central_seq(bool enable)
+{
+	unsigned int value;
+
+	value = pmu_raw_readl(S5P_CENTRAL_SEQ_CONFIGURATION);
+	if (enable)
+		value &= ~S5P_CENTRAL_LOWPWR_CFG;
+	else
+		value |= S5P_CENTRAL_LOWPWR_CFG;
+	pmu_raw_writel(value, S5P_CENTRAL_SEQ_CONFIGURATION);
+
+	value = pmu_raw_readl(S5P_CENTRAL_SEQ_CONFIGURATION_COREBLK);
+	if (enable)
+		value &= ~S5P_CENTRAL_LOWPWR_CFG;
+	else
+		value |= S5P_CENTRAL_LOWPWR_CFG;
+	pmu_raw_writel(value, S5P_CENTRAL_SEQ_CONFIGURATION_COREBLK);
+}
+
+static void exynos4412_pmu_init(void)
+{
+	unsigned int value;
+	int i;
+
+	/* Enable USE_STANDBY_WFI for all CORE */
+	pmu_raw_writel(S5P_USE_STANDBY_WFI_ALL, S5P_CENTRAL_SEQ_OPTION);
+
+	/* Decides whether to use retention capability */
+	value  = pmu_raw_readl(S5P_ARM_L2_0_OPTION);
+	value &= ~EXYNOS_L2_USE_RETENTION;
+	pmu_raw_writel(value, S5P_ARM_L2_0_OPTION);
+
+	value = pmu_raw_readl(S5P_ARM_L2_1_OPTION);
+	value &= ~EXYNOS_L2_USE_RETENTION;
+	pmu_raw_writel(value, S5P_ARM_L2_1_OPTION);
+
+	/* Set PSHOLD port for output high */
+	value = pmu_raw_readl(S5P_PS_HOLD_CONTROL);
+	value |= S5P_PS_HOLD_OUTPUT_HIGH;
+	pmu_raw_writel(value, S5P_PS_HOLD_CONTROL);
+
+	/* Enable signal for PSHOLD port */
+	value = pmu_raw_readl(S5P_PS_HOLD_CONTROL);
+	value |= S5P_PS_HOLD_EN;
+	pmu_raw_writel(value, S5P_PS_HOLD_CONTROL);
+
+	/* Enable only SC_FEEDBACK */
+	for (i = 0; i < ARRAY_SIZE(exynos4412_list_feed); i++) {
+		value =  pmu_raw_readl(exynos4412_list_feed[i]);
+		value &= ~(EXYNOS_USE_SC_COUNTER);
+		value |= EXYNOS_USE_SC_FEEDBACK;
+		pmu_raw_writel(value, exynos4412_list_feed[i]);
+	}
+
+	exynos4412_pmu_central_seq(false);
+
+	pr_info("EXYNOS4x12 PMU Initialize\n");
+}
+
+static void exynos4412_powerdown_conf(enum sys_powerdown mode)
+{
+	exynos4412_pmu_central_seq(true);
+}
+
 const struct exynos_pmu_data exynos4210_pmu_data = {
 	.pmu_config	= exynos4210_pmu_config,
 };
 
 const struct exynos_pmu_data exynos4412_pmu_data = {
 	.pmu_config		= exynos4412_pmu_config,
+	.pmu_init		= exynos4412_pmu_init,
+	.powerdown_conf		= exynos4412_powerdown_conf,
 };
diff --git a/include/linux/soc/samsung/exynos-regs-pmu.h b/include/linux/soc/samsung/exynos-regs-pmu.h
index 5addaf5ccbce..6beed3e669d2 100644
--- a/include/linux/soc/samsung/exynos-regs-pmu.h
+++ b/include/linux/soc/samsung/exynos-regs-pmu.h
@@ -16,6 +16,8 @@
 
 #define S5P_CENTRAL_SEQ_CONFIGURATION		0x0200
 
+#define S5P_CENTRAL_SEQ_CONFIGURATION_COREBLK   0x0240
+
 #define S5P_CENTRAL_LOWPWR_CFG			(1 << 16)
 
 #define S5P_CENTRAL_SEQ_OPTION			0x0208
@@ -347,6 +349,25 @@
 #define EXYNOS3_OPTION_USE_SC_FEEDBACK			(1 << 1)
 #define EXYNOS3_OPTION_SKIP_DEACTIVATE_ACEACP_IN_PWDN	(1 << 7)
 
+/* EXYNOS4 */
+#define EXYNOS_USE_SC_FEEDBACK					BIT(1)
+#define EXYNOS_USE_SC_COUNTER					BIT(0)
+
+#define EXYNOS4_ARM_CORE0_OPTION				0x2008
+#define EXYNOS4_ARM_CORE1_OPTION				0x2088
+#define EXYNOS4_ARM_CORE2_OPTION				0x2108
+#define EXYNOS4_ARM_CORE3_OPTION				0x2188
+#define EXYNOS4_ARM_COMMON_OPTION				0x2408
+#define EXYNOS4_CAM_OPTION					0x3C08
+#define EXYNOS4_TV_OPTION					0x3C28
+#define EXYNOS4_MFC_OPTION					0x3C48
+#define EXYNOS4_G3D_OPTION					0x3C68
+#define EXYNOS4_LCD0_OPTION					0x3C88
+#define EXYNOS4_ISP_OPTION					0x3CA8
+#define EXYNOS4_MAUDIO_OPTION					0x3CC8
+#define EXYNOS4_GPS_OPTION					0x3CE8
+#define EXYNOS4_GPS_ALIVE_OPTION				0x3D08
+
 /* For EXYNOS5 */
 
 #define EXYNOS5_AUTO_WDTRESET_DISABLE				0x0408
-- 
2.20.1
