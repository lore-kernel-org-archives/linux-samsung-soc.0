From: Javier Martinez Canillas <javier@osg.samsung.com>
Subject: [PATCH v4 01/10] rtc: max77686: Fix max77686_rtc_read_alarm() return value
Date: Wed, 27 Jan 2016 00:36:37 -0300
Message-ID: <1453865806-4661-2-git-send-email-javier@osg.samsung.com>
References: <1453865806-4661-1-git-send-email-javier@osg.samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from lists.s-osg.org ([54.187.51.154]:54381 "EHLO lists.s-osg.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751877AbcA0DhH (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 26 Jan 2016 22:37:07 -0500
In-Reply-To: <1453865806-4661-1-git-send-email-javier@osg.samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: Kukjin Kim <kgene@kernel.org>, rtc-linux@googlegroups.com, Andi Shyti <andi.shyti@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Alexandre Belloni <alexandre.belloni@free-electrons.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Laxman Dewangan <ldewangan@nvidia.com>, linux-samsung-soc@vger.kernel.org, Javier Martinez Canillas <javier@osg.samsung.com>

The function is always returning zero even in case of failures since
the ret value was not propagated to the callers. Fix the error path.

Reported-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Signed-off-by: Javier Martinez Canillas <javier@osg.samsung.com>
Reviewed-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Tested-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Acked-by: Laxman Dewangan <ldewangan@nvidia.com>
Reviewed-by: Andi Shyti <andi.shyti@samsung.com>

---

Changes in v4:
- Add Andi Shyti's Reviewed-by to patch #1.

Changes in v3:
- Add Krzysztof Kozlowski's Reviewed-by and Tested-by to patch #1.
- Add Laxman Dewangan's Acked-by tag to patch #1.

Changes in v2: None

 drivers/rtc/rtc-max77686.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/rtc/rtc-max77686.c b/drivers/rtc/rtc-max77686.c
index 7184a0eda793..6653c3d11b66 100644
--- a/drivers/rtc/rtc-max77686.c
+++ b/drivers/rtc/rtc-max77686.c
@@ -235,7 +235,7 @@ static int max77686_rtc_read_alarm(struct device *dev, struct rtc_wkalrm *alrm)
 
 out:
 	mutex_unlock(&info->lock);
-	return 0;
+	return ret;
 }
 
 static int max77686_rtc_stop_alarm(struct max77686_rtc_info *info)
-- 
2.5.0
