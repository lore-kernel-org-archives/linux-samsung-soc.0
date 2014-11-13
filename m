From: Krishna Mohan Dani <krishna.md@samsung.com>
Subject: [PATCH 4/4 V3] ASoC: rt5631: Adding Device Tree compatibility to
 Realtek's ALC5631/RT5631 codec driver
Date: Thu, 13 Nov 2014 17:44:24 +0530
Message-ID: <1415880864-2246-5-git-send-email-krishna.md@samsung.com>
References: <1415880864-2246-1-git-send-email-krishna.md@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:27293 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932512AbaKMMRF (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 13 Nov 2014 07:17:05 -0500
Received: from epcpsbgr3.samsung.com
 (u143.gpu120.samsung.co.kr [203.254.230.143])
 by mailout4.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0NEZ00JX78SGCQ80@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 13 Nov 2014 21:17:04 +0900 (KST)
In-reply-to: <1415880864-2246-1-git-send-email-krishna.md@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, alsa-devel@alsa-project.org
Cc: kgene.kim@samsung.com, broonie@kernel.org

Signed-off-by: Krishna Mohan Dani <krishna.md@samsung.com>
---
 sound/soc/codecs/rt5631.c |    9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/sound/soc/codecs/rt5631.c b/sound/soc/codecs/rt5631.c
index 1ba27db..3b7d5e4 100644
--- a/sound/soc/codecs/rt5631.c
+++ b/sound/soc/codecs/rt5631.c
@@ -1686,10 +1686,18 @@ static struct snd_soc_codec_driver soc_codec_dev_rt5631 = {
 
 static const struct i2c_device_id rt5631_i2c_id[] = {
 	{ "rt5631", 0 },
+	{ "alc5631", 0 },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, rt5631_i2c_id);
 
+static struct of_device_id rt5631_i2c_dt_ids[] = {
+	{ .compatible = "realtek,rt5631"},
+	{ .compatible = "realtek,alc5631"},
+	{ }
+};
+MODULE_DEVICE_TABLE(of, rt5631_i2c_dt_ids);
+
 static const struct regmap_config rt5631_regmap_config = {
 	.reg_bits = 8,
 	.val_bits = 16,
@@ -1734,6 +1742,7 @@ static struct i2c_driver rt5631_i2c_driver = {
 	.driver = {
 		.name = "rt5631",
 		.owner = THIS_MODULE,
+		.of_match_table = of_match_ptr(rt5631_i2c_dt_ids),
 	},
 	.probe = rt5631_i2c_probe,
 	.remove   = rt5631_i2c_remove,
-- 
1.7.9.5
