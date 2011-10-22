From: Heiko =?iso-8859-1?q?St=FCbner?= <heiko@sntech.de>
Subject: [RFC][PATCH] Consolidate Samsung MAINTAINERS
Date: Sun, 23 Oct 2011 00:12:14 +0200
Message-ID: <201110230012.15273.heiko@sntech.de>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from s15407518.onlinehome-server.info ([82.165.136.167]:55052 "EHLO
	s15407518.onlinehome-server.info" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1752870Ab1JVWMY (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 22 Oct 2011 18:12:24 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>, 'Ben Dooks' <ben-linux@fluff.org>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: Heiko =?iso-8859-1?q?St=FCbner?= <heiko@sntech.de>

These days most Samsung stuff gets in the kernel through Kukjin Kim.
This patch changes MAINTAINERS to reflect this.

By adding Kukjin Kim to the maintainers for S3C2410, S3C244x and
S3C64xx alongside Ben Dooks the extra entries become identical to the
base ARM/SAMSUNG entry and can move into it.

Also the S3C2416 gets a maintainer through the s3c24* wildcard - as it
did not have one until now.

Signed-off-by: Heiko Stuebner <heiko@sntech.de>
---
 MAINTAINERS |   25 +++----------------------
 1 files changed, 3 insertions(+), 22 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 3d9b9d5..6646316 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1032,30 +1032,10 @@ S:	Maintained
 F:	arch/arm/plat-samsung/
 F:	arch/arm/plat-s3c24xx/
 F:	arch/arm/plat-s5p/
+F:	arch/arm/mach-s3c24*/
+F:	arch/arm/mach-s3c64xx/
 F:	drivers/*/*s3c2410*
 F:	drivers/*/*/*s3c2410*
-
-ARM/S3C2410 ARM ARCHITECTURE
-M:	Ben Dooks <ben-linux@fluff.org>
-L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
-W:	http://www.fluff.org/ben/linux/
-S:	Maintained
-F:	arch/arm/mach-s3c2410/
-
-ARM/S3C244x ARM ARCHITECTURE
-M:	Ben Dooks <ben-linux@fluff.org>
-L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
-W:	http://www.fluff.org/ben/linux/
-S:	Maintained
-F:	arch/arm/mach-s3c2440/
-F:	arch/arm/mach-s3c2443/
-
-ARM/S3C64xx ARM ARCHITECTURE
-M:	Ben Dooks <ben-linux@fluff.org>
-L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
-W:	http://www.fluff.org/ben/linux/
-S:	Maintained
-F:	arch/arm/mach-s3c64xx/
 
 ARM/S5P EXYNOS ARM ARCHITECTURES
 M:	Kukjin Kim <kgene.kim@samsung.com>
-- 
1.7.2.3
