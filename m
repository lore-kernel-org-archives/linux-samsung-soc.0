From: Krishna Mohan Dani <krishna.md@samsung.com>
Subject: [PATCH 3/4] Sound: Kconfig: Adding the description of the codec
Date: Tue, 11 Nov 2014 14:28:23 +0530
Message-ID: <1415696304-12023-4-git-send-email-krishna.md@samsung.com>
References: <1415696304-12023-1-git-send-email-krishna.md@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:48705 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751905AbaKKI7R (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 11 Nov 2014 03:59:17 -0500
Received: from epcpsbgr1.samsung.com
 (u141.gpu120.samsung.co.kr [203.254.230.141])
 by mailout3.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0NEV00K01AAS1NA0@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 11 Nov 2014 17:59:16 +0900 (KST)
In-reply-to: <1415696304-12023-1-git-send-email-krishna.md@samsung.com>
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
