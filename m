From: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Subject: [PATCH 1/1] drivers/rtc/rtc-s3c.c: Add .needs_src_clk to s3c6410 RTC data
Date: Tue, 24 Feb 2015 16:18:50 +0100
Message-ID: <1424791130-32102-1-git-send-email-javier.martinez@collabora.co.uk>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from bhuna.collabora.co.uk ([93.93.135.160]:49189 "EHLO
	bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751436AbbBXPTF (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 24 Feb 2015 10:19:05 -0500
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Andrew Morton <akpm@linux-foundation.org>
Cc: lessandro Zummo <a.zummo@towertech.it>, Marek Szyprowski <m.szyprowski@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Doug Anderson <dianders@chromium.org>, Olof Johansson <olof@lixom.net>, Kevin Hilman <khilman@linaro.org>, Tyler Baker <tyler.baker@linaro.org>, rtc-linux@googlegroups.com, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, Javier Martinez Canillas <javier.martinez@collabora.co.uk>

Commit df9e26d093d3 ("rtc: s3c: add support for RTC of Exynos3250 SoC")
added an "rtc_src" DT property to specify the clock used as a source to
the S3C real-time clock.

Not all SoCs needs this so commit eaf3a659086e ("drivers/rtc/rtc-s3c.c:
fix initialization failure without rtc source clock") changed to check
the struct s3c_rtc_data .needs_src_clk to conditionally grab the clock.

But that commit didn't update the data for each IP version so the RTC
broke on the boards that needs a source clock. This is the case of at
least Exynos5250 and Exynos5440 which uses the s3c6410 RTC IP block.

This commit fixes the S3C rtc on the Exynos5250 Snow and Exynos5420
Peach Pit and Pi Chromebooks.

Signed-off-by: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
---

Hello,

I see that Exynos4 uses the same s3c6410 RTC IP version but at least
the Exynos4412 Odroid boards don't define a source clock for the RTC.

According to the Exynos4 documentation I've, the RTC uses XRTCXTI as
its source clock so I think those boards are relying on the HW not
being completely defined in DT and the clock setup by the bootloader.

Best regards,
Javier

 drivers/rtc/rtc-s3c.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/rtc/rtc-s3c.c b/drivers/rtc/rtc-s3c.c
index 4241eeab3386..f4cf6851fae9 100644
--- a/drivers/rtc/rtc-s3c.c
+++ b/drivers/rtc/rtc-s3c.c
@@ -849,6 +849,7 @@ static struct s3c_rtc_data const s3c2443_rtc_data = {
 
 static struct s3c_rtc_data const s3c6410_rtc_data = {
 	.max_user_freq		= 32768,
+	.needs_src_clk		= true,
 	.irq_handler		= s3c6410_rtc_irq,
 	.set_freq		= s3c6410_rtc_setfreq,
 	.enable_tick		= s3c6410_rtc_enable_tick,
-- 
2.1.3
