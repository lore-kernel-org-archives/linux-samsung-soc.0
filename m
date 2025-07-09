Received: from mail-m19731117.qiye.163.com (mail-m19731117.qiye.163.com [220.197.31.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 197B6194A44;
	Wed,  9 Jul 2025 07:18:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.117
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752045487; cv=none; b=mzZcJMl42m/auT4+vBfemco2Eu7mpvx0wo8wx016FdezxgckuQFjiz3TJK6wSBn3ct+yGLqqh35cCO8XfU8Nl+PNOUpWA3UdrxNV0sCtJPzQiVi2uz8V+texkPdoMsDcg/mosxVMFNIMppRINL8xOE3SdOwMlD+jkivLf51k43I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752045487; c=relaxed/simple;
	bh=puj7pNzmbzG2jV91DTWokWkYd8g180dEonCodxcrlxI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=FOPFRx7vJ3phJ6ztIbMBA69epcJsykoxZUeJqujMWYYSxen+uGtWkhNCeWunguWNmlH9aMeUCJ2hElURiIi6tiQRxoTSpgNdqs8BLIJGLYNUoCfnqYY4KGf7Blyt/Q53vt1ig1csQK4CYKNf+D3cPkoYiIw1YjkNeWyf9VCFouQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com; spf=pass smtp.mailfrom=rock-chips.com; dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b=N9gWYFUJ; arc=none smtp.client-ip=220.197.31.117
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b="N9gWYFUJ"
Received: from zyb-HP-ProDesk-680-G2-MT.. (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 1b69b7a3d;
	Wed, 9 Jul 2025 15:02:38 +0800 (GMT+08:00)
From: Damon Ding <damon.ding@rock-chips.com>
To: andrzej.hajda@intel.com,
	neil.armstrong@linaro.org,
	rfoss@kernel.org
Cc: Laurent.pinchart@ideasonboard.com,
	jonas@kwiboo.se,
	jernej.skrabec@gmail.com,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	jingoohan1@gmail.com,
	inki.dae@samsung.com,
	sw0312.kim@samsung.com,
	kyungmin.park@samsung.com,
	krzk@kernel.org,
	alim.akhtar@samsung.com,
	hjc@rock-chips.com,
	heiko@sntech.de,
	andy.yan@rock-chips.com,
	dmitry.baryshkov@oss.qualcomm.com,
	l.stach@pengutronix.de,
	dianders@chromium.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	Damon Ding <damon.ding@rock-chips.com>
Subject: [PATCH v2 09/12] drm/rockchip: analogix_dp: Apply analogix_dp_find_panel_or_bridge()
Date: Wed,  9 Jul 2025 15:01:36 +0800
Message-Id: <20250709070139.3130635-10-damon.ding@rock-chips.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250709070139.3130635-1-damon.ding@rock-chips.com>
References: <20250709070139.3130635-1-damon.ding@rock-chips.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZGU9CT1ZJSUkZSU5JSUkaQhlWFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSEpMTE
	lVSktLVUpCS0tZBg++
X-HM-Tid: 0a97edfe57d803a3kunm3a7bcd50c83b57
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6PDo6Kww4STE#DS8RIxAUIio8
	LEgwCx5VSlVKTE5JS09PTk1LT0hOVTMWGhIXVR8aFhQVVR8SFRw7CRQYEFYYExILCFUYFBZFWVdZ
	EgtZQVlOQ1VJSVVMVUpKT1lXWQgBWUFPT0pCNwY+
DKIM-Signature:a=rsa-sha256;
	b=N9gWYFUJGUD4F4i2hzCLUEgLES3TI3byPfs0qM0cVg4BKXG0LuTecGitOy/UuxGPdgxUoX0IGcTu7kryJ2m1kWWoajFrY8zcsI+L5Ix7VcRfE6k9OmvJ9SY4cg7aiFFL8P6KpZXbapDzWWA7CLtzlBpR6UO3bXfUrjEd/hM1PgY=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=dZM2SJLeuc6k6xdaVTyBmp1Vz7vWBJGTdyTGtnxj4yI=;
	h=date:mime-version:subject:message-id:from;

Apply analogix_dp_find_panel_or_bridge() in order to move the
panel/bridge parsing from Rockchip side to the Analogix side.

Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
---
 .../gpu/drm/rockchip/analogix_dp-rockchip.c   | 38 +------------------
 1 file changed, 2 insertions(+), 36 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c b/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
index 4ed6bf9e5377..f54ea99467b0 100644
--- a/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
+++ b/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
@@ -21,13 +21,11 @@
 #include <video/of_videomode.h>
 #include <video/videomode.h>
 
-#include <drm/display/drm_dp_aux_bus.h>
 #include <drm/display/drm_dp_helper.h>
 #include <drm/drm_atomic.h>
 #include <drm/drm_atomic_helper.h>
 #include <drm/bridge/analogix_dp.h>
 #include <drm/drm_of.h>
-#include <drm/drm_panel.h>
 #include <drm/drm_probe_helper.h>
 
 #include "rockchip_drm_drv.h"
@@ -431,24 +429,6 @@ static const struct component_ops rockchip_dp_component_ops = {
 	.unbind = rockchip_dp_unbind,
 };
 
-static int rockchip_dp_link_panel(struct drm_dp_aux *aux)
-{
-	struct analogix_dp_plat_data *plat_data = analogix_dp_aux_to_plat_data(aux);
-	struct rockchip_dp_device *dp = pdata_encoder_to_dp(plat_data);
-	int ret;
-
-	/*
-	 * If drm_of_find_panel_or_bridge() returns -ENODEV, there may be no valid panel
-	 * or bridge nodes. The driver should go on for the driver-free bridge or the DP
-	 * mode applications.
-	 */
-	ret = drm_of_find_panel_or_bridge(dp->dev->of_node, 1, 0, &plat_data->panel, NULL);
-	if (ret && ret != -ENODEV)
-		return ret;
-
-	return component_add(dp->dev, &rockchip_dp_component_ops);
-}
-
 static int rockchip_dp_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -488,6 +468,7 @@ static int rockchip_dp_probe(struct platform_device *pdev)
 	dp->plat_data.power_on = rockchip_dp_poweron;
 	dp->plat_data.power_off = rockchip_dp_powerdown;
 	dp->plat_data.get_modes = rockchip_dp_get_modes;
+	dp->plat_data.ops = &rockchip_dp_component_ops;
 
 	ret = rockchip_dp_of_probe(dp);
 	if (ret < 0)
@@ -499,22 +480,7 @@ static int rockchip_dp_probe(struct platform_device *pdev)
 	if (IS_ERR(dp->adp))
 		return PTR_ERR(dp->adp);
 
-	ret = devm_of_dp_aux_populate_bus(analogix_dp_get_aux(dp->adp), rockchip_dp_link_panel);
-	if (ret) {
-		/*
-		 * If devm_of_dp_aux_populate_bus() returns -ENODEV, the done_probing() will not
-		 * be called because there are no EP devices. Then the rockchip_dp_link_panel()
-		 * will be called directly in order to support the other valid DT configurations.
-		 *
-		 * NOTE: The devm_of_dp_aux_populate_bus() is allowed to return -EPROBE_DEFER.
-		 */
-		if (ret != -ENODEV)
-			return dev_err_probe(dp->dev, ret, "failed to populate aux bus\n");
-
-		return rockchip_dp_link_panel(analogix_dp_get_aux(dp->adp));
-	}
-
-	return 0;
+	return analogix_dp_find_panel_or_bridge(dp->adp);
 }
 
 static void rockchip_dp_remove(struct platform_device *pdev)
-- 
2.34.1

