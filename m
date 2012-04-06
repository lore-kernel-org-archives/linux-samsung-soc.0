From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH] drivers: genpd: let platform code to register devices into
 disabled domains
Date: Fri, 06 Apr 2012 10:02:59 +0200
Message-ID: <1333699379-16700-1-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:25925 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752581Ab2DFIDG (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 6 Apr 2012 04:03:06 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, linux-pm@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, "Rafael J. Wysocki" <rjw@sisk.pl>

Some bootloaders disable power domains on boot and the platform startup
code registers them in the 'disabled' state. Current gen_pd code assumed
that the devices can be registered only to the power domain which is in
'enabled' state and these devices are active at the time of the
registration. This is not correct in our case. This patch lets drivers
to be registered into 'disabled' power domains and finally solves
mysterious freezes and lack of resume/suspend calls on Samsung Exynos4
NURI and UniversalC210 platforms.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
---
 drivers/base/power/domain.c |    7 +------
 1 files changed, 1 insertions(+), 6 deletions(-)

diff --git a/drivers/base/power/domain.c b/drivers/base/power/domain.c
index 73ce9fb..05f5799f 100644
--- a/drivers/base/power/domain.c
+++ b/drivers/base/power/domain.c
@@ -1211,11 +1211,6 @@ int __pm_genpd_add_device(struct generic_pm_domain *genpd, struct device *dev,
 
 	genpd_acquire_lock(genpd);
 
-	if (genpd->status == GPD_STATE_POWER_OFF) {
-		ret = -EINVAL;
-		goto out;
-	}
-
 	if (genpd->prepared_count > 0) {
 		ret = -EAGAIN;
 		goto out;
@@ -1239,7 +1234,7 @@ int __pm_genpd_add_device(struct generic_pm_domain *genpd, struct device *dev,
 	dev_pm_get_subsys_data(dev);
 	dev->power.subsys_data->domain_data = &gpd_data->base;
 	gpd_data->base.dev = dev;
-	gpd_data->need_restore = false;
+	gpd_data->need_restore = true;
 	list_add_tail(&gpd_data->base.list_node, &genpd->dev_list);
 	if (td)
 		gpd_data->td = *td;
-- 
1.7.1.569.g6f426
