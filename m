From: Yakir Yang <ykk@rock-chips.com>
Subject: [PATCH v4 1/2] drm/rockchip: analogix_dp: introduce the pclk for grf
Date: Thu, 23 Jun 2016 09:46:53 +0800
Message-ID: <1466646413-10530-1-git-send-email-ykk@rock-chips.com>
References: <1466562678-11094-1-git-send-email-ykk@rock-chips.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from lucky1.263xmail.com ([211.157.147.132]:46252 "EHLO
	lucky1.263xmail.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750838AbcFWBrD (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 22 Jun 2016 21:47:03 -0400
In-Reply-To: <1466562678-11094-1-git-send-email-ykk@rock-chips.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Mark Yao <yzq@rock-chips.com>, Inki Dae <inki.dae@samsung.com>, Jingoo Han <jingoohan1@gmail.com>, Heiko Stuebner <heiko@sntech.de>
Cc: Javier Martinez Canillas <javier@osg.samsung.com>, =?UTF-8?q?St=C3=A9phane=20Marchesin?= <marcheu@chromium.org>, Tomasz Figa <tfiga@chromium.com>, David Airlie <airlied@linux.ie>, daniel.vetter@ffwll.ch, Thierry Reding <treding@nvidia.com>, dianders@chromium.org, Krzysztof Kozlowski <k.kozlowski@samsung.com>, emil.l.velikov@gmail.com, Dan Carpenter <dan.carpenter@oracle.com>, Yakir Yang <ykk@rock-chips.com>, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org, linux-rockchip@lists.infradead.org

For RK3399's GRF module, if we want to operate the graphic related grf
registers, we need to enable the pclk_vio_grf which supply power for VIO
GRF IOs, so it's better to introduce an optional grf clock in driver.

Signed-off-by: Yakir Yang <ykk@rock-chips.com>
---
Hi all,

This is an external patch for analogix_dp misc cleanup thread [0]
[0]: https://patchwork.kernel.org/patch/9175613/

BR,
- Yakir

Changes in v4:
- Check the the error code properly, 'EPROBE_DEFER' should be returned,
  'ENOENT' should assign a NULL point to grfclk, other errors should be
  regarded as failed. (Tomasz, Doug, reviewed at Google Gerrit)
    [https://chromium-review.googlesource.com/#/c/351821/20/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c@249]
- Add the document about optional 'grf' clock (Tomasz, Doug, reviewed at Google Gerrit)
    [https://chromium-review.googlesource.com/#/c/351821/]

Changes in v3:
- Add this patch in v3

 .../display/rockchip/analogix_dp-rockchip.txt      |  6 ++++++
 drivers/gpu/drm/rockchip/analogix_dp-rockchip.c    | 23 +++++++++++++++++++---
 2 files changed, 26 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/rockchip/analogix_dp-rockchip.txt b/Documentation/devicetree/bindings/display/rockchip/analogix_dp-rockchip.txt
index 726c945..0b39256 100644
--- a/Documentation/devicetree/bindings/display/rockchip/analogix_dp-rockchip.txt
+++ b/Documentation/devicetree/bindings/display/rockchip/analogix_dp-rockchip.txt
@@ -28,6 +28,12 @@ Required properties:
     Port 0: contained 2 endpoints, connecting to the output of vop.
     Port 1: contained 1 endpoint, connecting to the input of panel.
 
+Optional property for different chips:
+- clocks: from common clock binding: handle to grf_vio clock.
+
+- clock-names: from common clock binding:
+	       Required elements: "grf"
+
 For the below properties, please refer to Analogix DP binding document:
  * Documentation/devicetree/bindings/drm/bridge/analogix_dp.txt
 - phys (required)
diff --git a/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c b/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
index 787dc51..864ef92 100644
--- a/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
+++ b/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
@@ -56,6 +56,7 @@ struct rockchip_dp_device {
 	struct drm_display_mode  mode;
 
 	struct clk               *pclk;
+	struct clk               *grfclk;
 	struct regmap            *grf;
 	struct reset_control     *rst;
 
@@ -151,11 +152,17 @@ static void rockchip_dp_drm_encoder_enable(struct drm_encoder *encoder)
 
 	dev_dbg(dp->dev, "vop %s output to dp\n", (ret) ? "LIT" : "BIG");
 
-	ret = regmap_write(dp->grf, dp->data->lcdsel_grf_reg, val);
-	if (ret != 0) {
-		dev_err(dp->dev, "Could not write to GRF: %d\n", ret);
+	ret = clk_prepare_enable(dp->grfclk);
+	if (ret < 0) {
+		dev_err(dp->dev, "failed to enable grfclk %d\n", ret);
 		return;
 	}
+
+	ret = regmap_write(dp->grf, dp->data->lcdsel_grf_reg, val);
+	if (ret != 0)
+		dev_err(dp->dev, "Could not write to GRF: %d\n", ret);
+
+	clk_disable_unprepare(dp->grfclk);
 }
 
 static void rockchip_dp_drm_encoder_nop(struct drm_encoder *encoder)
@@ -235,6 +242,16 @@ static int rockchip_dp_init(struct rockchip_dp_device *dp)
 		return PTR_ERR(dp->grf);
 	}
 
+	dp->grfclk = devm_clk_get(dev, "grf");
+	if (PTR_ERR(dp->grfclk) == -ENOENT) {
+		dp->grfclk = NULL;
+	} else if (PTR_ERR(dp->grfclk) == -EPROBE_DEFER) {
+		return -EPROBE_DEFER;
+	} else if (IS_ERR(dp->grfclk)) {
+		dev_err(dev, "failed to get grf clock\n");
+		return PTR_ERR(dp->cfgclk);
+	}
+
 	dp->pclk = devm_clk_get(dev, "pclk");
 	if (IS_ERR(dp->pclk)) {
 		dev_err(dev, "failed to get pclk property\n");
-- 
1.9.1
