From: Mark Brown <broonie@kernel.org>
Subject: [PATCH 1/2] ASoC: core: Add devm_snd_soc_register_card()
Date: Mon, 16 Sep 2013 18:03:42 +0100
Message-ID: <1379351023-28996-1-git-send-email-broonie@kernel.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from cassiel.sirena.org.uk ([80.68.93.111]:48789 "EHLO
	cassiel.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751387Ab3IPRDu (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 16 Sep 2013 13:03:50 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Liam Girdwood <lgirdwood@gmail.com>, Sangbeom Kim <sbkim73@samsung.com>
Cc: alsa-devel@alsa-project.org, linux-samsung-soc@vger.kernel.org, linaro-kernel@lists.linaro.org, Mark Brown <broonie@linaro.org>

From: Mark Brown <broonie@linaro.org>

Simplify error handling and remove repetitive (and rarely executed) code
for unregistration by providing a devm_snd_soc_register() card.

Signed-off-by: Mark Brown <broonie@linaro.org>
---
 include/sound/soc.h    |  1 +
 sound/soc/soc-devres.c | 34 ++++++++++++++++++++++++++++++++++
 2 files changed, 35 insertions(+)

diff --git a/include/sound/soc.h b/include/sound/soc.h
index f126676..7ab5d2b 100644
--- a/include/sound/soc.h
+++ b/include/sound/soc.h
@@ -364,6 +364,7 @@ int snd_soc_codec_set_pll(struct snd_soc_codec *codec, int pll_id, int source,
 
 int snd_soc_register_card(struct snd_soc_card *card);
 int snd_soc_unregister_card(struct snd_soc_card *card);
+int devm_snd_soc_register_card(struct device *dev, struct snd_soc_card *card);
 int snd_soc_suspend(struct device *dev);
 int snd_soc_resume(struct device *dev);
 int snd_soc_poweroff(struct device *dev);
diff --git a/sound/soc/soc-devres.c b/sound/soc/soc-devres.c
index 13fe86f..b1d7322 100644
--- a/sound/soc/soc-devres.c
+++ b/sound/soc/soc-devres.c
@@ -50,3 +50,37 @@ int devm_snd_soc_register_component(struct device *dev,
 	return ret;
 }
 EXPORT_SYMBOL_GPL(devm_snd_soc_register_component);
+
+static void devm_card_release(struct device *dev, void *res)
+{
+	snd_soc_unregister_card(*(struct snd_soc_card **)res);
+}
+
+/**
+ * devm_snd_soc_register_card - resource managed card registration
+ * @dev: Device used to manage card
+ * @card: Card to register
+ *
+ * Register a card with automatic unregistration when the device is
+ * unregistered.
+ */
+int devm_snd_soc_register_card(struct device *dev, struct snd_soc_card *card)
+{
+	struct device **ptr;
+	int ret;
+
+	ptr = devres_alloc(devm_card_release, sizeof(*ptr), GFP_KERNEL);
+	if (!ptr)
+		return -ENOMEM;
+
+	ret = snd_soc_register_card(card);
+	if (ret == 0) {
+		*ptr = dev;
+		devres_add(dev, ptr);
+	} else {
+		devres_free(ptr);
+	}
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(devm_snd_soc_register_card);
-- 
1.8.4.rc3
