From: Javier Martinez Canillas <javier@osg.samsung.com>
Subject: [PATCH] rtc: Fix module autoload for rtc-{ab8500,max8997,s5m} drivers
Date: Thu, 27 Aug 2015 12:34:32 +0200
Message-ID: <1440671672-26590-1-git-send-email-javier@osg.samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from lists.s-osg.org ([54.187.51.154]:60306 "EHLO lists.s-osg.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751694AbbH0Ken (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 27 Aug 2015 06:34:43 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: Luis de Bethencourt <luis.bg@samsung.com>, Javier Martinez Canillas <javier@osg.samsung.com>, linux-samsung-soc@vger.kernel.org, Alessandro Zummo <a.zummo@towertech.it>, Sangbeom Kim <sbkim73@samsung.com>, Linus Walleij <linus.walleij@linaro.org>, Alexandre Belloni <alexandre.belloni@free-electrons.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, rtc-linux@googlegroups.com, linux-arm-kernel@lists.infradead.org

These platform drivers have a platform device ID table but the module
alias information is not created so module autoloading will not work.

Signed-off-by: Javier Martinez Canillas <javier@osg.samsung.com>

---

 drivers/rtc/rtc-ab8500.c  | 1 +
 drivers/rtc/rtc-max8997.c | 1 +
 drivers/rtc/rtc-s5m.c     | 1 +
 3 files changed, 3 insertions(+)

diff --git a/drivers/rtc/rtc-ab8500.c b/drivers/rtc/rtc-ab8500.c
index 133d2e2e1a25..8537d1e3a995 100644
--- a/drivers/rtc/rtc-ab8500.c
+++ b/drivers/rtc/rtc-ab8500.c
@@ -446,6 +446,7 @@ static const struct platform_device_id ab85xx_rtc_ids[] = {
 	{ "ab8500-rtc", (kernel_ulong_t)&ab8500_rtc_ops, },
 	{ "ab8540-rtc", (kernel_ulong_t)&ab8540_rtc_ops, },
 };
+MODULE_DEVICE_TABLE(platform, ab85xx_rtc_ids);
 
 static int ab8500_rtc_probe(struct platform_device *pdev)
 {
diff --git a/drivers/rtc/rtc-max8997.c b/drivers/rtc/rtc-max8997.c
index 9e02bcda0c09..db984d4bf952 100644
--- a/drivers/rtc/rtc-max8997.c
+++ b/drivers/rtc/rtc-max8997.c
@@ -521,6 +521,7 @@ static const struct platform_device_id rtc_id[] = {
 	{ "max8997-rtc", 0 },
 	{},
 };
+MODULE_DEVICE_TABLE(platform, rtc_id);
 
 static struct platform_driver max8997_rtc_driver = {
 	.driver		= {
diff --git a/drivers/rtc/rtc-s5m.c b/drivers/rtc/rtc-s5m.c
index ab60287ee72d..f2504b4eef34 100644
--- a/drivers/rtc/rtc-s5m.c
+++ b/drivers/rtc/rtc-s5m.c
@@ -807,6 +807,7 @@ static const struct platform_device_id s5m_rtc_id[] = {
 	{ "s2mps14-rtc",	S2MPS14X },
 	{ },
 };
+MODULE_DEVICE_TABLE(platform, s5m_rtc_id);
 
 static struct platform_driver s5m_rtc_driver = {
 	.driver		= {
-- 
2.4.3
