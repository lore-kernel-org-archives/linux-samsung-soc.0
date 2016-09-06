From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: [PATCH v2 6/7] clk: samsung: clk-exynos-audss: Add exynos5410
 compatible
Date: Tue, 06 Sep 2016 14:04:55 +0200
Message-ID: <1473163496-17820-7-git-send-email-s.nawrocki@samsung.com>
References: <1473163496-17820-1-git-send-email-s.nawrocki@samsung.com>
Return-path: <linux-clk-owner@vger.kernel.org>
In-reply-to: <1473163496-17820-1-git-send-email-s.nawrocki@samsung.com>
Sender: linux-clk-owner@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org
Cc: b.zolnierkie@samsung.com, krzk@kernel.org, Sylwester Nawrocki <s.nawrocki@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

Exynos5410 Audio Subsystem Clock Controller, comparing to the already
supported IP block revisions, has additionally an I2S_MST divider
so a new compatible string is added.
It is not clear from the Exynos5410 User's Manual released on 2012.03.09
where in the clock tree the I2S_MST clock divider can be found exactly
so this clock is left unimplemented for now.

Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
---
 Documentation/devicetree/bindings/clock/clk-exynos-audss.txt | 4 +++-
 drivers/clk/samsung/clk-exynos-audss.c                       | 9 +++++++++
 2 files changed, 12 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/clock/clk-exynos-audss.txt b/Documentation/devicetree/bindings/clock/clk-exynos-audss.txt
index 180e883..0c3d601 100644
--- a/Documentation/devicetree/bindings/clock/clk-exynos-audss.txt
+++ b/Documentation/devicetree/bindings/clock/clk-exynos-audss.txt
@@ -10,6 +10,8 @@ Required Properties:
   - "samsung,exynos4210-audss-clock" - controller compatible with all Exynos4 SoCs.
   - "samsung,exynos5250-audss-clock" - controller compatible with Exynos5250
     SoCs.
+  - "samsung,exynos5410-audss-clock" - controller compatible with Exynos5410
+    SoCs.
   - "samsung,exynos5420-audss-clock" - controller compatible with Exynos5420
     SoCs.
 - reg: physical base address and length of the controller's register set.
@@ -91,5 +93,5 @@ i2s0: i2s@03830000 {
 		<&clock_audss EXYNOS_MOUT_AUDSS>,
 		<&clock_audss EXYNOS_MOUT_I2S>;
 	clock-names = "iis", "i2s_opclk0", "i2s_opclk1",
-	"mout_audss", "mout_i2s";
+		      "mout_audss", "mout_i2s";
 };
diff --git a/drivers/clk/samsung/clk-exynos-audss.c b/drivers/clk/samsung/clk-exynos-audss.c
index 7d4026b..628f86b 100644
--- a/drivers/clk/samsung/clk-exynos-audss.c
+++ b/drivers/clk/samsung/clk-exynos-audss.c
@@ -70,6 +70,7 @@ static struct syscore_ops exynos_audss_clk_syscore_ops = {
 
 struct exynos_audss_clk_drvdata {
 	unsigned int has_adma_clk:1;
+	unsigned int has_mst_clk:1;
 	unsigned int enable_epll:1;
 	unsigned int num_clks;
 };
@@ -78,6 +79,11 @@ static const struct exynos_audss_clk_drvdata exynos4210_drvdata = {
 	.num_clks	= EXYNOS_AUDSS_MAX_CLKS - 1,
 };
 
+static const struct exynos_audss_clk_drvdata exynos5410_drvdata = {
+	.num_clks	= EXYNOS_AUDSS_MAX_CLKS - 1,
+	.has_mst_clk	= 1,
+};
+
 static const struct exynos_audss_clk_drvdata exynos5420_drvdata = {
 	.num_clks	= EXYNOS_AUDSS_MAX_CLKS,
 	.has_adma_clk	= 1,
@@ -92,6 +98,9 @@ static const struct of_device_id exynos_audss_clk_of_match[] = {
 		.compatible	= "samsung,exynos5250-audss-clock",
 		.data		= &exynos4210_drvdata,
 	}, {
+		.compatible	= "samsung,exynos5410-audss-clock",
+		.data		= &exynos5410_drvdata,
+	}, {
 		.compatible	= "samsung,exynos5420-audss-clock",
 		.data		= &exynos5420_drvdata,
 	},
-- 
1.9.1

