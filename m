From: Andi Shyti <andi.shyti@samsung.com>
Subject: [PATCH v2 2/2] clk: exynos5433: enable sclk_ioclk for SPI3
Date: Mon, 27 Jun 2016 22:03:14 +0900
Message-ID: <1467032594-7643-2-git-send-email-andi.shyti@samsung.com>
References: <1467032594-7643-1-git-send-email-andi.shyti@samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <1467032594-7643-1-git-send-email-andi.shyti@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Chanwoo Choi <cw00.choi@samsung.com>
Cc: Jaehoon Chung <jh80.chung@samsung.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Tomasz Figa <tomasz.figa@gmail.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Andi Shyti <andi.shyti@samsung.com>, Andi Shyti <andi@etezian.org>
List-Id: linux-samsung-soc@vger.kernel.org

enable SPI3 iosclk by using the CLK_IS_CRITICAL flag.
There is no device which is supposed to enable this clock when
needed, therefore, the only way to use the SPI bus is to enable
it in boot time.

Suggested-by: Tomasz Figa <tomasz.figa@gmail.com>
Signed-off-by: Andi Shyti <andi.shyti@samsung.com>
Signed-off-by: Jaehoon Chung <jh80.chung@samsung.com>
---

Hi,

V1 -> V2

- the "sclk_spi3" doesn't need to be enabled in boot time as it
  is handled by the spi driver itself.

- use the CLK_IS_CRITICAL flag for the ioclk

Andi

 drivers/clk/samsung/clk-exynos5433.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/samsung/clk-exynos5433.c b/drivers/clk/samsung/clk-exynos5433.c
index dcb4391..c33150e 100644
--- a/drivers/clk/samsung/clk-exynos5433.c
+++ b/drivers/clk/samsung/clk-exynos5433.c
@@ -1641,7 +1641,8 @@ static struct samsung_gate_clock peric_gate_clks[] __initdata = {
 	GATE(CLK_SCLK_IOCLK_SPI4, "sclk_ioclk_spi4", "ioclk_spi4_clk_in",
 			ENABLE_SCLK_PERIC, 21, CLK_SET_RATE_PARENT, 0),
 	GATE(CLK_SCLK_IOCLK_SPI3, "sclk_ioclk_spi3", "ioclk_spi3_clk_in",
-			ENABLE_SCLK_PERIC, 20, CLK_SET_RATE_PARENT, 0),
+			ENABLE_SCLK_PERIC, 20,
+			CLK_IS_CRITICAL | CLK_SET_RATE_PARENT, 0),
 	GATE(CLK_SCLK_SPI4, "sclk_spi4", "sclk_spi4_peric", ENABLE_SCLK_PERIC,
 			19, CLK_SET_RATE_PARENT, 0),
 	GATE(CLK_SCLK_SPI3, "sclk_spi3", "sclk_spi3_peric", ENABLE_SCLK_PERIC,
-- 
2.8.1
