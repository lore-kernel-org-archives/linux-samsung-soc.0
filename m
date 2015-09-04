From: Alim Akhtar <alim.akhtar@samsung.com>
Subject: [PATCH 10/11] clk: samsung: exynos7: Add missing fixed_clks to cmu_info
Date: Fri, 04 Sep 2015 17:07:15 +0530
Message-ID: <1441366637-28001-11-git-send-email-alim.akhtar@samsung.com>
References: <1441366637-28001-1-git-send-email-alim.akhtar@samsung.com>
Return-path: <linux-clk-owner@vger.kernel.org>
In-reply-to: <1441366637-28001-1-git-send-email-alim.akhtar@samsung.com>
Sender: linux-clk-owner@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: s.nawrocki@samsung.com, tomasz.figa@gmail.com, kgene@kernel.org, k.kozlowski@samsung.com, mturquette@baylibre.com, amit.daniel@samsung.com, gautam.vivek@samsung.com, sboyd@codeaurora.org, linux-clk@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

FSYS0 fixed clocks are not added to fsys0_cmu_info, this make
some of the usb clocks as orphan. This fixes the same.

Signed-off-by: Alim Akhtar <alim.akhtar@samsung.com>
---
 drivers/clk/samsung/clk-exynos7.c |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/clk/samsung/clk-exynos7.c b/drivers/clk/samsung/clk-exynos7.c
index f47a2d4..43cfee0 100644
--- a/drivers/clk/samsung/clk-exynos7.c
+++ b/drivers/clk/samsung/clk-exynos7.c
@@ -936,6 +936,8 @@ static struct samsung_gate_clock fsys0_gate_clks[] __initdata = {
 };
 
 static struct samsung_cmu_info fsys0_cmu_info __initdata = {
+	.fixed_clks		= fixed_rate_clks_fsys0,
+	.nr_fixed_clks		= ARRAY_SIZE(fixed_rate_clks_fsys0),
 	.mux_clks		= fsys0_mux_clks,
 	.nr_mux_clks		= ARRAY_SIZE(fsys0_mux_clks),
 	.gate_clks		= fsys0_gate_clks,
-- 
1.7.10.4

