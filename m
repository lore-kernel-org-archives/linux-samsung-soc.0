Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75A5B3783B5
	for <linux-samsung-soc@vger.kernel.org>; Sat, 18 Jul 2026 23:36:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784417765; cv=none; b=JoPQZPG43kT0/Qx5zdaS3+JYqCJXvqkx4HKN9J9WOo8G+RDX8bysBsjoEyCCZPJwADnxYUtyrw2HKpcckDY6l5Rgt3MfZgd/J9pNGZyrRVbDFZsCZtKCwbzO6IyqzN3c07MOCOoi/OfQ1wLyptfT/a0+kRa08tmwWnWySpGH9RI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784417765; c=relaxed/simple;
	bh=/ymnttl7oB89lytF5t8kzEi7A56W5KOk4Klf25QHF00=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qbSz7N+/ykTkDiLOS3zUulSyoxWRrAnUjMkVhxcY2GndehNVC+RipaDrw1/uQqS6I8/sf0L2Lpycbz0rAn5HRDy65YaroiDr18tW23QnitTbeYBqQq3YBFiBnJ4orI6ZeBV6JkZfM8GsUDbVM/72Qs9cwXTybK/hxi/BUjyQnfc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DvDhn5JD; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DvDhn5JD"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-47c2b362ee2so7853082f8f.1
        for <linux-samsung-soc@vger.kernel.org>; Sat, 18 Jul 2026 16:36:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784417761; x=1785022561; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qVQM0So1MCL7ilj5LYZg6mzfa82XvkJyQz/kOpkAFIY=;
        b=DvDhn5JDkdXyNJ5ZgSx9AlEXMAQx1WXI6Tv80KNd5mTCAiRnoBMB5KfWVxR2crGT37
         sIni4pkG6g0qGE0IqvsXDN+WtulNk9Pxufaw11gHo0Bmej9RhYjkPAB82y3Al32tRCMn
         x7wKjVvHmvm9Dq8ckqllj4DzZR+wNeAbUbiGwH7hrY2L36EKDolryfQo9TPAeIDPdSUF
         TyzQ53c6OeGoNZy0TYcYUks8rfSBlHAo5KBO9x04/tslRVCET9eq6giVs4av6l9cafw7
         VtRPJYv6wNT+QD01uc5osY8ywRZzBUq9fbbB0q4xUhABvY4ZJuBKgr/Mc3lCMZyoy57X
         7Wbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784417761; x=1785022561;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qVQM0So1MCL7ilj5LYZg6mzfa82XvkJyQz/kOpkAFIY=;
        b=K1VU8xGXmV/G4cCF+3W5+hcvU2gONQy4RvVTchCost7Ie6VwU2m205w0nA1G3g0ck4
         yCR8WmXgh75tcueUOHoF7n8LTVoWsErzC73bwuEOaDIU4nkksCH8kYEa97bQvq6XFMQG
         43/IEo7PAT4Hy3V4rs2uaKnw1aT5PZFRQO6wg52VreQllbjRrxI0eCeYKAzJbtqrUs6O
         srgDS5YvFFFbdyKmBiHlkj6/1yIQcM9RI+A87quFp+3jQgv7YKr5eIoFY1/ZBFyMibYF
         qlBMeBRhXRHMcp8HAuwL8CvUlWHRdg+4Y5Cs3UZJz8b6YMM/au0Wpzp6QqrgHFYSdTg1
         CRUg==
X-Forwarded-Encrypted: i=1; AHgh+RpyTs7nrVtYtOVcP6ml+GYXqgXyKcB5eODbsaTmh/Grn48aVmNAGUmKABXZhTT0cZZp0dVmBdL5zB/1Xs6hyc/drA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4f+r/j8jIa56tTEmgQmtbfLi0Ye1XJV+FAWSvaHDM+LXCj7IF
	35F5TYLYFX6B8+V+yzCo1SO0/FHcDZx17JQNRFnYBwDVGbWvYKha9pML
