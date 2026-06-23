Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDEAB3242BC
	for <linux-samsung-soc@vger.kernel.org>; Tue, 23 Jun 2026 13:19:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782220799; cv=none; b=VJkKqaI1RzBSU2iwIxDuEhk7qpuzX7lQ/YP1rPQm54D7nB1Dw4NRGHZKttfhm3/Naka9ktMu7d6g7PZWIaXsJW4DJ+s+bTg8TDMLjG2o/O+JFB991Hvy0g/Hk2VpvRon4yrg5/gTy3H8IaZThw0dPoBL7dHJzzwqDdn4KzbbXoo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782220799; c=relaxed/simple;
	bh=y11WvUR+l4q0fuMYjxYX/9FqI2O4pIXTvZjpNPprJOo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZcD5RWR9JtzZsWgf/Qldvmcu/Vq8BGfDh6CRag7Vftv8ekwcebqWzL8KH3dxPY7oPdxPUPnvRVUWFwH1jARYva+fE+vTYVb0bgCzN8a/fCx8fU8cS/IeHPRdmsfcqXZp14jx/K+qfxbE45jP5jGif/xZ7rR3YGq8Sej5Gmz07gk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZInyN8ab; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZInyN8ab"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-693c51a8a19so8759869a12.3
        for <linux-samsung-soc@vger.kernel.org>; Tue, 23 Jun 2026 06:19:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782220796; x=1782825596; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/Y6PphOb9ZABROa1QGn6/qy2YxlaF9xxkPzHynumORE=;
        b=ZInyN8ab7fPFqOKy4WvV54ntZcTeAJb7SeGGaQI7k2MnMQqYxI5YVxtuXrxoLimQDQ
         9uShhCbVUupoY0CqQHNjOFc9pT3plUpliNpvfg6AVnyEibd4BAZO4J+76AZTGBHfVNlA
         Oug2zltQSAGV32++lAIsMIfd3pQmmbjVTKSVcaRJTm+SlAOZSj5T+CCRQEes6BUOGbP1
         F3irqyI6Q/GwOhJdLFRxMQCZBJsZS3vdiQc3FOczYjUx9UMVdZhtqB10RFRgusuUJTK3
         q7wOIrr4xHMPualZUuR/DCRKqjxIXO1EoEUbxz6136XMrxU52twGXmYgdk0u4NsQhBqZ
         wHTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782220796; x=1782825596;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/Y6PphOb9ZABROa1QGn6/qy2YxlaF9xxkPzHynumORE=;
        b=qVX7z+Lxb6CR1o4Crq/W2/ppA4qUC2XMkEHL0mqw48ALYcPKoxXJ7tdMismYIHH8Uz
         liF/diiygquCpzWqWyptP01BKrCLT+zsXFHAruzfrgU4dBtpyKGewvupt5uxhx1pUAOL
         rSd43QBvi9jvUfFgmRxNtgAgUXjlCuf5h2qkjOHP6BAqhTEDIbqeehyqBnI0HpDt0NLg
         TVKzw9k8q/Kqfg7WoG7oUbPiDoEQgf6Kgnxl3vlezWLvybNnBXBVCvhvKvNVbqrnB1B/
         oC/sgphI41kI27Raf0x2Z+RPqz+agk1K3lmjK1Qiqt7gIS9fD7aUUKXSRAMVS4ekzdmg
         OdoQ==
X-Forwarded-Encrypted: i=1; AFNElJ8ie0hcRNJhPZ3vIoiU7h1tWS10dpSlf6NSypSvMhrRb+ay48S5tAjwdKXGjhCheLSh36TXYMFW0DqMlA1yo2u93w==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/rLHaQ6Kdx/bhVSId9OcymZw8hBVIdbFS3qSji8rHOa693UFl
	I4N9bawhMC2q+IUQxl0t3APNAc6nmH1X7i4/if0veNAQN6cjg0A2qRXHY2e/kcdN
