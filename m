From: Yakir Yang <ykk@rock-chips.com>
Subject: [PATCH v3 02/10] drm/rockchip: analogix_dp: split the lcdc select setting into device data
Date: Tue, 14 Jun 2016 19:46:08 +0800
Message-ID: <1465904768-805-1-git-send-email-ykk@rock-chips.com>
References: <1465904718-663-1-git-send-email-ykk@rock-chips.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1465904718-663-1-git-send-email-ykk@rock-chips.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Yao <yzq@rock-chips.com>, Inki Dae <inki.dae@samsung.com>, Jingoo Han <jingoohan1@gmail.com>, Heiko Stuebner <heiko@sntech.de>
Cc: Javier Martinez Canillas <javier@osg.samsung.com>, =?UTF-8?q?St=C3=A9phane=20Marchesin?= <marcheu@chromium.org>, Tomasz Figa <tomasz.figa@chromium.com>, David Airlie <airlied@linux.ie>, daniel.vetter@ffwll.ch, Thierry Reding <treding@nvidia.com>, dianders@chromium.org, Krzysztof Kozlowski <k.kozlowski@samsung.com>, emil.l.velikov@gmail.com, Dan Carpenter <dan.carpenter@oracle.com>, Yakir Yang <ykk@rock-chips.com>, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org, linux-rockchip@lists.infradead.org
List-Id: linux-samsung-soc@vger.kernel.org

eDP controller need to declare which vop provide the video source,
and it's defined in GRF registers.

But different chips have different GRF register address, so we need to
create a device data to declare the GRF messages for each chips.

Signed-off-by: Yakir Yang <ykk@rock-chips.com>
Acked-by: Mark Yao <mark.yao@rock-chips.com>
---
Changes in v3:
- Write a kerneldoc-style comment explaining the chips data fields (Tomasz, reviewed at Google Gerrit)
    [https://chromium-review.googlesource.com/#/c/346313/10/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c@39]
- Drop the '.lcdcsel_mask' number in chips data field (Tomasz, reviewed at Google Gerrit)
    [https://chromium-review.googlesource.com/#/c/346313/10/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c@382]
- Add acked flag from Mark.

Changes in v2: None

 drivers/gpu/drm/rockchip/analogix_dp-rockchip.c | 39 +++++++++++++++++++------
 1 file changed, 30 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c b/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
index 2bc8a7e..3855f46 100644
--- a/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
+++ b/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
@@ -14,6 +14,7 @@
 
 #include <linux/component.h>
 #include <linux/mfd/syscon.h>
+#include <linux/of_device.h>
 #include <linux/of_graph.h>
 #include <linux/regmap.h>
 #include <linux/reset.h>
@@ -35,11 +36,17 @@
 
 #define to_dp(nm)	container_of(nm, struct rockchip_dp_device, nm)
 
-/* dp grf register offset */
-#define GRF_SOC_CON6                            0x025c
-#define GRF_EDP_LCD_SEL_MASK                    BIT(5)
-#define GRF_EDP_SEL_VOP_LIT                     BIT(5)
-#define GRF_EDP_SEL_VOP_BIG                     0
+/**
+ * struct rockchip_dp_chip_data - splite the grf setting of kind of chips
+ * @lcdsel_grf_reg: grf register offset of lcdc select
+ * @lcdsel_big: reg value of selecting vop big for eDP
+ * @lcdsel_lit: reg value of selecting vop little for eDP
+ */
+struct rockchip_dp_chip_data {
+	u32	lcdsel_grf_reg;
+	u32	lcdsel_big;
+	u32	lcdsel_lit;
+};
 
 struct rockchip_dp_device {
 	struct drm_device        *drm_dev;
@@ -51,6 +58,8 @@ struct rockchip_dp_device {
 	struct regmap            *grf;
 	struct reset_control     *rst;
 
+	const struct rockchip_dp_chip_data *data;
+
 	struct analogix_dp_plat_data plat_data;
 };
 
@@ -119,13 +128,13 @@ static void rockchip_dp_drm_encoder_enable(struct drm_encoder *encoder)
 		return;
 
 	if (ret)
-		val = GRF_EDP_SEL_VOP_LIT | (GRF_EDP_LCD_SEL_MASK << 16);
+		val = dp->data->lcdsel_lit;
 	else
-		val = GRF_EDP_SEL_VOP_BIG | (GRF_EDP_LCD_SEL_MASK << 16);
+		val = dp->data->lcdsel_big;
 
 	dev_dbg(dp->dev, "vop %s output to dp\n", (ret) ? "LIT" : "BIG");
 
-	ret = regmap_write(dp->grf, GRF_SOC_CON6, val);
+	ret = regmap_write(dp->grf, dp->data->lcdsel_grf_reg, val);
 	if (ret != 0) {
 		dev_err(dp->dev, "Could not write to GRF: %d\n", ret);
 		return;
@@ -246,6 +255,7 @@ static int rockchip_dp_bind(struct device *dev, struct device *master,
 			    void *data)
 {
 	struct rockchip_dp_device *dp = dev_get_drvdata(dev);
+	const struct rockchip_dp_chip_data *dp_data;
 	struct drm_device *drm_dev = data;
 	int ret;
 
@@ -256,10 +266,15 @@ static int rockchip_dp_bind(struct device *dev, struct device *master,
 	 */
 	dev_set_drvdata(dev, NULL);
 
+	dp_data = of_device_get_match_data(dev);
+	if (!dp_data)
+		return -ENODEV;
+
 	ret = rockchip_dp_init(dp);
 	if (ret < 0)
 		return ret;
 
+	dp->data = dp_data;
 	dp->drm_dev = drm_dev;
 
 	ret = rockchip_dp_drm_create_encoder(dp);
@@ -365,8 +380,14 @@ static const struct dev_pm_ops rockchip_dp_pm_ops = {
 	SET_SYSTEM_SLEEP_PM_OPS(rockchip_dp_suspend, rockchip_dp_resume)
 };
 
+static const struct rockchip_dp_chip_data rk3288_dp = {
+	.lcdsel_grf_reg = 0x025c,
+	.lcdsel_big = 0 | BIT(21),
+	.lcdsel_lit = BIT(5) | BIT(21),
+};
+
 static const struct of_device_id rockchip_dp_dt_ids[] = {
-	{.compatible = "rockchip,rk3288-dp",},
+	{.compatible = "rockchip,rk3288-dp", .data = &rk3288_dp },
 	{}
 };
 MODULE_DEVICE_TABLE(of, rockchip_dp_dt_ids);
-- 
1.9.1
