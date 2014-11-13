From: Krishna Mohan Dani <krishna.md@samsung.com>
Subject: [PATCH 3/4 V3] Sound: Kconfig: Adding the description of the codec
Date: Thu, 13 Nov 2014 17:44:23 +0530
Message-ID: <1415880864-2246-4-git-send-email-krishna.md@samsung.com>
References: <1415880864-2246-1-git-send-email-krishna.md@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:36790 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932512AbaKMMQd (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 13 Nov 2014 07:16:33 -0500
Received: from epcpsbgr1.samsung.com
 (u141.gpu120.samsung.co.kr [203.254.230.141])
 by mailout1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0NEZ00A858RKBC30@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 13 Nov 2014 21:16:32 +0900 (KST)
In-reply-to: <1415880864-2246-1-git-send-email-krishna.md@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, alsa-devel@alsa-project.org
Cc: kgene.kim@samsung.com, broonie@kernel.org

Signed-off-by: Krishna Mohan Dani <krishna.md@samsung.com>
---
 sound/soc/codecs/Kconfig |    3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/sound/soc/codecs/Kconfig b/sound/soc/codecs/Kconfig
index a68d173..7e43e97 100644
--- a/sound/soc/codecs/Kconfig
+++ b/sound/soc/codecs/Kconfig
@@ -487,7 +487,8 @@ config SND_SOC_RT286
 	depends on I2C
 
 config SND_SOC_RT5631
-	tristate
+	tristate "Realtek ALC5631/RT5631 CODEC"
+	depends on I2C
 
 config SND_SOC_RT5640
 	tristate
-- 
1.7.9.5
