From: Lukasz Luba <l.luba@partner.samsung.com>
Subject: [PATCH v1 17/50] clk: samsung: add CLK_MOUT_MMC0 in the Exynos5420
Date: Mon, 15 Jul 2019 14:43:44 +0200
Message-ID: <20190715124417.4787-18-l.luba@partner.samsung.com>
References: <20190715124417.4787-1-l.luba@partner.samsung.com>
        <CGME20190715124447eucas1p143a857f619f48b9b87437ec3b13dfb3f@eucas1p1.samsung.com>
Content-Type: text/plain; charset="utf-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190715124417.4787-1-l.luba@partner.samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org
Cc: mturquette@baylibre.com, sboyd@kernel.org, b.zolnierkie@samsung.com, krzk@kernel.org, kgene@kernel.org, mark.rutland@arm.com, robh+dt@kernel.org, cw00.choi@samsung.com, kyungmin.park@samsung.com, a.hajda@samsung.com, m.szyprowski@samsung.com, s.nawrocki@samsung.com, myungjoo.ham@samsung.com, Lukasz Luba <l.luba@partner.samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

Add ID to mout_mmc0 MUX to make possible children connection in
the DT.

Signed-off-by: Lukasz Luba <l.luba@partner.samsung.com>
---
 drivers/clk/samsung/clk-exynos5420.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/samsung/clk-exynos5420.c b/drivers/clk/samsung/clk-exynos5420.c
index ead569a164cf..8d58801baf2c 100644
--- a/drivers/clk/samsung/clk-exynos5420.c
+++ b/drivers/clk/samsung/clk-exynos5420.c
@@ -763,7 +763,7 @@ static const struct samsung_mux_clock exynos5x_mux_clks[] __initconst = {
 
 	/* FSYS Block */
 	MUX(0, "mout_usbd301", mout_group2_p, SRC_FSYS, 4, 3),
-	MUX(0, "mout_mmc0", mout_group2_p, SRC_FSYS, 8, 3),
+	MUX(CLK_MOUT_MMC0, "mout_mmc0", mout_group2_p, SRC_FSYS, 8, 3),
 	MUX(0, "mout_mmc1", mout_group2_p, SRC_FSYS, 12, 3),
 	MUX(0, "mout_mmc2", mout_group2_p, SRC_FSYS, 16, 3),
 	MUX(0, "mout_usbd300", mout_group2_p, SRC_FSYS, 20, 3),
-- 
2.17.1
