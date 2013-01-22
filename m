From: Chen Gang <gang.chen@asianux.com>
Subject: [PATCH v2] ARM: plat-samsung: using vsnprintf instead of vsprintf
 for the limit buffer length 256
Date: Tue, 22 Jan 2013 11:54:51 +0800
Message-ID: <50FE0D8B.7010908@asianux.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=GB2312
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from intranet.asianux.com ([58.214.24.6]:20531 "EHLO
	intranet.asianux.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752645Ab3AVDyF (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 21 Jan 2013 22:54:05 -0500
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: kgene.kim@samsung.com, ben-linux@fluff.org, Russell King - ARM Linux <linux@arm.linux.org.uk>
Cc: Ben Dooks <ben@fluff.org>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org


  the buff is 256 limited, so need use vsnprintf instead of vsprintf

Signed-off-by: Chen Gang <gang.chen@asianux.com>
Cc: Ben Dooks <ben@fluff.org>
---
 arch/arm/plat-samsung/pm.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/plat-samsung/pm.c b/arch/arm/plat-samsung/pm.c
index 1507028..d896add 100644
--- a/arch/arm/plat-samsung/pm.c
+++ b/arch/arm/plat-samsung/pm.c
@@ -51,7 +51,7 @@ void s3c_pm_dbg(const char *fmt, ...)
 	char buff[256];
 
 	va_start(va, fmt);
-	vsprintf(buff, fmt, va);
+	vsnprintf(buff, sizeof(buff), fmt, va);
 	va_end(va);
 
 	printascii(buff);
-- 
1.7.10.4
