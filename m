From: Mateusz Krawczuk <m.krawczuk@partner.samsung.com>
Subject: [PATCH] DT: if dt is available don't use s3c_arch_init
Date: Mon, 23 Sep 2013 12:14:49 +0200
Message-ID: <1379931289-29384-1-git-send-email-m.krawczuk@partner.samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:22043 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753395Ab3IWKPG (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 23 Sep 2013 06:15:06 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: kgene.kim@samsung.com
Cc: ben-linux@fluff.org, linux@arm.linux.org.uk, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, t.figa@samsung.com, m.szyprowski@samsung.com, Mateusz Krawczuk <m.krawczuk@partner.samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>

It prevents from executing platform code, when booting from device tree.

Signed-off-by: Mateusz Krawczuk <m.krawczuk@partner.samsung.com>
Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
---
 arch/arm/plat-samsung/init.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm/plat-samsung/init.c b/arch/arm/plat-samsung/init.c
index aa9511b..0ace02d 100644
--- a/arch/arm/plat-samsung/init.c
+++ b/arch/arm/plat-samsung/init.c
@@ -20,6 +20,7 @@
 #include <linux/module.h>
 #include <linux/interrupt.h>
 #include <linux/ioport.h>
+#include <linux/of.h>
 #include <linux/serial_core.h>
 #include <linux/platform_device.h>
 #include <linux/of.h>
@@ -152,6 +153,8 @@ static int __init s3c_arch_init(void)
 {
 	int ret;
 
+	if (of_have_populated_dt())
+		return 0;
 	// do the correct init for cpu
 
 	if (cpu == NULL) {
-- 
1.8.1.2
