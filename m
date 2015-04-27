From: Chanwoo Choi <cw00.choi@samsung.com>
Subject: [PATCH v3 09/10] clk: samsung: exynos5433: Add CLK_IGNORE_UNUSED flag
 to clocks for sercure monitor call
Date: Mon, 27 Apr 2015 20:36:36 +0900
Message-ID: <1430134597-14668-10-git-send-email-cw00.choi@samsung.com>
References: <1430134597-14668-1-git-send-email-cw00.choi@samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <1430134597-14668-1-git-send-email-cw00.choi@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: s.nawrocki@samsung.com, tomasz.figa@gmail.com, mturquette@linaro.org
Cc: kgene@kernel.org, inki.dae@samsung.com, chanho61.park@samsung.com, cw00.choi@samsung.com, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Jonghwa Lee <jonghwa3.lee@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

From: Jonghwa Lee <jonghwa3.lee@samsung.com>

This patch adds 'CLK_IGNORE_UNUSED' flag to clocks which is required for
operation of secure monitor call (smc). System will hang when it executes 'smc'
with one of those clock is gated. All related clocks must be enabled.

Signed-off-by: Jonghwa Lee <jonghwa3.lee@samsung.com>
Signed-off-by: Chanwoo Choi <cw00.choi@samsung.com>
---
 drivers/clk/samsung/clk-exynos5433.c | 36 ++++++++++++++++++------------------
 1 file changed, 18 insertions(+), 18 deletions(-)

