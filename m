From: Andi Shyti <andi.shyti@samsung.com>
Subject: [PATCH v4 1/2] clk: exynos5433: do not use CLK_IGNORE_UNUSED for SPI
 clocks
Date: Thu, 07 Jul 2016 21:13:56 +0900
Message-ID: <1467893637-12573-2-git-send-email-andi.shyti@samsung.com>
References: <1467893637-12573-1-git-send-email-andi.shyti@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:34778 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750922AbcGGMOF (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 7 Jul 2016 08:14:05 -0400
In-reply-to: <1467893637-12573-1-git-send-email-andi.shyti@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Chanwoo Choi <cw00.choi@samsung.com>
Cc: Jaehoon Chung <jh80.chung@samsung.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Tomasz Figa <tomasz.figa@gmail.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Andi Shyti <andi.shyti@samsung.com>, Andi Shyti <andi@etezian.org>

The CLK_IGNORE_UNUSED flag has to be avoided whenever possible.
Use the CLK_IS_CRITICAL flag instead for critical SPI1 clocks,
which enables the clock line during boot time.

Suggested-by: Tomasz Figa <tomasz.figa@gmail.com>
Signed-off-by: Andi Shyti <andi.shyti@samsung.com>
---
 drivers/clk/samsung/clk-exynos5433.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/samsung/clk-exynos5433.c b/drivers/clk/samsung/clk-exynos5433.c
index c3a5318..337387b 100644
--- a/drivers/clk/samsung/clk-exynos5433.c
+++ b/drivers/clk/samsung/clk-exynos5433.c
@@ -1662,7 +1662,7 @@ static struct samsung_gate_clock peric_gate_clks[] __initdata = {
 			ENABLE_SCLK_PERIC, 13, CLK_SET_RATE_PARENT, 0),
 	GATE(CLK_SCLK_IOCLK_SPI1, "sclk_ioclk_spi1", "ioclk_spi1_clk_in",
 			ENABLE_SCLK_PERIC, 12,
-			CLK_IGNORE_UNUSED | CLK_SET_RATE_PARENT, 0),
+			CLK_IS_CRITICAL | CLK_SET_RATE_PARENT, 0),
 	GATE(CLK_SCLK_IOCLK_SPI0, "sclk_ioclk_spi0", "ioclk_spi0_clk_in",
 			ENABLE_SCLK_PERIC, 11, CLK_SET_RATE_PARENT, 0),
 	GATE(CLK_SCLK_IOCLK_I2S1_BCLK, "sclk_ioclk_i2s1_bclk",
@@ -1677,7 +1677,7 @@ static struct samsung_gate_clock peric_gate_clks[] __initdata = {
 	GATE(CLK_SCLK_SPI2, "sclk_spi2", "sclk_spi2_peric", ENABLE_SCLK_PERIC,
 			5, CLK_SET_RATE_PARENT, 0),
 	GATE(CLK_SCLK_SPI1, "sclk_spi1", "sclk_spi1_peric", ENABLE_SCLK_PERIC,
-			4, CLK_IGNORE_UNUSED | CLK_SET_RATE_PARENT, 0),
+			4, CLK_SET_RATE_PARENT, 0),
 	GATE(CLK_SCLK_SPI0, "sclk_spi0", "sclk_spi0_peric", ENABLE_SCLK_PERIC,
 			3, CLK_SET_RATE_PARENT, 0),
 	GATE(CLK_SCLK_UART2, "sclk_uart2", "sclk_uart2_peric",
-- 
2.8.1
