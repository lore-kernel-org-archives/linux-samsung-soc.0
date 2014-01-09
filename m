From: Naveen Krishna Chatradhi <ch.naveen@samsung.com>
Subject: [PATCH 6/6 v2] crypto:s5p-sss: validate iv before memcpy
Date: Thu, 09 Jan 2014 10:30:40 +0530
Message-ID: <1389243640-13282-1-git-send-email-ch.naveen@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:49634 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750702AbaAIFAZ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 9 Jan 2014 00:00:25 -0500
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-crypto@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, vzapolskiy@gmail.com, herbert@gondor.apana.org.au, naveenkrishna.ch@gmail.com, cpgs@samsung.com, tomasz.figa@gmail.com

This patch adds code to validate "iv" buffer before trying to
memcpy the contents

Signed-off-by: Naveen Krishna Chatradhi <ch.naveen@samsung.com>
---
Changes since v1:
None

 drivers/crypto/s5p-sss.c |    5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/crypto/s5p-sss.c b/drivers/crypto/s5p-sss.c
index 7c31a5f..220f123 100644
--- a/drivers/crypto/s5p-sss.c
+++ b/drivers/crypto/s5p-sss.c
@@ -398,8 +398,9 @@ static void s5p_set_aes(struct s5p_aes_dev *dev,
 	struct samsung_aes_varient *var = dev->varient;
 	void __iomem *keystart;
 
-	memcpy(dev->ioaddr + SSS_REG_AES_IV_DATA
-				(var->aes_offset, 0), iv, 0x10);
+	if (iv)
+		memcpy(dev->ioaddr + SSS_REG_AES_IV_DATA
+					(var->aes_offset, 0), iv, 0x10);
 
 	if (keylen == AES_KEYSIZE_256)
 		keystart = dev->ioaddr +
-- 
1.7.9.5
