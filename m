From: Tomasz Stanislawski <t.stanislaws@samsung.com>
Subject: [RFC 08/12] drm: exynos: hdmi: simplify extracting hpd-gpio from DT
Date: Mon, 21 Oct 2013 16:18:27 +0200
Message-ID: <1382365111-6533-9-git-send-email-t.stanislaws@samsung.com>
References: <1382365111-6533-1-git-send-email-t.stanislaws@samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <1382365111-6533-1-git-send-email-t.stanislaws@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, kyungmin.park@samsung.com, t.figa@samsung.com, kishon@ti.com, sw0312.kim@samsung.com, inki.dae@samsung.com, rahul.sharma@samsung.com, kgene.kim@samsung.com, s.nawrocki@samsung.com, thomas.abraham@linaro.org, mturquette@linaro.org, Tomasz Stanislawski <t.stanislaws@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

This patch eliminates redundant checks while retrieving HPD gpio from DT during
HDMI's probe().

Signed-off-by: Tomasz Stanislawski <t.stanislaws@samsung.com>
---
 drivers/gpu/drm/exynos/exynos_hdmi.c |   13 ++++---------
 1 file changed, 4 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_hdmi.c b/drivers/gpu/drm/exynos/exynos_hdmi.c
index e36588a..5adb5c1 100644
--- a/drivers/gpu/drm/exynos/exynos_hdmi.c
+++ b/drivers/gpu/drm/exynos/exynos_hdmi.c
@@ -1858,23 +1858,18 @@ static struct s5p_hdmi_platform_data *drm_hdmi_dt_parse_pdata
 {
 	struct device_node *np = dev->of_node;
 	struct s5p_hdmi_platform_data *pd;
-	u32 value;
 
 	pd = devm_kzalloc(dev, sizeof(*pd), GFP_KERNEL);
 	if (!pd)
-		goto err_data;
+		return NULL;
 
-	if (!of_find_property(np, "hpd-gpio", &value)) {
+	pd->hpd_gpio = of_get_named_gpio_flags(np, "hpd-gpio", 0, NULL);
+	if (pd->hpd_gpio < 0) {
 		DRM_ERROR("no hpd gpio property found\n");
-		goto err_data;
+		return NULL;
 	}
 
-	pd->hpd_gpio = of_get_named_gpio(np, "hpd-gpio", 0);
-
 	return pd;
-
-err_data:
-	return NULL;
 }
 
 static struct of_device_id hdmi_match_types[] = {
-- 
1.7.9.5
