From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [PATCH] ARM: S5P: Remove unused s3c_pm_check_resume_pin
Date: Sat,  2 Apr 2011 10:36:14 +0900
Message-ID: <1301708174-15899-1-git-send-email-kgene.kim@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from ganesha.gnumonks.org ([213.95.27.120]:34115 "EHLO
	ganesha.gnumonks.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754298Ab1DBCIV (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 1 Apr 2011 22:08:21 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: ben-linux@fluff.org, Abhilash Kesavan <a.kesavan@samsung.com>, Kukjin Kim <kgene.kim@samsung.com>

From: Abhilash Kesavan <a.kesavan@samsung.com>

The s3c_pm_check_resume_pin() is not being used and can be safely
removed to fix the build warning.

Signed-off-by: Abhilash Kesavan <a.kesavan@samsung.com>
Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
---
 arch/arm/plat-s5p/pm.c |   11 -----------
 1 files changed, 0 insertions(+), 11 deletions(-)

diff --git a/arch/arm/plat-s5p/pm.c b/arch/arm/plat-s5p/pm.c
index d592b63..d15dc47 100644
--- a/arch/arm/plat-s5p/pm.c
+++ b/arch/arm/plat-s5p/pm.c
@@ -19,17 +19,6 @@
 
 #define PFX "s5p pm: "
 
-/* s3c_pm_check_resume_pin
- *
- * check to see if the pin is configured correctly for sleep mode, and
- * make any necessary adjustments if it is not
-*/
-
-static void s3c_pm_check_resume_pin(unsigned int pin, unsigned int irqoffs)
-{
-	/* nothing here yet */
-}
-
 /* s3c_pm_configure_extint
  *
  * configure all external interrupt pins
-- 
1.7.1