diff --git a/drivers/clk/samsung/clk-exynos5433.c b/drivers/clk/samsung/clk-exynos5433.c
index 256fec0..39c9564 100644
--- a/drivers/clk/samsung/clk-exynos5433.c
+++ b/drivers/clk/samsung/clk-exynos5433.c
@@ -1390,7 +1390,7 @@ static struct samsung_gate_clock mif_gate_clks[] __initdata = {
 
 	/* ENABLE_ACLK_MIF2 */
 	GATE(CLK_ACLK_MIFND_266, "aclk_mifnd_266", "div_aclk_mif_266",
-			ENABLE_ACLK_MIF2, 20, 0, 0),
+			ENABLE_ACLK_MIF2, 20, CLK_IGNORE_UNUSED, 0),
 	GATE(CLK_ACLK_PPMU_DREX1S3, "aclk_ppmu_drex1s3", "div_aclk_drex1",
 			ENABLE_ACLK_MIF2, 17, CLK_IGNORE_UNUSED, 0),
 	GATE(CLK_ACLK_PPMU_DREX1S1, "aclk_ppmu_drex1s1", "div_aclk_drex1",
@@ -1833,39 +1833,39 @@ static struct samsung_gate_clock peris_gate_clks[] __initdata = {
 
 	/* ENABLE_PCLK_PERIS_SECURE_TZPC */
 	GATE(CLK_PCLK_TZPC12, "pclk_tzpc12", "aclk_peris_66",
-			ENABLE_PCLK_PERIS_SECURE_TZPC, 12, 0, 0),
+			ENABLE_PCLK_PERIS_SECURE_TZPC, 12, CLK_IGNORE_UNUSED, 0),
 	GATE(CLK_PCLK_TZPC11, "pclk_tzpc11", "aclk_peris_66",
-			ENABLE_PCLK_PERIS_SECURE_TZPC, 11, 0, 0),
+			ENABLE_PCLK_PERIS_SECURE_TZPC, 11, CLK_IGNORE_UNUSED, 0),
 	GATE(CLK_PCLK_TZPC10, "pclk_tzpc10", "aclk_peris_66",
-			ENABLE_PCLK_PERIS_SECURE_TZPC, 10, 0, 0),
+			ENABLE_PCLK_PERIS_SECURE_TZPC, 10, CLK_IGNORE_UNUSED, 0),
 	GATE(CLK_PCLK_TZPC9, "pclk_tzpc9", "aclk_peris_66",
-			ENABLE_PCLK_PERIS_SECURE_TZPC, 9, 0, 0),
+			ENABLE_PCLK_PERIS_SECURE_TZPC, 9, CLK_IGNORE_UNUSED, 0),
 	GATE(CLK_PCLK_TZPC8, "pclk_tzpc8", "aclk_peris_66",
-			ENABLE_PCLK_PERIS_SECURE_TZPC, 8, 0, 0),
+			ENABLE_PCLK_PERIS_SECURE_TZPC, 8, CLK_IGNORE_UNUSED, 0),
 	GATE(CLK_PCLK_TZPC7, "pclk_tzpc7", "aclk_peris_66",
-			ENABLE_PCLK_PERIS_SECURE_TZPC, 7, 0, 0),
+			ENABLE_PCLK_PERIS_SECURE_TZPC, 7, CLK_IGNORE_UNUSED, 0),
 	GATE(CLK_PCLK_TZPC6, "pclk_tzpc6", "aclk_peris_66",
-			ENABLE_PCLK_PERIS_SECURE_TZPC, 6, 0, 0),
+			ENABLE_PCLK_PERIS_SECURE_TZPC, 6, CLK_IGNORE_UNUSED, 0),
 	GATE(CLK_PCLK_TZPC5, "pclk_tzpc5", "aclk_peris_66",
-			ENABLE_PCLK_PERIS_SECURE_TZPC, 5, 0, 0),
+			ENABLE_PCLK_PERIS_SECURE_TZPC, 5, CLK_IGNORE_UNUSED, 0),
 	GATE(CLK_PCLK_TZPC4, "pclk_tzpc4", "aclk_peris_66",
-			ENABLE_PCLK_PERIS_SECURE_TZPC, 4, 0, 0),
+			ENABLE_PCLK_PERIS_SECURE_TZPC, 4, CLK_IGNORE_UNUSED, 0),
 	GATE(CLK_PCLK_TZPC3, "pclk_tzpc3", "aclk_peris_66",
-			ENABLE_PCLK_PERIS_SECURE_TZPC, 3, 0, 0),
+			ENABLE_PCLK_PERIS_SECURE_TZPC, 3, CLK_IGNORE_UNUSED, 0),
 	GATE(CLK_PCLK_TZPC2, "pclk_tzpc2", "aclk_peris_66",
-			ENABLE_PCLK_PERIS_SECURE_TZPC, 2, 0, 0),
+			ENABLE_PCLK_PERIS_SECURE_TZPC, 2, CLK_IGNORE_UNUSED, 0),
 	GATE(CLK_PCLK_TZPC1, "pclk_tzpc1", "aclk_peris_66",
-			ENABLE_PCLK_PERIS_SECURE_TZPC, 1, 0, 0),
+			ENABLE_PCLK_PERIS_SECURE_TZPC, 1, CLK_IGNORE_UNUSED, 0),
 	GATE(CLK_PCLK_TZPC0, "pclk_tzpc0", "aclk_peris_66",
-			ENABLE_PCLK_PERIS_SECURE_TZPC, 0, 0, 0),
+			ENABLE_PCLK_PERIS_SECURE_TZPC, 0, CLK_IGNORE_UNUSED, 0),
 
 	/* ENABLE_PCLK_PERIS_SECURE_SECKEY_APBIF */
 	GATE(CLK_PCLK_SECKEY_APBIF, "pclk_seckey_apbif", "aclk_peris_66",
-			ENABLE_PCLK_PERIS_SECURE_SECKEY_APBIF, 0, 0, 0),
+			ENABLE_PCLK_PERIS_SECURE_SECKEY_APBIF, 0, CLK_IGNORE_UNUSED, 0),
 
 	/* ENABLE_PCLK_PERIS_SECURE_CHIPID_APBIF */
 	GATE(CLK_PCLK_CHIPID_APBIF, "pclk_chipid_apbif", "aclk_peris_66",
-			ENABLE_PCLK_PERIS_SECURE_CHIPID_APBIF, 0, 0, 0),
+			ENABLE_PCLK_PERIS_SECURE_CHIPID_APBIF, 0, CLK_IGNORE_UNUSED, 0),
 
 	/* ENABLE_PCLK_PERIS_SECURE_TOPRTC */
 	GATE(CLK_PCLK_TOPRTC, "pclk_toprtc", "aclk_peris_66",
@@ -1896,11 +1896,11 @@ static struct samsung_gate_clock peris_gate_clks[] __initdata = {
 
 	/* ENABLE_SCLK_PERIS_SECURE_SECKEY */
 	GATE(CLK_SCLK_SECKEY, "sclk_seckey", "oscclk_efuse_common",
-			ENABLE_SCLK_PERIS_SECURE_SECKEY, 0, 0, 0),
+			ENABLE_SCLK_PERIS_SECURE_SECKEY, 0, CLK_IGNORE_UNUSED, 0),
 
 	/* ENABLE_SCLK_PERIS_SECURE_CHIPID */
 	GATE(CLK_SCLK_CHIPID, "sclk_chipid", "oscclk_efuse_common",
-			ENABLE_SCLK_PERIS_SECURE_CHIPID, 0, 0, 0),
+			ENABLE_SCLK_PERIS_SECURE_CHIPID, 0, CLK_IGNORE_UNUSED, 0),
 
 	/* ENABLE_SCLK_PERIS_SECURE_TOPRTC */
 	GATE(CLK_SCLK_TOPRTC, "sclk_toprtc", "oscclk_efuse_common",
-- 
1.8.5.5
