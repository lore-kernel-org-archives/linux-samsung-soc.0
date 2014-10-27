From: Krishna Mohan Dani <krishna.md@samsung.com>
Subject: [PATCH 4/4] Sound: DT: Adding Device Tree compatibility to Realtek's
 ALC5631 codec driver
Date: Mon, 27 Oct 2014 11:41:11 +0530
Message-ID: <1414390271-25040-5-git-send-email-krishna.md@samsung.com>
References: <1414390271-25040-1-git-send-email-krishna.md@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:37886 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750873AbaJ0GOT (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 27 Oct 2014 02:14:19 -0400
Received: from epcpsbgr5.samsung.com
 (u145.gpu120.samsung.co.kr [203.254.230.145])
 by mailout3.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0NE3006K7ANLS410@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 27 Oct 2014 15:14:09 +0900 (KST)
In-reply-to: <1414390271-25040-1-git-send-email-krishna.md@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: kgene.kim@samsung.com, broonie@linaro.org, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org

Signed-off-by: Krishna Mohan Dani <krishna.md@samsung.com>
---
 sound/soc/codecs/rt5631.c |   11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/sound/soc/codecs/rt5631.c b/sound/soc/codecs/rt5631.c
index 1ba27db..d7c3f42 100644
--- a/sound/soc/codecs/rt5631.c
+++ b/sound/soc/codecs/rt5631.c
@@ -1690,6 +1690,14 @@ static const struct i2c_device_id rt5631_i2c_id[] = {
 };
 MODULE_DEVICE_TABLE(i2c, rt5631_i2c_id);
 
+#ifdef CONFIG_OF
+static struct of_device_id rt5631_i2c_dt_ids[] = {
+	{ .compatible = "realtek,alc5631"},
+	{ }
+};
+MODULE_DEVICE_TABLE(of, rt5631_i2c_dt_ids);
+#endif
+
 static const struct regmap_config rt5631_regmap_config = {
 	.reg_bits = 8,
 	.val_bits = 16,
@@ -1734,6 +1742,9 @@ static struct i2c_driver rt5631_i2c_driver = {
 	.driver = {
 		.name = "rt5631",
 		.owner = THIS_MODULE,
+#ifdef CONFIG_OF
+		.of_match_table = of_match_ptr(rt5631_i2c_dt_ids),
+#endif
 	},
 	.probe = rt5631_i2c_probe,
 	.remove   = rt5631_i2c_remove,
-- 
1.7.9.5
