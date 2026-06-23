Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 399741DF27F
	for <linux-samsung-soc@vger.kernel.org>; Tue, 23 Jun 2026 12:50:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782219024; cv=none; b=iRf8JI7oLhs/cW/sMlwMt8POFSKSAPxQsNsmjdbOS965cxNzsIkiJL3xHTb69wr3EgfnjNRMym+61GwzwwVmMRXGtxkVABouvrLk2/rzC8QDJxEgmL5Bb0LTQtZ6L7pluEUwFC4sF0vc959naMKuN/aNt4WZ16bjPQay+j6GPoQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782219024; c=relaxed/simple;
	bh=BRp4YSZKLzV8jGiQkQALEUqJ180tBSzhlndVhTnaOgk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XgJ7vBneTgcEbL2ms0g239Sej/whDyBO7bGHFl64GmvBH/vCEq/QWgy9aZ/l0jCnWlPWStn61NDvHI4lZaGOoXCds8HKYayeDxr+I4In3Qit5IK0fN5sTZUgQEgbsMRyD/rQTKq52MrvQohk+g7TbOD4dPxg5VVvPLxCKLYnlfA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fSHVDB76; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fSHVDB76"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-697d677fc3dso1491210a12.3
        for <linux-samsung-soc@vger.kernel.org>; Tue, 23 Jun 2026 05:50:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782219022; x=1782823822; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GfbBiX99Kq2saoubNvJ6eQaYIgg7ngdg7CfSlqO7TPw=;
        b=fSHVDB76ko+u/ecAv5bHOpvJP1bxlBlGnsDJqKuiAtqSNJI6DE3+JOVsKcJUq8ppSh
         nI3QBQIeJS2C8RRcCxXxaAeWyRbAQi1jLT56/apwV3fJxXtFOwORPoj6Vx7eC2zS3s7I
         HM2oJjWxJnJsvMrWEPUzUtexeb8e6ZmcKT1Tg+RZwYaf2LrLsT/Hdj7FS3u9VlLOpwmE
         joHMNKDDFRpuv0acwp3WSLUiTD+KAHcYY2YagwUBorMW41Tj7T6eBGHwLW/MR2wTsk+/
         YDzukQuAlBPAwvtXcTWI+lBg+8f9Z2EUlYHrQLb1UaM7m4zAnFrmz/rAUySjMXa7CRuP
         zUZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782219022; x=1782823822;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=GfbBiX99Kq2saoubNvJ6eQaYIgg7ngdg7CfSlqO7TPw=;
        b=Gut/WwI/SlRd5+EVc7VQU5qPjR5IApP40FYbrliVvXVQxJxZ7XapsRZb7ge5zn9Dme
         eEmHx1BjzwL8Ua9cA3M1NBg602ohxm+vpWHCWjPVLLvIo8bqCk7szAqyts5vsiwmW0nE
         f6aqsWTNzdmuGzBV6Pra+KuhjkD3e+NFVA/LW+nxrtbzvpQMdBFdCZJcT7FnynMPCDZj
         Oub1M6RpnQwRCHhZWa2iSm2HVped6xZt/SdiVgNG7Yej8ITG5qeEzKdFD4Wg1HdY5AYC
         uZDTiZz3nFbA/8QvXlNfnwOHStMzzS2sY7hGiVZw2AbTgtQIiuL3lssH9tmeGTNJsOW3
         JQig==
X-Forwarded-Encrypted: i=1; AFNElJ/B7hFdoBQPrIBiRPBv1meQZzoNEjtE+GH3hJcJn0gVHMynh06YVwkEN3u3g8sUXpi9uKu6NeH6DK669WHZyvzjoQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzoIMy6Q8ZA/3ju/TBDkybmWUKrc6fXlH21WrwZ2WfyFAZ1gS5/
	f2LJt2eDcMfBHzgVkRuAxJ22W0h3jGHRK1rsXppRSWNIadv7ykotuubI
X-Gm-Gg: AfdE7clvN777iufuGZC4npmq8Rh+PuvZ0NiWhrccmTB2E0+rYSQsfcG39ufBJt7AdLL
	fIymd2SA8W+FwSPCNqh0tFZLJ+ngjEnE3xSAKIo6UV3WXg8tV5qDHwEOaKLnqYrbOLbGvaADKNw
	TNAky/njOF7frmwhFE/tf5O0C1LtWA7C3+xXsfWVY9/ViZLyig/iGfcF3SHi4HokBgahk/v+FpT
	VFeeHlmg4+s2YHc5IVDJwPzzNkKu8QMaVN6mxidwmCuki4i0pCVoFtmWgZzkacQkh9X9vS/56EB
	chOJxb8vsAgVBF/kDL2fHEaghUp1PqqXvbQxO6961mCFVdQuxNkIPyQxS2YtaE8lyXPjMKi1F1f
	fXuB9F7xmi1tm3kydKDR5gPdPvlrsK5zSm1rYsciKVw1wcpSAnOQ2Pz3or8T28XUj7/lzXKXNKq
	sftN10dEEYEQfN0taIQUJo
X-Received: by 2002:a05:6402:2710:b0:697:d645:a9db with SMTP id 4fb4d7f45d1cf-697d645acfamr1997717a12.23.1782219021317;
        Tue, 23 Jun 2026 05:50:21 -0700 (PDT)
