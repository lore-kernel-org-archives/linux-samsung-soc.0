From: Ben Dooks <ben-linux@fluff.org>
Subject: [PATCH] ARM: SAMSUNG: Move pwm-clock code into plat-samsung
Date: Fri,  8 Jan 2010 02:36:58 +0000
Message-ID: <1262918223-26529-2-git-send-email-ben-linux@fluff.org>
References: <1262918223-26529-1-git-send-email-ben-linux@fluff.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from trinity.fluff.org ([89.16.178.74]:57640 "EHLO trinity.fluff.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750786Ab0AHChE (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 7 Jan 2010 21:37:04 -0500
In-Reply-To: <1262918223-26529-1-git-send-email-ben-linux@fluff.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org

Move the code for the pwm-clock into plat-samsung, as it is common to
all Samsung SoCs.

Signed-off-by: Ben Dooks <ben-linux@fluff.org>
---
 arch/arm/plat-s3c/Makefile                      |    1 -
 arch/arm/plat-samsung/Makefile                  |    1 +
 arch/arm/{plat-s3c => plat-samsung}/pwm-clock.c |    0
 3 files changed, 1 insertions(+), 1 deletions(-)
 rename arch/arm/{plat-s3c => plat-samsung}/pwm-clock.c (100%)

diff --git a/arch/arm/plat-s3c/Makefile b/arch/arm/plat-s3c/Makefile
index 99f91ad..ef10a91 100644
--- a/arch/arm/plat-s3c/Makefile
+++ b/arch/arm/plat-s3c/Makefile
@@ -13,7 +13,6 @@ obj-				:=
 
 obj-y				+= init.o
 obj-y				+= time.o
-obj-y				+= pwm-clock.o
 obj-y				+= gpio.o
 obj-y				+= gpio-config.o
 
diff --git a/arch/arm/plat-samsung/Makefile b/arch/arm/plat-samsung/Makefile
index 7612198..d4d5f94 100644
--- a/arch/arm/plat-samsung/Makefile
+++ b/arch/arm/plat-samsung/Makefile
@@ -12,5 +12,6 @@ obj-				:=
 # Objects we always build independent of SoC choice
 
 obj-y				+= clock.o
+obj-y				+= pwm-clock.o
 
 obj-$(CONFIG_SAMSUNG_CLKSRC)	+= clock-clksrc.o
diff --git a/arch/arm/plat-s3c/pwm-clock.c b/arch/arm/plat-samsung/pwm-clock.c
similarity index 100%
rename from arch/arm/plat-s3c/pwm-clock.c
rename to arch/arm/plat-samsung/pwm-clock.c
-- 
1.6.0.4
