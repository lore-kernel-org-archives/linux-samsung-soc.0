From: Tushar Behera <tushar.behera@linaro.org>
Subject: [PATCH 9/9] ARM: SAMSUNG: Delete unused plat/regs-serial.h header file
Date: Mon, 30 Dec 2013 15:30:40 +0530
Message-ID: <1388397640-720-10-git-send-email-tushar.behera@linaro.org>
References: <1388397640-720-1-git-send-email-tushar.behera@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pd0-f180.google.com ([209.85.192.180]:48987 "EHLO
	mail-pd0-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754424Ab3L3KEm (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 30 Dec 2013 05:04:42 -0500
Received: by mail-pd0-f180.google.com with SMTP id q10so11249883pdj.11
        for <linux-samsung-soc@vger.kernel.org>; Mon, 30 Dec 2013 02:04:41 -0800 (PST)
In-Reply-To: <1388397640-720-1-git-send-email-tushar.behera@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com

Signed-off-by: Tushar Behera <tushar.behera@linaro.org>
---
 arch/arm/plat-samsung/include/plat/regs-serial.h |    1 -
 1 file changed, 1 deletion(-)
 delete mode 100644 arch/arm/plat-samsung/include/plat/regs-serial.h

diff --git a/arch/arm/plat-samsung/include/plat/regs-serial.h b/arch/arm/plat-samsung/include/plat/regs-serial.h
deleted file mode 100644
index f05f2af..0000000
--- a/arch/arm/plat-samsung/include/plat/regs-serial.h
+++ /dev/null
@@ -1 +0,0 @@
-#include <linux/serial_s3c.h>
-- 
1.7.9.5
