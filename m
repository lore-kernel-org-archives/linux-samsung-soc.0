From: Javier Martinez Canillas <javier@osg.samsung.com>
Subject: [PATCH v2 07/10] rtc: max77686: Use dev_warn() instead of pr_warn()
Date: Thu, 21 Jan 2016 17:23:30 -0300
Message-ID: <1453407813-14646-8-git-send-email-javier@osg.samsung.com>
References: <1453407813-14646-1-git-send-email-javier@osg.samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1453407813-14646-1-git-send-email-javier@osg.samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: Kukjin Kim <kgene@kernel.org>, rtc-linux@googlegroups.com, Chanwoo Choi <cw00.choi@samsung.com>, Alexandre Belloni <alexandre.belloni@free-electrons.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Laxman Dewangan <ldewangan@nvidia.com>, linux-samsung-soc@vger.kernel.org, Javier Martinez Canillas <javier@osg.samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

It is better to use dev_*() log functions instead of pr_*() to print
information about the device in the kernel log in a standardized way.

This also allows to remove the local pr_fmt() defined macro.

Suggested-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Signed-off-by: Javier Martinez Canillas <javier@osg.samsung.com>
---

Changes in v2: None

 drivers/rtc/rtc-max77686.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/rtc/rtc-max77686.c b/drivers/rtc/rtc-max77686.c
index 3e6d6bff5154..e1739d19ce9a 100644
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
@@ -245,8 +243,9 @@ static int max77686_rtc_tm_to_data(struct rtc_time *tm, u8 *data,
 		data[RTC_YEAR] = tm->tm_year > 100 ? (tm->tm_year - 100) : 0;
 
 		if (tm->tm_year < 100) {
-			pr_warn("RTC can't handle year %d. Assume it's 2000.\n",
-				1900 + tm->tm_year);
+			dev_warn(info->dev,
+				 "RTC can't handle year %d. Assume it's 2000\n",
+				 1900 + tm->tm_year);
 			return -EINVAL;
 		}
 	} else {
-- 
2.5.0
