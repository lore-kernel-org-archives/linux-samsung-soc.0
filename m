Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795418703;
	b=qlBTHtQNny7wutcNQIxmyRPf/v5GGSpLL/XBJ5+XftpgfAC52K63zLs+ASPzDgbutHTZ
	 Jd+nEq6dNtDNGWaRG7Z1BIsiWRF3EVt8bmcVr8+Xy1KvRrrYBJxj0hhaVLzEIMdBLO9Bl
	 Z+JzCpkkKZwYGVPeiAwG8qB3T9PFlSncOEEuonNVX8Lf+YeupyjJFyu/tfSK2lkQV7fcc
	 nFDZJfDV4bFO3ZrMiW35uXfnKUuupqXVmC8p+mYb1R9198/saySGOEHfNFtN8S0QLXCCf
	 iIErTzHp8glj/3cncjqn1DjpQzdMD1fOuJ72pwKPZV9Fie5JkerEjvU9n6bqx4AXnMw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795418703;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=rsARERdZD46Vb5O4JLoK8Z3OY4IcI9MHjMKxLTV0Ng0=;
	b=vLP4Y2tRUaRbbXxqX7x4pyRMxeccoGglbuvUQGQ7dTqmfKAEsQ4HeU+Id3HBsoRRiLow
	 xjvhGmGl+AxkFnFrgg5JdSpW2L2x8lzhCm0at7XDjIwHxNzmcBLFG0bxQ5ZMwPMMQrAWM
	 7zN/Td5K2+MOm5KjKwZ6//b5cjny74IkEsOuWuSpUy3SWsFI4sCJmlTjgGMjf/xPNbZgH
	 Xddr6oEOfX/6B8+17M4jaZ2wamPtq+5emiHvSqHuygy9SBItE+KvWvWtYfMlbkQ2Chrf+
	 GFEzf5gruE87U7l+I6J7dVx8/OabNIvm3M9ClYHcHdmt2SKudCDESmb7snwYezDGxGg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=fZvI2ggW;
	arc=none smtp.remote-ip=209.85.214.179
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35D73606A31A
	for <linux-samsung-soc@vger.kernel.org>; Mon, 23 Nov 2026 07:25:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 35D73606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=fZvI2ggW
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2f037bc348dso24522445ad.0
        for <linux-samsung-soc@vger.kernel.org>; Sun, 22 Nov 2026 23:25:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1795418701; x=1796023501; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=rsARERdZD46Vb5O4JLoK8Z3OY4IcI9MHjMKxLTV0Ng0=;
        b=fZvI2ggWZDeuzqAZ/ZjEAMAhzf5E/YLJLMwUG2gIB+ka6EyBpyUHEZIrsni9eJNf8E
         Uvaw/dkgfluINPC/XL2I5EWUjAQg6sgvaYn1ld1V1apEtUK9uyD6eOaVa4021lQy0VLv
         JCNTZSQHzoYZnkqmZ8tpvPSVtFIxZ99pPVQ+4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795418701; x=1796023501;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rsARERdZD46Vb5O4JLoK8Z3OY4IcI9MHjMKxLTV0Ng0=;
        b=MUGxU1A9ZzKka9WA22saroOik3q/dP2dD84NHIOrwRfZ2t7+yCKpAWnpueKWpFYLZW
         PKabXFlYAnwgZs4XGcmR3DFAS/gNvdu+IrwqEi5yIN50YdLkdLI9DaktzaLXiElNCLqT
         Epm8uwAB4j2j7XJRJhVkOPvB9Nc9OIWpw28KuDrqY3eQBrrYnVwgFq79VN/7Kt+enOBe
         2ihcZ3wVhTq4CFB1kOGddISmU78yrTnKitvdbudolyTGVjt3QXl3PMEYPQEI9H622JLF
         r+qJc8rk72TUzKuj/XdWl25/uOFendBldF5TRpBFhXaOmmbIovSJWvUI/W2BPSaj23sK
         3+FA==
X-Forwarded-Encrypted: i=1; AL+hErFTyF97fCWDqSibakRwauACSgVx1EadQjK4m6luYFZxBm7nspie+Ypjr4eHbsHc0C2cQrXMNq53ZQ5JrMujK73CIw==@vger.kernel.org
X-Gm-Message-State: APuU4Z9Ah+10z1iag3OOJVts02uXWl/8l+8f9BB2XDs4iwfS36hKwpxj
	sYH1q/CrwsZspeyDvay2Q9/hCZp35UXBOkHN1PHnw1ZXsfYXGwh5LxSaoUZTJ4xiUg==
X-Gm-Gg: AZFdTZe6GMxFRVFApwM6cfISQH6mpqaSQsvZRB+IjbpN+/7sZivSTAfTiBEIeqAh+cJ
	VE5CTgNWpDTYdpJ8D2ZuQYKsibkxJmOCK1Abu++a7gssy0Svo/BdjvEFR3r0nNFFFdWVWEl39XR
	38maNyNT79aAPkS6UoVoGE675S1amMNJ7zc5KZAf7sQtpM6oD6mfBcZQbvJW2J6RiyEEmwmHFeF
	XpGV3HwO/jPfK1uY9S6q7aFguulcG2hwYl4z2EwaUKmaOCQDmEHj0AdsZOABnWI+H0TAG92ENBM
	5cYX8Yu9ZATE/R3FhLgIjYACoCQhDTavnjkVsf8CfIikyfAeolXl1bhvLYHGQm0x4ijWo+H8pqu
	FJx/5aNkBdIr5DJkO8DUcjMtBJBikIQI35eZHJ5WqA7AiklgkjjKVeHYAHruLVqvZpLdi/7mjnV
	HrtINr/E7z7C4kOUxCwmdNJ5qmGI5b6+LVU8xI3TYCfT5x9Q8vg1wRDjuMhFl2wTQGcbM5RYhuE
	LPu/SR+i+Ywmcd8qwR14xHRmSC6NPaPDEmyHjR9UOFWSiDsi3FqXeLflLWT1a6DoC9ilKG4yg/F
	6dgL1udI+BUBmFo0ozeQGvoobqUg1OQ/kSDCNXMLX4HBC1wbZ903zIiIHYwS
