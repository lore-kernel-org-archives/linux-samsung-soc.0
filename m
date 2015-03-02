From: Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH 01/10] Input: s3c2410_ts: fix S3C_ADC dependency
Date: Mon,  2 Mar 2015 13:35:54 +0100
Message-ID: <1425299763-4066822-2-git-send-email-arnd@arndb.de>
References: <1425299763-4066822-1-git-send-email-arnd@arndb.de>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mout.kundenserver.de ([212.227.17.13]:53155 "EHLO
	mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751556AbbCBMh0 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 2 Mar 2015 07:37:26 -0500
In-Reply-To: <1425299763-4066822-1-git-send-email-arnd@arndb.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: Kukjin Kim <kgene@kernel.org>, linux-samsung-soc@vger.kernel.org, Maurus Cuelenaere <mcuelenaere@gmail.com>, Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, dmitry.torokhov@gmail.com, ch.naveen@samsung.com, a.kesavan@samsung.com, cw00.choi@samsung.com, jic23@kernel.org, Tomasz Figa <tomasz.figa@gmail.com>, padma.v@samsung.com, Arnd Bergmann <arnd@arndb.de>

S3C_ADC is only available on machines that don't do ARCH_MULTIPLATFORM,
so changing the 'select' into 'depends on' here helps us move to
ARCH_MULTIPLATFORM without introducing regressions.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/input/touchscreen/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/input/touchscreen/Kconfig b/drivers/input/touchscreen/Kconfig
index 58917525126e..3b4cd9ab1af0 100644
--- a/drivers/input/touchscreen/Kconfig
+++ b/drivers/input/touchscreen/Kconfig
@@ -326,7 +326,7 @@ config TOUCHSCREEN_ILI210X
 config TOUCHSCREEN_S3C2410
 	tristate "Samsung S3C2410/generic touchscreen input driver"
 	depends on ARCH_S3C24XX || SAMSUNG_DEV_TS
-	select S3C_ADC
+	depends on S3C_ADC
 	help
 	  Say Y here if you have the s3c2410 touchscreen.
 
-- 
2.1.0.rc2