X-Gm-Gg: AfdE7ckVmCmg7Cvy5bTJgPxObudPEnaK4nwoGIx8Gv3k5IXK4eb1KrpgxlVIFqGnZip
	MpI6ko+4Bxy+PSoICdySvjCSF+hcQKfjxMurTpYhbpi+TtnWSXr2jHWleUERA2TTEZhiYf7d1oS
	Onn4CagknROCnSwvIo1v7Jt8wRpvRFX4cQ/rDbxYNlRaD6ZILVK2kiTmVsi0te0qs8ZA8RkeQM3
	DfxrJoqQO7P60xWizN817addj6PkiBMatZGY284PFcofpt4hqy/9Zxz+bamITqzBJ87AXocYiub
	46VOC/pn3cKyeKWGxs1AP5ucF9lxnPY0AhuNLu5TZOg11J2ww/GjQgHQl2wfIn5suHJSKbOji77
	MiU08PMS+xIfzNg24Wzduir3UE6jGsIv10H8KDD3uik5UbBIVWOT4tYe6L6AjHcjdmDxN3tAYlS
	aJhpa9HMKWhQ==
X-Received: by 2002:a05:600c:4e94:b0:495:571e:e5d3 with SMTP id 5b1f17b1804b1-495571ee75fmr14134205e9.36.1784417760679;
        Sat, 18 Jul 2026 16:36:00 -0700 (PDT)
Received: from [127.0.0.2] ([2a01:14:111:ccf0:645b:9e5c:7fe3:c09f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4954a2a24b6sm160964675e9.3.2026.07.18.16.35.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Jul 2026 16:36:00 -0700 (PDT)
From: Diogo Silva <diogompaissilva@gmail.com>
Date: Sun, 19 Jul 2026 01:35:32 +0200
Subject: [PATCH 01/15] drm/exynos: remove dependency on DRM simple helpers
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260719-drm_simple_encoder_init-v1-1-a78c509e3062@gmail.com>
References: <20260719-drm_simple_encoder_init-v1-0-a78c509e3062@gmail.com>
In-Reply-To: <20260719-drm_simple_encoder_init-v1-0-a78c509e3062@gmail.com>
To: Jingoo Han <jingoohan1@gmail.com>, Inki Dae <inki.dae@samsung.com>, 
 Seung-Woo Kim <sw0312.kim@samsung.com>, 
 Kyungmin Park <kyungmin.park@samsung.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Michal Simek <michal.simek@amd.com>, 
 Thierry Reding <thierry.reding@kernel.org>, 
 Mikko Perttunen <mperttunen@nvidia.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>, Stefan Agner <stefan@agner.ch>, 
 Alison Wang <alison.wang@nxp.com>, 
 Anitha Chrisanthus <anitha.chrisanthus@intel.com>, 
 David Airlie <airlied@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>, 
 Dmitry Osipenko <dmitry.osipenko@collabora.com>, 
 Gurchetan Singh <gurchetansingh@chromium.org>, 
 Chia-I Wu <olvaffe@gmail.com>, Jyri Sarha <jyri.sarha@iki.fi>, 
 Liu Ying <victor.liu@nxp.com>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Xinliang Liu <xinliang.liu@linaro.org>, 
 Sumit Semwal <sumit.semwal@linaro.org>, 
 Yongqin Liu <yongqin.liu@linaro.org>, John Stultz <jstultz@google.com>, 
 Liviu Dudau <liviu.dudau@arm.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>
Cc: dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-tegra@vger.kernel.org, virtualization@lists.linux.dev, 
 imx@lists.linux.dev, linux-mediatek@lists.infradead.org, 
 linux-renesas-soc@vger.kernel.org, linux-amlogic@lists.infradead.org, 
 linux-doc@vger.kernel.org, Diogo Silva <diogompaissilva@gmail.com>
X-Mailer: b4 0.15.2

The simple KMS helpers are deprecated because they only add an
intermediate layer between drivers and atomic modesetting.

Open-code drm_simple_encoder_init() by calling drm_encoder_init()
directly and providing driver-local drm_encoder_funcs.
Also check the return value from drm_encoder_init() to avoid silent
failures.

Signed-off-by: Diogo Silva <diogompaissilva@gmail.com>
---
 drivers/gpu/drm/exynos/exynos_dp.c       | 13 +++++++++++--
 drivers/gpu/drm/exynos/exynos_drm_dpi.c  | 14 ++++++++++++--
 drivers/gpu/drm/exynos/exynos_drm_dsi.c  | 11 +++++++++--
 drivers/gpu/drm/exynos/exynos_drm_vidi.c | 14 ++++++++++++--
 drivers/gpu/drm/exynos/exynos_hdmi.c     | 15 +++++++++++++--
 5 files changed, 57 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_dp.c b/drivers/gpu/drm/exynos/exynos_dp.c
index b80540328150..1598892c602b 100644
--- a/drivers/gpu/drm/exynos/exynos_dp.c
+++ b/drivers/gpu/drm/exynos/exynos_dp.c
@@ -24,11 +24,11 @@
 #include <drm/drm_bridge.h>
 #include <drm/drm_bridge_connector.h>
 #include <drm/drm_crtc.h>
+#include <drm/drm_encoder.h>
 #include <drm/drm_of.h>
 #include <drm/drm_panel.h>
 #include <drm/drm_print.h>
 #include <drm/drm_probe_helper.h>
-#include <drm/drm_simple_kms_helper.h>
 #include <drm/exynos_drm.h>
 
 #include "exynos_drm_crtc.h"
@@ -79,6 +79,10 @@ static void exynos_dp_nop(struct drm_encoder *encoder)
 	/* do nothing */
 }
 
+static const struct drm_encoder_funcs exynos_dp_encoder_funcs = {
+	.destroy = drm_encoder_cleanup,
+};
+
 static const struct drm_encoder_helper_funcs exynos_dp_encoder_helper_funcs = {
 	.mode_set = exynos_dp_mode_set,
 	.enable = exynos_dp_nop,
@@ -95,7 +99,12 @@ static int exynos_dp_bind(struct device *dev, struct device *master, void *data)
 
 	dp->drm_dev = drm_dev;
 
-	drm_simple_encoder_init(drm_dev, encoder, DRM_MODE_ENCODER_TMDS);
+	ret = drm_encoder_init(drm_dev, encoder, &exynos_dp_encoder_funcs,
+			       DRM_MODE_ENCODER_TMDS, NULL);
+	if (ret) {
+		dev_err(dp->dev, "Failed to initialize encoder\n");
+		return ret;
+	}
 
 	drm_encoder_helper_add(encoder, &exynos_dp_encoder_helper_funcs);
 
diff --git a/drivers/gpu/drm/exynos/exynos_drm_dpi.c b/drivers/gpu/drm/exynos/exynos_drm_dpi.c
index 0dc36df6ada3..4e42a1da81d1 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_dpi.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_dpi.c
@@ -12,10 +12,10 @@
 #include <linux/regulator/consumer.h>
 
 #include <drm/drm_atomic_helper.h>
+#include <drm/drm_encoder.h>
 #include <drm/drm_panel.h>
 #include <drm/drm_print.h>
 #include <drm/drm_probe_helper.h>
-#include <drm/drm_simple_kms_helper.h>
 
 #include <video/of_videomode.h>
 #include <video/videomode.h>
@@ -140,6 +140,10 @@ static void exynos_dpi_disable(struct drm_encoder *encoder)
 	}
 }
 
