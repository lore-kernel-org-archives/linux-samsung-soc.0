From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [PATCH 17/17] ASoC: Samsung: remove s5pc100 related codes
Date: Tue, 01 Jul 2014 06:32:27 +0900
Message-ID: <1404163947-3105-18-git-send-email-kgene.kim@samsung.com>
References: <1404163947-3105-1-git-send-email-kgene.kim@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:60295 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752526AbaF3NTQ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 30 Jun 2014 09:19:16 -0400
Received: from epcpsbgr4.samsung.com
 (u144.gpu120.samsung.co.kr [203.254.230.144])
 by mailout3.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0N7Z003XHGZVL660@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 30 Jun 2014 22:19:07 +0900 (KST)
In-reply-to: <1404163947-3105-1-git-send-email-kgene.kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: Kukjin Kim <kgene.kim@samsung.com>, Mark Brown <broonie@linaro.org>

This patch removes s5pc100 related codes in
<linux/platform_data/asoc-s3c.h>.

Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
Cc: Mark Brown <broonie@linaro.org>
---
 include/linux/platform_data/asoc-s3c.h |    9 ---------
 1 file changed, 9 deletions(-)

diff --git a/include/linux/platform_data/asoc-s3c.h b/include/linux/platform_data/asoc-s3c.h
index 709c6f7..a6591c6 100644
--- a/include/linux/platform_data/asoc-s3c.h
+++ b/include/linux/platform_data/asoc-s3c.h
@@ -15,15 +15,6 @@
 #define S3C64XX_AC97_GPE  1
 extern void s3c64xx_ac97_setup_gpio(int);
 
-/*
- * The machine init code calls s5p*_spdif_setup_gpio with
- * one of these defines in order to select appropriate bank
- * of GPIO for S/PDIF pins
- */
-#define S5PC100_SPDIF_GPD  0
-#define S5PC100_SPDIF_GPG3 1
-extern void s5pc100_spdif_setup_gpio(int);
-
 struct samsung_i2s {
 /* If the Primary DAI has 5.1 Channels */
 #define QUIRK_PRI_6CHAN		(1 << 0)
-- 
1.7.10.4
