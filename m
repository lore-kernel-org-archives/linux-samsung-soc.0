From: Krishna Mohan Dani <krishna.md@samsung.com>
Subject: [PATCH 3/4 V2] Sound: Kconfig: Adding the description of the codec
Date: Wed, 12 Nov 2014 14:05:38 +0530
Message-ID: <1415781339-16089-4-git-send-email-krishna.md@samsung.com>
References: <1415781339-16089-1-git-send-email-krishna.md@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:36602 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751987AbaKLIgr (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 12 Nov 2014 03:36:47 -0500
Received: from epcpsbgr5.samsung.com
 (u145.gpu120.samsung.co.kr [203.254.230.145])
 by mailout2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0NEX0037G3X9ZUA0@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 12 Nov 2014 17:36:45 +0900 (KST)
In-reply-to: <1415781339-16089-1-git-send-email-krishna.md@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, alsa-devel@alsa-project.org
Cc: kgene.kim@samsung.com, broonie@kernel.org

Signed-off-by: Krishna Mohan Dani <krishna.md@samsung.com>
---
 sound/soc/codecs/Kconfig |    3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/sound/soc/codecs/Kconfig b/sound/soc/codecs/Kconfig
index a68d173..2d85887 100644
--- a/sound/soc/codecs/Kconfig
+++ b/sound/soc/codecs/Kconfig
@@ -487,7 +487,8 @@ config SND_SOC_RT286
 	depends on I2C
 
 config SND_SOC_RT5631
-	tristate
+	tristate "Realtek ALC5631 CODEC"
+	depends on I2C
 
 config SND_SOC_RT5640
 	tristate
-- 
1.7.9.5
