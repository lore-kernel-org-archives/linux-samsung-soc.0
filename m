From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: [PATCH 5/6] clk: samsung: exynos5433: Fix mout_aclk_cam1*_user clocks
 definition
Date: Tue, 23 Feb 2016 13:14:31 +0100
Message-ID: <1456229672-13445-6-git-send-email-s.nawrocki@samsung.com>
References: <1456229672-13445-1-git-send-email-s.nawrocki@samsung.com>
Return-path: <linux-clk-owner@vger.kernel.org>
In-reply-to: <1456229672-13445-1-git-send-email-s.nawrocki@samsung.com>
Sender: linux-clk-owner@vger.kernel.org
To: linux-clk@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc: tomasz.figa@gmail.com, mturquette@baylibre.com, sboyd@codeaurora.org, jonghwa3.lee@samsung.com, m.szyprowski@samsung.com, Sylwester Nawrocki <s.nawrocki@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

Control bits for the ACLK_CAM1_552_USER and ACLK_CAM1_400_USER
mux clocks are in MUX_SEL_CAM10, not MUX_SEL_CAM01 register.

Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
---
 drivers/clk/samsung/clk-exynos5433.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/samsung/clk-exynos5433.c b/drivers/clk/samsung/clk-exynos5433.c
index eb4d141..23dd651 100644
--- a/drivers/clk/samsung/clk-exynos5433.c
+++ b/drivers/clk/samsung/clk-exynos5433.c
@@ -5038,9 +5038,9 @@ static struct samsung_mux_clock cam1_mux_clks[] __initdata = {
 	MUX(CLK_MOUT_ACLK_CAM1_333_USER, "mout_aclk_cam1_333_user",
 			mout_aclk_cam1_333_user_p, MUX_SEL_CAM10, 8, 1),
 	MUX(CLK_MOUT_ACLK_CAM1_400_USER, "mout_aclk_cam1_400_user",
-			mout_aclk_cam1_400_user_p, MUX_SEL_CAM01, 4, 1),
+			mout_aclk_cam1_400_user_p, MUX_SEL_CAM10, 4, 1),
 	MUX(CLK_MOUT_ACLK_CAM1_552_USER, "mout_aclk_cam1_552_user",
-			mout_aclk_cam1_552_user_p, MUX_SEL_CAM01, 0, 1),
+			mout_aclk_cam1_552_user_p, MUX_SEL_CAM10, 0, 1),
 
 	/* MUX_SEL_CAM11 */
 	MUX(CLK_MOUT_PHYCLK_RXBYTECLKHS0_S2B_USER,
-- 
1.9.1

