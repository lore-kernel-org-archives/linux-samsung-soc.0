From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: [RFC PATCH 4/7] ARM: s3c64xx: Fix build error with CONFIG_S3C_DEV_FB disabled
Date: Thu, 10 Jan 2013 00:41:46 +0100
Message-ID: <1357774909-29938-5-git-send-email-tomasz.figa@gmail.com>
References: <1357774909-29938-1-git-send-email-tomasz.figa@gmail.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ee0-f54.google.com ([74.125.83.54]:57437 "EHLO
	mail-ee0-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758018Ab3AIXmH (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 9 Jan 2013 18:42:07 -0500
Received: by mail-ee0-f54.google.com with SMTP id c13so1131834eek.41
        for <linux-samsung-soc@vger.kernel.org>; Wed, 09 Jan 2013 15:42:06 -0800 (PST)
In-Reply-To: <1357774909-29938-1-git-send-email-tomasz.figa@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, devicetree-discuss@lists.ozlabs.org, kgene.kim@samsung.com, broonie@opensource.wolfsonmicro.com, kwangwoo.lee@gmail.com, jacmet@sunsite.dk, augulis.darius@gmail.com, mcuelenaere@gmail.com, linux@arm.linux.org.uk, Tomasz Figa <tomasz.figa@gmail.com>

If there is no board selecting CONFIG_S3C_DEV_FB enabled, build will fail on
arch/arm/mach-s3c64xx/pm.c, where s3c_device_fb is referenced.

This patch adds ifdef guard around the code making it compile only when
CONFIG_S3C_DEV_FB is enabled.

Signed-off-by: Tomasz Figa <tomasz.figa@gmail.com>
---
 arch/arm/mach-s3c64xx/pm.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/mach-s3c64xx/pm.c b/arch/arm/mach-s3c64xx/pm.c
index f6b13a2..3686785 100644
--- a/arch/arm/mach-s3c64xx/pm.c
+++ b/arch/arm/mach-s3c64xx/pm.c
@@ -338,10 +338,10 @@ int __init s3c64xx_pm_init(void)
 
 	for (i = 0; i < ARRAY_SIZE(s3c64xx_pm_domains); i++)
 		pm_genpd_init(&s3c64xx_pm_domains[i]->pd, NULL, false);
-
+#ifdef CONFIG_S3C_DEV_FB
 	if (dev_get_platdata(&s3c_device_fb.dev))
 		pm_genpd_add_device(&s3c64xx_pm_f.pd, &s3c_device_fb.dev);
-
+#endif
 	return 0;
 }
 
-- 
1.8.1
