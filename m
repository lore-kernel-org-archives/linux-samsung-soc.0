From: Mark Brown <broonie@kernel.org>
Subject: [PATCH 3/3] ASoC: smdk_wm8994: Configure the MCLK1 rate based on the board
Date: Sat, 27 Jul 2013 12:53:25 +0100
Message-ID: <1374926005-2400-3-git-send-email-broonie@kernel.org>
References: <1374926005-2400-1-git-send-email-broonie@kernel.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from cassiel.sirena.org.uk ([80.68.93.111]:56743 "EHLO
	cassiel.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751553Ab3G0Lxz (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 27 Jul 2013 07:53:55 -0400
In-Reply-To: <1374926005-2400-1-git-send-email-broonie@kernel.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>, Sangbeom Kim <sbkim73@samsung.com>, Liam Girdwood <lgirdwood@gmail.com>
Cc: linux-samsung-soc@vger.kernel.org, alsa-devel@alsa-project.org, Mark Brown <broonie@linaro.org>

From: Mark Brown <broonie@linaro.org>

Make the code more generally applicable by refactoring so that the MCLK1
rate can be selected based on the compatible string provided by the device
tree, allowing use on other boards which have different rates or use other
information sources.

Signed-off-by: Mark Brown <broonie@linaro.org>
---
 sound/soc/samsung/smdk_wm8994.c | 37 +++++++++++++++++++++++++++++--------
 1 file changed, 29 insertions(+), 8 deletions(-)

diff --git a/sound/soc/samsung/smdk_wm8994.c b/sound/soc/samsung/smdk_wm8994.c
index a561175..5fd7a05 100644
--- a/sound/soc/samsung/smdk_wm8994.c
+++ b/sound/soc/samsung/smdk_wm8994.c
@@ -11,6 +11,7 @@
 #include <sound/pcm_params.h>
 #include <linux/module.h>
 #include <linux/of.h>
+#include <linux/of_device.h>
 
  /*
   * Default CFG switch settings to use this driver:
@@ -37,6 +38,15 @@
 /* SMDK has a 16.934MHZ crystal attached to WM8994 */
 #define SMDK_WM8994_FREQ 16934000
 
+struct smdk_wm8994_data {
+	int mclk1_rate;
+};
+
+/* Default SMDKs */
+static struct smdk_wm8994_data smdk_board_data = {
+	.mclk1_rate = SMDK_WM8994_FREQ,
+};
+
 static int smdk_hw_params(struct snd_pcm_substream *substream,
 	struct snd_pcm_hw_params *params)
 {
@@ -141,15 +151,28 @@ static struct snd_soc_card smdk = {
 	.num_links = ARRAY_SIZE(smdk_dai),
 };
 
+#ifdef CONFIG_OF
+static const struct of_device_id samsung_wm8994_of_match[] = {
+	{ .compatible = "samsung,smdk-wm8994", .data = &smdk_board_data },
+	{},
+};
+MODULE_DEVICE_TABLE(of, samsung_wm8994_of_match);
+#endif /* CONFIG_OF */
 
 static int smdk_audio_probe(struct platform_device *pdev)
 {
 	int ret;
 	struct device_node *np = pdev->dev.of_node;
 	struct snd_soc_card *card = &smdk;
+	struct smdk_wm8994_data *board;
+	const struct of_device_id *id;
 
 	card->dev = &pdev->dev;
 
+	board = devm_kzalloc(&pdev->dev, sizeof(*board), GFP_KERNEL);
+	if (!board)
+		return -ENOMEM;
+
 	if (np) {
 		smdk_dai[0].cpu_dai_name = NULL;
 		smdk_dai[0].cpu_of_node = of_parse_phandle(np,
@@ -164,6 +187,12 @@ static int smdk_audio_probe(struct platform_device *pdev)
 		smdk_dai[0].platform_of_node = smdk_dai[0].cpu_of_node;
 	}
 
+	id = of_match_device(samsung_wm8994_of_match, &pdev->dev);
+	if (id)
+		*board = *((struct smdk_wm8994_data *)id->data);
+
+	platform_set_drvdata(pdev, board);
+
 	ret = snd_soc_register_card(card);
 
 	if (ret)
@@ -181,14 +210,6 @@ static int smdk_audio_remove(struct platform_device *pdev)
 	return 0;
 }
 
-#ifdef CONFIG_OF
-static const struct of_device_id samsung_wm8994_of_match[] = {
-	{ .compatible = "samsung,smdk-wm8994", },
-	{},
-};
-MODULE_DEVICE_TABLE(of, samsung_wm8994_of_match);
-#endif /* CONFIG_OF */
-
 static struct platform_driver smdk_audio_driver = {
 	.driver		= {
 		.name	= "smdk-audio-wm8894",
-- 
1.8.3.2
