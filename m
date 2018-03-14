From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: [PATCH] clk: samsung: Add fout=196608001 Hz EPLL rate entry for
 exynos4412
Date: Wed, 14 Mar 2018 12:32:26 +0100
Message-ID: <20180314113226.1807-1-s.nawrocki@samsung.com>
References: <CGME20180314113237epcas2p15a4a9304f6b69e9bca7556d910d3b861@epcas2p1.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-clk@vger.kernel.org
Cc: linux-samsung-soc@vger.kernel.org, b.zolnierkie@samsung.com, sboyd@kernel.org, mturquette@baylibre.com, cw00.choi@samsung.com, Sylwester Nawrocki <s.nawrocki@samsung.com>, linux-arm-kernel@lists.infradead.org, m.szyprowski@samsung.com
List-Id: linux-samsung-soc@vger.kernel.org

This additional frequency is required for HDMI audio support
on Odroid U3 board.

Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
---
 drivers/clk/samsung/clk-exynos4.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/samsung/clk-exynos4.c b/drivers/clk/samsung/clk-exynos4.c
index edf125525a36..0421960eb963 100644
--- a/drivers/clk/samsung/clk-exynos4.c
+++ b/drivers/clk/samsung/clk-exynos4.c
@@ -1319,6 +1319,7 @@ static const struct samsung_pll_rate_table exynos4x12_apll_rates[] __initconst =
 };
 
 static const struct samsung_pll_rate_table exynos4x12_epll_rates[] __initconst = {
+	PLL_36XX_RATE(24 * MHZ, 196608001, 197, 3, 3, -25690),
 	PLL_36XX_RATE(24 * MHZ, 192000000, 48, 3, 1,     0),
 	PLL_36XX_RATE(24 * MHZ, 180633605, 45, 3, 1, 10381),
 	PLL_36XX_RATE(24 * MHZ, 180000000, 45, 3, 1,     0),
-- 
2.14.2
