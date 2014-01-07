From: Tushar Behera <tushar.behera@linaro.org>
Subject: [PATCH V2 1/3] ARM: SAMSUNG: Remove platform dependency from samsung.S
Date: Tue,  7 Jan 2014 11:23:15 +0530
Message-ID: <1389073997-30763-2-git-send-email-tushar.behera@linaro.org>
References: <1388397640-720-1-git-send-email-tushar.behera@linaro.org>
 <1389073997-30763-1-git-send-email-tushar.behera@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pb0-f46.google.com ([209.85.160.46]:40717 "EHLO
	mail-pb0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750854AbaAGF5R (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 7 Jan 2014 00:57:17 -0500
Received: by mail-pb0-f46.google.com with SMTP id md12so19369906pbc.19
        for <linux-samsung-soc@vger.kernel.org>; Mon, 06 Jan 2014 21:57:16 -0800 (PST)
In-Reply-To: <1389073997-30763-1-git-send-email-tushar.behera@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, broonie@linaro.org, Sachin Kamat <sachin.kamat@linaro.org>

From: Sachin Kamat <sachin.kamat@linaro.org>

regs-serial.h only includes linux/serial_s3c.h. Include this
header directly in samsung.S to remove unnecessary platform
dependency.

Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
Signed-off-by: Tushar Behera <tushar.behera@linaro.org>
---
 arch/arm/include/debug/samsung.S |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/include/debug/samsung.S b/arch/arm/include/debug/samsung.S
index f3a9cff..8d8d922 100644
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
