From: Javier Martinez Canillas <javier@osg.samsung.com>
Subject: [PATCH 2/8] rtc: max77686: Use usleep_range() instead of msleep()
Date: Wed, 20 Jan 2016 14:14:42 -0300
Message-ID: <1453310088-29985-3-git-send-email-javier@osg.samsung.com>
References: <1453310088-29985-1-git-send-email-javier@osg.samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1453310088-29985-1-git-send-email-javier@osg.samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: Kukjin Kim <kgene@kernel.org>, rtc-linux@googlegroups.com, Chanwoo Choi <cw00.choi@samsung.com>, Alexandre Belloni <alexandre.belloni@free-electrons.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Laxman Dewangan <ldewangan@nvidia.com>, linux-samsung-soc@vger.kernel.org, Javier Martinez Canillas <javier@osg.samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

Documentation/timers/timers-howto.txt suggest to use usleep_range()
instead of msleep() for small msec (1ms - 20ms) since msleep() will
often sleep for 20ms for any value in that range.

This is fine in this case since 16ms is the _minimum_ delay required
by max77686 for an RTC update but by using usleep_range() instead of
msleep(), the driver can support other RTC IP blocks with a shorter
minium delay (i.e: in the range of usecs insted of msecs).

Signed-off-by: Javier Martinez Canillas <javier@osg.samsung.com>
---

 drivers/rtc/rtc-max77686.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/rtc/rtc-max77686.c b/drivers/rtc/rtc-max77686.c
index 9599be257db4..ae4d61e7ce4b 100644
--- a/drivers/rtc/rtc-max77686.c
+++ b/drivers/rtc/rtc-max77686.c
@@ -41,7 +41,7 @@
 #define ALARM_ENABLE_SHIFT		7
 #define ALARM_ENABLE_MASK		(1 << ALARM_ENABLE_SHIFT)
 
-#define MAX77686_RTC_UPDATE_DELAY	16
+#define MAX77686_RTC_UPDATE_DELAY	16000
 
 enum {
 	RTC_SEC = 0,
@@ -130,7 +130,8 @@ static int max77686_rtc_update(struct max77686_rtc_info *info,
 				__func__, ret, data);
 	else {
 		/* Minimum 16ms delay required before RTC update. */
-		msleep(MAX77686_RTC_UPDATE_DELAY);
+		usleep_range(MAX77686_RTC_UPDATE_DELAY,
+			     MAX77686_RTC_UPDATE_DELAY * 2);
 	}
 
 	return ret;
-- 
2.5.0
