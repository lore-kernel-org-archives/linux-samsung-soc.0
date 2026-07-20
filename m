Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6584433BC4
	for <linux-samsung-soc@vger.kernel.org>; Mon, 20 Jul 2026 15:41:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784562080; cv=none; b=afXEfmmBZsxGAubk5SwcMGnHp16QRrorzCXLcL8kp+P06BpiMZmsIAWZtUZ31uMfmLcr9r/Qjjf5DKiJvsGKTg0iRt1z8oNHZckICn4eEpyngcIkVL+EmJaeubCFj38rXw3jvDIO1QPdA+g4sRMRQAZIvXvsFu/EZ5lda7vIHS8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784562080; c=relaxed/simple;
	bh=HdxpWSHVTZnagqWd9UGqEZtDSs8wJ971uoSLZwkj04A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Rl8h29urkArLQnp+epFh2hQlUp3Jx78BYn9eSFUeyR7XgnPTTMavV4xHJSatvf4mfzuQSxwq3lGIFETGQlb1hKqKozwS7dAy3RuclFGwsHGbBN9B4FFZyc+oX3IAFqOOaPyN6JrQ2Pv2/IWYoV1yj1eGobQWX5c6LEhEr8CgK6k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ifpynGoV; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ifpynGoV"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-471eeac43bfso9602863f8f.3
        for <linux-samsung-soc@vger.kernel.org>; Mon, 20 Jul 2026 08:41:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784562073; x=1785166873; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ATiv+bDbiK4r8/Ev/Mp3rnzRTm75IqK6z6i5srau5Es=;
        b=ifpynGoV4SFFXmDXj/N0kA0WITPIodx5d6p8MSCd+9l/k+dvefMzB3LPNOn//ldTbp
         i3Et44uJZb0c9nahYz16xJbri7VTwvwb/u0qbjTAYYTxD1JkvDfGxhwPm04kniao2/B6
         xSW7/VmSe99yh4Ocm2FE5v1PqvFhc51R5BUMaOwBQgfjEYbRSUS/Px1rF/7E+QBUR0qd
         QwTWAAygOPxwrcWVqtnQQjKzLxFhRRV+e9G8KmRy48J+qvI85NMD0SBumBBZzgtwdXiq
         Dy0l6ZAmg/xAwfZIkVg1m0Aeb1eA14Y1bk7w0MHOxrA7aDOA5wbgjpUa6DhwJTftu65v
         9w9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784562073; x=1785166873;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ATiv+bDbiK4r8/Ev/Mp3rnzRTm75IqK6z6i5srau5Es=;
        b=Z9NSKcw7cghc5qRYq/FRLnuwXbhG11I/1Jba5gt8uxh3HYL+GNBGy1wE1eG+EhzySB
         7ZPBTC1l7gboaBXAlLGnd5l+62dKILfqKrUQ/4ql//sY4D/MwehVfolVgTmx3cSmXmCS
         NQc7SiA/c24ISpD9e72c7LgubufWnZr91hCLUL02vS7KQ+TJli5wb09hPK+RMm5+GQ2x
         KYOoxoZHhpj38ggzi0DYa/4sKB9N/lcQthBwn8kWZOQXv8OiwDZuh5LkmRVMQLsw9Pfv
         X/xYcp5oLR4wdjFO3nlA6ZqNf8SpDMA0WWNmlh9K1tgJNsQqFHAU0kojaX7eZZw2YHOR
         Ugog==
X-Forwarded-Encrypted: i=1; AHgh+RpH4eImsBCmqdRcoaoe3f16Fj9PBm4GOR78lK012mjRm2AcvBGQepjpP7GNMvNjRRLRYZpWCbpQT4g0r6dHu3X9yg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwDz5tu6cJXOxXzCCa0Bl3YTPWYBYVpU83pFYbPYVl6hQTjlWgk
	cgSy9/Mb9lNCeoiOEhBNqGE1dkNCLIyMAqPF9T5/UZysOogcSnmtT9c4
