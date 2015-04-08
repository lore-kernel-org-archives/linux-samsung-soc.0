From: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Subject: [PATCH 1/1] clk: exynos5420: Restore GATE_BUS_TOP on suspend
Date: Wed,  8 Apr 2015 07:34:12 +0200
Message-ID: <1428471252-15872-1-git-send-email-javier.martinez@collabora.co.uk>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: Mike Turquette <mturquette@linaro.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Tomasz Figa <tomasz.figa@gmail.com>, Kukjin Kim <kgene@kernel.org>, Olof Johansson <olof@lixom.net>, Doug Anderson <dianders@chromium.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Kevin Hilman <khilman@linaro.org>, Tyler Baker <tyler.baker@linaro.org>, Abhilash Kesavan <kesavan.abhilash@gmail.com>, Chanwoo Choi <cw00.choi@samsung.com>, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, Javier Martinez Canillas <javier.martinez@collabora.co.uk>
List-Id: linux-samsung-soc@vger.kernel.org

Commit ae43b3289186 ("ARM: 8202/1: dmaengine: pl330: Add runtime Power
Management support v12") added pm support for the pl330 dma driver but
it makes the clock for the Exynos5420 MDMA0 DMA controller to be gated
during suspend and this in turn makes its parent clock aclk266_g2d to
be gated. But the clock needs to be ungated prior suspend to allow the
system to be suspend and resumed correctly.

Add GATE_BUS_TOP register to the list of registers to be restored when
the system enters into a suspend state so aclk266_g2d will be ungated.

Thanks to Abhilash Kesavan for figuring out that this was the issue.

Fixes: ae43b32 ("ARM: 8202/1: dmaengine: pl330: Add runtime Power Management support v12")
Signed-off-by: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Tested-by: Kevin Hilman <khilman@linaro.org>
Tested-by: Abhilash Kesavan <a.kesavan@samsung.com>
Acked-by: Tomasz Figa <tomasz.figa@gmail.com>
---
 drivers/clk/samsung/clk-exynos5420.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/samsung/clk-exynos5420.c b/drivers/clk/samsung/clk-exynos5420.c
index 07d666cc6a29..bea4a173eef5 100644
--- a/drivers/clk/samsung/clk-exynos5420.c
+++ b/drivers/clk/samsung/clk-exynos5420.c
@@ -271,6 +271,7 @@ static const struct samsung_clk_reg_dump exynos5420_set_clksrc[] = {
 	{ .offset = SRC_MASK_PERIC0,		.value = 0x11111110, },
 	{ .offset = SRC_MASK_PERIC1,		.value = 0x11111100, },
 	{ .offset = SRC_MASK_ISP,		.value = 0x11111000, },
+	{ .offset = GATE_BUS_TOP,		.value = 0xffffffff, },
 	{ .offset = GATE_BUS_DISP1,		.value = 0xffffffff, },
 	{ .offset = GATE_IP_PERIC,		.value = 0xffffffff, },
 };
-- 
2.1.4
