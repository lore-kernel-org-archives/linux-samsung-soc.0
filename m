From: Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH 21/30] ASoC: samsung/i2s: fix module_device_table
Date: Thu, 11 Apr 2013 02:05:03 +0200
Message-ID: <1365638712-1028578-22-git-send-email-arnd@arndb.de>
References: <1365638712-1028578-1-git-send-email-arnd@arndb.de>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from moutng.kundenserver.de ([212.227.126.186]:49815 "EHLO
	moutng.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S937696Ab3DKAHL (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 10 Apr 2013 20:07:11 -0400
In-Reply-To: <1365638712-1028578-1-git-send-email-arnd@arndb.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, Kukjin Kim <kgene.kim@samsung.com>, linux-samsung-soc@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, alsa-devel@alsa-project.org, Mark Brown <broonie@opensource.wolfsonmicro.com>, Liam Girdwood <lgirdwood@gmail.com>

The second argument to the module_device_table macro must be the
name of the device id array. In the samsung i2s driver, there
was a small typo, resulting in a build error when building it
as a loadable module.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
Cc: alsa-devel@alsa-project.org
Cc: Mark Brown <broonie@opensource.wolfsonmicro.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>
---
 sound/soc/samsung/i2s.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/samsung/i2s.c b/sound/soc/samsung/i2s.c
index 61f2622..f7c6816 100644
--- a/sound/soc/samsung/i2s.c
+++ b/sound/soc/samsung/i2s.c
@@ -1289,7 +1289,7 @@ static struct platform_device_id samsung_i2s_driver_ids[] = {
 	},
 	{},
 };
-MODULE_DEVICE_TABLE(platform, samsung-i2s-driver-ids);
+MODULE_DEVICE_TABLE(platform, samsung_i2s_driver_ids);
 
 #ifdef CONFIG_OF
 static struct samsung_i2s_dai_data samsung_i2s_dai_data_array[] = {
-- 
1.8.1.2
