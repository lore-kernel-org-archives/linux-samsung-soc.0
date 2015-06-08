From: Hyungwon Hwang <human.hwang@samsung.com>
Subject: [PATCH v2] drm/exynos: dsi: check whether dsi is enabled before
 sending data
Date: Mon, 08 Jun 2015 09:40:17 +0900
Message-ID: <1433724017-13536-1-git-send-email-human.hwang@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:57769 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751211AbbFHAk2 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 7 Jun 2015 20:40:28 -0400
Received: from epcpsbgr3.samsung.com
 (u143.gpu120.samsung.co.kr [203.254.230.143])
 by mailout4.samsung.com (Oracle Communications Messaging Server 7.0.5.31.0
 64bit (built May  5 2014))
 with ESMTP id <0NPL01ZPBOJE9S60@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 08 Jun 2015 09:40:26 +0900 (KST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org, inki.dae@samsung.com
Cc: sw0312.kim@samsung.com, jy0922.shim@samsung.com, Hyungwon Hwang <human.hwang@samsung.com>

exynos_dsi_host_transfer() can be called through a panel driver while
DSI is turning down. It is possible because the function checks only
whether DSI is initialized or not, and there is a moment which DSI is
set by uninitialized, but DSI is still turning down. To prevent it,
DSI must be set by disabled before starting to be turned down, and
exynos_dsi_host_transfer() must check whether DSI is enabled or not.

Kernel dump:
[ 4721.351448] Unhandled fault: synchronous external abort (0x96000210) at 0xffffff800015e018
[ 4721.351809] Internal error: : 96000210 [#1] PREEMPT SMP
[ 4721.352031] Modules linked in:
[ 4721.352173] CPU: 2 PID: 300 Comm: deviced Tainted: G        W       4.0.4-01017-g7964a87 #1
[ 4721.353989] Hardware name: Samsung DRACO board (DT)
[ 4721.358852] task: ffffffc0a0b70000 ti: ffffffc0a00ec000 task.ti: ffffffc0a00ec000
[ 4721.366327] PC is at exynos_dsi_enable_lane+0x14/0x5c
[ 4721.371353] LR is at exynos_dsi_host_transfer+0x834/0x8d8
[ 4721.376731] pc : [<ffffffc000432bcc>] lr : [<ffffffc000434590>] pstate: 60000145
[ 4721.384107] sp : ffffffc0a00efbe0
[ 4721.387405] x29: ffffffc0a00efbe0 x28: ffffffc0a00ec000
[ 4721.392699] x27: ffffffc000968000 x26: 0000000000000040
[ 4721.397994] x25: ffffffc000f74dc0 x24: ffffffc0a00efec8
[ 4721.403290] x23: ffffffc0a4815400 x22: ffffffc0009f2729
[ 4721.408584] x21: ffffffc0a00efcc8 x20: ffffffc0a4a2a848
[ 4721.413879] x19: ffffffc0a4a2a818 x18: 0000000000000004
[ 4721.419173] x17: 0000007faa5cddf0 x16: ffffffc0001a40a8
[ 4721.424469] x15: 0000000000000009 x14: 000000000000000d
[ 4721.429762] x13: 6e6e6f63206b726f x12: 0000000000000010
[ 4721.435058] x11: 0101010101010101 x10: 0000000000000000
[ 4721.440353] x9 : 000000000000000a x8 : 8386838282818381
[ 4721.445648] x7 : ffffffc0a201efe8 x6 : 0000000000000000
[ 4721.450943] x5 : 00000000fffffffa x4 : ffffffc0a201f170
[ 4721.456237] x3 : ffffff800015e000 x2 : ffffff800015e018
[ 4721.461531] x1 : 000000000000000f x0 : ffffffc0a4a2a818
[ 4721.466826]
[ 4721.468305] Process deviced (pid: 300, stack limit = 0xffffffc0a00ec028)
[ 4721.474989] Stack: (0xffffffc0a00efbe0 to 0xffffffc0a00f0000)
[ 4721.480720] fbe0: a00efca0 ffffffc0 0042c944 ffffffc0 a0f2d680 ffffffc0 00000024 00000000
[ 4721.488895] fc00: a4b6d000 ffffffc0 009f2729 ffffffc0 a4815400 ffffffc0 a00efec8 ffffffc0

Signed-off-by: Hyungwon Hwang <human.hwang@samsung.com>
---
Changes for v2:
 - Previous version of this patch makes a problem in initializing the DSI. This
   patch fixes it, by moving the point which DSI is set by enabled to the
   point before drm_panel_prepare() called. This is where the setting must
   be done, because to call drm_panel_prepare() successfully, DSI must be
   enabled. Also this patch adds the condition to TE irq handler. DSI must be
   enabled and initialized, not just enabled before calling te_handler in
   the display driver.

 drivers/gpu/drm/exynos/exynos_drm_dsi.c | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_dsi.c b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
index 1cfc4be07..a2ca956 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_dsi.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
@@ -1268,7 +1268,8 @@ static irqreturn_t exynos_dsi_te_irq_handler(int irq, void *dev_id)
 	struct exynos_dsi *dsi = (struct exynos_dsi *)dev_id;
 	struct drm_encoder *encoder = dsi->display.encoder;

-	if (dsi->state & DSIM_STATE_ENABLED)
+	if ((dsi->state & DSIM_STATE_ENABLED) &&
+			(dsi->state & DSIM_STATE_INITIALIZED))
 		exynos_drm_crtc_te_handler(encoder->crtc);

 	return IRQ_HANDLED;
@@ -1408,6 +1409,9 @@ static ssize_t exynos_dsi_host_transfer(struct mipi_dsi_host *host,
 	struct exynos_dsi_transfer xfer;
 	int ret;

+	if (!(dsi->state & DSIM_STATE_ENABLED))
+		return -EINVAL;
+
 	if (!(dsi->state & DSIM_STATE_INITIALIZED)) {
 		ret = exynos_dsi_init(dsi);
 		if (ret)
@@ -1520,8 +1524,11 @@ static int exynos_dsi_enable(struct exynos_dsi *dsi)
 	if (ret < 0)
 		return ret;

+	dsi->state |= DSIM_STATE_ENABLED;
+
 	ret = drm_panel_prepare(dsi->panel);
 	if (ret < 0) {
+		dsi->state &= ~DSIM_STATE_ENABLED;
 		exynos_dsi_poweroff(dsi);
 		return ret;
 	}
@@ -1529,8 +1536,6 @@ static int exynos_dsi_enable(struct exynos_dsi *dsi)
 	exynos_dsi_set_display_mode(dsi);
 	exynos_dsi_set_display_enable(dsi, true);

-	dsi->state |= DSIM_STATE_ENABLED;
-
 	ret = drm_panel_enable(dsi->panel);
 	if (ret < 0) {
 		dsi->state &= ~DSIM_STATE_ENABLED;
@@ -1551,9 +1556,10 @@ static void exynos_dsi_disable(struct exynos_dsi *dsi)
 	drm_panel_disable(dsi->panel);
 	exynos_dsi_set_display_enable(dsi, false);
 	drm_panel_unprepare(dsi->panel);
-	exynos_dsi_poweroff(dsi);

 	dsi->state &= ~DSIM_STATE_ENABLED;
+
+	exynos_dsi_poweroff(dsi);
 }

 static void exynos_dsi_dpms(struct exynos_drm_display *display, int mode)
--
1.9.1
