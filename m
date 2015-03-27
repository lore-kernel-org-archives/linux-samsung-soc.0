From: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Subject: [RFC PATCH v2 1/2] clk: exynos5420: Add alias for MDMA0 controller clock
Date: Fri, 27 Mar 2015 20:38:50 +0100
Message-ID: <1427485131-18561-1-git-send-email-javier.martinez@collabora.co.uk>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Kukjin Kim <kgene@kernel.org>
Cc: Sylwester Nawrocki <s.nawrocki@samsung.com>, Doug Anderson <dianders@chromium.org>, Olof Johansson <olof@lixom.net>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Abhilash Kesavan <kesavan.abhilash@gmail.com>, Kevin Hilman <khilman@linaro.org>, Tyler Baker <tyler.baker@linaro.org>, Steve Capper <steve.capper@linaro.org>, Amit Kucheria <amit.kucheria@linaro.org>, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, Javier Martinez Canillas <javier.martinez@collabora.co.uk>
List-Id: linux-samsung-soc@vger.kernel.org

The MDMA0 controller clock needs to be enabled to allow the
system to be resumed when entering into a suspend state.

The clock is disabled as a part of the runtime pm for the
pl330 DMA driver so the system fails to resume. So to allow
the system to grab the clock and make sure that it stays
enabled during suspend, an alias has to be added so a clock
lookup for a clock is registered.

Signed-off-by: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
---

Changes since v1: None.

 drivers/clk/samsung/clk-exynos5420.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/samsung/clk-exynos5420.c b/drivers/clk/samsung/clk-exynos5420.c
index 07d666cc6a29..8b49e8b3b548 100644
--- a/drivers/clk/samsung/clk-exynos5420.c
+++ b/drivers/clk/samsung/clk-exynos5420.c
@@ -893,7 +893,7 @@ static struct samsung_div_clock exynos5x_div_clks[] __initdata = {
 
 static struct samsung_gate_clock exynos5x_gate_clks[] __initdata = {
 	/* G2D */
-	GATE(CLK_MDMA0, "mdma0", "aclk266_g2d", GATE_IP_G2D, 1, 0, 0),
+	GATE_A(CLK_MDMA0, "mdma0", "aclk266_g2d", GATE_IP_G2D, 1, 0, 0, "mdma0"),
 	GATE(CLK_SSS, "sss", "aclk266_g2d", GATE_IP_G2D, 2, 0, 0),
 	GATE(CLK_G2D, "g2d", "aclk333_g2d", GATE_IP_G2D, 3, 0, 0),
 	GATE(CLK_SMMU_MDMA0, "smmu_mdma0", "aclk266_g2d", GATE_IP_G2D, 5, 0, 0),
-- 
2.1.4
