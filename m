From: zain wang <wzz@rock-chips.com>
Subject: [PATCH] drm/bridge: analogix: Don't return -EINVAL when panel not support PSR in PSR functions
Date: Fri,  2 Dec 2016 10:32:22 +0800
Message-ID: <1480645942-29912-1-git-send-email-wzz@rock-chips.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from regular1.263xmail.com ([211.150.99.134]:41823 "EHLO
        regular1.263xmail.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752480AbcLBCdB (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 1 Dec 2016 21:33:01 -0500
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sean Paul <seanpaul@chromium.org>, Daniel Vetter <daniel.vetter@ffwll.ch>, Inki Dae <inki.dae@samsung.com>, David Airlie <airlied@linux.ie>
Cc: Tomeu Vizoso <tomeu.vizoso@collabora.com>, Mika Kahola <mika.kahola@intel.com>, =?UTF-8?q?St=C3=A9phane=20Marchesin?= <marcheu@chromium.org>, Tomasz Figa <tfiga@chromium.org>, dianders@chromium.org, Thierry Reding <treding@nvidia.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Heiko Stuebner <heiko@sntech.de>, Jingoo Han <jingoohan1@gmail.com>, Javier Martinez Canillas <javier@osg.samsung.com>, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, zain wang <wzz@rock-chips.com>

We will ignored PSR setting if panel not support it. So, in this case, we should
return from analogix_dp_enable/disable_psr() without any error code.
Let's retrun 0 instead of -EINVAL when panel not support PSR in
analogix_dp_enable/disable_psr().

Signed-off-by: zain wang <wzz@rock-chips.com>
---
 drivers/gpu/drm/bridge/analogix/analogix_dp_core.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
index 6e0447f..0cb3695 100644
--- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
+++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
@@ -112,7 +112,7 @@ int analogix_dp_enable_psr(struct device *dev)
 	struct edp_vsc_psr psr_vsc;
 
 	if (!dp->psr_support)
-		return -EINVAL;
+		return 0;
 
 	/* Prepare VSC packet as per EDP 1.4 spec, Table 6.9 */
 	memset(&psr_vsc, 0, sizeof(psr_vsc));
@@ -135,7 +135,7 @@ int analogix_dp_disable_psr(struct device *dev)
 	struct edp_vsc_psr psr_vsc;
 
 	if (!dp->psr_support)
-		return -EINVAL;
+		return 0;
 
 	/* Prepare VSC packet as per EDP 1.4 spec, Table 6.9 */
 	memset(&psr_vsc, 0, sizeof(psr_vsc));
@@ -878,6 +878,8 @@ static void analogix_dp_commit(struct analogix_dp_device *dp)
 	dp->psr_support = analogix_dp_detect_sink_psr(dp);
 	if (dp->psr_support)
 		analogix_dp_enable_sink_psr(dp);
+	else
+		dev_warn(dp->dev, "Sink not support PSR\n");
 }
 
 /*
-- 
1.9.1
