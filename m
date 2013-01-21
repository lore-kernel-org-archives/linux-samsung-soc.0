From: Chen Gang <gang.chen@asianux.com>
Subject: [PATCH] ARM: plat-samsung: using vsnprintf instead of vsprintf for
 the limit buffer length 256
Date: Mon, 21 Jan 2013 18:25:18 +0800
Message-ID: <50FD178E.9090105@asianux.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=GB2312
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from intranet.asianux.com ([58.214.24.6]:11738 "EHLO
	intranet.asianux.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751874Ab3AUKYc (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 21 Jan 2013 05:24:32 -0500
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: kgene.kim@samsung.com, ben-linux@fluff.org, linux@arm.linux.org.uk
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org


  the buff size is 256, so need use vsnprintf instead of vsprintf.

Signed-off-by: Chen Gang <gang.chen@asianux.com>
---
 arch/arm/plat-samsung/pm.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/plat-samsung/pm.c b/arch/arm/plat-samsung/pm.c
index 1507028..8d07b45 100644
--- a/arch/arm/plat-samsung/pm.c
+++ b/arch/arm/plat-samsung/pm.c
@@ -51,7 +51,7 @@ void s3c_pm_dbg(const char *fmt, ...)
 	char buff[256];
 
 	va_start(va, fmt);
-	vsprintf(buff, fmt, va);
+	vsnprintf(buff, 256, fmt, va);
 	va_end(va);
 
 	printascii(buff);
-- 
1.7.10.4
