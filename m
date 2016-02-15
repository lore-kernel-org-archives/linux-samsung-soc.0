From: Yakir Yang <ykk@rock-chips.com>
Subject: [PATCH v14 16/17] drm: bridge: analogix/dp: add panel prepare/unprepare in suspend/resume time
Date: Mon, 15 Feb 2016 19:11:37 +0800
Message-ID: <1455534697-2209-1-git-send-email-ykk@rock-chips.com>
References: <1455534485-1154-1-git-send-email-ykk@rock-chips.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1455534485-1154-1-git-send-email-ykk@rock-chips.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Inki Dae <inki.dae@samsung.com>, Andrzej Hajda <a.hajda@samsung.com>, Joonyoung Shim <jy0922.shim@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Jingoo Han <jingoohan1@gmail.com>, Thierry Reding <treding@nvidia.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Rob Herring <robh+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, Mark Yao <mark.yao@rock-chips.com>
Cc: Russell King <linux@arm.linux.org.uk>, djkurtz@chromium.org, Sean Paul <seanpaul@chromium.org>, Kukjin Kim <kgene@kernel.org>, Kumar Gala <galak@codeaurora.org>, emil.l.velikov@gmail.com, Ian Campbell <ijc+devicetree@hellion.org.uk>, Gustavo Padovan <gustavo.padovan@collabora.co.uk>, Kishon Vijay Abraham I <kishon@ti.com>, Pawel Moll <pawel.moll@arm.com>, ajaynumb@gmail.com, robherring2@gmail.com, javier@osg.samsung.com, Andy Yan <andy.yan@rock-chips.com>, Yakir Yang <ykk@rock-chips.com>, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org
List-Id: linux-samsung-soc@vger.kernel.org

Turn off the panel power in suspend time would help to reduce
power waste.

Signed-off-by: Yakir Yang <ykk@rock-chips.com>
---
Changes in v14: None
Changes in v13: None
Changes in v12: None
Changes in v11: None
Changes in v10: None
Changes in v9: None
Changes in v8: None
Changes in v7: None
Changes in v6: None
Changes in v5: None
Changes in v4: None
Changes in v3: None
Changes in v2: None

 drivers/gpu/drm/bridge/analogix/analogix_dp_core.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
index bc59e8d..5292b28 100644
--- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
+++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
@@ -1400,6 +1400,12 @@ int analogix_dp_suspend(struct device *dev)
 	struct analogix_dp_device *dp = dev_get_drvdata(dev);
 
 	clk_disable_unprepare(dp->clock);
+
+	if (dp->plat_data->panel) {
+		if (drm_panel_unprepare(dp->plat_data->panel))
+			DRM_ERROR("failed to turnoff the panel\n");
+	}
+
 	return 0;
 }
 EXPORT_SYMBOL_GPL(analogix_dp_suspend);
@@ -1415,6 +1421,13 @@ int analogix_dp_resume(struct device *dev)
 		return ret;
 	}
 
+	if (dp->plat_data->panel) {
+		if (drm_panel_prepare(dp->plat_data->panel)) {
+			DRM_ERROR("failed to setup the panel\n");
+			return -EBUSY;
+		}
+	}
+
 	return 0;
 }
 EXPORT_SYMBOL_GPL(analogix_dp_resume);
-- 
1.9.1
