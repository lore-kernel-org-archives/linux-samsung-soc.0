From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [PATCH] ARM: S3C2440: Fixed build error for s3c244x
Date: Thu,  8 Mar 2012 01:48:36 -0800
Message-ID: <1331200116-2424-1-git-send-email-kgene.kim@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-iy0-f174.google.com ([209.85.210.174]:59172 "EHLO
	mail-iy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751644Ab2CHJtE (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 8 Mar 2012 04:49:04 -0500
Received: by iagz16 with SMTP id z16so467076iag.19
        for <linux-samsung-soc@vger.kernel.org>; Thu, 08 Mar 2012 01:49:03 -0800 (PST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: arnd@arndb.de, olof@lixom.net
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, Kukjin Kim <kgene.kim@samsung.com>

Fixed following:
arch/arm/mach-s3c2440/s3c244x.c: In function 's3c244x_restart':
arch/arm/mach-s3c2440/s3c244x.c:209: error: expected declaration or statement at end of input
make[1]: *** [arch/arm/mach-s3c24xx/s3c244x.o] Error 1
make: *** [arch/arm/mach-s3c24xx] Error 2

Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
---
Hi Arnd, Olof,

This happened when I applied Heiko's 'Fix restart on S3C2442'.
It was my fault :( and this should be sent before release v3.3.

Please pick this up.

Thanks.
Kgene.

 arch/arm/mach-s3c2440/s3c244x.c |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/arch/arm/mach-s3c2440/s3c244x.c b/arch/arm/mach-s3c2440/s3c244x.c
index 744930a..d15852f 100644
--- a/arch/arm/mach-s3c2440/s3c244x.c
+++ b/arch/arm/mach-s3c2440/s3c244x.c
@@ -207,3 +207,4 @@ void s3c244x_restart(char mode, const char *cmd)
 
 	/* we'll take a jump through zero as a poor second */
 	soft_restart(0);
+}
-- 
1.7.4.4
