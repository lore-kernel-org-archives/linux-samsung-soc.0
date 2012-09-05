From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: [PATCH 1/2] ARM: S3C24XX: Use module_platform_driver macro in h1940-bluetooth.c
Date: Wed,  5 Sep 2012 15:09:28 +0530
Message-ID: <1346837969-11344-1-git-send-email-sachin.kamat@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pb0-f46.google.com ([209.85.160.46]:41290 "EHLO
	mail-pb0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751429Ab2IEJmQ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 5 Sep 2012 05:42:16 -0400
Received: by pbbrr13 with SMTP id rr13so648137pbb.19
        for <linux-samsung-soc@vger.kernel.org>; Wed, 05 Sep 2012 02:42:16 -0700 (PDT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, sachin.kamat@linaro.org, patches@linaro.org

module_platform_driver simplifies the code by eliminating
module_init and module_exit calls.

Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
---
 arch/arm/mach-s3c24xx/h1940-bluetooth.c |   14 +-------------
 1 files changed, 1 insertions(+), 13 deletions(-)

diff --git a/arch/arm/mach-s3c24xx/h1940-bluetooth.c b/arch/arm/mach-s3c24xx/h1940-bluetooth.c
index a5eeb62..57aee91 100644
--- a/arch/arm/mach-s3c24xx/h1940-bluetooth.c
+++ b/arch/arm/mach-s3c24xx/h1940-bluetooth.c
@@ -138,19 +138,7 @@ static struct platform_driver h1940bt_driver = {
 	.remove		= h1940bt_remove,
 };
 
-
-static int __init h1940bt_init(void)
-{
-	return platform_driver_register(&h1940bt_driver);
-}
-
-static void __exit h1940bt_exit(void)
-{
-	platform_driver_unregister(&h1940bt_driver);
-}
-
-module_init(h1940bt_init);
-module_exit(h1940bt_exit);
+module_platform_driver(h1940bt_driver);
 
 MODULE_AUTHOR("Arnaud Patard <arnaud.patard@rtp-net.org>");
 MODULE_DESCRIPTION("Driver for the iPAQ H1940 bluetooth chip");
-- 
1.7.4.1
