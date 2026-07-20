Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C29EB4314B1
	for <linux-samsung-soc@vger.kernel.org>; Mon, 20 Jul 2026 15:41:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784562073; cv=none; b=KriAXwCgbRVxEBz9IEEzBMKpAOmG+pgL7Ni6HFwaVt5s/wxfm3yNIPCZRtaB1lqWsUamxvp30ivpozJEyxzAYV0i37Y9PCZHL0ic5YkpL9NKisuWw/uu/l05TQWVvIWM+4xocZTdJTwjiBOvU/Cx07h04tOKT+vnqaWX/pWuDOo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784562073; c=relaxed/simple;
	bh=uAbddcMyRgpLPl1Ml7UGFgQr7U5XL5NUVGp3YEItfuo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cfuJiWwWxg23TR7XeY1OvccCwmKKWWvSW5jZZlanfsS6jtixiHOALZcLMd+jFqXdxAJAbBEs9JtnRIH6NREIih8EFSFAl8lQdZYfxvAalsZYPfeqap+kjX1wK/lqI8U2SWCPjT1L47QN+QYm+PYbsRTdFlkWr9lrY0TL1yhgy+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qw5msTeH; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qw5msTeH"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4956242332dso7013645e9.2
        for <linux-samsung-soc@vger.kernel.org>; Mon, 20 Jul 2026 08:41:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784562069; x=1785166869; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/m2It/8MnIxoX8xbOWjx4p2UhJgFTMfhBAqsULip3yI=;
        b=qw5msTeHD7m5Nyf0Q+Kk5iT4ck3jJFaiaC1bDQ0BmAb6ZvnWk92kUaVRfZue8kQ2Im
         KV9T1Ost0eShNx7YKI0qRQqkuUPJtY33rrQdV6lLfK6xRhfYJfP8eGyLQQ0VFuWPOf8b
         P3vvx8i1TKbfPNcTTOXBhGS3t35523ic4DhNMBj9vcocLbMRPKvNnYRQrppiaAfLYVDi
         pFVqxb0RjXNMw/J1LliE6l6mFaXiE4ttVF5D0J6TtMx8FNhqQGUg41IGQqGnyWR/G5xY
         Rck5nKyJoejhilGl2kXHzWSWJ1zDMe/ojMFoWuRixCU1UntRXDAmQsffmP4HCKQwUgmT
         vBrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784562069; x=1785166869;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/m2It/8MnIxoX8xbOWjx4p2UhJgFTMfhBAqsULip3yI=;
        b=fwwbmKmUfZBAH38zrP4ahkOe6ZuLsClfchF1H2ZqIdlO0iwU6vYhs27LNnn6uC7etd
         lnpXC7co2Ei7235Ulv7qSqVgyHTgYg1yvKyvDFj7mGUKq7nIeCg9zonx9mk7GqRc3Ih3
         0Kt9Url5XQDgeFhxV1auZSBI7vIVKr9MEwW3IKG//Fp00OmLrbrDniQCDl/9w1UPKVS/
         qC/0h9vGNr3fSfB+VA2tYnzVKw/8nSNC5DmSfMkPFKg1WDFoN24fqGwWKvgxiNV9emlp
         WpkMrudw6dB5Fbz2VDEC4XyGvMcVjZk2Wq6c6wNK2OkK/IujN8tPGBa92fCyKPov2WQE
         jCJw==
X-Forwarded-Encrypted: i=1; AHgh+RqxrmR88Ovrovpo55niP69iUGyKk8s2d8a3YwPsQAVjQa5idnwLmTWbMAorcAkmS64/xjWWkvrLKAvkFjBZ9J7nIQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxbB6Q5zFTmzu0kLICH61nEvGdRkNDh2XZutpteSEuMLDvr6rlw
	fW/ajZUz7RFVwoUUzgwQA593UeYlkjqxfz92CShRuKKxBUssjcbJyUcf