X-Gm-Gg: AR+sD12u556MHXPY/HCwNgQq8EFB5OLZXcx5bxhzcP4WHiz2gu/zhll2PUhyBZZ98VU
	vsZxOjn6+uWirm8lkITqhTwUQU4igvdIESQNZ5jEp7vHq51eNS+dc1/nJ60XtUWujwNSqYRMh+X
	LomYnZ0NxrheZjgJc0tsvHXC/5DoXfk2Mg4g2o7bPnJ2FY9T8tRQjMXF4NUNQEpYicFtTAhbx6i
	Q/DmBjmuhVY7RzdH+hw+tNGdJHi07Fddtju1dXNkVWnbFerBvbzfxnKYYm7aTtji2fZk/fVXFbp
	igF34E4L30dv7nNEuN0Uu1m6d0git9GUKIJI2QeP9KFgi9islV0R7LkY0oFZTrWudnkobVwLEeT
	mBCrnr0zL6hXFIwteJZ9soyFUqCJRDymwd7msgI8KpEflapBK5u5amoi+AGYzNuDyE/n7Oq4IZq
	XjTIPTDku74A==
X-Received: by 2002:a5d:5d0e:0:b0:47d:eedb:ee62 with SMTP id ffacd0b85a97d-47f6230389fmr18153184f8f.14.1784562072745;
        Mon, 20 Jul 2026 08:41:12 -0700 (PDT)
Received: from [127.0.0.2] ([2a01:14:111:ccf0:e9c1:2f80:10a9:c708])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f67466e09sm32667936f8f.21.2026.07.20.08.41.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 08:41:12 -0700 (PDT)
From: Diogo Silva <diogompaissilva@gmail.com>
Date: Mon, 20 Jul 2026 17:40:39 +0200
Subject: [PATCH v2 07/15] drm/tidss: remove dependency on DRM simple
 helpers
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260720-drm_simple_encoder_init-v2-7-5020b630668a@gmail.com>
References: <20260720-drm_simple_encoder_init-v2-0-5020b630668a@gmail.com>
In-Reply-To: <20260720-drm_simple_encoder_init-v2-0-5020b630668a@gmail.com>
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

Signed-off-by: Diogo Silva <diogompaissilva@gmail.com>
---
 drivers/gpu/drm/tidss/tidss_encoder.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/tidss/tidss_encoder.c b/drivers/gpu/drm/tidss/tidss_encoder.c
index 698f8d964ca0..10dbcc6cdf6a 100644
--- a/drivers/gpu/drm/tidss/tidss_encoder.c
+++ b/drivers/gpu/drm/tidss/tidss_encoder.c
@@ -9,11 +9,11 @@
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_bridge.h>
 #include <drm/drm_bridge_connector.h>
+#include <drm/drm_encoder.h>
 #include <drm/drm_crtc.h>
 #include <drm/drm_modeset_helper_vtables.h>
 #include <drm/drm_panel.h>
 #include <drm/drm_of.h>
-#include <drm/drm_simple_kms_helper.h>
 
 #include "tidss_crtc.h"
 #include "tidss_drv.h"
@@ -81,6 +81,10 @@ static const struct drm_bridge_funcs tidss_bridge_funcs = {
 	.atomic_destroy_state		= drm_atomic_helper_bridge_destroy_state,
 };
 
+static const struct drm_encoder_funcs tidss_encoder_funcs = {
+	.destroy = drm_encoder_cleanup,
+};
+
 int tidss_encoder_create(struct tidss_device *tidss,
 			 struct drm_bridge *next_bridge,
 			 u32 encoder_type, u32 possible_crtcs)
@@ -95,8 +99,8 @@ int tidss_encoder_create(struct tidss_device *tidss,
 	if (IS_ERR(t_enc))
 		return PTR_ERR(t_enc);
 
-	ret = drm_simple_encoder_init(&tidss->ddev, &t_enc->encoder,
-				      encoder_type);
+	ret = drm_encoder_init(&tidss->ddev, &t_enc->encoder,
+			       &tidss_encoder_funcs, encoder_type, NULL);
 	if (ret)
 		return ret;
 

-- 
2.54.0

