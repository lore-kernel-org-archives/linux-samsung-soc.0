From: Lukasz Luba <l.luba@partner.samsung.com>
Subject: [PATCH v1 12/50] clk: add ID to PWM MUX in Exynos5420
Date: Mon, 15 Jul 2019 14:43:39 +0200
Message-ID: <20190715124417.4787-13-l.luba@partner.samsung.com>
References: <20190715124417.4787-1-l.luba@partner.samsung.com>
        <CGME20190715124443eucas1p1adf02a02bf77448f2277ddd5fe5e895b@eucas1p1.samsung.com>
Content-Type: text/plain; charset="utf-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190715124417.4787-1-l.luba@partner.samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org
Cc: mturquette@baylibre.com, sboyd@kernel.org, b.zolnierkie@samsung.com, krzk@kernel.org, kgene@kernel.org, mark.rutland@arm.com, robh+dt@kernel.org, cw00.choi@samsung.com, kyungmin.park@samsung.com, a.hajda@samsung.com, m.szyprowski@samsung.com, s.nawrocki@samsung.com, myungjoo.ham@samsung.com, Lukasz Luba <l.luba@partner.samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

Add ID to PWM MUX to manage it from DT to reflect proper topology.

Signed-off-by: Lukasz Luba <l.luba@partner.samsung.com>
---
 drivers/clk/samsung/clk-exynos5420.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/samsung/clk-exynos5420.c b/drivers/clk/samsung/clk-exynos5420.c
index 7bf74401c4e7..7f8221527633 100644
--- a/drivers/clk/samsung/clk-exynos5420.c
+++ b/drivers/clk/samsung/clk-exynos5420.c
@@ -772,7 +772,7 @@ static const struct samsung_mux_clock exynos5x_mux_clks[] __initconst = {
 	MUX(CLK_MOUT_UART1, "mout_uart1", mout_group2_p, SRC_PERIC0, 8, 3),
 	MUX(CLK_MOUT_UART2, "mout_uart2", mout_group2_p, SRC_PERIC0, 12, 3),
 	MUX(CLK_MOUT_UART3, "mout_uart3", mout_group2_p, SRC_PERIC0, 16, 3),
-	MUX(0, "mout_pwm", mout_group2_p, SRC_PERIC0, 24, 3),
+	MUX(CLK_MOUT_PWM, "mout_pwm", mout_group2_p, SRC_PERIC0, 24, 3),
 	MUX(0, "mout_spdif", mout_spdif_p, SRC_PERIC0, 28, 3),
 	MUX(0, "mout_audio0", mout_audio0_p, SRC_PERIC1, 8, 3),
 	MUX(0, "mout_audio1", mout_audio1_p, SRC_PERIC1, 12, 3),
-- 
2.17.1
