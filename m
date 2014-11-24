From: Krishna Mohan Dani <krishna.md@samsung.com>
Subject: [PATCH] ASoC: rt5631: Fixing compilation warning when DT is disabled
Date: Mon, 24 Nov 2014 16:52:42 +0530
Message-ID: <1416828162-8216-1-git-send-email-krishna.md@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:26012 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751012AbaKXLXN (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 24 Nov 2014 06:23:13 -0500
Received: from epcpsbgr1.samsung.com
 (u141.gpu120.samsung.co.kr [203.254.230.141])
 by mailout1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0NFJ004GAJMNSM90@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 24 Nov 2014 20:23:11 +0900 (KST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, alsa-devel@alsa-project.org
Cc: kgene.kim@samsung.com, broonie@kernel.org, Claude Youn <claude.youn@gmail.com>

Fixes the following compilation warning:
Warning: 'rt5631_i2c_dt_ids' defined but not used - when DT is not used.

Signed-off-by: Claude Youn <claude.youn@gmail.com>
Signed-off-by: Krishna Mohan Dani <krishna.md@samsung.com>
---
 sound/soc/codecs/rt5631.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/rt5631.c b/sound/soc/codecs/rt5631.c
index 3b7d5e4..5c65915 100644
--- a/sound/soc/codecs/rt5631.c
+++ b/sound/soc/codecs/rt5631.c
@@ -1691,7 +1691,7 @@ static const struct i2c_device_id rt5631_i2c_id[] = {
 };
 MODULE_DEVICE_TABLE(i2c, rt5631_i2c_id);
 
-static struct of_device_id rt5631_i2c_dt_ids[] = {
+static struct of_device_id rt5631_i2c_dt_ids[] __maybe_unused = {
 	{ .compatible = "realtek,rt5631"},
 	{ .compatible = "realtek,alc5631"},
 	{ }
-- 
1.7.9.5
