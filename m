From: Rahul Sharma <rahul.sharma@samsung.com>
Subject: [PATCH v3 3/3] s5p-tv: hdmi: use hdmiphy as PHY
Date: Thu, 15 May 2014 00:47:23 +0530
Message-ID: <1400095043-685-4-git-send-email-rahul.sharma@samsung.com>
References: <1400095043-685-1-git-send-email-rahul.sharma@samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <1400095043-685-1-git-send-email-rahul.sharma@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, dri-devel@lists.freedesktop.org
Cc: a.hajda@samsung.com, t.stanislaws@samsung.com, devicetree@vger.kernel.org, kgene.kim@samsung.com, kishon@ti.com, kyungmin.park@samsung.com, robh+dt@kernel.org, grant.likely@linaro.org, sylvester.nawrocki@gmail.com, joshi@samsung.com, Rahul Sharma <rahul.sharma@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

From: Tomasz Stanislawski <t.stanislaws@samsung.com>

The HDMIPHY (physical interface) is controlled by a single
bit in a power controller's regiter. It was implemented
as clock. It was a simple but effective hack.

This patch makes S5P-HDMI driver to control HDMIPHY via PHY interface.

Signed-off-by: Tomasz Stanislawski <t.stanislaws@samsung.com>
Signed-off-by: Rahul Sharma <Rahul.Sharma@samsung.com>
---
 drivers/media/platform/s5p-tv/hdmi_drv.c |   11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/media/platform/s5p-tv/hdmi_drv.c b/drivers/media/platform/s5p-tv/hdmi_drv.c
index 534722c..8013e52 100644
--- a/drivers/media/platform/s5p-tv/hdmi_drv.c
+++ b/drivers/media/platform/s5p-tv/hdmi_drv.c
@@ -32,6 +32,7 @@
 #include <linux/clk.h>
 #include <linux/regulator/consumer.h>
 #include <linux/v4l2-dv-timings.h>
+#include <linux/phy/phy.h>
 
 #include <media/s5p_hdmi.h>
 #include <media/v4l2-common.h>
@@ -66,7 +67,7 @@ struct hdmi_resources {
 	struct clk *sclk_hdmi;
 	struct clk *sclk_pixel;
 	struct clk *sclk_hdmiphy;
-	struct clk *hdmiphy;
+	struct phy *hdmiphy;
 	struct regulator_bulk_data *regul_bulk;
 	int regul_count;
 };
@@ -586,7 +587,7 @@ static int hdmi_resource_poweron(struct hdmi_resources *res)
 	if (ret < 0)
 		return ret;
 	/* power-on hdmi physical interface */
-	clk_enable(res->hdmiphy);
+	phy_power_on(res->hdmiphy);
 	/* use VPP as parent clock; HDMIPHY is not working yet */
 	clk_set_parent(res->sclk_hdmi, res->sclk_pixel);
 	/* turn clocks on */
@@ -600,7 +601,7 @@ static void hdmi_resource_poweroff(struct hdmi_resources *res)
 	/* turn clocks off */
 	clk_disable(res->sclk_hdmi);
 	/* power-off hdmiphy */
-	clk_disable(res->hdmiphy);
+	phy_power_off(res->hdmiphy);
 	/* turn HDMI power off */
 	regulator_bulk_disable(res->regul_count, res->regul_bulk);
 }
@@ -784,7 +785,7 @@ static void hdmi_resources_cleanup(struct hdmi_device *hdev)
 	/* kfree is NULL-safe */
 	kfree(res->regul_bulk);
 	if (!IS_ERR(res->hdmiphy))
-		clk_put(res->hdmiphy);
+		phy_put(res->hdmiphy);
 	if (!IS_ERR(res->sclk_hdmiphy))
 		clk_put(res->sclk_hdmiphy);
 	if (!IS_ERR(res->sclk_pixel))
@@ -835,7 +836,7 @@ static int hdmi_resources_init(struct hdmi_device *hdev)
 		dev_err(dev, "failed to get clock 'sclk_hdmiphy'\n");
 		goto fail;
 	}
-	res->hdmiphy = clk_get(dev, "hdmiphy");
+	res->hdmiphy = phy_get(dev, "hdmiphy");
 	if (IS_ERR(res->hdmiphy)) {
 		dev_err(dev, "failed to get clock 'hdmiphy'\n");
 		goto fail;
-- 
1.7.9.5