Received: from [127.0.0.2] ([194.35.121.133])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6977b82fd6fsm5153967a12.2.2026.06.23.05.50.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2026 05:50:20 -0700 (PDT)
From: Diogo Silva <diogompaissilva@gmail.com>
Date: Tue, 23 Jun 2026 14:49:43 +0200
Subject: [PATCH 1/2] drm/exynos: Remove dependency on DRM simple helpers
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260623-exynos-drm-simple-v1-1-bb52f098b1ee@gmail.com>
References: <20260623-exynos-drm-simple-v1-0-bb52f098b1ee@gmail.com>
In-Reply-To: <20260623-exynos-drm-simple-v1-0-bb52f098b1ee@gmail.com>
To: Jingoo Han <jingoohan1@gmail.com>, Inki Dae <inki.dae@samsung.com>, 
 Seung-Woo Kim <sw0312.kim@samsung.com>, 
 Kyungmin Park <kyungmin.park@samsung.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Diogo Silva <diogompaissilva@gmail.com>
X-Mailer: b4 0.14.3

Simple KMS helper are deprecated since they only add an intermediate
layer between drivers and the atomic modesetting.
This patch removes the dependency on drm simple helpers from exynos
DRM drivers.

Signed-off-by: Diogo Silva <diogompaissilva@gmail.com>
---
 drivers/gpu/drm/exynos/exynos_dp.c       |  9 +++++++--
 drivers/gpu/drm/exynos/exynos_drm_dpi.c  |  9 +++++++--
 drivers/gpu/drm/exynos/exynos_drm_dsi.c  |  9 +++++++--
 drivers/gpu/drm/exynos/exynos_drm_vidi.c |  9 +++++++--
 drivers/gpu/drm/exynos/exynos_hdmi.c     | 10 ++++++++--
 5 files changed, 36 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_dp.c b/drivers/gpu/drm/exynos/exynos_dp.c
index b80540328150..a2095fb43483 100644
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
@@ -95,7 +99,8 @@ static int exynos_dp_bind(struct device *dev, struct device *master, void *data)
 
 	dp->drm_dev = drm_dev;
 
-	drm_simple_encoder_init(drm_dev, encoder, DRM_MODE_ENCODER_TMDS);
+	drm_encoder_init(drm_dev, encoder, &exynos_dp_encoder_funcs,
+			 DRM_MODE_ENCODER_TMDS, NULL);
 
 	drm_encoder_helper_add(encoder, &exynos_dp_encoder_helper_funcs);
 
diff --git a/drivers/gpu/drm/exynos/exynos_drm_dpi.c b/drivers/gpu/drm/exynos/exynos_drm_dpi.c
index 0dc36df6ada3..4a3d443a15e6 100644
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
@@ -194,7 +198,8 @@ int exynos_dpi_bind(struct drm_device *dev, struct drm_encoder *encoder)
 {
 	int ret;
 
-	drm_simple_encoder_init(dev, encoder, DRM_MODE_ENCODER_TMDS);
+	drm_encoder_init(dev, encoder, &exynos_dpi_encoder_funcs,
+			 DRM_MODE_ENCODER_TMDS, NULL);
 
 	drm_encoder_helper_add(encoder, &exynos_dpi_encoder_helper_funcs);
 
diff --git a/drivers/gpu/drm/exynos/exynos_drm_dsi.c b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
index c4d098ab7863..25c438cdc744 100644
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
@@ -79,7 +83,8 @@ static int exynos_dsi_bind(struct device *dev, struct device *master, void *data
 	struct drm_device *drm_dev = data;
 	int ret;
 
-	drm_simple_encoder_init(drm_dev, encoder, DRM_MODE_ENCODER_TMDS);
+	drm_encoder_init(drm_dev, encoder, &exynos_drm_dsi_encoder_funcs,
+			 DRM_MODE_ENCODER_TMDS, NULL);
 
 	ret = exynos_drm_set_possible_crtcs(encoder, EXYNOS_DISPLAY_TYPE_LCD);
 	if (ret < 0)
diff --git a/drivers/gpu/drm/exynos/exynos_drm_vidi.c b/drivers/gpu/drm/exynos/exynos_drm_vidi.c
index 67bbf9b8bc0e..b0f3cfc2a283 100644
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
@@ -445,7 +449,8 @@ static int vidi_bind(struct device *dev, struct device *master, void *data)
 		return PTR_ERR(ctx->crtc);
 	}
 
-	drm_simple_encoder_init(drm_dev, encoder, DRM_MODE_ENCODER_TMDS);
+	drm_encoder_init(drm_dev, encoder, &&exynos_vidi_encoder_funcs,
+			 DRM_MODE_ENCODER_TMDS, NULL);
 
 	drm_encoder_helper_add(encoder, &exynos_vidi_encoder_helper_funcs);
 
diff --git a/drivers/gpu/drm/exynos/exynos_hdmi.c b/drivers/gpu/drm/exynos/exynos_hdmi.c
index 09b2cabb236f..26baf5357997 100644
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
@@ -1862,7 +1867,8 @@ static int hdmi_bind(struct device *dev, struct device *master, void *data)
 
 	hdata->phy_clk.enable = hdmiphy_clk_enable;
 
-	drm_simple_encoder_init(drm_dev, encoder, DRM_MODE_ENCODER_TMDS);
+	drm_encoder_init(drm_dev, encoder, &exynos_hdmi_encoder_funcs,
+			 DRM_MODE_ENCODER_TMDS, NULL);
 
 	drm_encoder_helper_add(encoder, &exynos_hdmi_encoder_helper_funcs);
 

-- 
2.51.2

