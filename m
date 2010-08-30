From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [PATCH] ARM: SAMSUNG: Fix on s5p_gpio_[get,set]_drvstr
Date: Mon, 30 Aug 2010 12:31:11 +0900
Message-ID: <1283139071-25374-1-git-send-email-kgene.kim@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from ganesha.gnumonks.org ([213.95.27.120]:38407 "EHLO
	ganesha.gnumonks.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754618Ab0H3Do6 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 29 Aug 2010 23:44:58 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: ben-linux@fluff.org, Kukjin Kim <kgene.kim@samsung.com>

This patch fixes bug on gpio drive strength helper function.

The offset should be like follwoing.
-       off = chip->chip.base - pin;
+       off = pin - chip->chip.base;

In the s5p_gpio_get_drvstr(),
the second line is unnecessary, because overwrite drvstr.
        drvstr = __raw_readl(reg);
-       drvstr = 0xffff & (0x3 << shift);

And need 2bit masking before return the drvstr value.
        drvstr = drvstr >> shift;
+       drvstr &= 0x3;

In the s5p_gpio_set_drvstr(), need relevant bit clear.
        tmp = __raw_readl(reg);
+       tmp &= ~(0x3 << shift);
        tmp |= drvstr << shift;

Reported-by: Janghyuck Kim <janghyuck.kim@samsung.com>
Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
---
 arch/arm/plat-samsung/gpio-config.c |    7 ++++---
 1 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/arch/arm/plat-samsung/gpio-config.c b/arch/arm/plat-samsung/gpio-config.c
index 57b68a5..e3d41ea 100644
--- a/arch/arm/plat-samsung/gpio-config.c
+++ b/arch/arm/plat-samsung/gpio-config.c
@@ -273,13 +273,13 @@ s5p_gpio_drvstr_t s5p_gpio_get_drvstr(unsigned int pin)
 	if (!chip)
 		return -EINVAL;
 
-	off = chip->chip.base - pin;
+	off = pin - chip->chip.base;
 	shift = off * 2;
 	reg = chip->base + 0x0C;
 
 	drvstr = __raw_readl(reg);
-	drvstr = 0xffff & (0x3 << shift);
 	drvstr = drvstr >> shift;
+	drvstr &= 0x3;
 
 	return (__force s5p_gpio_drvstr_t)drvstr;
 }
@@ -296,11 +296,12 @@ int s5p_gpio_set_drvstr(unsigned int pin, s5p_gpio_drvstr_t drvstr)
 	if (!chip)
 		return -EINVAL;
 
-	off = chip->chip.base - pin;
+	off = pin - chip->chip.base;
 	shift = off * 2;
 	reg = chip->base + 0x0C;
 
 	tmp = __raw_readl(reg);
+	tmp &= ~(0x3 << shift);
 	tmp |= drvstr << shift;
 
 	__raw_writel(tmp, reg);
-- 
1.6.2.5
