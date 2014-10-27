From: Krishna Mohan Dani <krishna.md@samsung.com>
Subject: [PATCH 3/4] Sound: Kconfig: Adding the description of the codec
Date: Mon, 27 Oct 2014 11:41:10 +0530
Message-ID: <1414390271-25040-4-git-send-email-krishna.md@samsung.com>
References: <1414390271-25040-1-git-send-email-krishna.md@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:37758 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750965AbaJ0GNn (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 27 Oct 2014 02:13:43 -0400
Received: from epcpsbgr4.samsung.com
 (u144.gpu120.samsung.co.kr [203.254.230.144])
 by mailout3.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0NE3006IQAMUS410@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 27 Oct 2014 15:13:42 +0900 (KST)
In-reply-to: <1414390271-25040-1-git-send-email-krishna.md@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: kgene.kim@samsung.com, broonie@linaro.org, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org

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