X-Gm-Gg: AfdE7ckAnlJBTljyJV64Ox+rEg+KZ4W2F1ghRSjIh8WO1KO71lHfbsPDb+ab7RROHBz
	B1gF13SELtNbbsbSqd90bugv6eP7hW/nC98UrddiTq2ImvL5lp2FxvCw0lDytUe1LeAcLrGYac0
	4HEj65zLaWjZNhE/vXVBpqZ0IkE3138D7s6aGfvqk24J71k0cZ/BRywy5Zj9E8pQ+ESCGQnnaeE
	qD2GqnGAblcxPWd+gv6tCz1ZgT87NmWZT6U0KZ0LlUAQti6biQzOTH0HkUFb9O3R0GN7gJ52xiN
	5F9nlPQuVtJYbthTgXvO7jOWT1Q7UF42w5ctZaLa5mD4zBUG5kOLk66l/aR/hzjF9HPrUK21XpG
	2bIbYjhum1Adv7O8LDszfmb/+EkvLgf5Oj2/akHnwWQoCbxlbwOZRb+Q+1OurgvavMAYiysRCGi
	1//ovecmQ7fQ==
X-Received: by 2002:a05:600c:1f8c:b0:493:cefc:d113 with SMTP id 5b1f17b1804b1-4954a3e6e29mr174459165e9.5.1784562068798;
        Mon, 20 Jul 2026 08:41:08 -0700 (PDT)
Received: from [127.0.0.2] ([2a01:14:111:ccf0:e9c1:2f80:10a9:c708])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f67466e09sm32667936f8f.21.2026.07.20.08.41.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 08:41:08 -0700 (PDT)
From: Diogo Silva <diogompaissilva@gmail.com>
Date: Mon, 20 Jul 2026 17:40:38 +0200
Subject: [PATCH v2 06/15] drm/virtio: remove dependency on DRM simple
 helpers
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260720-drm_simple_encoder_init-v2-6-5020b630668a@gmail.com>
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
Also check the return value from drm_encoder_init() to avoid silent
failures.

Signed-off-by: Diogo Silva <diogompaissilva@gmail.com>
---
 drivers/gpu/drm/virtio/virtgpu_display.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/virtio/virtgpu_display.c b/drivers/gpu/drm/virtio/virtgpu_display.c
index 44ffffec550f..67023d91d40b 100644
--- a/drivers/gpu/drm/virtio/virtgpu_display.c
+++ b/drivers/gpu/drm/virtio/virtgpu_display.c
@@ -28,11 +28,11 @@
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_damage_helper.h>
 #include <drm/drm_edid.h>
+#include <drm/drm_encoder.h>
 #include <drm/drm_fourcc.h>
 #include <drm/drm_gem_framebuffer_helper.h>
 #include <drm/drm_print.h>
 #include <drm/drm_probe_helper.h>
-#include <drm/drm_simple_kms_helper.h>
 #include <drm/drm_vblank.h>
 #include <drm/drm_vblank_helper.h>
 
@@ -232,6 +232,10 @@ static enum drm_mode_status virtio_gpu_conn_mode_valid(struct drm_connector *con
 	return MODE_BAD;
 }
 
+static const struct drm_encoder_funcs virtio_gpu_enc_funcs = {
+	.destroy = drm_encoder_cleanup,
+};
+
 static const struct drm_encoder_helper_funcs virtio_gpu_enc_helper_funcs = {
 	.mode_set   = virtio_gpu_enc_mode_set,
 	.enable     = virtio_gpu_enc_enable,
@@ -306,7 +310,11 @@ static int vgdev_output_init(struct virtio_gpu_device *vgdev, int index)
 	if (vgdev->has_edid)
 		drm_connector_attach_edid_property(connector);
 
-	drm_simple_encoder_init(dev, encoder, DRM_MODE_ENCODER_VIRTUAL);
+	ret = drm_encoder_init(dev, encoder, &virtio_gpu_enc_funcs,
+			       DRM_MODE_ENCODER_VIRTUAL, NULL);
+	if (ret)
+		return ret;
+
 	drm_encoder_helper_add(encoder, &virtio_gpu_enc_helper_funcs);
 	encoder->possible_crtcs = 1 << index;
 

-- 
2.54.0

