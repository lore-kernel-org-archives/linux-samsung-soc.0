From: Yauhen Kharuzhy <jekhor@gmail.com>
Subject: [PATCH v2 2/4] ARM: S3C2416: Set name of the framebuffer device only if it present
Date: Tue, 22 Jun 2010 18:22:02 +0300
Message-ID: <1277220124-16225-3-git-send-email-jekhor@gmail.com>
References: <1277220124-16225-1-git-send-email-jekhor@gmail.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-fx0-f46.google.com ([209.85.161.46]:39957 "EHLO
	mail-fx0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755768Ab0FVPYh (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 22 Jun 2010 11:24:37 -0400
Received: by fxm10 with SMTP id 10so2502417fxm.19
        for <linux-samsung-soc@vger.kernel.org>; Tue, 22 Jun 2010 08:24:35 -0700 (PDT)
In-Reply-To: <1277220124-16225-1-git-send-email-jekhor@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Ben Dooks <ben-linux@fluff.org>
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Yauhen Kharuzhy <jekhor@gmail.com>

Fix case when board doesn't have LCD connected and doesn't have
corresponding platform device compiled.

Signed-off-by: Yauhen Kharuzhy <jekhor@gmail.com>
---
 arch/arm/mach-s3c2416/s3c2416.c |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/arch/arm/mach-s3c2416/s3c2416.c b/arch/arm/mach-s3c2416/s3c2416.c
index 35dabcc..355ab62 100644
--- a/arch/arm/mach-s3c2416/s3c2416.c
+++ b/arch/arm/mach-s3c2416/s3c2416.c
@@ -90,7 +90,9 @@ int __init s3c2416_init(void)
 	s3c_i2c0_setname("s3c2440-i2c");
 	s3c_i2c1_setname("s3c2440-i2c");
 
+#ifdef CONFIG_S3C_DEV_FB
 	s3c_device_fb.name = "s3c2443-fb";
+#endif
 
 	return sysdev_register(&s3c2416_sysdev);
 }
-- 
1.7.1
