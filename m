From: Andi Shyti <andi.shyti@samsung.com>
Subject: [PATCH v4 2/2] clk: exynos5433: enable sclk_ioclk for SPI3
Date: Thu, 07 Jul 2016 21:13:57 +0900
Message-ID: <1467893637-12573-3-git-send-email-andi.shyti@samsung.com>
References: <1467893637-12573-1-git-send-email-andi.shyti@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:39985 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750900AbcGGMOF (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 7 Jul 2016 08:14:05 -0400
In-reply-to: <1467893637-12573-1-git-send-email-andi.shyti@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Chanwoo Choi <cw00.choi@samsung.com>
Cc: Jaehoon Chung <jh80.chung@samsung.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Tomasz Figa <tomasz.figa@gmail.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Andi Shyti <andi.shyti@samsung.com>, Andi Shyti <andi@etezian.org>

enable SPI3 critical clocks by using the CLK_IS_CRITICAL flag.
There is no device which is supposed to enable this clock when
needed, therefore, the only way to use the SPI bus is to enable
it in boot time.

Suggested-by: Tomasz Figa <tomasz.figa@gmail.com>
Signed-off-by: Andi Shyti <andi.shyti@samsung.com>
Signed-off-by: Jaehoon Chung <jh80.chung@samsung.com>
Reviewed-by: Chanwoo Choi <cw00.choi@samsung.com>
---
 drivers/clk/samsung/clk-exynos5433.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/samsung/clk-exynos5433.c b/drivers/clk/samsung/clk-exynos5433.c
index 337387b..fb8d330 100644
--- a/drivers/clk/samsung/clk-exynos5433.c
+++ b/drivers/clk/samsung/clk-exynos5433.c
@@ -1648,7 +1648,8 @@ static struct samsung_gate_clock peric_gate_clks[] __initdata = {
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
