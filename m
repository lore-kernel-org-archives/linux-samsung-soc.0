From: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Subject: [PATCH 1/1] mfd: max77686: Remove unused struct max77686_opmode_data
Date: Wed,  6 May 2015 19:07:16 +0200
Message-ID: <1430932036-23971-1-git-send-email-javier.martinez@collabora.co.uk>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from bhuna.collabora.co.uk ([93.93.135.160]:36389 "EHLO
	bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751591AbbEFRHa (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 6 May 2015 13:07:30 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Lee Jones <lee.jones@linaro.org>
Cc: Chanwoo Choi <cw00.choi@samsung.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Samuel Ortiz <sameo@linux.intel.com>, Olof Johansson <olof@lixom.net>, Doug Anderson <dianders@chromium.org>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, Javier Martinez Canillas <javier.martinez@collabora.co.uk>

The defined struct max77686_opmode_data isn't used neither by
the max77686 mfd driver nor the drivers for its sub-devices.

Signed-off-by: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
---
 include/linux/mfd/max77686.h | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/include/linux/mfd/max77686.h b/include/linux/mfd/max77686.h
index bb995ab9a575..d4b72d519115 100644
--- a/include/linux/mfd/max77686.h
+++ b/include/linux/mfd/max77686.h
@@ -125,9 +125,4 @@ enum max77686_opmode {
 	MAX77686_OPMODE_STANDBY,
 };
 
-struct max77686_opmode_data {
-	int id;
-	int mode;
-};
-
 #endif /* __LINUX_MFD_MAX77686_H */
-- 
2.1.4
