From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: [PATCH 6/6] clk: samsung: exynos5433: Fix wrong registers of
 PCLK_GSCL_SMMU clocks
Date: Tue, 23 Feb 2016 13:14:32 +0100
Message-ID: <1456229672-13445-7-git-send-email-s.nawrocki@samsung.com>
References: <1456229672-13445-1-git-send-email-s.nawrocki@samsung.com>
Return-path: <linux-clk-owner@vger.kernel.org>
In-reply-to: <1456229672-13445-1-git-send-email-s.nawrocki@samsung.com>
Sender: linux-clk-owner@vger.kernel.org
To: linux-clk@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc: tomasz.figa@gmail.com, mturquette@baylibre.com, sboyd@codeaurora.org, jonghwa3.lee@samsung.com, m.szyprowski@samsung.com, Sylwester Nawrocki <s.nawrocki@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

From: Jonghwa Lee <jonghwa3.lee@samsung.com>

This fixes register assignment in the CLK_PCLK_SMMU_GSCL{1,2}
clocks definition.

Signed-off-by: Jonghwa Lee <jonghwa3.lee@samsung.com>
Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
---
 drivers/clk/samsung/clk-exynos5433.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/samsung/clk-exynos5433.c b/drivers/clk/samsung/clk-exynos5433.c
index 23dd651..707a814 100644
--- a/drivers/clk/samsung/clk-exynos5433.c
+++ b/drivers/clk/samsung/clk-exynos5433.c
@@ -3411,11 +3411,11 @@ static struct samsung_gate_clock gscl_gate_clks[] __initdata = {
 
 	/* ENABLE_PCLK_GSCL_SECURE_SMMU_GSCL1 */
 	GATE(CLK_PCLK_SMMU_GSCL1, "pclk_smmu_gscl1", "mout_aclk_gscl_111_user",
-		ENABLE_PCLK_GSCL_SECURE_SMMU_GSCL0, 0, 0, 0),
+		ENABLE_PCLK_GSCL_SECURE_SMMU_GSCL1, 0, 0, 0),
 
 	/* ENABLE_PCLK_GSCL_SECURE_SMMU_GSCL2 */
 	GATE(CLK_PCLK_SMMU_GSCL2, "pclk_smmu_gscl2", "mout_aclk_gscl_111_user",
-		ENABLE_PCLK_GSCL_SECURE_SMMU_GSCL0, 0, 0, 0),
+		ENABLE_PCLK_GSCL_SECURE_SMMU_GSCL2, 0, 0, 0),
 };
 
 static struct samsung_cmu_info gscl_cmu_info __initdata = {
-- 
1.9.1

