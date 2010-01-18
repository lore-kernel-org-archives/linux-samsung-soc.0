From: Ben Dooks <ben-linux@fluff.org>
Subject: [PATCH] ARM: SAMSUNG: Move pm-gpio into plat-samsung
Date: Mon, 18 Jan 2010 02:38:38 +0000
Message-ID: <1263782319-20775-4-git-send-email-ben-linux@fluff.org>
References: <1263782319-20775-1-git-send-email-ben-linux@fluff.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from trinity.fluff.org ([89.16.178.74]:43663 "EHLO trinity.fluff.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753180Ab0ARCik (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 17 Jan 2010 21:38:40 -0500
In-Reply-To: <1263782319-20775-1-git-send-email-ben-linux@fluff.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: Ben Dooks <ben-linux@fluff.org>

Move the pm-gpio code into plat-samsung.

Note, this should be changed later to properly compile the 4bit code if
the 4bit settings are enabled.

Signed-off-by: Ben Dooks <ben-linux@fluff.org>
---
 arch/arm/plat-s3c/Makefile                    |    1 -
 arch/arm/plat-samsung/Makefile                |    4 ++++
 arch/arm/{plat-s3c => plat-samsung}/pm-gpio.c |    0
 3 files changed, 4 insertions(+), 1 deletions(-)
 rename arch/arm/{plat-s3c => plat-samsung}/pm-gpio.c (100%)

diff --git a/arch/arm/plat-s3c/Makefile b/arch/arm/plat-s3c/Makefile
index ea4a001..ac12ba5 100644
--- a/arch/arm/plat-s3c/Makefile
+++ b/arch/arm/plat-s3c/Makefile
@@ -22,7 +22,6 @@ obj-$(CONFIG_S3C_DMA)		+= dma.o
 # PM support
 
 obj-$(CONFIG_PM)		+= pm.o
-obj-$(CONFIG_PM)		+= pm-gpio.o
 obj-$(CONFIG_S3C2410_PM_CHECK)	+= pm-check.o
 
 # PWM support
diff --git a/arch/arm/plat-samsung/Makefile b/arch/arm/plat-samsung/Makefile
index 1425a45..0310e04 100644
--- a/arch/arm/plat-samsung/Makefile
+++ b/arch/arm/plat-samsung/Makefile
@@ -36,3 +36,7 @@ obj-$(CONFIG_S3C_DEV_FB)	+= dev-fb.o
 obj-$(CONFIG_S3C_DEV_USB_HOST)	+= dev-usb.o
 obj-$(CONFIG_S3C_DEV_USB_HSOTG)	+= dev-usb-hsotg.o
 obj-$(CONFIG_S3C_DEV_NAND)	+= dev-nand.o
+
+# PM support
+
+obj-$(CONFIG_PM)		+= pm-gpio.o
diff --git a/arch/arm/plat-s3c/pm-gpio.c b/arch/arm/plat-samsung/pm-gpio.c
similarity index 100%
rename from arch/arm/plat-s3c/pm-gpio.c
rename to arch/arm/plat-samsung/pm-gpio.c
-- 
1.6.0.4
