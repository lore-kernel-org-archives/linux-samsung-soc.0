From: Arvind Yadav <arvind.yadav.cs@gmail.com>
Subject: [PATCH] crygpu/drm/exynos/exynos_hdmi - Unmap region obtained by of_iomap
Date: Mon, 17 Oct 2016 16:39:22 +0530
Message-ID: <1476702562-24422-1-git-send-email-arvind.yadav.cs@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: airlied@linux.ie, krzk@kernel.org, kgene@kernel.org
Cc: inki.dae@samsung.com, jy0922.shim@samsung.com, sw0312.kim@samsung.com, kyungmin.park@samsung.com, dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

Free memory mapping, if hdmi_probe is not successful.

Signed-off-by: Arvind Yadav <arvind.yadav.cs@gmail.com>
---
 drivers/gpu/drm/exynos/exynos_hdmi.c |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/exynos/exynos_hdmi.c b/drivers/gpu/drm/exynos/exynos_hdmi.c
index 2275efe..9b7857b 100644
--- a/drivers/gpu/drm/exynos/exynos_hdmi.c
+++ b/drivers/gpu/drm/exynos/exynos_hdmi.c
@@ -1901,6 +1901,8 @@ err_disable_pm_runtime:
 err_hdmiphy:
 	if (hdata->hdmiphy_port)
 		put_device(&hdata->hdmiphy_port->dev);
+	if (hdata->regs_hdmiphy)
+		iounmap(hdata->regs_hdmiphy);
 err_ddc:
 	put_device(&hdata->ddc_adpt->dev);
 
-- 
1.7.9.5
