From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH 5/9] clk: samsung: Drop useless alias in Exynos5420 clk
 driver
Date: Tue, 03 Oct 2017 12:00:12 +0200
Message-ID: <20171003100016.32029-6-m.szyprowski@samsung.com>
References: <20171003100016.32029-1-m.szyprowski@samsung.com>
        <CGME20171003100030eucas1p2be91ffc5db49f33cbc289175e72dd586@eucas1p2.samsung.com>
Return-path: <linux-clk-owner@vger.kernel.org>
In-reply-to: <20171003100016.32029-1-m.szyprowski@samsung.com>
Sender: linux-clk-owner@vger.kernel.org
To: linux-clk@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

Drop clkdev alias for "mout_aclk400_mscl" clock. It was not used at all
and it was probably committed by accident.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 drivers/clk/samsung/clk-exynos5420.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/clk/samsung/clk-exynos5420.c b/drivers/clk/samsung/clk-exynos5420.c
index 038701a2af4c..45d34f601e9e 100644
--- a/drivers/clk/samsung/clk-exynos5420.c
+++ b/drivers/clk/samsung/clk-exynos5420.c
@@ -600,8 +600,7 @@ static const struct samsung_mux_clock exynos5420_mux_clks[] __initconst = {
 				TOP_SPARE2, 4, 1),
 
 	MUX(0, "mout_aclk400_isp", mout_group1_p, SRC_TOP0, 0, 2),
-	MUX_A(0, "mout_aclk400_mscl", mout_group1_p,
-				SRC_TOP0, 4, 2, "aclk400_mscl"),
+	MUX(0, "mout_aclk400_mscl", mout_group1_p, SRC_TOP0, 4, 2),
 	MUX(0, "mout_aclk400_wcore", mout_group1_p, SRC_TOP0, 16, 2),
 	MUX(0, "mout_aclk100_noc", mout_group1_p, SRC_TOP0, 20, 2),
 
-- 
2.14.2

