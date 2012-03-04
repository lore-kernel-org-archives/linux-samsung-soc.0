From: Heiko =?iso-8859-1?q?St=FCbner?= <heiko@sntech.de>
Subject: [PATCH 3/3] ARM: S3C24XX: remove obsolete S3C2416_DMA option
Date: Sun, 4 Mar 2012 18:45:18 +0100
Message-ID: <201203041845.18405.heiko@sntech.de>
References: <201203041842.35420.heiko@sntech.de>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from s15407518.onlinehome-server.info ([82.165.136.167]:34138 "EHLO
	s15407518.onlinehome-server.info" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1754518Ab2CDRpX (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 4 Mar 2012 12:45:23 -0500
In-Reply-To: <201203041842.35420.heiko@sntech.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: ben-linux@fluff.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org

The S3C2416 now reuses the dma selection of the S3C2443.
Therefore it is not necessary to keep the S3C2416_DMA option around.

Signed-off-by: Heiko Stuebner <heiko@sntech.de>
---
 arch/arm/Kconfig               |    1 -
 arch/arm/mach-s3c2416/Kconfig  |   14 --------------
 arch/arm/mach-s3c2416/Makefile |   12 ------------
 3 files changed, 0 insertions(+), 27 deletions(-)
 delete mode 100644 arch/arm/mach-s3c2416/Kconfig
 delete mode 100644 arch/arm/mach-s3c2416/Makefile

diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
index c0a87d0..86d0acf 100644
--- a/arch/arm/Kconfig
+++ b/arch/arm/Kconfig
@@ -1068,7 +1068,6 @@ source "arch/arm/plat-spear/Kconfig"
 source "arch/arm/mach-s3c24xx/Kconfig"
 if ARCH_S3C24XX
 source "arch/arm/mach-s3c2412/Kconfig"
-source "arch/arm/mach-s3c2416/Kconfig"
 source "arch/arm/mach-s3c2440/Kconfig"
 endif
 
diff --git a/arch/arm/mach-s3c2416/Kconfig b/arch/arm/mach-s3c2416/Kconfig
deleted file mode 100644
index faaa289..0000000
--- a/arch/arm/mach-s3c2416/Kconfig
+++ /dev/null
@@ -1,14 +0,0 @@
-# arch/arm/mach-s3c2416/Kconfig
-#
-# Copyright 2009 Yauhen Kharuzhy <jekhor@gmail.com>
-#
-# Licensed under GPLv2
-
-# note, this also supports the S3C2450 which is so similar it has the same
-# ID code as the S3C2416.
-
-config S3C2416_DMA
-	bool
-	depends on CPU_S3C2416
-	help
-	  Internal config node for S3C2416 DMA support
diff --git a/arch/arm/mach-s3c2416/Makefile b/arch/arm/mach-s3c2416/Makefile
deleted file mode 100644
index 3299f19..0000000
--- a/arch/arm/mach-s3c2416/Makefile
+++ /dev/null
@@ -1,12 +0,0 @@
-# arch/arm/mach-s3c2416/Makefile
-#
-# Copyright 2009 Yauhen Kharuzhy <jekhor@gmail.com>
-#
-# Licensed under GPLv2
-
-obj-y				:=
-obj-m				:=
-obj-n				:=
-obj-				:=
-
-#obj-$(CONFIG_S3C2416_DMA)	+= dma.o
-- 
1.7.2.3
