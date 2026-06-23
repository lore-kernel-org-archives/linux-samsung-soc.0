Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D0C0263C8C
	for <linux-samsung-soc@vger.kernel.org>; Tue, 23 Jun 2026 13:19:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782220797; cv=none; b=njDxqFxFIK5cL/gF3HhCkpWwPwZWMEExD5ZMEVdcwXwE2XlKchwymmG6ebdzSnBnns/sM505skXGSgAqWBK/4NeAfXWBbIkAVamlgwx3BpSe2/3Gp6pnnzl2fAWsifETN26M29NLKARnj+9zu81PzN/KqbacSPsR3Y6hKC5vR8g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782220797; c=relaxed/simple;
	bh=5F4Lkaj2dnnHl4Q7FnByFWaxdDVFksXp/dNImsew220=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=L3bsHIT29/8cXU6VhEwj+dsMtHwh/jRJGT6+zLW+bfsFAzSlBugcbQrr5ULVXC7Gf+Io9WZhwIGv08n9fJZDLLnCuAOVoP7TaOtQIE1szEhNBRW1bmr4TtDEwaeh67IWlwC9cD0umpSZdpEvByJsbTiPURLUKVVkywqF9RRluuU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gIQatr+X; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gIQatr+X"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-697763eeafcso5607351a12.3
        for <linux-samsung-soc@vger.kernel.org>; Tue, 23 Jun 2026 06:19:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782220794; x=1782825594; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Yxi/wE47a99ioZKRhiXdNPZKOFUf/VwFzstV1N+fI3o=;
        b=gIQatr+Xry3u3Byz2f00OeHcHAFYgw5RRFtIFLgJccCS/ThUUFwu7rwbUmCtotT83Z
         vDOs5kzEe3LHM+cGVsTQmfTAwAghYLDz5BlaJO9wWOBsgAZ38dz7x2smYq9lE+OOcGAM
         7wnoH1QwVhMb41w1MCzmTwmFaJQjv6lDSXQzuqtIb0xyULlVA/uqGadP6JLulPvRje7/
         RaIMoaoJeqE7q6XU3LFhmmAbSIyRoLOpuqgppP1TSaeudwe+BOxNyGBNtHlWrXEY0KuE
         NpDdFAVGeSnG7cpKiXeQRyzxEv4zmr1JDn+EHTuUyw+hujM6Hpw+LONpv/63prHejogX
         ZNqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782220794; x=1782825594;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Yxi/wE47a99ioZKRhiXdNPZKOFUf/VwFzstV1N+fI3o=;
        b=hF44M7zu+OfLpIlsDdD0ANlpDqDc5uZTEUbdOGY8jVSef6g9vOBLuTSGgs5KDHIFPu
         Y4saVJeUeiYtYoo+pVV23WkyAYTRLFdrtDP1TMQr7aMCN6Uohvbg0KK2P28wOiErimvY
         hV4cW1VR1quM6AcU2f1BC4v6F2ynuG+fh50iJajkUzMoSQpQMawWi5HKH0ih0yAs9ZxJ
         KX2OEpwRo/X63piO3Gr0RS7nJhj/Qpg+lgwiXLx/DrwQ6NMgJD94vE4gkuTwTx2XAlIS
         iypaQlI/7NvtoEB3XS9y3WSyMqY+g5l7haCv89cvtDxhsouPhtrycFIyVKzDnuVhuzfi
         TmCA==
X-Forwarded-Encrypted: i=1; AFNElJ+REwU6bqrEZ3Vt045NAjX52NUCqjDP9Yuh7f3YisaAAUws9lSw8dF+YbvFeTstjncEqJLnl/ahBTj0JnNuhBeG6Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YyMDzTsSwYIkPMWANtI6gs9LFfScap18IR5dnsRmbp7qOoOyzyN
	dFgxZJFUMjkuMvyurc5m1AA9OV/b4dDvbP6P8ybr5l3iTKYlMjx/bXDf
X-Gm-Gg: AfdE7cklMBHoRgO4al11hdaQPXuYWJuh6WrvsFxiradgnC3G7gpwATz+VKtS+c/qB0D
	sDU1OrAgrW6yfNDkkN3kyDfY0guW8eowZeekQhaE3tedriRNYKXouEMp9kQl3IgCKfR+M+mcYAR
	CjNNLaX0aPMyiBn0JnfXko9EQFMOFZJp3uasMi2SibPjI7ofQNO+Of5Kswm9dU2Xfp/NACFqkgN
	ALUnvCtiPrwcVjdq6iqz+XSGJ7SD44R/d6bgydJJ9jNDcXiPS+ah2kys2VVjOgzKu8LuBbf7Nlg
	U+9IVDrgxpUwYI9caFdAsQKWqAoRO20qm5UxUIxOEHKPOgIFLLSXkMMLioxDBL4cbacnzXaB8co
	bTE1eb4JNOduQ00FMRSlMCa4J6y/uqmV4+mDHIlDD5rWPkHZ506yeNdQtfDDFMd9CJXJbS8jQ39
	8bwj8E5EqxWyOFkh2g
X-Received: by 2002:a05:6402:3205:b0:687:7fa4:faa0 with SMTP id 4fb4d7f45d1cf-69711e0602bmr986767a12.23.1782220793768;
        Tue, 23 Jun 2026 06:19:53 -0700 (PDT)
Received: from [127.0.0.2] ([194.35.121.133])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6977b82f95dsm5060107a12.3.2026.06.23.06.19.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2026 06:19:53 -0700 (PDT)
From: Diogo Silva <diogompaissilva@gmail.com>
Date: Tue, 23 Jun 2026 15:19:30 +0200
Subject: [PATCH v2 1/2] drm/exynos: Remove dependency on DRM simple helpers
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260623-exynos-drm-simple-v2-1-a8d59678b7d2@gmail.com>
References: <20260623-exynos-drm-simple-v2-0-a8d59678b7d2@gmail.com>
In-Reply-To: <20260623-exynos-drm-simple-v2-0-a8d59678b7d2@gmail.com>
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
index 67bbf9b8bc0e..d905dc703c06 100644
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
+	drm_encoder_init(drm_dev, encoder, &exynos_vidi_encoder_funcs,
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

