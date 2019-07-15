From: Lukasz Luba <l.luba@partner.samsung.com>
Subject: [PATCH v1 09/50] clk: samsung: add IDs to FSYS clocks in Exynos5x
Date: Mon, 15 Jul 2019 14:43:36 +0200
Message-ID: <20190715124417.4787-10-l.luba@partner.samsung.com>
References: <20190715124417.4787-1-l.luba@partner.samsung.com>
        <CGME20190715124441eucas1p12e1f58587318219a5a2c695faa200b17@eucas1p1.samsung.com>
Content-Type: text/plain; charset="utf-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190715124417.4787-1-l.luba@partner.samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org
Cc: mturquette@baylibre.com, sboyd@kernel.org, b.zolnierkie@samsung.com, krzk@kernel.org, kgene@kernel.org, mark.rutland@arm.com, robh+dt@kernel.org, cw00.choi@samsung.com, kyungmin.park@samsung.com, a.hajda@samsung.com, m.szyprowski@samsung.com, s.nawrocki@samsung.com, myungjoo.ham@samsung.com, Lukasz Luba <l.luba@partner.samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

Add IDs to MUXes of ACLK200_FSYS, ACLK_FSYS2, PCLK200_FSYS to manage them
from DT.

Signed-off-by: Lukasz Luba <l.luba@partner.samsung.com>
---
 drivers/clk/samsung/clk-exynos5420.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/samsung/clk-exynos5420.c b/drivers/clk/samsung/clk-exynos5420.c
index 5f251279b4c8..6164d0ca75e0 100644
--- a/drivers/clk/samsung/clk-exynos5420.c
+++ b/drivers/clk/samsung/clk-exynos5420.c
@@ -622,9 +622,12 @@ static const struct samsung_mux_clock exynos5x_mux_clks[] __initconst = {
 	MUX(0, "mout_kfc", mout_kfc_p, SRC_KFC, 16, 1),
 
 	MUX(0, "mout_aclk200", mout_group1_p, SRC_TOP0, 8, 2),
-	MUX(0, "mout_aclk200_fsys2", mout_group1_p, SRC_TOP0, 12, 2),
-	MUX(0, "mout_pclk200_fsys", mout_group1_p, SRC_TOP0, 24, 2),
-	MUX(0, "mout_aclk200_fsys", mout_group1_p, SRC_TOP0, 28, 2),
+	MUX(CLK_MOUT_ACLK200_FSYS2, "mout_aclk200_fsys2", mout_group1_p,
+			SRC_TOP0, 12, 2),
+	MUX(CLK_MOUT_PCLK200_FSYS, "mout_pclk200_fsys", mout_group1_p,
+			SRC_TOP0, 24, 2),
+	MUX(CLK_MOUT_ACLK200_FSYS, "mout_aclk200_fsys", mout_group1_p,
+			SRC_TOP0, 28, 2),
 
 	MUX(0, "mout_aclk66", mout_group1_p, SRC_TOP1, 8, 2),
 	MUX(0, "mout_aclk166", mout_group1_p, SRC_TOP1, 24, 2),
-- 
2.17.1
