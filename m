From: Seung-Woo Kim <sw0312.kim@samsung.com>
Subject: [PATCH] drm/exynos: hdmi: add null check for hdmiphy_port
Date: Mon, 28 Jul 2014 17:15:22 +0900
Message-ID: <1406535322-6589-1-git-send-email-sw0312.kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces@lists.freedesktop.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: dri-devel@lists.freedesktop.org, inki.dae@samsung.com
Cc: linux-samsung-soc@vger.kernel.org, sw0312.kim@samsung.com
List-Id: linux-samsung-soc@vger.kernel.org

The hdmiphy can be apb and hdmiphy_port can be null. So before
accessing hdmiphy_port, it should be checked.

Signed-off-by: Seung-Woo Kim <sw0312.kim@samsung.com>
---
 drivers/gpu/drm/exynos/exynos_hdmi.c |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_hdmi.c b/drivers/gpu/drm/exynos/exynos_hdmi.c
index fd8141f..54d97f7 100644
--- a/drivers/gpu/drm/exynos/exynos_hdmi.c
+++ b/drivers/gpu/drm/exynos/exynos_hdmi.c
@@ -2520,7 +2520,8 @@ static int hdmi_remove(struct platform_device *pdev)
 	if (hdata->res.reg_hdmi_en)
 		regulator_disable(hdata->res.reg_hdmi_en);
 
-	put_device(&hdata->hdmiphy_port->dev);
+	if (hdata->hdmiphy_port)
+		put_device(&hdata->hdmiphy_port->dev);
 	put_device(&hdata->ddc_adpt->dev);
 
 	pm_runtime_disable(&pdev->dev);
-- 
1.7.4.1
