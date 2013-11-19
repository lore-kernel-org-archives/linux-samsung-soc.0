From: Naveen Krishna Chatradhi <ch.naveen@samsung.com>
Subject: [PATCH v3] i2c: s3c2410: dont need CPU_FREQ transitions for exynos
 series
Date: Tue, 19 Nov 2013 11:48:35 +0530
Message-ID: <1384841915-8264-1-git-send-email-ch.naveen@samsung.com>
References: <1381490814-20890-1-git-send-email-ch.naveen@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:40885 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750762Ab3KSGRN (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 19 Nov 2013 01:17:13 -0500
In-reply-to: <1381490814-20890-1-git-send-email-ch.naveen@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-i2c@vger.kernel.org
Cc: sjg@chromium.org, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, wsa@the-dreams.de, ben-linux@fluff.org, grant.likely@secretlab.ca, broonie@kernel.org, dianders@chromium.org, cpgs@samsung.com, t.figa@samsung.com

For Exynos4 and Exynos5 SoCs from Samsung the i2c clock is based
on a fixed 66 MHz peripheral clock, and therefore is completely
independent of the cpu frequency.
Thus, registering for a CPU freq notifier is very wasteful.

This patch modifes the code such that, i2c bus registers to
cpu_freq_transition only if CONFIG_CPU_FREQ_S3C24XX is enabled.

This change should save a bunch of cpufreq transitions calls
which does not apply to exynos SoCs.

Signed-off-by: Naveen Krishna Chatradhi <ch.naveen@samsung.com>
Acked-by: Kyungmin Park <kyungmin.park@samsung.com>
Reviewed-by: Doug Anderson <dianders@chromium.org>
---
Changes since v2:
None, Rebased on for-next of linux-i2c git repo.

Changes since v1:
Use CONFIG_CPU_FREQ_S3C24XX instead of (CONFIG_CPU_FREQ & !CONFIG_EXYNOS)
As commented by Tomasz

 drivers/i2c/busses/i2c-s3c2410.c |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-s3c2410.c b/drivers/i2c/busses/i2c-s3c2410.c
index bf8fb94..fa51dff 100644
--- a/drivers/i2c/busses/i2c-s3c2410.c
+++ b/drivers/i2c/busses/i2c-s3c2410.c
@@ -123,7 +123,7 @@ struct s3c24xx_i2c {
 	struct s3c2410_platform_i2c	*pdata;
 	int			gpios[2];
 	struct pinctrl          *pctrl;
-#ifdef CONFIG_CPU_FREQ
+#if defined(CONFIG_CPU_FREQ_S3C24XX)
 	struct notifier_block	freq_transition;
 #endif
 };
@@ -843,7 +843,7 @@ static int s3c24xx_i2c_clockrate(struct s3c24xx_i2c *i2c, unsigned int *got)
 	return 0;
 }
 
-#ifdef CONFIG_CPU_FREQ
+#if defined(CONFIG_CPU_FREQ_S3C24XX)
 
 #define freq_to_i2c(_n) container_of(_n, struct s3c24xx_i2c, freq_transition)
 
-- 
1.7.10.4
