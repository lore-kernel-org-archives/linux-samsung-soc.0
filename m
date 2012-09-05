From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: [PATCH 2/2] ARM: S3C24XX: Use module_platform_driver macro in mach-osiris-dvs.c
Date: Wed,  5 Sep 2012 15:09:29 +0530
Message-ID: <1346837969-11344-2-git-send-email-sachin.kamat@linaro.org>
References: <1346837969-11344-1-git-send-email-sachin.kamat@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pb0-f46.google.com ([209.85.160.46]:41290 "EHLO
	mail-pb0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751429Ab2IEJmU (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 5 Sep 2012 05:42:20 -0400
Received: by mail-pb0-f46.google.com with SMTP id rr13so648137pbb.19
        for <linux-samsung-soc@vger.kernel.org>; Wed, 05 Sep 2012 02:42:20 -0700 (PDT)
In-Reply-To: <1346837969-11344-1-git-send-email-sachin.kamat@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, sachin.kamat@linaro.org, patches@linaro.org

module_platform_driver simplifies the code by eliminating
module_init and module_exit calls.

Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
---
 arch/arm/mach-s3c24xx/mach-osiris-dvs.c |   13 +------------
 1 files changed, 1 insertions(+), 12 deletions(-)

diff --git a/arch/arm/mach-s3c24xx/mach-osiris-dvs.c b/arch/arm/mach-s3c24xx/mach-osiris-dvs.c
index ad2792d..5876c6b 100644
--- a/arch/arm/mach-s3c24xx/mach-osiris-dvs.c
+++ b/arch/arm/mach-s3c24xx/mach-osiris-dvs.c
@@ -175,18 +175,7 @@ static struct platform_driver osiris_dvs_driver = {
 	},
 };
 
-static int __init osiris_dvs_init(void)
-{
-	return platform_driver_register(&osiris_dvs_driver);
-}
-
-static void __exit osiris_dvs_exit(void)
-{
-	platform_driver_unregister(&osiris_dvs_driver);
-}
-
-module_init(osiris_dvs_init);
-module_exit(osiris_dvs_exit);
+module_platform_driver(osiris_dvs_driver);
 
 MODULE_DESCRIPTION("Simtec OSIRIS DVS support");
 MODULE_AUTHOR("Ben Dooks <ben@simtec.co.uk>");
-- 
1.7.4.1
