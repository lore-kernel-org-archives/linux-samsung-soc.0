From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [PATCH] ARM: SAMSUNG: Removed redunt zreladdr in Makefile.boot
Date: Fri,  3 Sep 2010 08:27:23 +0900
Message-ID: <1283470043-16050-1-git-send-email-kgene.kim@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from ganesha.gnumonks.org ([213.95.27.120]:51611 "EHLO
	ganesha.gnumonks.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755227Ab0IBXkq (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 2 Sep 2010 19:40:46 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: ben-linux@fluff.org, Kukjin Kim <kgene.kim@samsung.com>

Because can be calculated ZREADDR now, removed redunt zreladdr
definitions in each Makefile.boot of Samsung architectures.

Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
Cc: Ben Dooks <ben-linux@fluff.org>
---
 arch/arm/mach-s3c2410/Makefile.boot |    2 --
 arch/arm/mach-s3c64xx/Makefile.boot |    1 -
 arch/arm/mach-s5p6440/Makefile.boot |    1 -
 arch/arm/mach-s5p6442/Makefile.boot |    1 -
 arch/arm/mach-s5pc100/Makefile.boot |    1 -
 arch/arm/mach-s5pv210/Makefile.boot |    1 -
 arch/arm/mach-s5pv310/Makefile.boot |    1 -
 7 files changed, 0 insertions(+), 8 deletions(-)

diff --git a/arch/arm/mach-s3c2410/Makefile.boot b/arch/arm/mach-s3c2410/Makefile.boot
index 58c1dd7..69dbda1 100644
--- a/arch/arm/mach-s3c2410/Makefile.boot
+++ b/arch/arm/mach-s3c2410/Makefile.boot
@@ -1,7 +1,5 @@
 ifeq ($(CONFIG_PM_H1940),y)
-	zreladdr-y		:= 0x30108000
 	params_phys-y	:= 0x30100100
 else
-	zreladdr-y		:= 0x30008000
 	params_phys-y	:= 0x30000100
 endif
diff --git a/arch/arm/mach-s3c64xx/Makefile.boot b/arch/arm/mach-s3c64xx/Makefile.boot
index ba41fdc..b6349bd 100644
--- a/arch/arm/mach-s3c64xx/Makefile.boot
+++ b/arch/arm/mach-s3c64xx/Makefile.boot
@@ -1,2 +1 @@
-   zreladdr-y	:= 0x50008000
 params_phys-y	:= 0x50000100
diff --git a/arch/arm/mach-s5p6440/Makefile.boot b/arch/arm/mach-s5p6440/Makefile.boot
index ff90aa1..9a79532 100644
--- a/arch/arm/mach-s5p6440/Makefile.boot
+++ b/arch/arm/mach-s5p6440/Makefile.boot
@@ -1,2 +1 @@
-   zreladdr-y	:= 0x20008000
 params_phys-y	:= 0x20000100
diff --git a/arch/arm/mach-s5p6442/Makefile.boot b/arch/arm/mach-s5p6442/Makefile.boot
index ff90aa1..9a79532 100644
--- a/arch/arm/mach-s5p6442/Makefile.boot
+++ b/arch/arm/mach-s5p6442/Makefile.boot
@@ -1,2 +1 @@
-   zreladdr-y	:= 0x20008000
 params_phys-y	:= 0x20000100
diff --git a/arch/arm/mach-s5pc100/Makefile.boot b/arch/arm/mach-s5pc100/Makefile.boot
index ff90aa1..9a79532 100644
--- a/arch/arm/mach-s5pc100/Makefile.boot
+++ b/arch/arm/mach-s5pc100/Makefile.boot
@@ -1,2 +1 @@
-   zreladdr-y	:= 0x20008000
 params_phys-y	:= 0x20000100
diff --git a/arch/arm/mach-s5pv210/Makefile.boot b/arch/arm/mach-s5pv210/Makefile.boot
index ff90aa1..9a79532 100644
--- a/arch/arm/mach-s5pv210/Makefile.boot
+++ b/arch/arm/mach-s5pv210/Makefile.boot
@@ -1,2 +1 @@
-   zreladdr-y	:= 0x20008000
 params_phys-y	:= 0x20000100
diff --git a/arch/arm/mach-s5pv310/Makefile.boot b/arch/arm/mach-s5pv310/Makefile.boot
index d65956f..85644bc 100644
--- a/arch/arm/mach-s5pv310/Makefile.boot
+++ b/arch/arm/mach-s5pv310/Makefile.boot
@@ -1,2 +1 @@
-   zreladdr-y	:= 0x40008000
 params_phys-y	:= 0x40000100
-- 
1.6.2.5
