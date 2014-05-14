From: Naveen Krishna Chatradhi <ch.naveen@samsung.com>
Subject: [PATCH] drm/exynos: Make exynos_drm_init() call late during the bootup
Date: Wed, 14 May 2014 17:09:45 +0530
Message-ID: <1400067585-31236-1-git-send-email-ch.naveen@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:42044 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754040AbaENLmB (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 14 May 2014 07:42:01 -0400
Received: from epcpsbgr5.samsung.com
 (u145.gpu120.samsung.co.kr [203.254.230.145])
 by mailout2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0N5K00404B60MJ50@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 14 May 2014 20:42:00 +0900 (KST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org
Cc: seanpaul@chromium.org, inki.dae@samsung.com, naveenkrishna.ch@gmail.com

exynos_drm_init() does probing of various drivers like dp_panel,
hdmi, fimd, mixer, etc in an order and finally binds them together.

Some of the drm devices (Eg: dp_panel) try to do regulator_get()
and enable few supplies during their probe.
Chances are that, these devices may get probed before the respective
supply/PMIC is hooked.  In such cases, dp_panel would continue with
"dummy regulator". Which is not what the system wants.

Lets give the core connectivity and regulators modules some time
to hookup the supplies before Exynos DRM devices comes into picture.

Signed-off-by: Naveen Krishna Chatradhi <ch.naveen@samsung.com>
---
This change is proposed after
1. Discussing with I2C/SPI & DMA subsystem maintainers and Others
   @ https://lkml.org/lkml/2014/5/9/333
   Trying to change the I2C, SPI and DMA drivers as subsys_initcall()
   Which was strictly opposed, as a flaw was found in DRM subsystem.

2. -EPROBE_DEFER won't work well with the current sequency of
    platform_driver_register()s in exynos_drm_init()

3. bridge_panel mechanism is under RFC and no conclusions were drawn yet.

We should be able to probe each DRM device independently and let PROBE_DEFER
take care of dependencies. But, this could cause lot of bootup time.

late_initcall() of DRM works well and fixes all the above issues for now.
Kindly suggest, if an alternative/better mechanism is out there.

Thanks,
 drivers/gpu/drm/exynos/exynos_drm_drv.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_drv.c b/drivers/gpu/drm/exynos/exynos_drm_drv.c
index 4cef88f..78c185a 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_drv.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_drv.c
@@ -692,7 +692,7 @@ static void exynos_drm_exit(void)
 	platform_driver_unregister(&exynos_drm_platform_driver);
 }
 
-module_init(exynos_drm_init);
+late_initcall(exynos_drm_init);
 module_exit(exynos_drm_exit);
 
 MODULE_AUTHOR("Inki Dae <inki.dae@samsung.com>");
-- 
1.7.9.5
