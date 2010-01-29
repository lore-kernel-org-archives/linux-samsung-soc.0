From: Ben Dooks <ben-linux@fluff.org>
Subject: [PATCH] ARM: SAMSUNG: Move DMA support to plat-samsung
Date: Fri, 29 Jan 2010 09:02:15 +0000
Message-ID: <1264755741-16184-5-git-send-email-ben-linux@fluff.org>
References: <1264755741-16184-1-git-send-email-ben-linux@fluff.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from trinity.fluff.org ([89.16.178.74]:33770 "EHLO trinity.fluff.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1756679Ab0A2JCi (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 29 Jan 2010 04:02:38 -0500
In-Reply-To: <1264755741-16184-1-git-send-email-ben-linux@fluff.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: Ben Dooks <ben-linux@fluff.org>

Move the core of the DMA support to plat-samsung for everyone to use.

Signed-off-by: Ben Dooks <ben-linux@fluff.org>
---
 arch/arm/plat-s3c/Makefile                         |    4 ----
 arch/arm/plat-samsung/Makefile                     |    4 ++++
 arch/arm/{plat-s3c => plat-samsung}/dma.c          |    0
 .../{plat-s3c => plat-samsung}/include/plat/dma.h  |    2 +-
 4 files changed, 5 insertions(+), 5 deletions(-)
 rename arch/arm/{plat-s3c => plat-samsung}/dma.c (100%)
 rename arch/arm/{plat-s3c => plat-samsung}/include/plat/dma.h (98%)

diff --git a/arch/arm/plat-s3c/Makefile b/arch/arm/plat-s3c/Makefile
index 197b9bd..2a3c4a4 100644
--- a/arch/arm/plat-s3c/Makefile
+++ b/arch/arm/plat-s3c/Makefile
@@ -13,7 +13,3 @@ obj-				:=
 
 obj-y				+= init.o
 obj-y				+= time.o
-
-# DMA support
-
-obj-$(CONFIG_S3C_DMA)		+= dma.o
diff --git a/arch/arm/plat-samsung/Makefile b/arch/arm/plat-samsung/Makefile
index 629fd9f..facc7e3 100644
--- a/arch/arm/plat-samsung/Makefile
+++ b/arch/arm/plat-samsung/Makefile
@@ -39,6 +39,10 @@ obj-$(CONFIG_S3C_DEV_USB_HOST)	+= dev-usb.o
 obj-$(CONFIG_S3C_DEV_USB_HSOTG)	+= dev-usb-hsotg.o
 obj-$(CONFIG_S3C_DEV_NAND)	+= dev-nand.o
 
+# DMA support
+
+obj-$(CONFIG_S3C_DMA)		+= dma.o
+
 # PM support
 
 obj-$(CONFIG_PM)		+= pm.o
diff --git a/arch/arm/plat-s3c/dma.c b/arch/arm/plat-samsung/dma.c
similarity index 100%
rename from arch/arm/plat-s3c/dma.c
rename to arch/arm/plat-samsung/dma.c
diff --git a/arch/arm/plat-s3c/include/plat/dma.h b/arch/arm/plat-samsung/include/plat/dma.h
similarity index 98%
rename from arch/arm/plat-s3c/include/plat/dma.h
rename to arch/arm/plat-samsung/include/plat/dma.h
index e429d10..7584d75 100644
--- a/arch/arm/plat-s3c/include/plat/dma.h
+++ b/arch/arm/plat-samsung/include/plat/dma.h
@@ -1,4 +1,4 @@
-/* arch/arm/plat-s3c/include/plat/dma.h
+/* arch/arm/plat-samsung/include/plat/dma.h
  *
  * Copyright (C) 2003-2006 Simtec Electronics
  *	Ben Dooks <ben@simtec.co.uk>
-- 
1.6.0.4
