From: Sangbeom Kim <sbkim73@samsung.com>
Subject: [PATCH] ARM: S5PV210: Fix sysdev related warning messages
Date: Wed, 17 Nov 2010 15:21:22 +0900
Message-ID: <1289974882-14711-1-git-send-email-sbkim73@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from ganesha.gnumonks.org ([213.95.27.120]:48934 "EHLO
	ganesha.gnumonks.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755630Ab0KQGex (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 17 Nov 2010 01:34:53 -0500
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: Kukjin Kim <kgene.kim@samsung.com>, ben-linux@fluff.org, Abhilash Kesavan <a.kesavan@samsung.com>, Sangbeom Kim <sbkim73@samsung.com>

From: Abhilash Kesavan <a.kesavan@samsung.com>

This patch fixes following warning messages when CONFIG_PM selected.

In file included from arch/arm/mach-s5pv210/mach-smdkv210.c:34:
arch/arm/plat-samsung/include/plat/pm.h:104: warning: 'struct sys_device' declared inside parameter list
arch/arm/plat-samsung/include/plat/pm.h:104: warning: its scope is only this definition or declaration, which is probably not what you want
arch/arm/plat-samsung/include/plat/pm.h:105: warning: 'struct sys_device' declared inside parameter list

In file included from arch/arm/mach-s5pv210/mach-smdkc110.c:31:
arch/arm/plat-samsung/include/plat/pm.h:104: warning: 'struct sys_device' declared inside parameter list
arch/arm/plat-samsung/include/plat/pm.h:104: warning: its scope is only this definition or declaration, which is probably not what you want
arch/arm/plat-samsung/include/plat/pm.h:105: warning: 'struct sys_device' declared inside parameter list
arch/arm/plat-samsung/pm.c:217: warning: 's3c_pm_show_resume_irqs' defined but not used

Signed-off-by: Abhilash Kesavan <a.kesavan@samsung.com>
Signed-off-by: Sangbeom Kim <sbkim73@samsung.com>
---
 arch/arm/mach-s5pv210/mach-smdkc110.c |    1 +
 arch/arm/mach-s5pv210/mach-smdkv210.c |    1 +
 2 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/arch/arm/mach-s5pv210/mach-smdkc110.c b/arch/arm/mach-s5pv210/mach-smdkc110.c
index 0ad7924..5dd1681 100644
--- a/arch/arm/mach-s5pv210/mach-smdkc110.c
+++ b/arch/arm/mach-s5pv210/mach-smdkc110.c
@@ -13,6 +13,7 @@
 #include <linux/init.h>
 #include <linux/serial_core.h>
 #include <linux/i2c.h>
+#include <linux/sysdev.h>
 
 #include <asm/mach/arch.h>
 #include <asm/mach/map.h>
diff --git a/arch/arm/mach-s5pv210/mach-smdkv210.c b/arch/arm/mach-s5pv210/mach-smdkv210.c
index bcd7a5d..1fbc45b 100644
--- a/arch/arm/mach-s5pv210/mach-smdkv210.c
+++ b/arch/arm/mach-s5pv210/mach-smdkv210.c
@@ -13,6 +13,7 @@
 #include <linux/i2c.h>
 #include <linux/init.h>
 #include <linux/serial_core.h>
+#include <linux/sysdev.h>
 
 #include <asm/mach/arch.h>
 #include <asm/mach/map.h>
-- 
1.6.2.5
