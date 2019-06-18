From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: [RFT 02/10] clk: samsung: Add bus clock for GPU/G3D on Exynos4412
Date: Tue, 18 Jun 2019 21:05:26 +0200
Message-ID: <20190618190534.4951-3-krzk@kernel.org>
References: <20190618190534.4951-1-krzk@kernel.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190618190534.4951-1-krzk@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Kukjin Kim <kgene@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Tomasz Figa <tomasz.figa@gmail.com>, Chanwoo Choi <cw00.choi@samsung.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Marek Szyprowski <m.szyprowski@samsung.com>, Olof Johansson <olof@lixom.net>, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org
Cc: Joseph Kogut <joseph.kogut@gmail.com>, Arnd Bergmann <arnd@arndb.de>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Inki Dae <inki.dae@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>
List-Id: linux-samsung-soc@vger.kernel.org

Add ID and gate for bus clock for GPU (Mali 400) on Exynos4412.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 drivers/clk/samsung/clk-exynos4.c   | 1 +
 include/dt-bindings/clock/exynos4.h | 1 +
 2 files changed, 2 insertions(+)

diff --git a/drivers/clk/samsung/clk-exynos4.c b/drivers/clk/samsung/clk-exynos4.c
index d2a68a792a21..ed4af7da9c4f 100644
--- a/drivers/clk/samsung/clk-exynos4.c
+++ b/drivers/clk/samsung/clk-exynos4.c
@@ -961,6 +961,7 @@ static const struct samsung_gate_clock exynos4210_gate_clks[] __initconst = {
 
 /* list of gate clocks supported in exynos4x12 soc */
 static const struct samsung_gate_clock exynos4x12_gate_clks[] __initconst = {
+	GATE(CLK_ASYNC_G3D, "async_g3d", "aclk200", GATE_IP_LEFTBUS, 6, 0, 0),
 	GATE(CLK_AUDSS, "audss", "sclk_epll", E4X12_GATE_IP_MAUDIO, 0, 0, 0),
 	GATE(CLK_MDNIE0, "mdnie0", "aclk160", GATE_IP_LCD0, 2, 0, 0),
 	GATE(CLK_ROTATOR, "rotator", "aclk200", E4X12_GATE_IP_IMAGE, 1, 0, 0),
diff --git a/include/dt-bindings/clock/exynos4.h b/include/dt-bindings/clock/exynos4.h
index a0439ce8e8d3..88ec3968b90a 100644
--- a/include/dt-bindings/clock/exynos4.h
+++ b/include/dt-bindings/clock/exynos4.h
@@ -187,6 +187,7 @@
 #define CLK_MIPI_HSI		349 /* Exynos4210 only */
 #define CLK_PIXELASYNCM0	351
 #define CLK_PIXELASYNCM1	352
+#define CLK_ASYNC_G3D		353 /* Exynos4x12 only */
 #define CLK_PWM_ISP_SCLK	379 /* Exynos4x12 only */
 #define CLK_SPI0_ISP_SCLK	380 /* Exynos4x12 only */
 #define CLK_SPI1_ISP_SCLK	381 /* Exynos4x12 only */
-- 
2.17.1
