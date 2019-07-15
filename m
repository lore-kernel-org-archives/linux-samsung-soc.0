From: Lukasz Luba <l.luba@partner.samsung.com>
Subject: [PATCH v1 04/50] clk: samsung: add IDs to manage aclk400_mscl in
 Exynos5420
Date: Mon, 15 Jul 2019 14:43:31 +0200
Message-ID: <20190715124417.4787-5-l.luba@partner.samsung.com>
References: <20190715124417.4787-1-l.luba@partner.samsung.com>
 <CGME20190715124437eucas1p1827d7b5d7196f060799e5df6c27d29ad@eucas1p1.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190715124417.4787-1-l.luba@partner.samsung.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org
Cc: mark.rutland@arm.com, cw00.choi@samsung.com, b.zolnierkie@samsung.com, sboyd@kernel.org, mturquette@baylibre.com, krzk@kernel.org, Lukasz Luba <l.luba@partner.samsung.com>, a.hajda@samsung.com, robh+dt@kernel.org, kyungmin.park@samsung.com, kgene@kernel.org, myungjoo.ham@samsung.com, s.nawrocki@samsung.com, m.szyprowski@samsung.com
List-Id: linux-samsung-soc@vger.kernel.org

Add needed IDs to MUXes which are used from DT to properly set clock
hierarchy.

Signed-off-by: Lukasz Luba <l.luba@partner.samsung.com>
---
 drivers/clk/samsung/clk-exynos5420.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/samsung/clk-exynos5420.c b/drivers/clk/samsung/clk-exynos5420.c
index 361ee53fc9fc..8f1d39cb2f1e 100644
--- a/drivers/clk/samsung/clk-exynos5420.c
+++ b/drivers/clk/samsung/clk-exynos5420.c
@@ -462,7 +462,8 @@ static const struct samsung_fixed_factor_clock
 
 static const struct samsung_mux_clock exynos5800_mux_clks[] __initconst = {
 	MUX(0, "mout_aclk400_isp", mout_group3_5800_p, SRC_TOP0, 0, 3),
-	MUX(0, "mout_aclk400_mscl", mout_group3_5800_p, SRC_TOP0, 4, 3),
+	MUX(CLK_MOUT_ACLK400_MSCL, "mout_aclk400_mscl", mout_group3_5800_p,
+			SRC_TOP0, 4, 3),
 	MUX(CLK_MOUT_ACLK400_WCORE, "mout_aclk400_wcore", mout_group2_5800_p,
 			SRC_TOP0, 16, 3),
 	MUX(0, "mout_aclk100_noc", mout_group1_5800_p, SRC_TOP0, 20, 2),
@@ -548,7 +549,8 @@ static const struct samsung_mux_clock exynos5420_mux_clks[] __initconst = {
 				TOP_SPARE2, 4, 1),
 
 	MUX(0, "mout_aclk400_isp", mout_group1_p, SRC_TOP0, 0, 2),
-	MUX(0, "mout_aclk400_mscl", mout_group1_p, SRC_TOP0, 4, 2),
+	MUX(CLK_MOUT_ACLK400_MSCL, "mout_aclk400_mscl", mout_group1_p,
+			SRC_TOP0, 4, 2),
 	MUX(CLK_MOUT_ACLK400_WCORE, "mout_aclk400_wcore", mout_group1_p,
 			SRC_TOP0, 16, 2),
 	MUX(0, "mout_aclk100_noc", mout_group1_p, SRC_TOP0, 20, 2),
@@ -670,8 +672,8 @@ static const struct samsung_mux_clock exynos5x_mux_clks[] __initconst = {
 
 	MUX(0, "mout_sw_aclk400_isp", mout_sw_aclk400_isp_p,
 			SRC_TOP10, 0, 1),
-	MUX(0, "mout_sw_aclk400_mscl", mout_sw_aclk400_mscl_p,
-			SRC_TOP10, 4, 1),
+	MUX(CLK_MOUT_SW_ACLK400_MSCL, "mout_sw_aclk400_mscl",
+			mout_sw_aclk400_mscl_p,	SRC_TOP10, 4, 1),
 	MUX(CLK_MOUT_SW_ACLK200, "mout_sw_aclk200", mout_sw_aclk200_p,
 			SRC_TOP10, 8, 1),
 	MUX(0, "mout_sw_aclk200_fsys2", mout_sw_aclk200_fsys2_p,
-- 
2.17.1
