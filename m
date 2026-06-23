Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D93F1E9B1A
	for <linux-samsung-soc@vger.kernel.org>; Tue, 23 Jun 2026 12:50:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782219026; cv=none; b=Ia8tR3UjsmHionROu8x/u1EB8edfamSDmV68vJAMTsWq0Ap9PiqZPM0oR2bQg1VXnRXHGYQQyb1VYKbmrLD8aijBGHu/D7+//eh4AkF3zhDdULrC2sviqgyJgDmZHdmk9jxLDBQTOM3qbQL46JUdZOnD0vEu43GV3v9JCwOz9Uc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782219026; c=relaxed/simple;
	bh=ScFFqr1Y4T5ka4YvBc6DVkvQUgWEMOdpk05Ur+4sxPI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bvwduSJHVlBRxHw3PLH+OcY1pR13/OaUot235zKUn2u/FLbWWM811N/qeVWQe+42D1ftjiThLPmjOpetRGwcDMEn8hKDS0mYsxqoSNTQERz0z3wyzLSs2Ozv7HYmd7wvxAZX9Nzi/FC4vfbTQjJh/ZK1TPPUQzFtf3qNzLcOAis=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Cr+2dggi; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Cr+2dggi"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-695f539fc8cso1561885a12.0
        for <linux-samsung-soc@vger.kernel.org>; Tue, 23 Jun 2026 05:50:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782219023; x=1782823823; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UKUs6CELJR/1Q1bIKn9jYUW7U/GC0CCNgQj6pM1EaDs=;
        b=Cr+2dggirb/s+iJWHki8cFQ/1fxBX/wfW673B1A2yDV5/T06EQlG4blIo6Au1KO7bL
         Rxr4KcGaA28gHI4bYkWL5ymEltiI2SCd9Wx7iEJupbycY/nQBa5+UN0C72i80sS1AA/z
         oSh5r2YjALapGGgVEXVQyS1VvC4MAiRSRrd/PxNsh4gaON7FWW1vtCEhHebRRRorKU9h
         dHVDyE81rmEOJTHF1UVE07pcBkfg6Gaq//0q4kiWsieTQ6DqLwCThLuCSJj9ExisQRBl
         ZPIXD0XXJZnODOMyvQI8H1nmKlV+EYzMy/rSM0SU+2J4DO5fyqisyU/QnLKG6WC0PoyB
         dt2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782219023; x=1782823823;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=UKUs6CELJR/1Q1bIKn9jYUW7U/GC0CCNgQj6pM1EaDs=;
        b=Zw2iywG+6XNCSo447G3ISdFpmnGNnqFwgnYp1JIiuBwoj+JMOKvnhI9U9UBSsr3T38
         5o7xlmvH8/ygw59ZwQ6Ls6mIQTBDDFk7hCPBhkdITAjd/voGRkZidiXdO+D9560ZrDsV
         7vAyy2FEDa8fdU+0xNRgfUUGbXrq7S5yOfvOlu/S5v9VbnWpCUqdiRXF4kp2sjkzraVb
         CkVvFPf1g3fjydDumlPfJ6ZtBc75i0SyrCTa34H4dJp2EKdg5G6yjo0dAy40O4SyE97r
         +ktjZxbcqMVJsqae9Mwmz/izot7OE6qRD77jWQ+BnVn4bWS68YYdEUhqrbzqEye6H68a
         KY8A==
X-Forwarded-Encrypted: i=1; AFNElJ8QD6kqDgyCGe/oTsbTpb2qyIeDxDQ4IZFDBNX5LSN/Pdqa8jO2Eiz8n+MPD3+yBvkTEMdfXB+CFUs8QFd3Tc7HUg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwetGZ56GaQES33N5IRZZT2C2eThH4nQxoHC76XPvbNoAzkg22Y
	GT+T8Ze/CHrTjn4TFPsKc7refsbm95oSXwoD2pwKoo6vAY3cw9TgSQGc
X-Gm-Gg: AfdE7cmCVud5m+UD3+WW+kHhFL89bhbmDwEOO8NALNdaQ7qXXIIFn4Jl8H0G04vqfHP
	7hPZPJ4Z+Bou3X4AdqQJtUTKmz5YmK3AA/cE+TLlvbrmcVhIxZQ/aYvpdEB9l63+rJv3skkfwwL
	OVep1q8bFJxGiWMA8ijzLrnQspG1Bk2F4w85YXmjkvx6TcZdbJqh/tgUoany2vHjuYnipXAYYvD
	ypNgOPxTXVRfBD3O7VtP28cI9wQlzSlhhIdityDoA9AoROIzml7ijeHJw/Zs8n2D5A6+/nBXfzu
	KAQG154wxq2rQCLx+Olgk7rhOTZOdUABmFCJCgORgrxS1y8V6VeGluysPmog81wFxm1AuHwq5s3
	bi3scq+jnQ+xop1sFQpoBYFydgvf6NLA8VKbqYBt7X8TzJoJUH/g3GvK+vc46aP5pNcw1pjwkM7
	itCAHu+kRC7uei/A5sWDng
X-Received: by 2002:a17:907:ec0a:b0:c0f:cbe9:9e7a with SMTP id a640c23a62f3a-c10309ba1acmr182459466b.15.1782219023302;
        Tue, 23 Jun 2026 05:50:23 -0700 (PDT)
Received: from [127.0.0.2] ([194.35.121.133])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6977b82fd6fsm5153967a12.2.2026.06.23.05.50.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2026 05:50:22 -0700 (PDT)
From: Diogo Silva <diogompaissilva@gmail.com>
Date: Tue, 23 Jun 2026 14:49:44 +0200
Subject: [PATCH 2/2] drm/exynos: Add error handling to drm_encoder_init()
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260623-exynos-drm-simple-v1-2-bb52f098b1ee@gmail.com>
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

