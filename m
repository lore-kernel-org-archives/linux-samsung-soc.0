From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: [PATCH 1/3] ASoC: samsung: Remove unused "samsung-i2sv4"
 platform_device_id entry
Date: Fri, 08 Apr 2016 18:52:43 +0200
Message-ID: <1460134365-31500-1-git-send-email-s.nawrocki@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:40785 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754046AbcDHQxU (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 8 Apr 2016 12:53:20 -0400
Received: from epcpsbgm1new.samsung.com (epcpsbgm1 [203.254.230.26])
 by mailout2.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0O5B00CENQWPEM30@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Sat, 09 Apr 2016 01:53:17 +0900 (KST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: broonie@kernel.org
Cc: alsa-devel@alsa-project.org, linux-samsung-soc@vger.kernel.org, Sylwester Nawrocki <s.nawrocki@samsung.com>

"samsung-i2sv4" identifier was previously used for the I2S device
of the S5PV210 SoCs, it can be removed now when s5pv210 is a dt-only
platform.

Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
---
 sound/soc/samsung/i2s.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/sound/soc/samsung/i2s.c b/sound/soc/samsung/i2s.c
index 70a2559..ededac9 100644
--- a/sound/soc/samsung/i2s.c
+++ b/sound/soc/samsung/i2s.c
@@ -1492,9 +1492,6 @@ static const struct platform_device_id samsung_i2s_driver_ids[] = {
 	}, {
 		.name           = "samsung-i2s-sec",
 		.driver_data    = (kernel_ulong_t)&samsung_dai_type_sec,
-	}, {
-		.name		= "samsung-i2sv4",
-		.driver_data	= (kernel_ulong_t)&i2sv5_dai_type,
 	},
 	{},
 };
-- 
1.9.1