X-Gm-Gg: AfdE7cn5zibCqXzxw85M143ilm4UUk46HfMZaslb+vP8cIhh2gamlKY1dWbNCR9bRPo
	f58KkWA1I791RESbGDf4ZRRxLmHcnhCMeNa00BedfKL4FPQbubI2R8MeXapBJmR/fKgBL8DLS48
	ZXzEkrA35EhPuEOUv0s1PsK33oJe510p90O3yPOewwZWb7fLs/sMOGr6990yXZF+XxFSwre5qIi
	4MCzrZm7J+ap8pKhefNVST6jVEU7YLBdCgZz/yLI4moXAp7DnqYijvIaDEDUe0JmzfG6vnbObDc
	mXDt8b7PGVv9tQWA4eLkNBecBXr+W3GjJre4pDYGfpntPhH3Bs40zdOlgffXTY8uzcJs9BDtYrZ
	xTdcmeyl1d3cssKz2SH3rhLNvRKjKdNfyItyeB8FgX5yuKHJcr8Cgnnnuf3aHfXcXzmvEiYyTf6
	vflLob5Gbh83AcKBL8WqI6
X-Received: by 2002:a05:6402:2345:b0:697:d4ec:15ed with SMTP id 4fb4d7f45d1cf-697dbad10c0mr1435510a12.14.1782220796124;
        Tue, 23 Jun 2026 06:19:56 -0700 (PDT)
Received: from [127.0.0.2] ([194.35.121.133])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6977b82f95dsm5060107a12.3.2026.06.23.06.19.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2026 06:19:55 -0700 (PDT)
From: Diogo Silva <diogompaissilva@gmail.com>
Date: Tue, 23 Jun 2026 15:19:31 +0200
Subject: [PATCH v2 2/2] drm/exynos: Add error handling to
 drm_encoder_init()
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260623-exynos-drm-simple-v2-2-a8d59678b7d2@gmail.com>
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

Not handling the return code on drm_encoder_init can lead to silent
failure and/or a drm_encoder_cleanup on a non-initialized encoder.
This patch adds error handling to the drm_encoder_init calls to prevent
that from happening.

Signed-off-by: Diogo Silva <diogompaissilva@gmail.com>
---
 drivers/gpu/drm/exynos/exynos_dp.c       | 8 ++++++--
 drivers/gpu/drm/exynos/exynos_drm_dpi.c  | 9 +++++++--
 drivers/gpu/drm/exynos/exynos_drm_dsi.c  | 6 ++++--
 drivers/gpu/drm/exynos/exynos_drm_vidi.c | 9 +++++++--
 drivers/gpu/drm/exynos/exynos_hdmi.c     | 9 +++++++--
 5 files changed, 31 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_dp.c b/drivers/gpu/drm/exynos/exynos_dp.c
index a2095fb43483..1598892c602b 100644
--- a/drivers/gpu/drm/exynos/exynos_dp.c
+++ b/drivers/gpu/drm/exynos/exynos_dp.c
@@ -99,8 +99,12 @@ static int exynos_dp_bind(struct device *dev, struct device *master, void *data)
 
 	dp->drm_dev = drm_dev;
 
-	drm_encoder_init(drm_dev, encoder, &exynos_dp_encoder_funcs,
-			 DRM_MODE_ENCODER_TMDS, NULL);
+	ret = drm_encoder_init(drm_dev, encoder, &exynos_dp_encoder_funcs,
+			       DRM_MODE_ENCODER_TMDS, NULL);
+	if (ret) {
+		dev_err(dp->dev, "Failed to initialize encoder\n");
+		return ret;
+	}
 
 	drm_encoder_helper_add(encoder, &exynos_dp_encoder_helper_funcs);
 
