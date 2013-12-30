From: Tushar Behera <tushar.behera@linaro.org>
Subject: [PATCH 1/9] ARM: SAMSUNG: Remove platform dependency from samsung.S
Date: Mon, 30 Dec 2013 15:30:32 +0530
Message-ID: <1388397640-720-2-git-send-email-tushar.behera@linaro.org>
References: <1388397640-720-1-git-send-email-tushar.behera@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pa0-f51.google.com ([209.85.220.51]:64565 "EHLO
	mail-pa0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751702Ab3L3KEU (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 30 Dec 2013 05:04:20 -0500
Received: by mail-pa0-f51.google.com with SMTP id fa1so11512111pad.38
        for <linux-samsung-soc@vger.kernel.org>; Mon, 30 Dec 2013 02:04:19 -0800 (PST)
In-Reply-To: <1388397640-720-1-git-send-email-tushar.behera@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, Sachin Kamat <sachin.kamat@linaro.org>

From: Sachin Kamat <sachin.kamat@linaro.org>

regs-serial.h only includes linux/serial_s3c.h. Include this
header directly in samsung.S to remove unnecessary platform
dependency.

Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
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
