From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: [PATCH 1/1] ARM: S3C24XX: Remove duplicate header file inclusion
Date: Tue, 12 Jun 2012 13:56:03 +0530
Message-ID: <1339489563-30705-1-git-send-email-sachin.kamat@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pb0-f46.google.com ([209.85.160.46]:46157 "EHLO
	mail-pb0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751181Ab2FLIhX (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 12 Jun 2012 04:37:23 -0400
Received: by pbbrp8 with SMTP id rp8so493755pbb.19
        for <linux-samsung-soc@vger.kernel.org>; Tue, 12 Jun 2012 01:37:22 -0700 (PDT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, sachin.kamat@linaro.org, patches@linaro.org

regs-clock.h header file was included twice.

Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
---
 arch/arm/mach-s3c24xx/common.c |    1 -
 1 files changed, 0 insertions(+), 1 deletions(-)

diff --git a/arch/arm/mach-s3c24xx/common.c b/arch/arm/mach-s3c24xx/common.c
index 56cdd34..0c9e9a7 100644
--- a/arch/arm/mach-s3c24xx/common.c
+++ b/arch/arm/mach-s3c24xx/common.c
@@ -41,7 +41,6 @@
 #include <asm/mach/arch.h>
 #include <asm/mach/map.h>
 
-#include <mach/regs-clock.h>
 #include <mach/regs-gpio.h>
 #include <plat/regs-serial.h>
 
-- 
1.7.4.1
