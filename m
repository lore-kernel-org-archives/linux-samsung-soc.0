From: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
Subject: [PATCH 4/5] drm/exynos: mixer: do blending setup in mixer_cfg_layer()
Date: Wed,  6 May 2015 15:36:49 +0200
Message-ID: <1430919410-9917-5-git-send-email-tjakobi@math.uni-bielefeld.de>
References: <1430919410-9917-1-git-send-email-tjakobi@math.uni-bielefeld.de>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from smtp.math.uni-bielefeld.de ([129.70.45.10]:34804 "EHLO
	smtp.math.uni-bielefeld.de" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751393AbbEFNkL (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 6 May 2015 09:40:11 -0400
In-Reply-To: <1430919410-9917-1-git-send-email-tjakobi@math.uni-bielefeld.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, gustavo.padovan@collabora.co.uk, jy0922.shim@samsung.com, inki.dae@samsung.com, Tobias Jakobi <tjakobi@math.uni-bielefeld.de>

This updates the blending setup when the layer configuration
changes (triggered by mixer_win_{commit,disable}).

Extra care has to be taken for the layer that is currently
being enabled/disabled.

Signed-off-by: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
---
 drivers/gpu/drm/exynos/exynos_mixer.c | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/drivers/gpu/drm/exynos/exynos_mixer.c b/drivers/gpu/drm/exynos/exynos_mixer.c
index 3ab7a01..430d10c 100644
--- a/drivers/gpu/drm/exynos/exynos_mixer.c
+++ b/drivers/gpu/drm/exynos/exynos_mixer.c
@@ -177,6 +177,18 @@ static inline bool is_alpha_format(const struct mixer_context* ctx, unsigned int
 	}
 }
 
+static inline unsigned int layer_bitmask(const struct mixer_context* ctx)
+{
+	unsigned int i, mask = 0;
+
+	for (i = 0; i < MIXER_WIN_NR; ++i) {
+		if (ctx->planes[i].enabled)
+			mask |= (1 << i);
+	}
+
+	return mask;
+}
+
 static inline u32 vp_reg_read(struct mixer_resources *res, u32 reg_id)
 {
 	return readl(res->vp_regs + reg_id);
@@ -513,6 +525,7 @@ static void mixer_cfg_rgb_fmt(struct mixer_context *ctx, unsigned int height)
 static void mixer_cfg_layer(struct mixer_context *ctx, unsigned int win, bool enable)
 {
 	struct mixer_resources *res = &ctx->mixer_res;
+	unsigned int enable_state;
 	u32 val = enable ? ~0 : 0;
 
 	switch (win) {
@@ -530,6 +543,16 @@ static void mixer_cfg_layer(struct mixer_context *ctx, unsigned int win, bool en
 		}
 		break;
 	}
+
+	/* Determine the current enabled/disabled state of the layers. */
+	enable_state = layer_bitmask(ctx);
+	if (enable)
+		enable_state |= (1 << win);
+	else
+		enable_state &= ~(1 << win);
+
+	/* Layer configuration has changed, update blending setup. */
+	mixer_layer_blending(ctx, enable_state);
 }
 
 static void mixer_run(struct mixer_context *ctx)
-- 
2.0.5
