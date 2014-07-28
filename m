From: Inki Dae <inki.dae@samsung.com>
Subject: [PATCH v2 2/2] drm/exynos: dsi: add LPM (Low Power Mode) transfer
 support
Date: Mon, 28 Jul 2014 11:00:57 +0900
Message-ID: <1406512857-7213-3-git-send-email-inki.dae@samsung.com>
References: <1406512857-7213-1-git-send-email-inki.dae@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-reply-to: <1406512857-7213-1-git-send-email-inki.dae@samsung.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: dri-devel@lists.freedesktop.org
Cc: a.hajda@samsung.com, treding@nvidia.com, linux-samsung-soc@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

This patch adds LPM transfer support for video or command data.

With this patch, Exynos MIPI DSI controller can transfer command or
video data with HS or LP mode in accordance with mode_flags set
by LCD Panel driver.

Changelog v2: Enable High Speed clock only in case of stand by request.

Signed-off-by: Inki Dae <inki.dae@samsung.com>
Acked-by: Kyungmin Park <kyungmin.park@samsung.com>
---
 drivers/gpu/drm/exynos/exynos_drm_dsi.c |   22 ++++++++++++++++++++--
 1 file changed, 20 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_dsi.c b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
index 5e78d45..1bed105 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_dsi.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
@@ -493,8 +493,11 @@ static int exynos_dsi_enable_clock(struct exynos_dsi *dsi)
 			| DSIM_ESC_PRESCALER(esc_div)
 			| DSIM_LANE_ESC_CLK_EN_CLK
 			| DSIM_LANE_ESC_CLK_EN_DATA(BIT(dsi->lanes) - 1)
-			| DSIM_BYTE_CLK_SRC(0)
-			| DSIM_TX_REQUEST_HSCLK;
+			| DSIM_BYTE_CLK_SRC(0);
+
+	if (!(dsi->mode_flags & MIPI_DSI_MODE_CMD_LPM))
+		reg |= DSIM_TX_REQUEST_HSCLK;
+
 	writel(reg, dsi->reg_base + DSIM_CLKCTRL_REG);
 
 	return 0;
@@ -553,6 +556,18 @@ static void exynos_dsi_set_phy_ctrl(struct exynos_dsi *dsi)
 	writel(reg, dsi->reg_base + DSIM_PHYTIMING2_REG);
 }
 
+static void exynos_dsi_enable_hs_clock(struct exynos_dsi *dsi,
+					bool enable)
+{
+	u32 reg = readl(dsi->reg_base + DSIM_CLKCTRL_REG);
+
+	reg &= ~DSIM_TX_REQUEST_HSCLK;
+	if (enable)
+		reg |= DSIM_TX_REQUEST_HSCLK;
+
+	writel(reg, dsi->reg_base + DSIM_CLKCTRL_REG);
+}
+
 static void exynos_dsi_disable_clock(struct exynos_dsi *dsi)
 {
 	u32 reg;
@@ -705,6 +720,9 @@ static void exynos_dsi_set_display_enable(struct exynos_dsi *dsi, bool enable)
 {
 	u32 reg;
 
+	if (!(dsi->mode_flags & MIPI_DSI_MODE_VIDEO_LPM) && enable)
+		exynos_dsi_enable_hs_clock(dsi, true);
+
 	reg = readl(dsi->reg_base + DSIM_MDRESOL_REG);
 	if (enable)
 		reg |= DSIM_MAIN_STAND_BY;
-- 
1.7.9.5
