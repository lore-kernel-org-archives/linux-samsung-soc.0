From: YoungJun Cho <yj44.cho@samsung.com>
Subject: [PATCH v6 05/14] drm/exynos: dsi: add TE interrupt handler to support
 LCD I80 interface
Date: Tue, 22 Jul 2014 19:49:44 +0900
Message-ID: <1406026184-29185-1-git-send-email-yj44.cho@samsung.com>
References: <53CE3C45.9010509@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-reply-to: <53CE3C45.9010509@samsung.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: airlied@linux.ie, dri-devel@lists.freedesktop.org
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, pawel.moll@arm.com, ijc+devicetree@hellion.org.uk, sw0312.kim@samsung.com, a.hajda@samsung.com, kyungmin.park@samsung.com, robh+dt@kernel.org, galak@codeaurora.org, kgene.kim@samsung.com
List-Id: linux-samsung-soc@vger.kernel.org

This is a temporary solution and should be made by more
generic way.

To support LCD I80 interface, the DSI host should register
TE interrupt handler from the TE GPIO of attached panel.
So the panel generates a tearing effect synchronization signal
then the DSI host calls the CRTC device manager to trigger
to transfer video image.

Signed-off-by: YoungJun Cho <yj44.cho@samsung.com>
Acked-by: Inki Dae <inki.dae@samsung.com>
Acked-by: Kyungmin Park <kyungmin.park@samsung.com>
---
 drivers/gpu/drm/exynos/exynos_drm_dsi.c | 97 ++++++++++++++++++++++++++++++++-
 1 file changed, 95 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_dsi.c b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
index 58bfb2a..3adad44 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_dsi.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
@@ -16,7 +16,9 @@
 #include <drm/drm_panel.h>
 
 #include <linux/clk.h>
+#include <linux/gpio/consumer.h>
 #include <linux/irq.h>
+#include <linux/of_gpio.h>
 #include <linux/phy/phy.h>
 #include <linux/regulator/consumer.h>
 #include <linux/component.h>
@@ -24,6 +26,7 @@
 #include <video/mipi_display.h>
 #include <video/videomode.h>
 
+#include "exynos_drm_crtc.h"
 #include "exynos_drm_drv.h"
 
 /* returns true iff both arguments logically differs */
@@ -247,6 +250,7 @@ struct exynos_dsi {
 	struct clk *bus_clk;
 	struct regulator_bulk_data supplies[2];
 	int irq;
+	int te_gpio;
 
 	u32 pll_clk_rate;
 	u32 burst_clk_rate;
@@ -954,17 +958,89 @@ static irqreturn_t exynos_dsi_irq(int irq, void *dev_id)
 	return IRQ_HANDLED;
 }
 
+static irqreturn_t exynos_dsi_te_irq_handler(int irq, void *dev_id)
+{
+	struct exynos_dsi *dsi = (struct exynos_dsi *)dev_id;
+	struct drm_encoder *encoder = dsi->encoder;
+
+	if (dsi->state & DSIM_STATE_ENABLED)
+		exynos_drm_crtc_te_handler(encoder->crtc);
+
+	return IRQ_HANDLED;
+}
+
+static void exynos_dsi_enable_irq(struct exynos_dsi *dsi)
+{
+	enable_irq(dsi->irq);
+
+	if (gpio_is_valid(dsi->te_gpio))
+		enable_irq(gpio_to_irq(dsi->te_gpio));
+}
+
+static void exynos_dsi_disable_irq(struct exynos_dsi *dsi)
+{
+	if (gpio_is_valid(dsi->te_gpio))
+		disable_irq(gpio_to_irq(dsi->te_gpio));
+
+	disable_irq(dsi->irq);
+}
+
 static int exynos_dsi_init(struct exynos_dsi *dsi)
 {
 	exynos_dsi_enable_clock(dsi);
 	exynos_dsi_reset(dsi);
-	enable_irq(dsi->irq);
+	exynos_dsi_enable_irq(dsi);
 	exynos_dsi_wait_for_reset(dsi);
 	exynos_dsi_init_link(dsi);
 
 	return 0;
 }
 
