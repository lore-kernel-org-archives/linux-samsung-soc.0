From: Naveen Krishna Chatradhi <ch.naveen@samsung.com>
Subject: [PATCH 7/8 v4] crypto:s5p-sss: validate iv before memcpy
Date: Wed, 15 Jan 2014 14:47:27 +0530
Message-ID: <1389777447-15225-1-git-send-email-ch.naveen@samsung.com>
References: <1389243640-13282-1-git-send-email-ch.naveen@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:21424 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750941AbaAOJRP (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 15 Jan 2014 04:17:15 -0500
In-reply-to: <1389243640-13282-1-git-send-email-ch.naveen@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-crypto@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, vzapolskiy@gmail.com, herbert@gondor.apana.org.au, naveenkrishna.ch@gmail.com, cpgs@samsung.com, tomasz.figa@gmail.com

This patch adds code to validate "iv" buffer before trying to
memcpy the contents

Signed-off-by: Naveen Krishna Chatradhi <ch.naveen@samsung.com>
---
Changes since v3:
None

 drivers/crypto/s5p-sss.c |    3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/crypto/s5p-sss.c b/drivers/crypto/s5p-sss.c
index 69130b2..f7c66c7 100644
--- a/drivers/crypto/s5p-sss.c
+++ b/drivers/crypto/s5p-sss.c
@@ -380,7 +380,8 @@ static void s5p_set_aes(struct s5p_aes_dev *dev,
 {
 	void __iomem *keystart;
 
-	memcpy(dev->aes_ioaddr + SSS_REG_AES_IV_DATA (0), iv, 0x10);
+	if (iv)
+		memcpy(dev->aes_ioaddr + SSS_REG_AES_IV_DATA (0), iv, 0x10);
 
 	if (keylen == AES_KEYSIZE_256)
 		keystart = dev->aes_ioaddr + SSS_REG_AES_KEY_DATA(0);
-- 
1.7.9.5
