Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2146379C28
	for <linux-samsung-soc@vger.kernel.org>; Sat, 18 Jul 2026 23:36:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784417782; cv=none; b=rCno3k/QNIo8oDhdVk4eebKzMO7kIyU+X2RmqbnIp8P2NCxZ/vOa4IHTDrveegN/Lwa/mJdnWiilpB7GT5gB3NxWfgsvq66I0MpxzWbFbaO1PnGf5Z3UdOvIo5YAHYKgEXCo/xzjP2YdAJim5OKLKURyIqFCVaPOqEgw0e2Gxfg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784417782; c=relaxed/simple;
	bh=uAbddcMyRgpLPl1Ml7UGFgQr7U5XL5NUVGp3YEItfuo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=g4CcSXNd0i31iFIRmUGxCCsOzPRjI7hX68HdX2HAYZUP/AE0jfAmn91UerKPmrTQas9Jcc/JB6fgUjlxihUANYGzOdA71966i6p/pChtGjGVOihdhtg5SZlBk/Dfe3Yxo8YmLyhVrMYDaKHLFbohKxWrQWRZAVTKDR6S5vGWEEo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KtlCcNee; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KtlCcNee"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4953ddae026so28559875e9.3
        for <linux-samsung-soc@vger.kernel.org>; Sat, 18 Jul 2026 16:36:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784417779; x=1785022579; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/m2It/8MnIxoX8xbOWjx4p2UhJgFTMfhBAqsULip3yI=;
        b=KtlCcNeegq5ZtXkQLi3SgIe2cScOLVwBgT2+Mp00KKdDJ/F5VTJjghruZIuV0GJyg5
         +2gWRbYwjabq1qIqz3RRIODN7mUTQIw9j7iPfySmd5ctxFzqMs1zJJzmG35jAj6SvR1C
         qcZcE25uATYX+EL5Gmf4QiAmw2Y8Dkmhso26VCB23c6vCAPSgJCF3NgeYsZmZLTXdw5/
         5O/zlSq1enFEEvR71n5feczUq+q/iS98MDItUQ7JQBE5L26NPE19MlYIbV0rZnAwglXJ
         kSfRFeU/Xdc9K/tS6UJNNzzXcwHzeNCmukY1RflNsG9AP9JeKyczPGRymtzq06o1GAwv
         986g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784417779; x=1785022579;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/m2It/8MnIxoX8xbOWjx4p2UhJgFTMfhBAqsULip3yI=;
        b=S0GY5UdM7nV6B3726c4B1XC4aaXz6oJ3yNkdBBEwFIST3UqjAiN4vMv7MQjUQGym5Q
         Jkv6FjWO9F5kFEdVJzNjAw1EjzxOPvomibVeJaGyJmeA7COZEAmqZV78T5rbwSFmsXW+
         b44YxA/r7fiHsMGnkdlPbw5WiF+T2vUudQZgR9Frr7zyoP/Tpkq6bwhmb8l34CzwTRqW
         Fy4yr236tLA9ptqi1eA4Cvi4QSu+uzTEW5F2Imh/EkFZ9h/fKGNxu0blhvkOzQ3oOExA
         6sqeX4KoKeSuzfGrMtDwpqHDvSqyEIMCPdqTZ0LFkerWqdxHmrM4h0xUjczSD/TnA85N
         UmIA==
X-Forwarded-Encrypted: i=1; AHgh+Rott3RZ5TOFy4GolxDixvs3rBVJEej/GaeOROsUsqOSdvIO3PVEIeQ1L5x+pfVy0nf8gtGKQi//5I/mYdRB6gVqZw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxNQG+q8TDhQM35lR5KEy4Fj5ti+GeS9cMnfIOMcCdEMRQzL14q
	MwWpo/xmN3+OfmA6ilmdWkXoByYQeCO/4kO3RLmQcHUJknhN+6kfSv3d
X-Gm-Gg: AfdE7cnpj5Lwo7YRVpnoRCx1R2s7ngseLXdwJt1w0WExdgctuhfiI+oiqGjvv1Axjpc
	e6asSO5oS+l27BhqR7nttgoZ7YkkLtDfJayUL/rq/NN2hduRTBNzfGIwZGRhoH7jWZ/RAAFka7v
	wT9FeEMg9+yYoxlVtXv6LOoqLDScYZTyU7bL4ai5OjG1G2VBA49w3VyKPA/B7dAgmrSzLmFsL0l
	biLEJHOgJHq6bE+Um0wD0v/4rS4BowY2OrNK//tflH5E2im11L6448O6zC+Hyyh7BeJtQczbF3k
	/EyN18L/Ld9dpgNOi59BgMMsrGvll+LBaWz6NNnL1gSkGCYSof5mSlkYQAq9qDTfXy6u39VxPu4
	ztV2IaqZQpGQuMdpK2JGmyify42MvVHDr6RU1OY1I4FegnhspYkeTDIMunmmgQJFKz75qIsHCRj
	nGMIakgIcp5nqIz4Ley5Qy
X-Received: by 2002:a7b:ca50:0:b0:495:3fe1:4ce4 with SMTP id 5b1f17b1804b1-4954a40c110mr70449165e9.26.1784417779234;
        Sat, 18 Jul 2026 16:36:19 -0700 (PDT)
Received: from [127.0.0.2] ([2a01:14:111:ccf0:645b:9e5c:7fe3:c09f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4954a2a24b6sm160964675e9.3.2026.07.18.16.36.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Jul 2026 16:36:18 -0700 (PDT)
From: Diogo Silva <diogompaissilva@gmail.com>
Date: Sun, 19 Jul 2026 01:35:37 +0200
Subject: [PATCH 06/15] drm/virtio: remove dependency on DRM simple helpers
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260719-drm_simple_encoder_init-v1-6-a78c509e3062@gmail.com>
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

