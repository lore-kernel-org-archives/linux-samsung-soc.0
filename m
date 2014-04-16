From: Tomasz Stanislawski <t.stanislaws@samsung.com>
Subject: [PATCHv3 5/5] drm: exynos: hdmi: add support for pixel clock
 limitation
Date: Wed, 16 Apr 2014 17:12:58 +0200
Message-ID: <1397661178-6016-6-git-send-email-t.stanislaws@samsung.com>
References: <1397661178-6016-1-git-send-email-t.stanislaws@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-reply-to: <1397661178-6016-1-git-send-email-t.stanislaws@samsung.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: linux-samsung-soc@vger.kernel.org, dri-devel@lists.freedesktop.org
Cc: Tomasz Stanislawski <t.stanislaws@samsung.com>, pawel.moll@arm.com, b.zolnierkie@samsung.com, sw0312.kim@samsung.com, kyungmin.park@samsung.com, robh+dt@kernel.org, rahul.sharma@samsung.com, m.chehab@samsung.com
List-Id: linux-samsung-soc@vger.kernel.org

Adds support for limitation of maximal pixel clock of HDMI
signal. This feature is needed on boards that contains
lines or bridges with frequency limitations.

Signed-off-by: Tomasz Stanislawski <t.stanislaws@samsung.com>
---
 .../devicetree/bindings/video/exynos_hdmi.txt      |    4 ++++
 drivers/gpu/drm/exynos/exynos_hdmi.c               |   11 +++++++++++
 2 files changed, 15 insertions(+)

diff --git a/Documentation/devicetree/bindings/video/exynos_hdmi.txt b/Documentation/devicetree/bindings/video/exynos_hdmi.txt
index f9187a2..8718f8d 100644
--- a/Documentation/devicetree/bindings/video/exynos_hdmi.txt
+++ b/Documentation/devicetree/bindings/video/exynos_hdmi.txt
@@ -28,6 +28,10 @@ Required properties:
 - ddc: phandle to the hdmi ddc node
 - phy: phandle to the hdmi phy node
 
+Optional properties:
+- max-pixel-clock: used to limit the maximal pixel clock if a board has lines,
+	connectors or bridges not capable of carring higher frequencies
+
 Example:
 
 	hdmi {
diff --git a/drivers/gpu/drm/exynos/exynos_hdmi.c b/drivers/gpu/drm/exynos/exynos_hdmi.c
index 9adbd34..e012ba9 100644
--- a/drivers/gpu/drm/exynos/exynos_hdmi.c
+++ b/drivers/gpu/drm/exynos/exynos_hdmi.c
@@ -194,6 +194,7 @@ struct hdmi_context {
 	struct hdmi_resources		res;
 
 	int				hpd_gpio;
+	u32				max_pixel_clock;
 
 	enum hdmi_type			type;
 };
@@ -886,6 +887,9 @@ static int hdmi_mode_valid(struct drm_connector *connector,
 	if (ret)
 		return MODE_BAD;
 
+	if (mode->clock * 1000 > hdata->max_pixel_clock)
+		return MODE_CLOCK_HIGH;
+
 	ret = hdmi_find_phy_conf(hdata, mode->clock * 1000);
 	if (ret < 0)
 		return MODE_BAD;
@@ -2022,6 +2026,13 @@ static int drm_hdmi_dt_parse(struct hdmi_context *hdata, struct device_node *np)
 		return -ENOENT;
 	}
 
+	of_property_read_u32(np, "max-pixel-clock", &hdata->max_pixel_clock);
+	if (!hdata->max_pixel_clock) {
+		DRM_INFO("max-pixel-clock is zero, using INF\n");
+		hdata->max_pixel_clock = U32_MAX;
+	}
+
+
 	return 0;
 }
 
-- 
1.7.9.5
