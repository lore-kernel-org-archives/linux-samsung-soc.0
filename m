From: zain wang <wzz@rock-chips.com>
Subject: [PATCH v1 2/4] drm/bridge: analogix_dp: get sync PM when init eDP
Date: Thu, 29 Sep 2016 22:46:38 +0800
Message-ID: <1475160400-30782-3-git-send-email-wzz@rock-chips.com>
References: <1475160400-30782-1-git-send-email-wzz@rock-chips.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from regular1.263xmail.com ([211.150.99.140]:50381 "EHLO
        regular1.263xmail.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S933980AbcI2OrS (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 29 Sep 2016 10:47:18 -0400
In-Reply-To: <1475160400-30782-1-git-send-email-wzz@rock-chips.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sean Paul <seanpaul@chromium.org>, Daniel Vetter <daniel.vetter@ffwll.ch>, Inki Dae <inki.dae@samsung.com>, David Airlie <airlied@linux.ie>
Cc: Tomeu Vizoso <tomeu.vizoso@collabora.com>, Mika Kahola <mika.kahola@intel.com>, =?UTF-8?q?St=C3=A9phane=20Marchesin?= <marcheu@chromium.org>, Tomasz Figa <tfiga@chromium.org>, dianders@chromium.org, Thierry Reding <treding@nvidia.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Heiko Stuebner <heiko@sntech.de>, Jingoo Han <jingoohan1@gmail.com>, Javier Martinez Canillas <javier@osg.samsung.com>, Yakir Yang <ykk@rock-chips.com>, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, zain wang <wzz@rock-chips.com>

Signed-off-by: zain wang <wzz@rock-chips.com>

---

 drivers/gpu/drm/bridge/analogix/analogix_dp_core.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
index 206529a..026ec91 100644
--- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
+++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
@@ -1386,10 +1386,12 @@ int analogix_dp_bind(struct device *dev, struct drm_device *drm_dev,
 	}
 
 	pm_runtime_enable(dev);
+	pm_runtime_get_sync(dev);
 
 	phy_power_on(dp->phy);
 
 	analogix_dp_init_dp(dp);
+	pm_runtime_put_sync(dev);
 
 	ret = devm_request_threaded_irq(&pdev->dev, dp->irq,
 					analogix_dp_hardirq,
-- 
1.9.1