diff --git a/drivers/gpu/drm/exynos/exynos_drm_dpi.c b/drivers/gpu/drm/exynos/exynos_drm_dpi.c
index 4a3d443a15e6..4e42a1da81d1 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_dpi.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_dpi.c
@@ -198,8 +198,13 @@ int exynos_dpi_bind(struct drm_device *dev, struct drm_encoder *encoder)
 {
 	int ret;
 
-	drm_encoder_init(dev, encoder, &exynos_dpi_encoder_funcs,
-			 DRM_MODE_ENCODER_TMDS, NULL);
+	ret = drm_encoder_init(dev, encoder, &exynos_dpi_encoder_funcs,
+			       DRM_MODE_ENCODER_TMDS, NULL);
+	if (ret) {
+		DRM_DEV_ERROR(encoder_to_dpi(encoder)->dev,
+			      "failed to create encoder ret = %d\n", ret);
+		return ret;
+	}
 
 	drm_encoder_helper_add(encoder, &exynos_dpi_encoder_helper_funcs);
 
diff --git a/drivers/gpu/drm/exynos/exynos_drm_dsi.c b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
index 25c438cdc744..6b7561ac9bb0 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_dsi.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
@@ -83,8 +83,10 @@ static int exynos_dsi_bind(struct device *dev, struct device *master, void *data
 	struct drm_device *drm_dev = data;
 	int ret;
 
-	drm_encoder_init(drm_dev, encoder, &exynos_drm_dsi_encoder_funcs,
-			 DRM_MODE_ENCODER_TMDS, NULL);
+	ret = drm_encoder_init(drm_dev, encoder, &exynos_drm_dsi_encoder_funcs,
+			       DRM_MODE_ENCODER_TMDS, NULL);
+	if (ret)
+		return ret;
 
 	ret = exynos_drm_set_possible_crtcs(encoder, EXYNOS_DISPLAY_TYPE_LCD);
 	if (ret < 0)
diff --git a/drivers/gpu/drm/exynos/exynos_drm_vidi.c b/drivers/gpu/drm/exynos/exynos_drm_vidi.c
index d905dc703c06..59dea853d364 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_vidi.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_vidi.c
@@ -449,8 +449,13 @@ static int vidi_bind(struct device *dev, struct device *master, void *data)
 		return PTR_ERR(ctx->crtc);
 	}
 
-	drm_encoder_init(drm_dev, encoder, &exynos_vidi_encoder_funcs,
-			 DRM_MODE_ENCODER_TMDS, NULL);
+	ret = drm_encoder_init(drm_dev, encoder, &exynos_vidi_encoder_funcs,
+			       DRM_MODE_ENCODER_TMDS, NULL);
+	if (ret) {
+		DRM_DEV_ERROR(dev, "failed to initialize encoder ret = %d\n",
+			      ret);
+		return ret;
+	}
 
 	drm_encoder_helper_add(encoder, &exynos_vidi_encoder_helper_funcs);
 
diff --git a/drivers/gpu/drm/exynos/exynos_hdmi.c b/drivers/gpu/drm/exynos/exynos_hdmi.c
index 26baf5357997..f44586ce0fdf 100644
--- a/drivers/gpu/drm/exynos/exynos_hdmi.c
+++ b/drivers/gpu/drm/exynos/exynos_hdmi.c
@@ -1867,8 +1867,13 @@ static int hdmi_bind(struct device *dev, struct device *master, void *data)
 
 	hdata->phy_clk.enable = hdmiphy_clk_enable;
 
-	drm_encoder_init(drm_dev, encoder, &exynos_hdmi_encoder_funcs,
-			 DRM_MODE_ENCODER_TMDS, NULL);
+	ret = drm_encoder_init(drm_dev, encoder, &exynos_hdmi_encoder_funcs,
+			       DRM_MODE_ENCODER_TMDS, NULL);
+	if (ret) {
+		DRM_DEV_ERROR(dev, "failed to initialize encoder ret = %d\n",
+			      ret);
+		return ret;
+	}
 
 	drm_encoder_helper_add(encoder, &exynos_hdmi_encoder_helper_funcs);
 

-- 
2.51.2

