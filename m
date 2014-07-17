From: Ajay Kumar <ajaykumar.rs@samsung.com>
Subject: [RESEND PATCH V5 01/12] drm/exynos: Move DP setup out of hotplug
 workqueue
Date: Fri, 18 Jul 2014 02:13:47 +0530
Message-ID: <1405629839-12086-2-git-send-email-ajaykumar.rs@samsung.com>
References: <1405629839-12086-1-git-send-email-ajaykumar.rs@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:33613 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752334AbaGQUq5 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 17 Jul 2014 16:46:57 -0400
Received: from epcpsbgr4.samsung.com
 (u144.gpu120.samsung.co.kr [203.254.230.144])
 by mailout3.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0N8V00BHPJ28ZW70@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 18 Jul 2014 05:46:56 +0900 (KST)
In-reply-to: <1405629839-12086-1-git-send-email-ajaykumar.rs@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org
Cc: inki.dae@samsung.com, robdclark@gmail.com, daniel.vetter@ffwll.ch, thierry.reding@gmail.com, seanpaul@google.com, ajaynumb@gmail.com, jg1.han@samsung.com, joshi@samsung.com, prashanth.g@samsung.com, javier@dowhile0.org, Ajay Kumar <ajaykumar.rs@samsung.com>

Move the DP training and video enable from the hotplug handler into
a seperate function and call the same during dpms ON.

With existing code, DP HPD should be generated just few ms before
calling enable_irq in dp_poweron.

This patch removes that stringent time constraint.

Signed-off-by: Ajay Kumar <ajaykumar.rs@samsung.com>
---
 drivers/gpu/drm/exynos/exynos_dp_core.c |   11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/exynos/exynos_dp_core.c b/drivers/gpu/drm/exynos/exynos_dp_core.c
index 845d766..a94b114 100644
--- a/drivers/gpu/drm/exynos/exynos_dp_core.c
+++ b/drivers/gpu/drm/exynos/exynos_dp_core.c
@@ -875,10 +875,18 @@ static irqreturn_t exynos_dp_irq_handler(int irq, void *arg)
 static void exynos_dp_hotplug(struct work_struct *work)
 {
 	struct exynos_dp_device *dp;
-	int ret;
 
 	dp = container_of(work, struct exynos_dp_device, hotplug_work);
 
+	if (dp->drm_dev)
+		drm_helper_hpd_irq_event(dp->drm_dev);
+}
+
+static void exynos_dp_setup(void *in_ctx)
+{
+	struct exynos_dp_device *dp = in_ctx;
+	int ret;
+
 	ret = exynos_dp_detect_hpd(dp);
 	if (ret) {
 		/* Cable has been disconnected, we're done */
@@ -1059,6 +1067,7 @@ static void exynos_dp_poweron(struct exynos_dp_device *dp)
 	exynos_dp_phy_init(dp);
 	exynos_dp_init_dp(dp);
 	enable_irq(dp->irq);
+	exynos_dp_setup(dp);
 }
 
 static void exynos_dp_poweroff(struct exynos_dp_device *dp)
-- 
1.7.9.5
