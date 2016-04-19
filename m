From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH v2] drm/exynos: dsi: use generic of_device_get_match_data helper
Date: Tue, 19 Apr 2016 09:37:10 +0200
Message-ID: <1461051430-10176-1-git-send-email-m.szyprowski@samsung.com>
References: <57149F62.1000104@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:22376 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751325AbcDSHhZ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 19 Apr 2016 03:37:25 -0400
Received: from eucpsbgm1.samsung.com (unknown [203.254.199.244])
 by mailout3.w1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0O5V0000AEI88V10@mailout3.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 19 Apr 2016 08:37:20 +0100 (BST)
In-reply-to: <57149F62.1000104@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Inki Dae <inki.dae@samsung.com>, Joonyoung Shim <jy0922.shim@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Andrzej Hajda <a.hajda@samsung.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>

Simplify code by replacing custom code by generic helper and add missing
const qualifier to driver data structures.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
v2:
- added missing const qualifier to driver data structures
---
 drivers/gpu/drm/exynos/exynos_drm_dsi.c | 27 +++++++++------------------
 1 file changed, 9 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_dsi.c b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
index 63c84a106c0b..72c3565d22ee 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_dsi.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
@@ -280,7 +280,7 @@ struct exynos_dsi {
 	spinlock_t transfer_lock; /* protects transfer_list */
 	struct list_head transfer_list;
 
-	struct exynos_dsi_driver_data *driver_data;
+	const struct exynos_dsi_driver_data *driver_data;
 	struct device_node *bridge_node;
 };
 
@@ -532,15 +532,6 @@ static const struct of_device_id exynos_dsi_of_match[] = {
 	{ }
 };
 
-static inline struct exynos_dsi_driver_data *exynos_dsi_get_driver_data(
-						struct platform_device *pdev)
-{
-	const struct of_device_id *of_id =
-			of_match_device(exynos_dsi_of_match, &pdev->dev);
-
-	return (struct exynos_dsi_driver_data *)of_id->data;
-}
-
 static void exynos_dsi_wait_for_reset(struct exynos_dsi *dsi)
 {
 	if (wait_for_completion_timeout(&dsi->completed, msecs_to_jiffies(300)))
@@ -564,7 +555,7 @@ static void exynos_dsi_reset(struct exynos_dsi *dsi)
 static unsigned long exynos_dsi_pll_find_pms(struct exynos_dsi *dsi,
 		unsigned long fin, unsigned long fout, u8 *p, u16 *m, u8 *s)
 {
-	struct exynos_dsi_driver_data *driver_data = dsi->driver_data;
+	const struct exynos_dsi_driver_data *driver_data = dsi->driver_data;
 	unsigned long best_freq = 0;
 	u32 min_delta = 0xffffffff;
 	u8 p_min, p_max;
@@ -618,7 +609,7 @@ static unsigned long exynos_dsi_pll_find_pms(struct exynos_dsi *dsi,
 static unsigned long exynos_dsi_set_pll(struct exynos_dsi *dsi,
 					unsigned long freq)
 {
-	struct exynos_dsi_driver_data *driver_data = dsi->driver_data;
+	const struct exynos_dsi_driver_data *driver_data = dsi->driver_data;
 	unsigned long fin, fout;
 	int timeout;
 	u8 p, s;
@@ -712,7 +703,7 @@ static int exynos_dsi_enable_clock(struct exynos_dsi *dsi)
 
 static void exynos_dsi_set_phy_ctrl(struct exynos_dsi *dsi)
 {
-	struct exynos_dsi_driver_data *driver_data = dsi->driver_data;
+	const struct exynos_dsi_driver_data *driver_data = dsi->driver_data;
 	const unsigned int *reg_values = driver_data->reg_values;
 	u32 reg;
 
@@ -790,7 +781,7 @@ static void exynos_dsi_enable_lane(struct exynos_dsi *dsi, u32 lane)
 
 static int exynos_dsi_init_link(struct exynos_dsi *dsi)
 {
-	struct exynos_dsi_driver_data *driver_data = dsi->driver_data;
+	const struct exynos_dsi_driver_data *driver_data = dsi->driver_data;
 	int timeout;
 	u32 reg;
 	u32 lanes_mask;
@@ -1334,7 +1325,7 @@ static void exynos_dsi_disable_irq(struct exynos_dsi *dsi)
 
 static int exynos_dsi_init(struct exynos_dsi *dsi)
 {
-	struct exynos_dsi_driver_data *driver_data = dsi->driver_data;
+	const struct exynos_dsi_driver_data *driver_data = dsi->driver_data;
 
 	exynos_dsi_reset(dsi);
 	exynos_dsi_enable_irq(dsi);
@@ -1833,7 +1824,7 @@ static int exynos_dsi_probe(struct platform_device *pdev)
 	dsi->dsi_host.dev = dev;
 
 	dsi->dev = dev;
-	dsi->driver_data = exynos_dsi_get_driver_data(pdev);
+	dsi->driver_data = of_device_get_match_data(dev);
 
 	ret = exynos_dsi_parse_dt(dsi);
 	if (ret)
@@ -1917,7 +1908,7 @@ static int __maybe_unused exynos_dsi_suspend(struct device *dev)
 {
 	struct drm_encoder *encoder = dev_get_drvdata(dev);
 	struct exynos_dsi *dsi = encoder_to_dsi(encoder);
-	struct exynos_dsi_driver_data *driver_data = dsi->driver_data;
+	const struct exynos_dsi_driver_data *driver_data = dsi->driver_data;
 	int ret, i;
 
 	usleep_range(10000, 20000);
@@ -1948,7 +1939,7 @@ static int __maybe_unused exynos_dsi_resume(struct device *dev)
 {
 	struct drm_encoder *encoder = dev_get_drvdata(dev);
 	struct exynos_dsi *dsi = encoder_to_dsi(encoder);
-	struct exynos_dsi_driver_data *driver_data = dsi->driver_data;
+	const struct exynos_dsi_driver_data *driver_data = dsi->driver_data;
 	int ret, i;
 
 	ret = regulator_bulk_enable(ARRAY_SIZE(dsi->supplies), dsi->supplies);
-- 
1.9.2
