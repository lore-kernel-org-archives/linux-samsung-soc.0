From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH v5 9/9] drm/exynos: add support for 'hdmi' clock
Date: Mon, 02 Feb 2015 14:20:28 +0100
Message-ID: <1422883228-10690-10-git-send-email-m.szyprowski@samsung.com>
References: <1422883228-10690-1-git-send-email-m.szyprowski@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:53502 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S933215AbbBBNUs (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 2 Feb 2015 08:20:48 -0500
Received: from eucpsbgm1.samsung.com (unknown [203.254.199.244])
 by mailout3.w1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0NJ5006EQBXFXZ30@mailout3.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 02 Feb 2015 13:24:51 +0000 (GMT)
In-reply-to: <1422883228-10690-1-git-send-email-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, Marek Szyprowski <m.szyprowski@samsung.com>, Kukjin Kim <kgene@kernel.org>, Tobias Jakobi <Liquid.Acid@gmx.net>, Daniel Drake <drake@endlessm.com>, Andrzej Hajda <a.hajda@samsung.com>, Inki Dae <inki.dae@samsung.com>, Tomasz Figa <tomasz.figa@gmail.com>, Javier Martinez Canillas <javier.martinez@collabora.co.uk>, jy0922.shim@samsung.com, kyungmin.park@samsung.com

Mixed need to have hdmi clock enabled to properly perform power on/off
sequences, so add handling of this clock directly to the mixer driver.
Dependency between hdmi clock and mixer module has been observed on
Exynos4 based boards.

Suggested-by: Andrzej Hajda <a.hajda@samsung.com>
Reviewed-by: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Tested-by: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 Documentation/devicetree/bindings/video/exynos_mixer.txt | 1 +
 drivers/gpu/drm/exynos/exynos_mixer.c                    | 9 +++++++++
 2 files changed, 10 insertions(+)

diff --git a/Documentation/devicetree/bindings/video/exynos_mixer.txt b/Documentation/devicetree/bindings/video/exynos_mixer.txt
index 08b394b1edbf..3e38128f866b 100644
--- a/Documentation/devicetree/bindings/video/exynos_mixer.txt
+++ b/Documentation/devicetree/bindings/video/exynos_mixer.txt
@@ -15,6 +15,7 @@ Required properties:
 	a) mixer: Gate of Mixer IP bus clock.
 	b) sclk_hdmi: HDMI Special clock, one of the two possible inputs of
                mixer mux.
+	c) hdmi: Gate of HDMI IP bus clock, needed together with sclk_hdmi.
 
 Example:
 
diff --git a/drivers/gpu/drm/exynos/exynos_mixer.c b/drivers/gpu/drm/exynos/exynos_mixer.c
index 820b76234ef4..8212c8299625 100644
--- a/drivers/gpu/drm/exynos/exynos_mixer.c
+++ b/drivers/gpu/drm/exynos/exynos_mixer.c
@@ -72,6 +72,7 @@ struct mixer_resources {
 	spinlock_t		reg_slock;
 	struct clk		*mixer;
 	struct clk		*vp;
+	struct clk		*hdmi;
 	struct clk		*sclk_mixer;
 	struct clk		*sclk_hdmi;
 	struct clk		*mout_mixer;
@@ -774,6 +775,12 @@ static int mixer_resources_init(struct mixer_context *mixer_ctx)
 		return -ENODEV;
 	}
 
+	mixer_res->hdmi = devm_clk_get(dev, "hdmi");
+	if (IS_ERR(mixer_res->hdmi)) {
+		dev_err(dev, "failed to get clock 'hdmi'\n");
+		return PTR_ERR(mixer_res->hdmi);
+	}
+
 	mixer_res->sclk_hdmi = devm_clk_get(dev, "sclk_hdmi");
 	if (IS_ERR(mixer_res->sclk_hdmi)) {
 		dev_err(dev, "failed to get clock 'sclk_hdmi'\n");
@@ -1095,6 +1102,7 @@ static void mixer_poweron(struct exynos_drm_manager *mgr)
 	pm_runtime_get_sync(ctx->dev);
 
 	clk_prepare_enable(res->mixer);
+	clk_prepare_enable(res->hdmi);
 	if (ctx->vp_enabled) {
 		clk_prepare_enable(res->vp);
 		if (ctx->has_sclk)
@@ -1134,6 +1142,7 @@ static void mixer_poweroff(struct exynos_drm_manager *mgr)
 	ctx->powered = false;
 	mutex_unlock(&ctx->mixer_mutex);
 
+	clk_disable_unprepare(res->hdmi);
 	clk_disable_unprepare(res->mixer);
 	if (ctx->vp_enabled) {
 		clk_disable_unprepare(res->vp);
-- 
1.9.2
