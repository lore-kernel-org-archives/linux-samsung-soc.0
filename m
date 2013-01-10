From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: [PATCH] ARM: s3c64xx: cpuidle: Fix missing header error with CONFIG_CPU_IDLE enabled
Date: Thu, 10 Jan 2013 01:39:38 +0100
Message-ID: <1357778378-5278-1-git-send-email-tomasz.figa@gmail.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ee0-f45.google.com ([74.125.83.45]:53246 "EHLO
	mail-ee0-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932224Ab3AJAks (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 9 Jan 2013 19:40:48 -0500
Received: by mail-ee0-f45.google.com with SMTP id d49so1095161eek.4
        for <linux-samsung-soc@vger.kernel.org>; Wed, 09 Jan 2013 16:40:47 -0800 (PST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, kgene.kim@samsung.com, Tomasz Figa <tomasz.figa@gmail.com>

Recently the regs-syscon-power.h header was moved from
mach-s3c64xx/include/mach to mach-s3c64xx/, but cpuidle.c was not
updated to include the header from its new location, which caused
build error with CONFIG_CPU_IDLE enabled.

This patch fixed the problem by updating the include line with
proper header location.

Signed-off-by: Tomasz Figa <tomasz.figa@gmail.com>
---
 arch/arm/mach-s3c64xx/cpuidle.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/arm/mach-s3c64xx/cpuidle.c b/arch/arm/mach-s3c64xx/cpuidle.c
index e3e455b..50c66fe 100644
--- a/arch/arm/mach-s3c64xx/cpuidle.c
+++ b/arch/arm/mach-s3c64xx/cpuidle.c
@@ -20,8 +20,7 @@
 
 #include <mach/map.h>
 
-#include <mach/regs-syscon-power.h>
-
+#include "regs-syscon-power.h"
 #include "regs-sys.h"
 
 static int s3c64xx_enter_idle(struct cpuidle_device *dev,
-- 
1.8.1
