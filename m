From: Javier Martinez Canillas <javier@osg.samsung.com>
Subject: [PATCH v2 01/10] rtc: max77686: Fix max77686_rtc_read_alarm() return value
Date: Thu, 21 Jan 2016 17:23:24 -0300
Message-ID: <1453407813-14646-2-git-send-email-javier@osg.samsung.com>
References: <1453407813-14646-1-git-send-email-javier@osg.samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from lists.s-osg.org ([54.187.51.154]:34508 "EHLO lists.s-osg.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750907AbcAUUXz (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 21 Jan 2016 15:23:55 -0500
In-Reply-To: <1453407813-14646-1-git-send-email-javier@osg.samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: Kukjin Kim <kgene@kernel.org>, rtc-linux@googlegroups.com, Chanwoo Choi <cw00.choi@samsung.com>, Alexandre Belloni <alexandre.belloni@free-electrons.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Laxman Dewangan <ldewangan@nvidia.com>, linux-samsung-soc@vger.kernel.org, Javier Martinez Canillas <javier@osg.samsung.com>

The function is always returning zero even in case of failures since
the ret value was not propagated to the callers. Fix the error path.

Reported-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Signed-off-by: Javier Martinez Canillas <javier@osg.samsung.com>
---

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
