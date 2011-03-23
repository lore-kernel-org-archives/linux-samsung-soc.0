From: Heiko =?iso-8859-1?q?St=FCbner?= <heiko@sntech.de>
Subject: [PATCH RESEND 1/4] ARM: S3C2416: Add USB Phy register definitions
Date: Wed, 23 Mar 2011 22:37:26 +0100
Message-ID: <201103232237.26754.heiko@sntech.de>
References: <201103232235.49318.heiko@sntech.de>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from s15407518.onlinehome-server.info ([82.165.136.167]:40218 "EHLO
	s15407518.onlinehome-server.info" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1756695Ab1CWVhd (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 23 Mar 2011 17:37:33 -0400
In-Reply-To: <201103232235.49318.heiko@sntech.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Ben Dooks <ben-linux@fluff.org>
Cc: Thomas Abraham <thomas.ab@samsung.com>, Sangbeom Kim <sbkim73@samsung.com>, Kukjin Kim <kgene.kim@samsung.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-usb@vger.kernel.org, dbrownell@users.sourceforge.net, Alexander Neumann <alexander@debian.org>

From: Thomas Abraham <thomas.ab@samsung.com>

Add register definitions required to configure the USB Phy. The definitions
for PHYCTRL, PHYPWR, URSTCON and UCLKCON registers and corresponding bit
field definitions are added.

Signed-off-by: Thomas Abraham <thomas.ab@samsung.com>
Signed-off-by: Sangbeom Kim <sbkim73@samsung.com>
---
 .../mach-s3c2410/include/mach/regs-s3c2443-clock.h |   25 ++++++++++++++++++++
 1 files changed, 25 insertions(+), 0 deletions(-)

diff --git a/arch/arm/mach-s3c2410/include/mach/regs-s3c2443-clock.h b/arch/arm/mach-s3c2410/include/mach/regs-s3c2443-clock.h
index 44494a5..5e06c72 100644
--- a/arch/arm/mach-s3c2410/include/mach/regs-s3c2443-clock.h
+++ b/arch/arm/mach-s3c2410/include/mach/regs-s3c2443-clock.h
@@ -37,6 +37,10 @@
 #define S3C2443_SYSID			S3C2443_CLKREG(0x5C)
 #define S3C2443_PWRCFG			S3C2443_CLKREG(0x60)
 #define S3C2443_RSTCON			S3C2443_CLKREG(0x64)
+#define S3C2443_PHYCTRL			S3C2443_CLKREG(0x80)
+#define S3C2443_PHYPWR			S3C2443_CLKREG(0x84)
+#define S3C2443_URSTCON			S3C2443_CLKREG(0x88)
+#define S3C2443_UCLKCON			S3C2443_CLKREG(0x8C)
 
 #define S3C2443_SWRST_RESET		(0x533c2443)
 
@@ -121,6 +125,27 @@
 
 #define S3C2443_PWRCFG_SLEEP		(1<<15)
 
+#define S3C2443_PWRCFG_USBPHY		(1 << 4)
+
+#define S3C2443_URSTCON_FUNCRST		(1 << 2)
+#define S3C2443_URSTCON_PHYRST		(1 << 0)
+
+#define S3C2443_PHYCTRL_CLKSEL		(1 << 3)
+#define S3C2443_PHYCTRL_EXTCLK		(1 << 2)
+#define S3C2443_PHYCTRL_PLLSEL		(1 << 1)
+#define S3C2443_PHYCTRL_DSPORT		(1 << 0)
+
+#define S3C2443_PHYPWR_COMMON_ON	(1 << 31)
+#define S3C2443_PHYPWR_ANALOG_PD	(1 << 4)
+#define S3C2443_PHYPWR_PLL_REFCLK	(1 << 3)
+#define S3C2443_PHYPWR_XO_ON		(1 << 2)
+#define S3C2443_PHYPWR_PLL_PWRDN	(1 << 1)
+#define S3C2443_PHYPWR_FSUSPEND		(1 << 0)
+
+#define S3C2443_UCLKCON_DETECT_VBUS	(1 << 31)
+#define S3C2443_UCLKCON_FUNC_CLKEN	(1 << 2)
+#define S3C2443_UCLKCON_TCLKEN		(1 << 0)
+
 #include <asm/div64.h>
 
 static inline unsigned int
-- 
1.7.2.3
