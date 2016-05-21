From: Andrea Gelmini <andrea.gelmini@gelma.net>
Subject: [PATCH 0119/1529] Fix typo
Date: Sat, 21 May 2016 13:51:43 +0200
Message-ID: <20160521115143.5598-1-andrea.gelmini@gelma.net>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-lf0-f68.google.com ([209.85.215.68]:32902 "EHLO
	mail-lf0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751758AbcEULvu (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 21 May 2016 07:51:50 -0400
Received: by mail-lf0-f68.google.com with SMTP id z203so630527lfd.0
        for <linux-samsung-soc@vger.kernel.org>; Sat, 21 May 2016 04:51:49 -0700 (PDT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: andrea.gelmini@gelma.net
Cc: trivial@kernel.org, kgene@kernel.org, k.kozlowski@samsung.com, linux@armlinux.org.uk, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org

Signed-off-by: Andrea Gelmini <andrea.gelmini@gelma.net>
---
 arch/arm/mach-s3c24xx/mach-osiris-dvs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/mach-s3c24xx/mach-osiris-dvs.c b/arch/arm/mach-s3c24xx/mach-osiris-dvs.c
index ce2db23..262ab07 100644
--- a/arch/arm/mach-s3c24xx/mach-osiris-dvs.c
+++ b/arch/arm/mach-s3c24xx/mach-osiris-dvs.c
@@ -143,7 +143,7 @@ static int osiris_dvs_remove(struct platform_device *pdev)
 	return 0;
 }
 
-/* the CONFIG_PM block is so small, it isn't worth actaully compiling it
+/* the CONFIG_PM block is so small, it isn't worth actually compiling it
  * out if the configuration isn't set. */
 
 static int osiris_dvs_suspend(struct device *dev)
-- 
2.8.2.534.g1f66975
