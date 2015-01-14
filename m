From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: [PATCH V3 04/15] ASoC: samsung: i2s: Move clk_get() to platform driver
 probe()
Date: Wed, 14 Jan 2015 19:42:31 +0100
Message-ID: <1421260962-16892-5-git-send-email-s.nawrocki@samsung.com>
References: <1421260962-16892-1-git-send-email-s.nawrocki@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:40195 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754430AbbANSnX (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 14 Jan 2015 13:43:23 -0500
In-reply-to: <1421260962-16892-1-git-send-email-s.nawrocki@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: broonie@kernel.org, kgene@kernel.org
Cc: padma.v@samsung.com, drake@endlessm.com, sbkim73@samsung.com, alsa-devel@alsa-project.org, devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Sylwester Nawrocki <s.nawrocki@samsung.com>

Acquire the I2S interface clock in driver probe() callback
as it's a per-device not a per-DAI clock. While at it switch
to the resource managed clk_get().

Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
---
 sound/soc/samsung/i2s.c |   19 +++++++------------
 1 file changed, 7 insertions(+), 12 deletions(-)

diff --git a/sound/soc/samsung/i2s.c b/sound/soc/samsung/i2s.c
index 366b720..a854ffc 100644
--- a/sound/soc/samsung/i2s.c
+++ b/sound/soc/samsung/i2s.c
@@ -971,18 +971,12 @@ static int samsung_i2s_dai_probe(struct snd_soc_dai *dai)
 	struct i2s_dai *other = i2s->pri_dai ? : i2s->sec_dai;
 	int ret;
 
-	if (other && other->clk) { /* If this is probe on secondary */
+	if (is_secondary(i2s)) { /* If this is probe on the secondary DAI */
 		samsung_asoc_init_dma_data(dai, &other->sec_dai->dma_playback,
 					   NULL);
 		goto probe_exit;
 	}
 
-	i2s->clk = clk_get(&i2s->pdev->dev, "iis");
-	if (IS_ERR(i2s->clk)) {
-		dev_err(&i2s->pdev->dev, "failed to get i2s_clock\n");
-		return PTR_ERR(i2s->clk);
-	}
-
 	ret = clk_prepare_enable(i2s->clk);
 	if (ret != 0) {
 		dev_err(&i2s->pdev->dev, "failed to enable clock: %d\n", ret);
@@ -991,10 +985,6 @@ static int samsung_i2s_dai_probe(struct snd_soc_dai *dai)
 
 	samsung_asoc_init_dma_data(dai, &i2s->dma_playback, &i2s->dma_capture);
 
-	if (other) {
-		other->clk = i2s->clk;
-	}
-
 	if (i2s->quirks & QUIRK_NEED_RSTCLR)
 		writel(CON_RSTCLR, i2s->addr + I2SCON);
 
@@ -1032,7 +1022,6 @@ static int samsung_i2s_dai_remove(struct snd_soc_dai *dai)
 			writel(0, i2s->addr + I2SCON);
 
 		clk_disable_unprepare(i2s->clk);
-		clk_put(i2s->clk);
 	}
 
 	i2s->clk = NULL;
@@ -1222,6 +1211,11 @@ static int samsung_i2s_probe(struct platform_device *pdev)
 
 	regs_base = res->start;
 
+	pri_dai->clk = devm_clk_get(&pdev->dev, "iis");
+	if (IS_ERR(pri_dai->clk)) {
+		dev_err(&pdev->dev, "Failed to get iis clock\n");
+		return PTR_ERR(pri_dai->clk);
+	}
 	pri_dai->dma_playback.dma_addr = regs_base + I2STXD;
 	pri_dai->dma_capture.dma_addr = regs_base + I2SRXD;
 	pri_dai->dma_playback.ch_name = "tx";
@@ -1253,6 +1247,7 @@ static int samsung_i2s_probe(struct platform_device *pdev)
 
 		sec_dai->dma_playback.dma_size = 4;
 		sec_dai->addr = pri_dai->addr;
+		sec_dai->clk = pri_dai->clk;
 		sec_dai->quirks = quirks;
 		sec_dai->idma_playback.dma_addr = idma_addr;
 		sec_dai->pri_dai = pri_dai;
-- 
1.7.9.5
