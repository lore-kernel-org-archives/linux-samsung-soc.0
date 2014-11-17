From: YoungJun Cho <yj44.cho@samsung.com>
Subject: [PATCH 9/9] drm/exynos: dsi: set TE GPIO IRQ status as IRQ_NOAUTOEN
Date: Mon, 17 Nov 2014 22:00:16 +0900
Message-ID: <1416229216-32018-10-git-send-email-yj44.cho@samsung.com>
References: <1416229216-32018-1-git-send-email-yj44.cho@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:35157 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751632AbaKQNAa (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 17 Nov 2014 08:00:30 -0500
Received: from epcpsbgr4.samsung.com
 (u144.gpu120.samsung.co.kr [203.254.230.144])
 by mailout1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0NF600LK9PGL9T40@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 17 Nov 2014 22:00:21 +0900 (KST)
In-reply-to: <1416229216-32018-1-git-send-email-yj44.cho@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: dri-devel@lists.freedesktop.org
Cc: linux-samsung-soc@vger.kernel.org, inki.dae@samsung.com, jy0922.shim@samsung.com, sw0312.kim@samsung.com, a.hajda@samsung.com, kyungmin.park@samsung.com

The exynos_dsi_te_irq_handler() works only dsi(DPMS) is on.
So it is enough to enable and disable TE GPIO IRQ in
exynos_dsi_enable(disable)_irq() like DSI IRQ.

Signed-off-by: YoungJun Cho <yj44.cho@samsung.com>
Acked-by: Inki Dae <inki.dae@samsung.com>a
Acked-by: Kyungmin Park <kyungmin.park@samsung.com>
---
 drivers/gpu/drm/exynos/exynos_drm_dsi.c | 13 +++++--------
 1 file changed, 5 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_dsi.c b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
index 6fe6486..717c719 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_dsi.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
@@ -1155,6 +1155,7 @@ static int exynos_dsi_init(struct exynos_dsi *dsi)
 static int exynos_dsi_register_te_irq(struct exynos_dsi *dsi)
 {
 	int ret;
+	int te_gpio_irq;
 
 	dsi->te_gpio = of_get_named_gpio(dsi->panel_node, "te-gpios", 0);
 	if (!gpio_is_valid(dsi->te_gpio)) {
@@ -1169,14 +1170,10 @@ static int exynos_dsi_register_te_irq(struct exynos_dsi *dsi)
 		goto out;
 	}
 
-	/*
-	 * This TE GPIO IRQ should not be set to IRQ_NOAUTOEN, because panel
-	 * calls drm_panel_init() first then calls mipi_dsi_attach() in probe().
-	 * It means that te_gpio is invalid when exynos_dsi_enable_irq() is
-	 * called by drm_panel_init() before panel is attached.
-	 */
-	ret = request_threaded_irq(gpio_to_irq(dsi->te_gpio),
-					exynos_dsi_te_irq_handler, NULL,
+	te_gpio_irq = gpio_to_irq(dsi->te_gpio);
+
+	irq_set_status_flags(te_gpio_irq, IRQ_NOAUTOEN);
+	ret = request_threaded_irq(te_gpio_irq, exynos_dsi_te_irq_handler, NULL,
 					IRQF_TRIGGER_RISING, "TE", dsi);
 	if (ret) {
 		dev_err(dsi->dev, "request interrupt failed with %d\n", ret);
-- 
1.9.0
