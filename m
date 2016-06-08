From: Javier Martinez Canillas <javier@osg.samsung.com>
Subject: [PATCH] drm/exynos: dp: Fix NULL pointer dereference due uninitialized connector
Date: Wed,  8 Jun 2016 10:13:27 -0400
Message-ID: <1465395207-14571-1-git-send-email-javier@osg.samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from lists.s-osg.org ([54.187.51.154]:55069 "EHLO lists.s-osg.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1756427AbcFHONs (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 8 Jun 2016 10:13:48 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: Marc Zyngier <marc.zyngier@arm.com>, Yakir Yang <ykk@rock-chips.com>, Javier Martinez Canillas <javier@osg.samsung.com>, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, dri-devel@lists.freedesktop.org, Inki Dae <inki.dae@samsung.com>, linux-samsung-soc@vger.kernel.org, Kyungmin Park <kyungmin.park@samsung.com>, Jingoo Han <jingoohan1@gmail.com>, David Airlie <airlied@linux.ie>, Joonyoung Shim <jy0922.shim@samsung.com>, linux-arm-kernel@lists.infradead.org

From: Yakir Yang <ykk@rock-chips.com>

Commit 3424e3a4f844 ("drm: bridge: analogix/dp: split exynos dp driver to
bridge directory") split the Exynos DP core driver into a core driver and
a bridge driver for the Analogix chip since that is also used by Rockchip.

But the change introduced a regression causing a NULL pointer dereference
when trying to access an uninitialized connector in the driver .get_modes:

Fix this by instead of having a connector struct for both the Exynos and
Analogix drivers, just use the connector initialized in the bridge driver.

Fixes: 3424e3a4f844 ("drm: bridge: analogix/dp: split exynos dp driver to bridge directory")
Reported-by: Marc Zyngier <marc.zyngier@arm.com>
Signed-off-by: Yakir Yang <ykk@rock-chips.com>
[javier: wrote commit message]
Signed-off-by: Javier Martinez Canillas <javier@osg.samsung.com>
Tested-by: Marc Zyngier <marc.zyngier@arm.com>

---
Hello Inki,

This is a regression introduced in v4.7-rc1, so $SUBJECT is -rc material.

Best regards,
Javier

 drivers/gpu/drm/exynos/exynos_dp.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_dp.c b/drivers/gpu/drm/exynos/exynos_dp.c
index 468498e3fec1..4c1fb3f8b5a6 100644
--- a/drivers/gpu/drm/exynos/exynos_dp.c
+++ b/drivers/gpu/drm/exynos/exynos_dp.c
@@ -34,7 +34,7 @@
 
 struct exynos_dp_device {
 	struct drm_encoder         encoder;
-	struct drm_connector       connector;
+	struct drm_connector       *connector;
 	struct drm_bridge          *ptn_bridge;
 	struct drm_device          *drm_dev;
 	struct device              *dev;
@@ -70,7 +70,7 @@ static int exynos_dp_poweroff(struct analogix_dp_plat_data *plat_data)
 static int exynos_dp_get_modes(struct analogix_dp_plat_data *plat_data)
 {
 	struct exynos_dp_device *dp = to_dp(plat_data);
-	struct drm_connector *connector = &dp->connector;
+	struct drm_connector *connector = dp->connector;
 	struct drm_display_mode *mode;
 	int num_modes = 0;
 
@@ -103,6 +103,7 @@ static int exynos_dp_bridge_attach(struct analogix_dp_plat_data *plat_data,
 	int ret;
 
 	drm_connector_register(connector);
+	dp->connector = connector;
 
 	/* Pre-empt DP connector creation if there's a bridge */
 	if (dp->ptn_bridge) {
-- 
2.5.5