+static const struct drm_encoder_funcs exynos_dpi_encoder_funcs = {
+	.destroy = drm_encoder_cleanup,
+};
+
 static const struct drm_encoder_helper_funcs exynos_dpi_encoder_helper_funcs = {
 	.mode_set = exynos_dpi_mode_set,
 	.enable = exynos_dpi_enable,
@@ -194,7 +198,13 @@ int exynos_dpi_bind(struct drm_device *dev, struct drm_encoder *encoder)
 {
 	int ret;
 
-	drm_simple_encoder_init(dev, encoder, DRM_MODE_ENCODER_TMDS);
+	ret = drm_encoder_init(dev, encoder, &exynos_dpi_encoder_funcs,
+			       DRM_MODE_ENCODER_TMDS, NULL);
+	if (ret) {
+		DRM_DEV_ERROR(encoder_to_dpi(encoder)->dev,
+			      "failed to create encoder ret = %d\n", ret);
+		return ret;
+	}
 
 	drm_encoder_helper_add(encoder, &exynos_dpi_encoder_helper_funcs);
 
diff --git a/drivers/gpu/drm/exynos/exynos_drm_dsi.c b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
index c4d098ab7863..6b7561ac9bb0 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_dsi.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
@@ -13,7 +13,7 @@
 
 #include <drm/bridge/samsung-dsim.h>
 #include <drm/drm_probe_helper.h>
-#include <drm/drm_simple_kms_helper.h>
+#include <drm/drm_encoder.h>
 
 #include "exynos_drm_crtc.h"
 #include "exynos_drm_drv.h"
@@ -22,6 +22,10 @@ struct exynos_dsi {
 	struct drm_encoder encoder;
 };
 
+static const struct drm_encoder_funcs exynos_drm_dsi_encoder_funcs = {
+	.destroy = drm_encoder_cleanup,
+};
+
 static irqreturn_t exynos_dsi_te_irq_handler(struct samsung_dsim *dsim)
 {
 	struct exynos_dsi *dsi = dsim->priv;
@@ -79,7 +83,10 @@ static int exynos_dsi_bind(struct device *dev, struct device *master, void *data
 	struct drm_device *drm_dev = data;
 	int ret;
 
-	drm_simple_encoder_init(drm_dev, encoder, DRM_MODE_ENCODER_TMDS);
+	ret = drm_encoder_init(drm_dev, encoder, &exynos_drm_dsi_encoder_funcs,
+			       DRM_MODE_ENCODER_TMDS, NULL);
+	if (ret)
+		return ret;
 
 	ret = exynos_drm_set_possible_crtcs(encoder, EXYNOS_DISPLAY_TYPE_LCD);
 	if (ret < 0)
diff --git a/drivers/gpu/drm/exynos/exynos_drm_vidi.c b/drivers/gpu/drm/exynos/exynos_drm_vidi.c
index 67bbf9b8bc0e..59dea853d364 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_vidi.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_vidi.c
@@ -13,10 +13,10 @@
 
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_edid.h>
+#include <drm/drm_encoder.h>
 #include <drm/drm_framebuffer.h>
 #include <drm/drm_print.h>
 #include <drm/drm_probe_helper.h>
-#include <drm/drm_simple_kms_helper.h>
 #include <drm/drm_vblank.h>
 #include <drm/exynos_drm.h>
 
@@ -403,6 +403,10 @@ static void exynos_vidi_disable(struct drm_encoder *encoder)
 {
 }
 
+static const struct drm_encoder_funcs exynos_vidi_encoder_funcs = {
+	.destroy = drm_encoder_cleanup,
+};
+
 static const struct drm_encoder_helper_funcs exynos_vidi_encoder_helper_funcs = {
 	.mode_set = exynos_vidi_mode_set,
 	.enable = exynos_vidi_enable,
@@ -445,7 +449,13 @@ static int vidi_bind(struct device *dev, struct device *master, void *data)
 		return PTR_ERR(ctx->crtc);
 	}
 
-	drm_simple_encoder_init(drm_dev, encoder, DRM_MODE_ENCODER_TMDS);
+	ret = drm_encoder_init(drm_dev, encoder, &exynos_vidi_encoder_funcs,
+			       DRM_MODE_ENCODER_TMDS, NULL);
+	if (ret) {
+		DRM_DEV_ERROR(dev, "failed to initialize encoder ret = %d\n",
+			      ret);
+		return ret;
+	}
 
 	drm_encoder_helper_add(encoder, &exynos_vidi_encoder_helper_funcs);
 
diff --git a/drivers/gpu/drm/exynos/exynos_hdmi.c b/drivers/gpu/drm/exynos/exynos_hdmi.c
index 09b2cabb236f..f44586ce0fdf 100644
--- a/drivers/gpu/drm/exynos/exynos_hdmi.c
+++ b/drivers/gpu/drm/exynos/exynos_hdmi.c
@@ -36,9 +36,9 @@
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_bridge.h>
 #include <drm/drm_edid.h>
+#include <drm/drm_encoder.h>
 #include <drm/drm_print.h>
 #include <drm/drm_probe_helper.h>
-#include <drm/drm_simple_kms_helper.h>
 
 #include "exynos_drm_crtc.h"
 #include "regs-hdmi.h"
@@ -1575,6 +1575,11 @@ static void hdmi_disable(struct drm_encoder *encoder)
 	mutex_unlock(&hdata->mutex);
 }
 
+static const struct drm_encoder_funcs exynos_hdmi_encoder_funcs = {
+	.destroy = drm_encoder_cleanup,
+};
+
+
 static const struct drm_encoder_helper_funcs exynos_hdmi_encoder_helper_funcs = {
 	.mode_fixup	= hdmi_mode_fixup,
 	.enable		= hdmi_enable,
@@ -1862,7 +1867,13 @@ static int hdmi_bind(struct device *dev, struct device *master, void *data)
 
 	hdata->phy_clk.enable = hdmiphy_clk_enable;
 
-	drm_simple_encoder_init(drm_dev, encoder, DRM_MODE_ENCODER_TMDS);
+	ret = drm_encoder_init(drm_dev, encoder, &exynos_hdmi_encoder_funcs,
+			       DRM_MODE_ENCODER_TMDS, NULL);
+	if (ret) {
+		DRM_DEV_ERROR(dev, "failed to initialize encoder ret = %d\n",
+			      ret);
+		return ret;
+	}
 
 	drm_encoder_helper_add(encoder, &exynos_hdmi_encoder_helper_funcs);
 

-- 
2.54.0

