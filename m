From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: [PATCH 3/8] ASoC: samsung: i2s: Prevent external abort on
 exynos5433 I2S1 access
Date: Mon, 05 Feb 2018 16:43:58 +0100
Message-ID: <20180205154403.13520-4-s.nawrocki@samsung.com>
References: <20180205154403.13520-1-s.nawrocki@samsung.com>
        <CGME20180205154516epcas1p39c5977145e7b32879b935087ee3865f8@epcas1p3.samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:31807 "EHLO
        mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753136AbeBEPpT (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 5 Feb 2018 10:45:19 -0500
In-reply-to: <20180205154403.13520-1-s.nawrocki@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: broonie@kernel.org
Cc: lgirdwood@gmail.com, alsa-devel@alsa-project.org, robh+dt@kernel.org, devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, krzk@kernel.org, jcsing.lee@samsung.com, sbkim73@samsung.com, linux-kernel@vger.kernel.org, b.zolnierkie@samsung.com, m.szyprowski@samsung.com, Sylwester Nawrocki <s.nawrocki@samsung.com>

It seems both PCLK_I2S1 and SCLK_I2S1 clocks need to be enabled before
I2S1 control registers can be accessed on exynos5433, if SCLK clock
is disabled an exception is triggered. To fix this parent clock of
the RCLK_SRC clock is assigned to pri_dai->op_clk so required gate
clock is handled by the runtime PM ops.

Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
---
 sound/soc/samsung/i2s.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/sound/soc/samsung/i2s.c b/sound/soc/samsung/i2s.c
index b7d25a63da8b..1c05170e4999 100644
--- a/sound/soc/samsung/i2s.c
+++ b/sound/soc/samsung/i2s.c
@@ -1328,6 +1328,7 @@ static int samsung_i2s_probe(struct platform_device *pdev)
 		dev_err(&pdev->dev, "failed to enable clock: %d\n", ret);
 		return ret;
 	}
+
 	pri_dai->dma_playback.addr = regs_base + I2STXD;
 	pri_dai->dma_capture.addr = regs_base + I2SRXD;
 	pri_dai->dma_playback.chan_name = "tx";
@@ -1401,9 +1402,14 @@ static int samsung_i2s_probe(struct platform_device *pdev)
 	pm_runtime_enable(&pdev->dev);
 
 	ret = i2s_register_clock_provider(pdev);
-	if (!ret)
-		return 0;
+	if (ret < 0)
+		goto err_disable_pm;
+
+	pri_dai->op_clk = clk_get_parent(pri_dai->clk_table[CLK_I2S_RCLK_SRC]);
+
+	return 0;
 
+err_disable_pm:
 	pm_runtime_disable(&pdev->dev);
 err_disable_clk:
 	clk_disable_unprepare(pri_dai->clk);
-- 
2.14.2
