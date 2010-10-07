From: Sangbeom Kim <sbkim73@samsung.com>
Subject: [PATCH] ARM: S5P64X0: Replace the 6440 system device class definition with 64x0
Date: Thu,  7 Oct 2010 14:09:23 +0900
Message-ID: <1286428163-18685-1-git-send-email-sbkim73@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from ganesha.gnumonks.org ([213.95.27.120]:41307 "EHLO
	ganesha.gnumonks.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752382Ab0JGFTn (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 7 Oct 2010 01:19:43 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, ben-linux@fluff.org, Abhilash Kesavan <a.kesavan@samsung.com>, Sangbeom Kim <sbkim73@samsung.com>

From: Abhilash Kesavan <a.kesavan@samsung.com>

s5p64x0_sysclass should be used in place of the obselete s5p6440_sysclass

Signed-off-by: Abhilash Kesavan <a.kesavan@samsung.com>
Signed-off-by: Sangbeom Kim <sbkim73@samsung.com>
---
 arch/arm/plat-samsung/include/plat/cpu.h |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/arch/arm/plat-samsung/include/plat/cpu.h b/arch/arm/plat-samsung/include/plat/cpu.h
index 6412933..9addb3d 100644
--- a/arch/arm/plat-samsung/include/plat/cpu.h
+++ b/arch/arm/plat-samsung/include/plat/cpu.h
@@ -79,7 +79,7 @@ extern struct sysdev_class s3c2442_sysclass;
 extern struct sysdev_class s3c2443_sysclass;
 extern struct sysdev_class s3c6410_sysclass;
 extern struct sysdev_class s3c64xx_sysclass;
-extern struct sysdev_class s5p6440_sysclass;
+extern struct sysdev_class s5p64x0_sysclass;
 extern struct sysdev_class s5p6442_sysclass;
 extern struct sysdev_class s5pv210_sysclass;
 
-- 
1.6.6.1
