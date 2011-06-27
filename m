From: MyungJoo Ham <myungjoo.ham@samsung.com>
Subject: [PATCH 2/3] rtc: rtc-s3c: Disable alarm entries that are not chosen.
Date: Mon, 27 Jun 2011 20:43:25 +0900
Message-ID: <1309175006-9218-3-git-send-email-myungjoo.ham@samsung.com>
References: <1309175006-9218-1-git-send-email-myungjoo.ham@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-reply-to: <1309175006-9218-1-git-send-email-myungjoo.ham@samsung.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
	<mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
	<mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, rtc-linux@googlegroups.com
Cc: a.zummo@towertech.it, Kukjin Kim <kgene.kim@samsung.com>, dg77.kim@samsung.com, kyungmin.park@samsung.com, myungjoo.ham@gmail.com, ben-linux@fluff.org, Changhwan Youn <chaos.youn@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

When rtc_setalarm is called, the entries that are not chosen (entries
without valid time values) should be disabled. However, in the previous
rtc-s3c driver, they are not explicitly disabled (did not changed). This
patch allows to disable such entries even if they were previously used.

Signed-off-by: MyungJoo Ham <myungjoo.ham@samsung.com>
Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
---
 drivers/rtc/rtc-s3c.c |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/drivers/rtc/rtc-s3c.c b/drivers/rtc/rtc-s3c.c
index 3c8dfa7..be85ea5 100644
--- a/drivers/rtc/rtc-s3c.c
+++ b/drivers/rtc/rtc-s3c.c
@@ -273,7 +273,8 @@ static int s3c_rtc_setalarm(struct device *dev, struct rtc_wkalrm *alrm)
 		 1900 + tm->tm_year, tm->tm_mon + 1, tm->tm_mday,
 		 tm->tm_hour, tm->tm_min, tm->tm_sec);
 
-	alrm_en = readb(base + S3C2410_RTCALM) & S3C2410_RTCALM_ALMEN;
+	/* Disable entires that are not chosen by alrm */
+	alrm_en = S3C2410_RTCALM_ALMEN;
 	writeb(0x00, base + S3C2410_RTCALM);
 
 	if (tm->tm_sec < 60 && tm->tm_sec >= 0) {
-- 
1.7.4.1
