From: Lukasz Luba <l.luba@partner.samsung.com>
Subject: [PATCH v1 06/50] clk: samsung: add IDs to ACLK266 clocks in Exynos5420
Date: Mon, 15 Jul 2019 14:43:33 +0200
Message-ID: <20190715124417.4787-7-l.luba@partner.samsung.com>
References: <20190715124417.4787-1-l.luba@partner.samsung.com>
 <CGME20190715124438eucas1p2ee9d27c451eb7125bd3ec874baf76e14@eucas1p2.samsung.com>
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

Add IDs to MUXes related to ACLK266 for managing them from DT.

Signed-off-by: Lukasz Luba <l.luba@partner.samsung.com>
---
 drivers/clk/samsung/clk-exynos5420.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/samsung/clk-exynos5420.c b/drivers/clk/samsung/clk-exynos5420.c
index 74276875bc3e..9b4a1d81f708 100644
--- a/drivers/clk/samsung/clk-exynos5420.c
+++ b/drivers/clk/samsung/clk-exynos5420.c
@@ -472,7 +472,8 @@ static const struct samsung_mux_clock exynos5800_mux_clks[] __initconst = {
 	MUX(0, "mout_aclk333_432_gscl", mout_group6_5800_p, SRC_TOP1, 0, 2),
 	MUX(0, "mout_aclk333_432_isp", mout_group6_5800_p, SRC_TOP1, 4, 2),
 	MUX(0, "mout_aclk333_432_isp0", mout_group6_5800_p, SRC_TOP1, 12, 2),
-	MUX(0, "mout_aclk266", mout_group5_5800_p, SRC_TOP1, 20, 2),
+	MUX(CLK_MOUT_ACLK266, "mout_aclk266", mout_group5_5800_p,
+			SRC_TOP1, 20, 2),
 	MUX(0, "mout_aclk333", mout_group1_5800_p, SRC_TOP1, 28, 2),
 
 	MUX(0, "mout_aclk400_disp1", mout_group7_5800_p, SRC_TOP2, 4, 3),
@@ -561,7 +562,7 @@ static const struct samsung_mux_clock exynos5420_mux_clks[] __initconst = {
 	MUX(0, "mout_aclk333_432_isp", mout_group4_p,
 				SRC_TOP1, 4, 2),
 	MUX(0, "mout_aclk333_432_isp0", mout_group4_p, SRC_TOP1, 12, 2),
-	MUX(0, "mout_aclk266", mout_group1_p, SRC_TOP1, 20, 2),
+	MUX(CLK_MOUT_ACLK266, "mout_aclk266", mout_group1_p, SRC_TOP1, 20, 2),
 	MUX(0, "mout_aclk333", mout_group1_p, SRC_TOP1, 28, 2),
 
 	MUX(0, "mout_aclk400_disp1", mout_group1_p, SRC_TOP2, 4, 2),
-- 
2.17.1