Not handling the return code on drm_encoder_init can lead to silent
failure and/or a drm_encoder_cleanup on a non-initialized encoder.
This patch adds error handling to the drm_encoder_init calls to prevent
that from happening.

Signed-off-by: Diogo Silva <diogompaissilva@gmail.com>
---
 drivers/gpu/drm/exynos/exynos_dp.c       | 6 +++++-
 drivers/gpu/drm/exynos/exynos_drm_dpi.c  | 7 ++++++-
 drivers/gpu/drm/exynos/exynos_drm_dsi.c  | 4 +++-
 drivers/gpu/drm/exynos/exynos_drm_vidi.c | 7 ++++++-
 drivers/gpu/drm/exynos/exynos_hdmi.c     | 7 ++++++-
 5 files changed, 26 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_dp.c b/drivers/gpu/drm/exynos/exynos_dp.c
index a2095fb43483..3311674aa32a 100644
--- a/drivers/gpu/drm/exynos/exynos_dp.c
+++ b/drivers/gpu/drm/exynos/exynos_dp.c
@@ -99,8 +99,12 @@ static int exynos_dp_bind(struct device *dev, struct device *master, void *data)
 
 	dp->drm_dev = drm_dev;
 
-	drm_encoder_init(drm_dev, encoder, &exynos_dp_encoder_funcs,
+	ret = drm_encoder_init(drm_dev, encoder, &exynos_dp_encoder_funcs,
 			 DRM_MODE_ENCODER_TMDS, NULL);
+	if (ret) {
+		dev_err(dp->dev, "Failed to initialize encoder\n");
+		return ret;
+	}
 
 	drm_encoder_helper_add(encoder, &exynos_dp_encoder_helper_funcs);
 
diff --git a/drivers/gpu/drm/exynos/exynos_drm_dpi.c b/drivers/gpu/drm/exynos/exynos_drm_dpi.c
index 4a3d443a15e6..495fcabca0a1 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_dpi.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_dpi.c
@@ -198,8 +198,13 @@ int exynos_dpi_bind(struct drm_device *dev, struct drm_encoder *encoder)
 {
 	int ret;
 
-	drm_encoder_init(dev, encoder, &exynos_dpi_encoder_funcs,
+	ret = drm_encoder_init(dev, encoder, &exynos_dpi_encoder_funcs,
 			 DRM_MODE_ENCODER_TMDS, NULL);
+	if (ret) {
+		DRM_DEV_ERROR(encoder_to_dpi(encoder)->dev,
+			      "failed to create encoder ret = %d\n", ret);
+		return ret;
+	}
 
 	drm_encoder_helper_add(encoder, &exynos_dpi_encoder_helper_funcs);
 
diff --git a/drivers/gpu/drm/exynos/exynos_drm_dsi.c b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
index 25c438cdc744..73f7c9fe611a 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_dsi.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
@@ -83,8 +83,10 @@ static int exynos_dsi_bind(struct device *dev, struct device *master, void *data
 	struct drm_device *drm_dev = data;
 	int ret;
 
-	drm_encoder_init(drm_dev, encoder, &exynos_drm_dsi_encoder_funcs,
+	ret = drm_encoder_init(drm_dev, encoder, &exynos_drm_dsi_encoder_funcs,
 			 DRM_MODE_ENCODER_TMDS, NULL);
+	if (ret)
+		return ret;
 
 	ret = exynos_drm_set_possible_crtcs(encoder, EXYNOS_DISPLAY_TYPE_LCD);
 	if (ret < 0)
diff --git a/drivers/gpu/drm/exynos/exynos_drm_vidi.c b/drivers/gpu/drm/exynos/exynos_drm_vidi.c
index b0f3cfc2a283..a639f2ee4933 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_vidi.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_vidi.c
@@ -449,8 +449,13 @@ static int vidi_bind(struct device *dev, struct device *master, void *data)
 		return PTR_ERR(ctx->crtc);
 	}
 
-	drm_encoder_init(drm_dev, encoder, &&exynos_vidi_encoder_funcs,
+	ret = drm_encoder_init(drm_dev, encoder, &&exynos_vidi_encoder_funcs,
 			 DRM_MODE_ENCODER_TMDS, NULL);
+	if (ret) {
+		DRM_DEV_ERROR(dev, "failed to initialize encoder ret = %d\n",
+			      ret);
+		return ret;
+	}
 
 	drm_encoder_helper_add(encoder, &exynos_vidi_encoder_helper_funcs);
 
diff --git a/drivers/gpu/drm/exynos/exynos_hdmi.c b/drivers/gpu/drm/exynos/exynos_hdmi.c
index 26baf5357997..17323c9233ad 100644
--- a/drivers/gpu/drm/exynos/exynos_hdmi.c
+++ b/drivers/gpu/drm/exynos/exynos_hdmi.c
@@ -1867,8 +1867,13 @@ static int hdmi_bind(struct device *dev, struct device *master, void *data)
 
 	hdata->phy_clk.enable = hdmiphy_clk_enable;
 
-	drm_encoder_init(drm_dev, encoder, &exynos_hdmi_encoder_funcs,
+	ret = drm_encoder_init(drm_dev, encoder, &exynos_hdmi_encoder_funcs,
 			 DRM_MODE_ENCODER_TMDS, NULL);
+	if (ret) {
+		DRM_DEV_ERROR(dev, "failed to initialize encoder ret = %d\n",
+			      ret);
+		return ret;
+	}
 
 	drm_encoder_helper_add(encoder, &exynos_hdmi_encoder_helper_funcs);
 

-- 
2.51.2

