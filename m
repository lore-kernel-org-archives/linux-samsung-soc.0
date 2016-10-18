From: Zain Wang <wzz@rock-chips.com>
Subject: [PATCH v3 2/6] drm/bridge: remove dp init from analogix_dp_bind
Date: Tue, 18 Oct 2016 14:14:39 +0800
Message-ID: <1476771283-11398-3-git-send-email-wzz@rock-chips.com>
References: <1476771283-11398-1-git-send-email-wzz@rock-chips.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1476771283-11398-1-git-send-email-wzz@rock-chips.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Sean Paul <seanpaul@chromium.org>, Daniel Vetter <daniel.vetter@ffwll.ch>, Inki Dae <inki.dae@samsung.com>, David Airlie <airlied@linux.ie>
Cc: Tomeu Vizoso <tomeu.vizoso@collabora.com>, Mika Kahola <mika.kahola@intel.com>, =?UTF-8?q?St=C3=A9phane=20Marchesin?= <marcheu@chromium.org>, Tomasz Figa <tfiga@chromium.org>, dianders@chromium.org, Thierry Reding <treding@nvidia.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Heiko Stuebner <heiko@sntech.de>, Jingoo Han <jingoohan1@gmail.com>, Javier Martinez Canillas <javier@osg.samsung.com>, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, zain wang <wzz@rock-chips.com>
List-Id: linux-samsung-soc@vger.kernel.org

From: zain wang <wzz@rock-chips.com>

phy_power_on() and analogix_dp_init_dp would be called in bridge_eanble,
so remove them from analogix_dp_bind to be clear.

Signed-off-by: zain wang <wzz@rock-chips.com>
---

Changes in v3:
- remove changes before
- remove phy_power_on() and analogix_dp_init_dp from analogix_dp_bind().

Changes in v2: None

 drivers/gpu/drm/bridge/analogix/analogix_dp_core.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
index 001b075..bcae4dd 100644
--- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
+++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
@@ -1389,10 +1389,6 @@ int analogix_dp_bind(struct device *dev, struct drm_device *drm_dev,
 
 	pm_runtime_enable(dev);
 
-	phy_power_on(dp->phy);
-
-	analogix_dp_init_dp(dp);
-
 	ret = devm_request_threaded_irq(&pdev->dev, dp->irq,
 					analogix_dp_hardirq,
 					analogix_dp_irq_thread,
-- 
1.9.1
