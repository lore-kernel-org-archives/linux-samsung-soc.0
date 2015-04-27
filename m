From: Chanwoo Choi <cw00.choi@samsung.com>
Subject: [PATCH v3 02/10] clk: samsung: exynos5433: Fix wrong offset of
 PCLK_MSCL_SECURE_SMMU_JPEG
Date: Mon, 27 Apr 2015 20:36:29 +0900
Message-ID: <1430134597-14668-3-git-send-email-cw00.choi@samsung.com>
References: <1430134597-14668-1-git-send-email-cw00.choi@samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <1430134597-14668-1-git-send-email-cw00.choi@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: s.nawrocki@samsung.com, tomasz.figa@gmail.com, mturquette@linaro.org
Cc: kgene@kernel.org, inki.dae@samsung.com, chanho61.park@samsung.com, cw00.choi@samsung.com, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Jonghwa Lee <jonghwa3.lee@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

From: Jonghwa Lee <jonghwa3.lee@samsung.com>

This patch fixes the wrong offoset of PCLK_MSCL_SECURE_SMMU_JPEG in CMU_MSCL
domain.

Fixes: b274bbfd8b4a94cb5bd6f (clk: samsung: exynos5433: Add clocks for CMU_MSCL domain
Cc: Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc: Tomasz Figa <tomasz.figa@gmail.com>
Signed-off-by: Jonghwa Lee <jonghwa3.lee@samsung.com>
Signed-off-by: Chanwoo Choi <cw00.choi@samsung.com>
---
 drivers/clk/samsung/clk-exynos5433.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/samsung/clk-exynos5433.c b/drivers/clk/samsung/clk-exynos5433.c
index 387e3e3..543f9c7 100644
--- a/drivers/clk/samsung/clk-exynos5433.c
+++ b/drivers/clk/samsung/clk-exynos5433.c
@@ -3927,7 +3927,7 @@ CLK_OF_DECLARE(exynos5433_cmu_atlas, "samsung,exynos5433-cmu-atlas",
 #define ENABLE_PCLK_MSCL				0x0900
 #define ENABLE_PCLK_MSCL_SECURE_SMMU_M2MSCALER0		0x0904
 #define ENABLE_PCLK_MSCL_SECURE_SMMU_M2MSCALER1		0x0908
-#define ENABLE_PCLK_MSCL_SECURE_SMMU_JPEG		0x000c
+#define ENABLE_PCLK_MSCL_SECURE_SMMU_JPEG		0x090c
 #define ENABLE_SCLK_MSCL				0x0a00
 #define ENABLE_IP_MSCL0					0x0b00
 #define ENABLE_IP_MSCL1					0x0b04
-- 
1.8.5.5