X-Received: by 2002:a17:903:1acc:b0:2f0:a113:4e46 with SMTP id d9443c01a7336-2f0a1134e76mr11816085ad.48.1795418701534;
        Sun, 22 Nov 2026 23:25:01 -0800 (PST)
Received: from localhost ([2a00:79e0:203d:7:fde8:799d:8c83:f2ab])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-2f03ee84294sm47180345ad.9.2026.11.22.23.24.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 22 Nov 2026 23:25:01 -0800 (PST)
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
Subject: [PATCH v2] drm/exynos: Set supported modifiers during plane init
Date: Mon, 23 Nov 2026 15:24:54 +0800
Message-ID: <20261123072455.2221408-1-wenst@chromium.org>
X-Mailer: git-send-email 2.56.1.831.g720f3f5937-goog
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Post: <mailto:linux-samsung-soc@vger.kernel.org>
List-Help: <mailto:linux-samsung-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-samsung-soc+owner@vger.kernel.org>
Precedence: list
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

Also provide a .format_mod_supported callback to restrict
DRM_FORMAT_MOD_SAMSUNG_64_32_TILE to DRM_FORMAT_NV12, matching
framebuffer_check() so the mixer VP plane does not advertise the tiled
modifier for DRM_FORMAT_NV21, and validate modifiers against the plane's
modifier list.

EXYNOS_DRM_PLANE_CAP_TILE and the existing helper are removed, as the
check is now done by the DRM atomic check.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
Changes since v1:
- Add .format_mod_supported callback to restrict
  DRM_FORMAT_MOD_SAMSUNG_64_32_TILE to DRM_FORMAT_NV12 (Inki)
- Fix typo in commit message ("down" -> "done")
---
 drivers/gpu/drm/exynos/exynos_drm_drv.h   |  2 +-
 drivers/gpu/drm/exynos/exynos_drm_plane.c | 49 +++++++++--------------
 drivers/gpu/drm/exynos/exynos_mixer.c     |  8 +++-
 3 files changed, 28 insertions(+), 31 deletions(-)

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
index 020e8c9cf7de..92ed00e2b6f9 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_plane.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_plane.c
@@ -8,6 +8,7 @@
 #include <drm/drm_atomic.h>
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_blend.h>
+#include <drm/drm_fourcc.h>
 #include <drm/drm_framebuffer.h>
 #include <drm/drm_print.h>
 #include <drm/exynos_drm.h>
@@ -161,6 +162,23 @@ static void exynos_drm_plane_destroy_state(struct drm_plane *plane,
 	kfree(old_exynos_state);
 }
 
+static bool exynos_plane_format_mod_supported(struct drm_plane *plane,
+					      u32 format, u64 modifier)
+{
+	unsigned int i;
+
+	if (modifier == DRM_FORMAT_MOD_SAMSUNG_64_32_TILE &&
+	    format != DRM_FORMAT_NV12)
+		return false;
+
+	for (i = 0; i < plane->modifier_count; i++) {
+		if (plane->modifiers[i] == modifier)
+			return true;
+	}
+
+	return false;
+}
+
 static struct drm_plane_funcs exynos_plane_funcs = {
 	.update_plane	= drm_atomic_helper_update_plane,
 	.disable_plane	= drm_atomic_helper_disable_plane,
@@ -168,32 +186,9 @@ static struct drm_plane_funcs exynos_plane_funcs = {
 	.atomic_create_state = exynos_drm_plane_create_state,
 	.atomic_duplicate_state = exynos_drm_plane_duplicate_state,
 	.atomic_destroy_state = exynos_drm_plane_destroy_state,
+	.format_mod_supported = exynos_plane_format_mod_supported,
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
@@ -241,10 +236,6 @@ static int exynos_plane_atomic_check(struct drm_plane *plane,
 	/* translate state into exynos_state */
 	exynos_plane_mode_set(exynos_state);
 
-	ret = exynos_drm_plane_check_format(exynos_plane->config, exynos_state);
-	if (ret)
-		return ret;
-
 	ret = exynos_drm_plane_check_size(exynos_plane->config, exynos_state);
 	return ret;
 }
@@ -308,7 +299,7 @@ int exynos_plane_init(struct drm_device *dev,
 				       &exynos_plane_funcs,
 				       config->pixel_formats,
 				       config->num_pixel_formats,
-				       NULL, config->type, NULL);
+				       config->modifiers, config->type, NULL);
 	if (err) {
 		DRM_DEV_ERROR(dev->dev, "failed to initialize plane\n");
 		return err;
diff --git a/drivers/gpu/drm/exynos/exynos_mixer.c b/drivers/gpu/drm/exynos/exynos_mixer.c
index 9b210ff7449f..5da871e5ac9c 100644
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
2.56.1.831.g720f3f5937-goog

