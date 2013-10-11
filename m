From: Naveen Krishna Chatradhi <ch.naveen@samsung.com>
Subject: [PATCH] i2c: s3c2410: dont need CPU_FREQ transitions for exynos series
Date: Fri, 11 Oct 2013 16:56:54 +0530
Message-ID: <1381490814-20890-1-git-send-email-ch.naveen@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:23778 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751266Ab3JKLYn (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 11 Oct 2013 07:24:43 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc: wsa@the-dreams.de, khali@linux-fr.org, ben-linux@fluff.org, grant.likely@secretlab.ca, devicetree-discuss@lists.ozlabs.org, sjg@chromium.org, naveenkrishna.ch@gmail.com, broonie@opensource.wolfsonmicro.com, diander@google.com, cpgs@samsung.com

The exynos5 i2c clock is based on a fixed 66 MHz peripheral clock, and
therefore is completely independent of the cpu frequency.
Thus, registering for a CPU freq notifier is very wasteful.

This patch modifes the code such that, i2c bus registers to
cpu_freq_transition only for non Exynos SoCs.

This change should save a bunch of cpufreq transitions calls
which does not apply to exynos SoCs.

Signed-off-by: Naveen Krishna Chatradhi <ch.naveen@samsung.com>
---
 drivers/i2c/busses/i2c-s3c2410.c |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-s3c2410.c b/drivers/i2c/busses/i2c-s3c2410.c
index cab1c91..d062fa7 100644
--- a/drivers/i2c/busses/i2c-s3c2410.c
+++ b/drivers/i2c/busses/i2c-s3c2410.c
@@ -123,7 +123,7 @@ struct s3c24xx_i2c {
 	struct s3c2410_platform_i2c	*pdata;
 	int			gpios[2];
 	struct pinctrl          *pctrl;
-#ifdef CONFIG_CPU_FREQ
+#if defined(CONFIG_CPU_FREQ) && !defined(CONFIG_ARCH_EXYNOS)
 	struct notifier_block	freq_transition;
 #endif
 };
@@ -843,7 +843,7 @@ static int s3c24xx_i2c_clockrate(struct s3c24xx_i2c *i2c, unsigned int *got)
 	return 0;
 }
 
-#ifdef CONFIG_CPU_FREQ
+#if defined(CONFIG_CPU_FREQ) && !defined(CONFIG_ARCH_EXYNOS)
 
 #define freq_to_i2c(_n) container_of(_n, struct s3c24xx_i2c, freq_transition)
 
-- 
1.7.9.5
