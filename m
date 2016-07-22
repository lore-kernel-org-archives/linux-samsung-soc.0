From: Yakir Yang <ykk@rock-chips.com>
Subject: [PATCH v2 3/3] drm/bridge: analogix_dp: remove the panel prepare/unprepare in suspend/resume
Date: Fri, 22 Jul 2016 09:50:53 +0800
Message-ID: <1469152253-7383-1-git-send-email-ykk@rock-chips.com>
References: <1469151750-7130-1-git-send-email-ykk@rock-chips.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1469151750-7130-1-git-send-email-ykk@rock-chips.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Yao <yzq@rock-chips.com>, Inki Dae <inki.dae@samsung.com>, Thierry Reding <treding@nvidia.com>, Heiko Stuebner <heiko@sntech.de>
Cc: Jingoo Han <jingoohan1@gmail.com>, Javier Martinez Canillas <javier@osg.samsung.com>, =?UTF-8?q?St=C3=A9phane=20Marchesin?= <marcheu@chromium.org>, Sean Paul <seanpaul@chromium.org>, Tomasz Figa <tfiga@chromium.org>, dianders@chromium.org, David Airlie <airlied@linux.ie>, daniel.vetter@ffwll.ch, Krzysztof Kozlowski <k.kozlowski@samsung.com>, emil.l.velikov@gmail.com, Yakir Yang <ykk@rock-chips.com>, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org, linux-rockchip@lists.infradead.org
List-Id: linux-samsung-soc@vger.kernel.org

We already manager the panel power status in bridge_disable and
connector->detect functions, then we don't need to manager the
panel power status at suspend/resume in particular.

Signed-off-by: Yakir Yang <ykk@rock-chips.com>
---
Changes in v2: None

 drivers/gpu/drm/bridge/analogix/analogix_dp_core.c | 12 ------------
 1 file changed, 12 deletions(-)

diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
index 0ddaf93..3dadad2 100644
--- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
+++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
@@ -1413,11 +1413,6 @@ int analogix_dp_suspend(struct device *dev)
 
 	clk_disable_unprepare(dp->clock);
 
-	if (dp->plat_data->panel) {
-		if (drm_panel_unprepare(dp->plat_data->panel))
-			DRM_ERROR("failed to turnoff the panel\n");
-	}
-
 	return 0;
 }
 EXPORT_SYMBOL_GPL(analogix_dp_suspend);
@@ -1433,13 +1428,6 @@ int analogix_dp_resume(struct device *dev)
 		return ret;
 	}
 
-	if (dp->plat_data->panel) {
-		if (drm_panel_prepare(dp->plat_data->panel)) {
-			DRM_ERROR("failed to setup the panel\n");
-			return -EBUSY;
-		}
-	}
-
 	return 0;
 }
 EXPORT_SYMBOL_GPL(analogix_dp_resume);
-- 
1.9.1
