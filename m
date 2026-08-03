Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5C1F2EEE79
	for <linux-samsung-soc@vger.kernel.org>; Mon,  3 Aug 2026 13:52:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785765180; cv=none; b=SptWmXy6BpbeOnXcx2NJTDwWXj19+/dj450NBiHsKEF+bxX8iF1HUbJKfaG5cYpr5YTuBdpnYz0jPQXo4a+TQHGfWxZnOMV7btpM0N+3Om0OTqwOlfFyatT61fetDcJGDPncH9sLrQzFl+h32pv+SWckUcxuTUbHlFfET53h1UU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785765180; c=relaxed/simple;
	bh=pvRNspL5nnjT+VTn2VLyYBjtJviJHUXepC7svDV1rjo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=iVDq5sfccIXU5FjFNlVCxuMike0niPvDoGXzpI2N/ooANS2lTPANukD1wswRiK/FmmOyvCFkydRpaWaw6M+3tpwkIfpgq2efv/iwJCKijQPDuTrUF63glCYztghcgSu8CW0jH0L0BmkMoUWHPsQ6BHzObR22xjOrIehcWXx+yAY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=e6rNdyCW; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="e6rNdyCW"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2ceb096e675so39826205ad.0
        for <linux-samsung-soc@vger.kernel.org>; Mon, 03 Aug 2026 06:52:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1785765177; x=1786369977; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=KP2LOm/b1vDApC79L7HU3Q+z5sMfbtyywYlbaxYaS3U=;
        b=e6rNdyCWST44TSfAK8Fy0rV32KNNV8zzDZujZgHRMjs1E8/ZtvmrH+JGPOgctkNGep
         q8EVBaw7qMkFe3aTAnwpfzoJG0J+CPzTlv0UhXrwvVp/mNpA1HdHxccNIMmdwnztlQhS
         1fxpSp70dOqmdZviKtdXFzEmWuhEX9Ml+gVLA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785765177; x=1786369977;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KP2LOm/b1vDApC79L7HU3Q+z5sMfbtyywYlbaxYaS3U=;
        b=FZ0yqiM6tlQ5k/HuHDdejxQXKJazz6EwXZqx4s4Iwy+52UA3bmgiq6BMvgONz701MS
         d87NszwYm1ZXEEwIVKbF5tDsK0Mn2z9AJsNfGa7efFFAcCVHMl9b80qL6jj7utjxVuBF
         xUDaAM0TEsjsXBas1/v/eCQNQEMSU9ykRZGXu050KTleObZ0OL5CIgkrkZi9ldeowHem
         hN8h4DL5Ht6TzqRAIkXCdTPxUhYU/vzp6TKYfnJqCSQGDx9kMyu3GyW6sU4mGI96skDk
         +vPYiiMHM9Xnq1UGOONi9qZhHtCs5ZJa6vLEic9H/hrsxe+4ieNLbECLSjArJd0LlAyP
         Z6CQ==
X-Forwarded-Encrypted: i=1; AHgh+RpvH4HrefexgVUjOBzS30xYh5HaRS/x1xacbK0d+bqC5XZdPCp0fanmMFXSR7oMHUtvtp9RL0n05KCuZltw7Be9DQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyZPm9jdq5iLJmJXu/fSWqsYtBrTY3wuuZJSY799DCYysdRDhyC
	NN+mAk3pfuM/JTDqRojFMmzH2hYasoU5sfx+yEkYLQQtChEpMqWH3OH2e8p3kRPKlQ==
X-Gm-Gg: AR+sD10gcFLEHQj3jurTgmMurr48S7ZeEmc3zFxs0Q5MIZ4AHmN5HnGD9xQHvMhCcyU
	Exakm/BrAv7WrchDPZrZh8eo3QGKkzF1U6fFYTZ1xbkpBc/ngKBnpspQhYDcxx1VzddKQe95RFA
	H3xXHgaNaOgZeadRHOaWx87dC5LRnv/ddXaSD5eFFnxbbKDEw9TvcoHuNnQM450eTOKoGEM4a1s
	A3XhfB20fJHSdyCOTtqy/B8IPrxEWRDWQwRZXsPSLawA5iiwkBWKjOSjE37DE5284eqYXRFFFSk
	Y3ucsMqjlaF27bD4jRelb4biS/oZX2h51OOWRyDT6OyX2lBBzL/kkaoQBy83iwt2gP9YsvOI96j
	WA4lZz2Yqh3uif5yjH9n5YWpEwTurNuBB/JC9mFQpFnKRHgNuVuGGVMXgjneB3PO+Lky/+6riSM
	P4J4apKeoWY8WvJnqA+l5W2lW8mNvYUZiAvRSbhDNw7kNCztb6sJkG3wQwLzaX/4ogox420R1XZ
	NLQ40evdaAi760oJRylsw+JyBdY37vD/NefOBkD9AFgvvpHoZVKlQvE
X-Received: by 2002:a17:902:ce0b:b0:2cc:f4d4:299f with SMTP id d9443c01a7336-2d05229b34fmr106179645ad.27.1785765177126;
        Mon, 03 Aug 2026 06:52:57 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:1c0b:57ba:92e2:e178])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d04b12066fsm38791965ad.60.2026.08.03.06.52.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 06:52:56 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Inki Dae <inki.dae@samsung.com>,
	Seung-Woo Kim <sw0312.kim@samsung.com>,
	Kyungmin Park <kyungmin.park@samsung.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	dri-devel@lists.freedesktop.org,
	linux-samsung-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] drm/exynos: Set supported modifiers during plane init
Date: Mon,  3 Aug 2026 21:52:47 +0800
Message-ID: <20260803135249.2898083-1-wenst@chromium.org>
X-Mailer: git-send-email 2.55.0.571.g244d577d93-goog
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The exynos driver currently checks the modifier in a helper called by
the plane atomic check helper callback. This check only concerns whether
the selected plane supports the tiled format or not. This is tied to
the plane's hardware capability.

