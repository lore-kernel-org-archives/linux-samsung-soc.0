From: Javier Martinez Canillas <javier@osg.samsung.com>
Subject: [PATCH v4 07/10] rtc: max77686: Fix unsupported year message
Date: Wed, 27 Jan 2016 00:36:43 -0300
Message-ID: <1453865806-4661-8-git-send-email-javier@osg.samsung.com>
References: <1453865806-4661-1-git-send-email-javier@osg.samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from lists.s-osg.org ([54.187.51.154]:54423 "EHLO lists.s-osg.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752238AbcA0Dhf (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 26 Jan 2016 22:37:35 -0500
In-Reply-To: <1453865806-4661-1-git-send-email-javier@osg.samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: Kukjin Kim <kgene@kernel.org>, rtc-linux@googlegroups.com, Andi Shyti <andi.shyti@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Alexandre Belloni <alexandre.belloni@free-electrons.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Laxman Dewangan <ldewangan@nvidia.com>, linux-samsung-soc@vger.kernel.org, Javier Martinez Canillas <javier@osg.samsung.com>

The max77686 RTC only supports a range of 99 years so instead of using
year 1900 as the base, the year 2000 is used. This means that 1900 to
1999 are unsupported years.

The driver was printing a warning for those values but was returning a
error so for consistency, print an error message instead and don't say
that a year 2000 is assumed, since the year is not set.

Also, it is better to use dev_* log functions instead of pr_* to print
information about the device in the kernel log in a standardized way.

This also allows to remove the local pr_fmt() defined macro.

Suggested-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Signed-off-by: Javier Martinez Canillas <javier@osg.samsung.com>

---

Changes in v4:
- Use dev_err() instead of dev_warn() and change message.
  Suggested by Krzysztof Kozlowski and Andi Shyti.
- Change subject line and commit message of patch #7.
- Removed Laxman Dewangan's Acked-by tag since the patch changed.

Changes in v3:
- Add Laxman Dewangan's Acked-by tag to patch #7.

Changes in v2: None

 drivers/rtc/rtc-max77686.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/rtc/rtc-max77686.c b/drivers/rtc/rtc-max77686.c
index a9a4ee0f0f41..bbb06dd2ee35 100644
--- a/drivers/rtc/rtc-max77686.c
+++ b/drivers/rtc/rtc-max77686.c
@@ -12,8 +12,6 @@
  *
  */
 
-#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
-
 #include <linux/slab.h>
 #include <linux/rtc.h>
 #include <linux/delay.h>
@@ -249,7 +247,7 @@ static int max77686_rtc_tm_to_data(struct rtc_time *tm, u8 *data,
 	data[RTC_YEAR] = tm->tm_year > 100 ? (tm->tm_year - 100) : 0;
 
 	if (tm->tm_year < 100) {
-		pr_warn("RTC cannot handle the year %d.  Assume it's 2000.\n",
+		dev_err(info->dev, "RTC cannot handle the year %d.\n",
 			1900 + tm->tm_year);
 		return -EINVAL;
 	}
-- 
2.5.0
