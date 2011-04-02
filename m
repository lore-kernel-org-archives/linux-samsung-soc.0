From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [PATCH] ARM: SAMSUNG: Fix build failure in PM CRC check code
Date: Sat,  2 Apr 2011 10:46:36 +0900
Message-ID: <1301708796-30069-1-git-send-email-kgene.kim@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from ganesha.gnumonks.org ([213.95.27.120]:34756 "EHLO
	ganesha.gnumonks.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752638Ab1DBCSV (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 1 Apr 2011 22:18:21 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: ben-linux@fluff.org, Abhilash Kesavan <a.kesavan@samsung.com>, Russell King <rmk+kernel@arm.linux.org.uk>, Kukjin Kim <kgene.kim@samsung.com>

From: Abhilash Kesavan <a.kesavan@samsung.com>

This patch fixes build error that occurs on enabling the Samsung
specific PM CRC check code. Missed removing this reference of
s3c_sleep_save_phys during move to generic cpu suspend/resume
support.

Signed-off-by: Abhilash Kesavan <a.kesavan@samsung.com>
Cc: Russell King <rmk+kernel@arm.linux.org.uk>
Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
---
 arch/arm/plat-samsung/pm-check.c |    6 ------
 1 files changed, 0 insertions(+), 6 deletions(-)

diff --git a/arch/arm/plat-samsung/pm-check.c b/arch/arm/plat-samsung/pm-check.c
index e4baf76..6b733fa 100644
--- a/arch/arm/plat-samsung/pm-check.c
+++ b/arch/arm/plat-samsung/pm-check.c
@@ -164,7 +164,6 @@ static inline int in_region(void *ptr, int size, void *what, size_t whatsz)
  */
 static u32 *s3c_pm_runcheck(struct resource *res, u32 *val)
 {
-	void *save_at = phys_to_virt(s3c_sleep_save_phys);
 	unsigned long addr;
 	unsigned long left;
 	void *stkpage;
@@ -192,11 +191,6 @@ static u32 *s3c_pm_runcheck(struct resource *res, u32 *val)
 			goto skip_check;
 		}
 
-		if (in_region(ptr, left, save_at, 32*4 )) {
-			S3C_PMDBG("skipping %08lx, has save block in\n", addr);
-			goto skip_check;
-		}
-
 		/* calculate and check the checksum */
 
 		calc = crc32_le(~0, ptr, left);
-- 
1.7.1
