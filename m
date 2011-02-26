From: Banajit Goswami <banajit.g@samsung.com>
Subject: [PATCH] ARM: S5P64X0: Modify number of GPIO lines in Bank F
Date: Sat, 26 Feb 2011 13:25:49 +0900
Message-ID: <1298694349-16776-1-git-send-email-banajit.g@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from ganesha.gnumonks.org ([213.95.27.120]:58023 "EHLO
	ganesha.gnumonks.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751060Ab1BZEwK (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 25 Feb 2011 23:52:10 -0500
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, ben-linux@fluff.org, Banajit Goswami <banajit.g@samsung.com>

This patch modifies the number of total GPIO lines for Bank F
for Samsung S5P6440 and S5P6450 SoCs from 2 to 16.
This is necessary as the GPIO lines from 0 to 13 are reserved
and only lines 14 and 15 are used. As during initialization,
the line number starts at 0, putting 2 does not solve the
intended purpose.

Signed-off-by: Banajit Goswami <banajit.g@samsung.com>
---
 arch/arm/mach-s5p64x0/include/mach/gpio.h |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/mach-s5p64x0/include/mach/gpio.h b/arch/arm/mach-s5p64x0/include/mach/gpio.h
index 5486c8f..adb5f29 100644
--- a/arch/arm/mach-s5p64x0/include/mach/gpio.h
+++ b/arch/arm/mach-s5p64x0/include/mach/gpio.h
@@ -23,7 +23,7 @@
 #define S5P6440_GPIO_A_NR	(6)
 #define S5P6440_GPIO_B_NR	(7)
 #define S5P6440_GPIO_C_NR	(8)
-#define S5P6440_GPIO_F_NR	(2)
+#define S5P6440_GPIO_F_NR	(16)
 #define S5P6440_GPIO_G_NR	(7)
 #define S5P6440_GPIO_H_NR	(10)
 #define S5P6440_GPIO_I_NR	(16)
@@ -36,7 +36,7 @@
 #define S5P6450_GPIO_B_NR	(7)
 #define S5P6450_GPIO_C_NR	(8)
 #define S5P6450_GPIO_D_NR	(8)
-#define S5P6450_GPIO_F_NR	(2)
+#define S5P6450_GPIO_F_NR	(16)
 #define S5P6450_GPIO_G_NR	(14)
 #define S5P6450_GPIO_H_NR	(10)
 #define S5P6450_GPIO_I_NR	(16)
-- 
1.6.5.2
