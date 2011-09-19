From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [PATCH] ARM: SAMSUNG: Cleanup mach/clkdev.h
Date: Mon, 19 Sep 2011 20:36:26 +0900
Message-ID: <002001cc76c0$5e236c80$1a6a4580$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:19940 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755699Ab1ISLg3 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 19 Sep 2011 07:36:29 -0400
Received: from epcpsbgm2.samsung.com (mailout1.samsung.com [203.254.224.24])
 by mailout1.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LRR00EEUPKJZO10@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 19 Sep 2011 20:36:27 +0900 (KST)
Received: from kgenekim (12-23-120-114.csky.net [12.23.120.114])
 by mmp2.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0LRR00GOPPKR9R@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 19 Sep 2011 20:36:27 +0900 (KST)
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: ben-linux@fluff.org

According to commit a3831cf ("ARM: Consolidate the
clkdev header files"), current mach/clkdev.h is no
needed in Samsung stuff.

Cc: Ben Dooks <ben-linux@fluff.org>
Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
---
 arch/arm/mach-exynos4/include/mach/clkdev.h |    7 -------
 arch/arm/mach-s3c64xx/include/mach/clkdev.h |    7 -------
 arch/arm/mach-s5p64x0/include/mach/clkdev.h |    7 -------
 arch/arm/mach-s5pc100/include/mach/clkdev.h |    7 -------
 arch/arm/mach-s5pv210/include/mach/clkdev.h |    7 -------
 arch/arm/plat-s3c24xx/include/mach/clkdev.h |    7 -------
 6 files changed, 0 insertions(+), 42 deletions(-)
 delete mode 100644 arch/arm/mach-exynos4/include/mach/clkdev.h
 delete mode 100644 arch/arm/mach-s3c64xx/include/mach/clkdev.h
 delete mode 100644 arch/arm/mach-s5p64x0/include/mach/clkdev.h
 delete mode 100644 arch/arm/mach-s5pc100/include/mach/clkdev.h
 delete mode 100644 arch/arm/mach-s5pv210/include/mach/clkdev.h
 delete mode 100644 arch/arm/plat-s3c24xx/include/mach/clkdev.h

diff --git a/arch/arm/mach-exynos4/include/mach/clkdev.h
b/arch/arm/mach-exynos4/include/mach/clkdev.h
deleted file mode 100644
index 7dffa83..0000000
--- a/arch/arm/mach-exynos4/include/mach/clkdev.h
+++ /dev/null
@@ -1,7 +0,0 @@
-#ifndef __MACH_CLKDEV_H__
-#define __MACH_CLKDEV_H__
-
-#define __clk_get(clk) ({ 1; })
-#define __clk_put(clk) do {} while (0)
-
-#endif
diff --git a/arch/arm/mach-s3c64xx/include/mach/clkdev.h
b/arch/arm/mach-s3c64xx/include/mach/clkdev.h
deleted file mode 100644
index 7dffa83..0000000
--- a/arch/arm/mach-s3c64xx/include/mach/clkdev.h
+++ /dev/null
@@ -1,7 +0,0 @@
-#ifndef __MACH_CLKDEV_H__
-#define __MACH_CLKDEV_H__
-
-#define __clk_get(clk) ({ 1; })
-#define __clk_put(clk) do {} while (0)
-
-#endif
diff --git a/arch/arm/mach-s5p64x0/include/mach/clkdev.h
b/arch/arm/mach-s5p64x0/include/mach/clkdev.h
deleted file mode 100644
index 7dffa83..0000000
--- a/arch/arm/mach-s5p64x0/include/mach/clkdev.h
+++ /dev/null
@@ -1,7 +0,0 @@
-#ifndef __MACH_CLKDEV_H__
-#define __MACH_CLKDEV_H__
-
-#define __clk_get(clk) ({ 1; })
-#define __clk_put(clk) do {} while (0)
-
-#endif
diff --git a/arch/arm/mach-s5pc100/include/mach/clkdev.h
b/arch/arm/mach-s5pc100/include/mach/clkdev.h
deleted file mode 100644
index 7dffa83..0000000
--- a/arch/arm/mach-s5pc100/include/mach/clkdev.h
+++ /dev/null
@@ -1,7 +0,0 @@
-#ifndef __MACH_CLKDEV_H__
-#define __MACH_CLKDEV_H__
-
-#define __clk_get(clk) ({ 1; })
-#define __clk_put(clk) do {} while (0)
-
-#endif
diff --git a/arch/arm/mach-s5pv210/include/mach/clkdev.h
b/arch/arm/mach-s5pv210/include/mach/clkdev.h
deleted file mode 100644
index 7dffa83..0000000
--- a/arch/arm/mach-s5pv210/include/mach/clkdev.h
+++ /dev/null
@@ -1,7 +0,0 @@
-#ifndef __MACH_CLKDEV_H__
-#define __MACH_CLKDEV_H__
-
-#define __clk_get(clk) ({ 1; })
-#define __clk_put(clk) do {} while (0)
-
-#endif
diff --git a/arch/arm/plat-s3c24xx/include/mach/clkdev.h
b/arch/arm/plat-s3c24xx/include/mach/clkdev.h
deleted file mode 100644
index 7dffa83..0000000
--- a/arch/arm/plat-s3c24xx/include/mach/clkdev.h
+++ /dev/null
@@ -1,7 +0,0 @@
-#ifndef __MACH_CLKDEV_H__
-#define __MACH_CLKDEV_H__
-
-#define __clk_get(clk) ({ 1; })
-#define __clk_put(clk) do {} while (0)
-
-#endif
-- 
1.7.1
