From: Tomasz Stanislawski <t.stanislaws@samsung.com>
Subject: [RFC 06/12] Revert
 "drm/exynos: add mout_hdmi clock in hdmi driver to change parent"
Date: Mon, 21 Oct 2013 16:18:25 +0200
Message-ID: <1382365111-6533-7-git-send-email-t.stanislaws@samsung.com>
References: <1382365111-6533-1-git-send-email-t.stanislaws@samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <1382365111-6533-1-git-send-email-t.stanislaws@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, kyungmin.park@samsung.com, t.figa@samsung.com, kishon@ti.com, sw0312.kim@samsung.com, inki.dae@samsung.com, rahul.sharma@samsung.com, kgene.kim@samsung.com, s.nawrocki@samsung.com, thomas.abraham@linaro.org, mturquette@linaro.org, Tomasz Stanislawski <t.stanislaws@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

This reverts commit 59956d35a8618235ea715280b49447bb36f2c975.
---
 drivers/gpu/drm/exynos/exynos_hdmi.c |   14 ++++----------
 1 file changed, 4 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_hdmi.c b/drivers/gpu/drm/exynos/exynos_hdmi.c
index a0e10ae..fcfa23a 100644
--- a/drivers/gpu/drm/exynos/exynos_hdmi.c
+++ b/drivers/gpu/drm/exynos/exynos_hdmi.c
@@ -83,7 +83,6 @@ struct hdmi_resources {
 	struct clk			*sclk_pixel;
 	struct clk			*sclk_hdmiphy;
 	struct clk			*hdmiphy;
-	struct clk			*mout_hdmi;
 	struct regulator_bulk_data	*regul_bulk;
 	int				regul_count;
 };
@@ -1113,7 +1112,7 @@ static void hdmi_v13_mode_apply(struct hdmi_context *hdata)
 	}
 
 	clk_disable_unprepare(hdata->res.sclk_hdmi);
-	clk_set_parent(hdata->res.mout_hdmi, hdata->res.sclk_hdmiphy);
+	clk_set_parent(hdata->res.sclk_hdmi, hdata->res.sclk_hdmiphy);
 	clk_prepare_enable(hdata->res.sclk_hdmi);
 
 	/* enable HDMI and timing generator */
@@ -1280,7 +1279,7 @@ static void hdmi_v14_mode_apply(struct hdmi_context *hdata)
 	}
 
 	clk_disable_unprepare(hdata->res.sclk_hdmi);
-	clk_set_parent(hdata->res.mout_hdmi, hdata->res.sclk_hdmiphy);
+	clk_set_parent(hdata->res.sclk_hdmi, hdata->res.sclk_hdmiphy);
 	clk_prepare_enable(hdata->res.sclk_hdmi);
 
 	/* enable HDMI and timing generator */
@@ -1306,7 +1305,7 @@ static void hdmiphy_conf_reset(struct hdmi_context *hdata)
 	u32 reg;
 
 	clk_disable_unprepare(hdata->res.sclk_hdmi);
-	clk_set_parent(hdata->res.mout_hdmi, hdata->res.sclk_pixel);
+	clk_set_parent(hdata->res.sclk_hdmi, hdata->res.sclk_pixel);
 	clk_prepare_enable(hdata->res.sclk_hdmi);
 
 	/* operation mode */
@@ -1815,13 +1814,8 @@ static int hdmi_resources_init(struct hdmi_context *hdata)
 		DRM_ERROR("failed to get clock 'hdmiphy'\n");
 		goto fail;
 	}
-	res->mout_hdmi = devm_clk_get(dev, "mout_hdmi");
-	if (IS_ERR(res->mout_hdmi)) {
-		DRM_ERROR("failed to get clock 'mout_hdmi'\n");
-		goto fail;
-	}
 
-	clk_set_parent(res->mout_hdmi, res->sclk_pixel);
+	clk_set_parent(res->sclk_hdmi, res->sclk_pixel);
 
 	res->regul_bulk = devm_kzalloc(dev, ARRAY_SIZE(supply) *
 		sizeof(res->regul_bulk[0]), GFP_KERNEL);
-- 
1.7.9.5