Turns out the tiled support was added around the same time modifiers
were being plumbed through DRM planes. The latter provided a way to
describe per-plane modifier support.

Add a field to the hardware plane capability struct to allow adding
an optional list of supported modifiers. This is passed to
drm_universal_plane_init(). This also allows the core to generate
and pass to userspace a list of supported modifiers for each plane.

EXYNOS_DRM_PLANE_CAP_TILE and the existing helper are removed, as the
check is now down by the DRM atomic check.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 drivers/gpu/drm/exynos/exynos_drm_drv.h   |  2 +-
 drivers/gpu/drm/exynos/exynos_drm_plane.c | 30 +----------------------
 drivers/gpu/drm/exynos/exynos_mixer.c     |  8 +++++-
 3 files changed, 9 insertions(+), 31 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_drv.h b/drivers/gpu/drm/exynos/exynos_drm_drv.h
index b126cd129944..ab0edb826261 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_drv.h
+++ b/drivers/gpu/drm/exynos/exynos_drm_drv.h
@@ -92,7 +92,6 @@ struct exynos_drm_plane {
 #define EXYNOS_DRM_PLANE_CAP_DOUBLE	(1 << 0)
 #define EXYNOS_DRM_PLANE_CAP_SCALE	(1 << 1)
 #define EXYNOS_DRM_PLANE_CAP_ZPOS	(1 << 2)
-#define EXYNOS_DRM_PLANE_CAP_TILE	(1 << 3)
 #define EXYNOS_DRM_PLANE_CAP_PIX_BLEND	(1 << 4)
 #define EXYNOS_DRM_PLANE_CAP_WIN_BLEND	(1 << 5)
 
@@ -112,6 +111,7 @@ struct exynos_drm_plane_config {
 	const uint32_t *pixel_formats;
 	unsigned int num_pixel_formats;
 	unsigned int capabilities;
+	const uint64_t *modifiers;
 };
 
 /*
diff --git a/drivers/gpu/drm/exynos/exynos_drm_plane.c b/drivers/gpu/drm/exynos/exynos_drm_plane.c
index 5c04ef87e400..31f5f0941154 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_plane.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_plane.c
@@ -174,30 +174,6 @@ static struct drm_plane_funcs exynos_plane_funcs = {
 	.atomic_destroy_state = exynos_drm_plane_destroy_state,
 };
 
-static int
-exynos_drm_plane_check_format(const struct exynos_drm_plane_config *config,
-			      struct exynos_drm_plane_state *state)
-{
-	struct drm_framebuffer *fb = state->base.fb;
-	struct drm_device *dev = fb->dev;
-
-	switch (fb->modifier) {
-	case DRM_FORMAT_MOD_SAMSUNG_64_32_TILE:
-		if (!(config->capabilities & EXYNOS_DRM_PLANE_CAP_TILE))
-			return -ENOTSUPP;
-		break;
-
-	case DRM_FORMAT_MOD_LINEAR:
-		break;
-
-	default:
-		DRM_DEV_ERROR(dev->dev, "unsupported pixel format modifier");
-		return -ENOTSUPP;
-	}
-
-	return 0;
-}
-
 static int
 exynos_drm_plane_check_size(const struct exynos_drm_plane_config *config,
 			    struct exynos_drm_plane_state *state)
@@ -245,10 +221,6 @@ static int exynos_plane_atomic_check(struct drm_plane *plane,
 	/* translate state into exynos_state */
 	exynos_plane_mode_set(exynos_state);
 
-	ret = exynos_drm_plane_check_format(exynos_plane->config, exynos_state);
-	if (ret)
-		return ret;
-
 	ret = exynos_drm_plane_check_size(exynos_plane->config, exynos_state);
 	return ret;
 }
@@ -312,7 +284,7 @@ int exynos_plane_init(struct drm_device *dev,
 				       &exynos_plane_funcs,
 				       config->pixel_formats,
 				       config->num_pixel_formats,
-				       NULL, config->type, NULL);
+				       config->modifiers, config->type, NULL);
 	if (err) {
 		DRM_DEV_ERROR(dev->dev, "failed to initialize plane\n");
 		return err;
diff --git a/drivers/gpu/drm/exynos/exynos_mixer.c b/drivers/gpu/drm/exynos/exynos_mixer.c
index 69dea5049309..d74e605a452b 100644
--- a/drivers/gpu/drm/exynos/exynos_mixer.c
+++ b/drivers/gpu/drm/exynos/exynos_mixer.c
@@ -93,6 +93,12 @@ static const uint32_t vp_formats[] = {
 	DRM_FORMAT_NV21,
 };
 
+static const uint64_t vp_modifiers[] = {
+	DRM_FORMAT_MOD_LINEAR,
+	DRM_FORMAT_MOD_SAMSUNG_64_32_TILE,
+	DRM_FORMAT_MOD_INVALID
+};
+
 struct mixer_context {
 	struct platform_device *pdev;
 	struct device		*dev;
@@ -148,8 +154,8 @@ static const struct exynos_drm_plane_config plane_configs[MIXER_WIN_NR] = {
 		.num_pixel_formats = ARRAY_SIZE(vp_formats),
 		.capabilities = EXYNOS_DRM_PLANE_CAP_SCALE |
 				EXYNOS_DRM_PLANE_CAP_ZPOS |
-				EXYNOS_DRM_PLANE_CAP_TILE |
 				EXYNOS_DRM_PLANE_CAP_WIN_BLEND,
+		.modifiers = vp_modifiers,
 	},
 };
 
-- 
2.55.0.571.g244d577d93-goog

