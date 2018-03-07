From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: [PATCH] clk: samsung: exynos5420: Add more entries to EPLL rate table
Date: Wed, 07 Mar 2018 17:46:56 +0100
Message-ID: <20180307164656.12194-2-s.nawrocki@samsung.com>
References: <20180307164656.12194-1-s.nawrocki@samsung.com>
 <CGME20180307164733epcas1p3695c022315be8d2839ac9e88016e3a76@epcas1p3.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-reply-to: <20180307164656.12194-1-s.nawrocki@samsung.com>
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

Adding these EPLL output frequency entries allows to support all required
audio sample rates on the CODEC and the HDMI interface on Peach-Pit
Chromebook.

Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
---
 drivers/clk/samsung/clk-exynos5420.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/clk/samsung/clk-exynos5420.c b/drivers/clk/samsung/clk-exynos5420.c
index 1f204ba37f0f..f2607cb97a97 100644
--- a/drivers/clk/samsung/clk-exynos5420.c
+++ b/drivers/clk/samsung/clk-exynos5420.c
@@ -1360,8 +1360,11 @@ static const struct samsung_pll_rate_table exynos5420_epll_24mhz_tbl[] = {
 	PLL_36XX_RATE(180633609U, 301, 5, 3, 3671),
 	PLL_36XX_RATE(131072006U, 131, 3, 3, 4719),
 	PLL_36XX_RATE(100000000U, 200, 3, 4, 0),
+	PLL_36XX_RATE( 73728000U, 98, 2, 4, 19923),
+	PLL_36XX_RATE( 67737602U, 90, 2, 4, 20762),
 	PLL_36XX_RATE( 65536003U, 131, 3, 4, 4719),
 	PLL_36XX_RATE( 49152000U, 197, 3, 5, -25690),
+	PLL_36XX_RATE( 45158401U, 90, 3, 4, 20762),
 	PLL_36XX_RATE( 32768001U, 131, 3, 5, 4719),
 };
 
-- 
2.14.2
