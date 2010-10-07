From: Sangbeom Kim <sbkim73@samsung.com>
Subject: [PATCH] ARM: S5P64X0: fix gpio rbank support
Date: Thu,  7 Oct 2010 13:20:39 +0900
Message-ID: <1286425239-11632-1-git-send-email-sbkim73@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from ganesha.gnumonks.org ([213.95.27.120]:53190 "EHLO
	ganesha.gnumonks.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751247Ab0JGE3p (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 7 Oct 2010 00:29:45 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, ben-linux@fluff.org, Atul Dahiya <atul.dahiya@samsung.com>, Sangbeom Kim <sbkim73@samsung.com>

From: Atul Dahiya <atul.dahiya@samsung.com>

The patch removes s3c_gpio_lock/unlock to avoid acquiring the lock
recursively as lock is already acquired by calling function.

Signed-off-by: Atul Dahiya <atul.dahiya@samsung.com>
Signed-off-by: Sangbeom Kim <sbkim73@samsung.com>
---
 arch/arm/mach-s5p64x0/gpio.c |    4 ----
 1 files changed, 0 insertions(+), 4 deletions(-)

diff --git a/arch/arm/mach-s5p64x0/gpio.c b/arch/arm/mach-s5p64x0/gpio.c
index 3073ed0..533c1a3 100644
--- a/arch/arm/mach-s5p64x0/gpio.c
+++ b/arch/arm/mach-s5p64x0/gpio.c
@@ -158,15 +158,11 @@ int s5p64x0_gpio_setcfg_4bit_rbank(struct s3c_gpio_chip *chip,
 		cfg <<= shift;
 	}
 
-	s3c_gpio_lock(chip, flags);
-
 	con = __raw_readl(reg);
 	con &= ~(0xf << shift);
 	con |= cfg;
 	__raw_writel(con, reg);
 
-	s3c_gpio_unlock(chip, flags);
-
 	return 0;
 }
 
-- 
1.6.6.1
