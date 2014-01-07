From: Tushar Behera <tushar.behera@linaro.org>
Subject: [PATCH V2 3/3] ARM: SAMSUNG: Delete unused plat/regs-serial.h header file
Date: Tue,  7 Jan 2014 11:23:17 +0530
Message-ID: <1389073997-30763-4-git-send-email-tushar.behera@linaro.org>
References: <1388397640-720-1-git-send-email-tushar.behera@linaro.org>
 <1389073997-30763-1-git-send-email-tushar.behera@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pd0-f171.google.com ([209.85.192.171]:45623 "EHLO
	mail-pd0-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750854AbaAGF5W (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 7 Jan 2014 00:57:22 -0500
Received: by mail-pd0-f171.google.com with SMTP id z10so19095152pdj.30
        for <linux-samsung-soc@vger.kernel.org>; Mon, 06 Jan 2014 21:57:21 -0800 (PST)
In-Reply-To: <1389073997-30763-1-git-send-email-tushar.behera@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, broonie@linaro.org

There are no more users of this file, it can be deleted now.

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
