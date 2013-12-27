From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: [PATCH 1/1] ARM: SAMSUNG: Remove platform dependency from samsung.S
Date: Fri, 27 Dec 2013 14:34:08 +0530
Message-ID: <1388135048-12158-1-git-send-email-sachin.kamat@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pb0-f42.google.com ([209.85.160.42]:35745 "EHLO
	mail-pb0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754060Ab3L0JHj (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 27 Dec 2013 04:07:39 -0500
Received: by mail-pb0-f42.google.com with SMTP id uo5so9106670pbc.29
        for <linux-samsung-soc@vger.kernel.org>; Fri, 27 Dec 2013 01:07:39 -0800 (PST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, sachin.kamat@linaro.org

regs-serial.h only includes linux/serial_s3c.h. Include this
header directly in samsung.S to remove unnecessary platform
dependency.

Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
---
 arch/arm/include/debug/samsung.S |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/include/debug/samsung.S b/arch/arm/include/debug/samsung.S
index f3a9cff6d5d4..8d8d922e5e44 100644
--- a/arch/arm/include/debug/samsung.S
+++ b/arch/arm/include/debug/samsung.S
@@ -9,7 +9,7 @@
  * published by the Free Software Foundation.
 */
 
-#include <plat/regs-serial.h>
+#include <linux/serial_s3c.h>
 
 /* The S5PV210/S5PC110 implementations are as belows. */
 
-- 
1.7.9.5
