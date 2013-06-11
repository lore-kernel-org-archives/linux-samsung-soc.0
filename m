From: Rahul Sharma <rahul.sharma@samsung.com>
Subject: [PATCH 7/9] drm/exynos: use of_get_named_gpio to get hdmi hpd gpio
Date: Tue, 11 Jun 2013 19:41:29 +0530
Message-ID: <1370959891-8923-8-git-send-email-rahul.sharma@samsung.com>
References: <1370959891-8923-1-git-send-email-rahul.sharma@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:64536 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751464Ab3FKNwa (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 11 Jun 2013 09:52:30 -0400
Received: from epcpsbgr2.samsung.com
 (u142.gpu120.samsung.co.kr [203.254.230.142])
 by mailout2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0MO800AWOEJHBJE0@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 11 Jun 2013 22:52:29 +0900 (KST)
In-reply-to: <1370959891-8923-1-git-send-email-rahul.sharma@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, dri-devel@lists.freedesktop.org
Cc: kgene.kim@samsung.com, sw0312.kim@samsung.com, inki.dae@samsung.com, joshi@samsung.com, r.sh.open@gmail.com, Rahul Sharma <rahul.sharma@samsung.com>

Cleanup by removing flags variable from drm_hdmi_dt_parse_pdata
which is not used anywhere. Swtiching to of_get_named_gpio instead
of of_get_named_gpio_flags solved this.

Signed-off-by: Rahul Sharma <rahul.sharma@samsung.com>
---
 drivers/gpu/drm/exynos/exynos_hdmi.c |    3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_hdmi.c b/drivers/gpu/drm/exynos/exynos_hdmi.c
index 1eb5ffb..fc6a9b0 100644
--- a/drivers/gpu/drm/exynos/exynos_hdmi.c
+++ b/drivers/gpu/drm/exynos/exynos_hdmi.c
@@ -2081,7 +2081,6 @@ static struct s5p_hdmi_platform_data *drm_hdmi_dt_parse_pdata
 {
 	struct device_node *np = dev->of_node;
 	struct s5p_hdmi_platform_data *pd;
-	enum of_gpio_flags flags;
 	u32 value;
 
 	pd = devm_kzalloc(dev, sizeof(*pd), GFP_KERNEL);
@@ -2095,7 +2094,7 @@ static struct s5p_hdmi_platform_data *drm_hdmi_dt_parse_pdata
 		goto err_data;
 	}
 
-	pd->hpd_gpio = of_get_named_gpio_flags(np, "hpd-gpio", 0, &flags);
+	pd->hpd_gpio = of_get_named_gpio(np, "hpd-gpio", 0);
 
 	return pd;
 
-- 
1.7.10.4
