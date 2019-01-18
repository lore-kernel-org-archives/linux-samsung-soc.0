From: Kamil Konieczny <k.konieczny@partner.samsung.com>
Subject: [PATCH v4 5/5] clk: samsung: exynos5433: add imem clocks
Date: Fri, 18 Jan 2019 14:16:39 +0100
Message-ID: <20190118131639.17578-6-k.konieczny@partner.samsung.com>
References: <20190118131639.17578-1-k.konieczny@partner.samsung.com>
        <CGME20190118131713eucas1p11f52d9e6a11dbd2b66f289ca3c56d92c@eucas1p1.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190118131639.17578-1-k.konieczny@partner.samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: k.konieczny@partner.samsung.com, linux-samsung-soc@vger.kernel.org
Cc: Chanwoo Choi <cw00.choi@samsung.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Sylwester Nawrocki <s.nawrocki@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

Add imem clocks for exynos5433. This will enable to use crypto Slim
Security SubSystem (in short SlimSSS) IP block.

Signed-off-by: Kamil Konieczny <k.konieczny@partner.samsung.com>
---
 drivers/clk/samsung/clk-exynos5433.c | 32 ++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/drivers/clk/samsung/clk-exynos5433.c b/drivers/clk/samsung/clk-exynos5433.c
index 24c3360db65b..dae1c96de933 100644
--- a/drivers/clk/samsung/clk-exynos5433.c
+++ b/drivers/clk/samsung/clk-exynos5433.c
@@ -5467,6 +5467,35 @@ static const struct samsung_cmu_info cam1_cmu_info __initconst = {
 	.clk_name		= "aclk_cam1_400",
 };
 
+/*
+ * Register offset definitions for CMU_IMEM
+ */
+#define ENABLE_ACLK_IMEM_SLIMSSS		0x080c
+#define ENABLE_PCLK_IMEM_SLIMSSS		0x0908
+
+static const unsigned long imem_clk_regs[] __initconst = {
+	ENABLE_ACLK_IMEM_SLIMSSS,
+	ENABLE_PCLK_IMEM_SLIMSSS,
+};
+
+static const struct samsung_gate_clock imem_gate_clks[] __initconst = {
+	/* ENABLE_ACLK_IMEM_SLIMSSS */
+	GATE(CLK_ACLK_SLIMSSS, "aclk_slimsss", "aclk_imem_sssx_266",
+			ENABLE_ACLK_IMEM_SLIMSSS, 0, CLK_IGNORE_UNUSED, 0),
+
+	/* ENABLE_PCLK_IMEM_SLIMSSS */
+	GATE(CLK_PCLK_SLIMSSS, "pclk_slimsss", "aclk_imem_200",
+			ENABLE_PCLK_IMEM_SLIMSSS, 0, CLK_IGNORE_UNUSED, 0),
+};
+
+static const struct samsung_cmu_info imem_cmu_info __initconst = {
+	.gate_clks		= imem_gate_clks,
+	.nr_gate_clks		= ARRAY_SIZE(imem_gate_clks),
+	.nr_clk_ids		= IMEM_NR_CLK,
+	.clk_regs		= imem_clk_regs,
+	.nr_clk_regs		= ARRAY_SIZE(imem_clk_regs),
+	.clk_name		= "aclk_imem_200",
+};
 
 struct exynos5433_cmu_data {
 	struct samsung_clk_reg_dump *clk_save;
@@ -5654,6 +5683,9 @@ static const struct of_device_id exynos5433_cmu_of_match[] = {
 	}, {
 		.compatible = "samsung,exynos5433-cmu-mscl",
 		.data = &mscl_cmu_info,
+	}, {
+		.compatible = "samsung,exynos5433-cmu-imem",
+		.data = &imem_cmu_info,
 	}, {
 	},
 };
-- 
2.20.0
