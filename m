From: Tomasz Stanislawski <t.stanislaws@samsung.com>
Subject: [PATCH]  drm: exynos: hdmi: simplify extracting hpd-gpio from DT
Date: Mon, 14 Apr 2014 12:07:11 +0200
Message-ID: <534BB34F.7040308@samsung.com>
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
To: DRI mailing list <dri-devel@lists.freedesktop.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>
Cc: =?UTF-8?B?6rmA6rWt7KeE?= <kgene.kim@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, =?UTF-8?B?6rmA7Iq57Jqw?= <sw0312.kim@samsung.com>, =?UTF-8?B?J+uwleqyveuvvCc=?= <kyungmin.park@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

This patch eliminates redundant checks while retrieving HPD gpio from DT during
HDMI's probe().

Signed-off-by: Tomasz Stanislawski <t.stanislaws@samsung.com>
---
 drivers/gpu/drm/exynos/exynos_hdmi.c |   13 ++++---------
 1 file changed, 4 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_hdmi.c b/drivers/gpu/drm/exynos/exynos_hdmi.c
index e1a2e88..300c2af 100644
--- a/drivers/gpu/drm/exynos/exynos_hdmi.c
+++ b/drivers/gpu/drm/exynos/exynos_hdmi.c
@@ -2011,23 +2011,18 @@ static struct s5p_hdmi_platform_data *drm_hdmi_dt_parse_pdata
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
