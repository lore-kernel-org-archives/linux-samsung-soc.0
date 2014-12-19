From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: [PATCH v2 02/16] ASoC: samsung: i2s: samsung_i2s_get_driver_data()
 cleanup
Date: Fri, 19 Dec 2014 14:55:22 +0100
Message-ID: <1418997336-17777-3-git-send-email-s.nawrocki@samsung.com>
References: <1418997336-17777-1-git-send-email-s.nawrocki@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:31225 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752448AbaLSN4y (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 19 Dec 2014 08:56:54 -0500
In-reply-to: <1418997336-17777-1-git-send-email-s.nawrocki@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: broonie@kernel.org, kgene@kernel.org, alsa-devel@alsa-project.org
Cc: padma.v@samsung.com, drake@endlessm.com, sbkim73@samsung.com, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, Sylwester Nawrocki <s.nawrocki@samsung.com>

Tidy up the samsung_i2s_get_driver_data() function by using
IS_ENABLE() instead of #ifdef and add missing braces for
the 'else' part. Also ensure we are not dereferencing NULL
'match' pointer.

Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
---
 sound/soc/samsung/i2s.c |    9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/sound/soc/samsung/i2s.c b/sound/soc/samsung/i2s.c
index 827e4b4..430298c 100644
--- a/sound/soc/samsung/i2s.c
+++ b/sound/soc/samsung/i2s.c
@@ -1123,15 +1123,14 @@ static const struct of_device_id exynos_i2s_match[];
 static inline const struct samsung_i2s_dai_data *samsung_i2s_get_driver_data(
 						struct platform_device *pdev)
 {
-#ifdef CONFIG_OF
-	if (pdev->dev.of_node) {
+	if (IS_ENABLED(CONFIG_OF) && pdev->dev.of_node) {
 		const struct of_device_id *match;
 		match = of_match_node(exynos_i2s_match, pdev->dev.of_node);
-		return match->data;
-	} else
-#endif
+		return match ? match->data : NULL;
+	} else {
 		return (struct samsung_i2s_dai_data *)
 				platform_get_device_id(pdev)->driver_data;
+	}
 }
 
 #ifdef CONFIG_PM_RUNTIME
-- 
1.7.9.5