+static int exynos_dsi_register_te_irq(struct exynos_dsi *dsi)
+{
+	int ret;
+
+	dsi->te_gpio = of_get_named_gpio(dsi->panel_node, "te-gpios", 0);
+	if (!gpio_is_valid(dsi->te_gpio)) {
+		dev_err(dsi->dev, "no te-gpios specified\n");
+		ret = dsi->te_gpio;
+		goto out;
+	}
+
+	ret = gpio_request_one(dsi->te_gpio, GPIOF_IN, "te_gpio");
+	if (ret) {
+		dev_err(dsi->dev, "gpio request failed with %d\n", ret);
+		goto out;
+	}
+
+	/*
+	 * This TE GPIO IRQ should not be set to IRQ_NOAUTOEN, because panel
+	 * calls drm_panel_init() first then calls mipi_dsi_attach() in probe().
+	 * It means that te_gpio is invalid when exynos_dsi_enable_irq() is
+	 * called by drm_panel_init() before panel is attached.
+	 */
+	ret = request_threaded_irq(gpio_to_irq(dsi->te_gpio),
+					exynos_dsi_te_irq_handler, NULL,
+					IRQF_TRIGGER_RISING, "TE", dsi);
+	if (ret) {
+		dev_err(dsi->dev, "request interrupt failed with %d\n", ret);
+		gpio_free(dsi->te_gpio);
+		goto out;
+	}
+
+out:
+	return ret;
+}
+
+static void exynos_dsi_unregister_te_irq(struct exynos_dsi *dsi)
+{
+	if (gpio_is_valid(dsi->te_gpio)) {
+		free_irq(gpio_to_irq(dsi->te_gpio), dsi);
+		gpio_free(dsi->te_gpio);
+		dsi->te_gpio = -ENOENT;
+	}
+}
+
 static int exynos_dsi_host_attach(struct mipi_dsi_host *host,
 				  struct mipi_dsi_device *device)
 {
@@ -978,6 +1054,18 @@ static int exynos_dsi_host_attach(struct mipi_dsi_host *host,
 	if (dsi->connector.dev)
 		drm_helper_hpd_irq_event(dsi->connector.dev);
 
+	/*
+	 * This is a temporary solution and should be made by more generic way.
+	 *
+	 * If attached panel device is for command mode one, dsi should register
+	 * TE interrupt handler.
+	 */
+	if (!(dsi->mode_flags & MIPI_DSI_MODE_VIDEO)) {
+		int ret = exynos_dsi_register_te_irq(dsi);
+		if (ret)
+			return ret;
+	}
+
 	return 0;
 }
 
@@ -986,6 +1074,8 @@ static int exynos_dsi_host_detach(struct mipi_dsi_host *host,
 {
 	struct exynos_dsi *dsi = host_to_dsi(host);
 
+	exynos_dsi_unregister_te_irq(dsi);
+
 	dsi->panel_node = NULL;
 
 	if (dsi->connector.dev)
@@ -1099,7 +1189,7 @@ static void exynos_dsi_poweroff(struct exynos_dsi *dsi)
 
 		exynos_dsi_disable_clock(dsi);
 
-		disable_irq(dsi->irq);
+		exynos_dsi_disable_irq(dsi);
 	}
 
 	dsi->state &= ~DSIM_STATE_CMD_LPM;
@@ -1445,6 +1535,9 @@ static int exynos_dsi_probe(struct platform_device *pdev)
 		goto err_del_component;
 	}
 
+	/* To be checked as invalid one */
+	dsi->te_gpio = -ENOENT;
+
 	init_completion(&dsi->completed);
 	spin_lock_init(&dsi->transfer_lock);
 	INIT_LIST_HEAD(&dsi->transfer_list);
-- 
1.9.0
