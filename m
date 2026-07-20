Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5924941168A
	for <linux-samsung-soc@vger.kernel.org>; Mon, 20 Jul 2026 15:40:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784562057; cv=none; b=Uq2invDFLu7jIBE3fAhKngJWfIYYiqOYG1iGW5+y1bXKWG+tASDtx81vIu5JWSGkvasXmUsUojauEug3+3DWkTXYMC04PBui/7wq3CaH5EzoiMxIJXQQkS+52wz7qNj+5nlA/Mfqm9JfzDgcuguCPG7AHiY+knnKbKYX1vY2WAA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784562057; c=relaxed/simple;
	bh=nIPzxyC7g+URQtzWP7eUGE6nO5tW3SAcscwh0lKy5F8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mtH/3sL+EydLM/Y3/XYaiMJqcj+2o96H0QCVNZpLz1A0/kFQ//BVDhZEcYJMcl96LS5MNQ/om8wiTaYXC426CaRdBdnQn+GCEgfl3iVBPpcyRdopH3xCQlp+sP0hQkZuXY6K+BdgRi+hZe9XwBT/5L73cNDIlP2BG7Wd0QTXo98=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Q+P3xI3T; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q+P3xI3T"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-47f703a9e5dso509203f8f.0
        for <linux-samsung-soc@vger.kernel.org>; Mon, 20 Jul 2026 08:40:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784562053; x=1785166853; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Pvez7dBBgFzTEWul+X0zgtK0IubmPdgVdOv0lVVEMOs=;
        b=Q+P3xI3T+i5cj9Doai+6QDl5EuWScSaDw9cizNOjpWLNNgNvvYyVTRj1UuUFQaCWqV
         2A+f4QUmUY0YIwmSiCHL8UL8qsXeG2LypiebMKuQ3uNLvwZLFrN6llZ3OsEKt2GlNMRq
         HAEhF9NNTZ5Lr4Mgi2xl7e75NVJPsOv3N65eQLuGzoiNU9gJI+Jkl6o6V/dOzun0F/Nx
         2u18jAPIWTFJmKHJ+Jj8EcCNn1a2rh47vRZs3EezK+RRdNkXfnbeO40/1lgKbCqOirxd
         JUgQ2zH/bBu5qHNDBau41ajRVvlsGwJa1JRli3dn2NkOTpDdXGkbg9KvS9SOp4tyne1s
         IKAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784562053; x=1785166853;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Pvez7dBBgFzTEWul+X0zgtK0IubmPdgVdOv0lVVEMOs=;
        b=FEtTX32RuSnBGyrkzED0GAix9RMEfnFn/qkqPjN9783nmi0Z+kbbzAsp1XCy3dQQKi
         pXBDcNK/uEyNIqg2Sz6RddsaG8rdKvLTpznsmjGmAklEcwpXAvwkjvY2IkcmnLIjjJr4
         bNK6EuONxnJNz21Ivku3HvS7va0S2RBn/MT5s2WLfWTvgEM/JFm34GlsodqyLZnqREVF
         dJf4i5m3v/zh47/+Jn1kghJAPWwYhKH+4Cz2nZ39zVdyn+3Y9dDHuyO1H745fUZOjDJc
         VIwye7Nt24b42R9nLRZwGRSET573bzy79AZRfIyC3HdSACxDvECPp5zj9qYGZrP58zyV
         NvCQ==
X-Forwarded-Encrypted: i=1; AHgh+Rpa/Tsm0EWxBiJ54xLOh2j1wzqKImMet4ZRk0ANc3oGeBh0sznSqxjUJC/c+htxggib1yl8ks27F4UpWQVq6ib51w==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy69KJ0MPXLxaSjX9m0HQ1+sc8iKneu/DCfyJOKn7r1bQcovRim
	Vc1qsbAgtRuzIoy1SXuoIjD5H/UAh+9R39EMoJvvtM9bYr5pWBsEhjPr
X-Gm-Gg: AR+sD12JKxju9cZzceJeD/tEM8J1tKxNxv/bStIOlJD8em6Abcv5NLXTCNjcDyiKYk6
	CtxgMv0Z9ycpyhrIXaQSASZ+6qnHzLhCNR4/wd16KyiQ6JR8/QsaOyikzceXEWOw7Bc/UIvw+IE
	SCZDwzlcUtR1S4Q+TItkuQrpZXR2Fjw1H8HoG70aW8iiKn5MeHYTdMHEfGOlZlGLCBjB/cIVNUT
	y/Gzh3DAN1qHTU9yqX5ZPHxkjwTUbEIsifLHbXrTZ5suQXP5QeTnNswxRRV6WQK24tNg12JTWVv
	HIwii2VYptFVBdPYJMB15PxhFOzhNLVcL5/SYUeN8EvWPqWmdrN5Zqb4gBnoxMxE4MN7SopSfvz
	ECnqbjO23JwpBrEJR5az4394cjLZUq9vwoFirP3NcaLNllg1GffLlG9e4Zau8VpQZoZjy1VVKBC
	eh8gpDB0yXLg==
X-Received: by 2002:adf:f604:0:b0:475:f0f0:9ef6 with SMTP id ffacd0b85a97d-47f6233f338mr13274205f8f.59.1784562053525;
        Mon, 20 Jul 2026 08:40:53 -0700 (PDT)
Received: from [127.0.0.2] ([2a01:14:111:ccf0:e9c1:2f80:10a9:c708])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f67466e09sm32667936f8f.21.2026.07.20.08.40.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 08:40:52 -0700 (PDT)
From: Diogo Silva <diogompaissilva@gmail.com>
Date: Mon, 20 Jul 2026 17:40:34 +0200
Subject: [PATCH v2 02/15] drm/xlnx/zynqmp_dpsub: remove dependency on DRM
 simple helpers
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260720-drm_simple_encoder_init-v2-2-5020b630668a@gmail.com>
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
 drivers/gpu/drm/xlnx/zynqmp_kms.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xlnx/zynqmp_kms.c b/drivers/gpu/drm/xlnx/zynqmp_kms.c
index d5f922450565..ac9197e026af 100644
--- a/drivers/gpu/drm/xlnx/zynqmp_kms.c
+++ b/drivers/gpu/drm/xlnx/zynqmp_kms.c
@@ -29,8 +29,8 @@
 #include <drm/drm_managed.h>
 #include <drm/drm_mode_config.h>
 #include <drm/drm_plane.h>
+#include <drm/drm_print.h>
 #include <drm/drm_probe_helper.h>
-#include <drm/drm_simple_kms_helper.h>
 #include <drm/drm_vblank.h>
 
 #include <linux/clk.h>
@@ -417,6 +417,10 @@ static const struct drm_driver zynqmp_dpsub_drm_driver = {
 	.minor				= 0,
 };
 
+static const struct drm_encoder_funcs zynqmp_dpsub_encoder_funcs = {
+	.destroy = drm_encoder_cleanup,
+};
+
 static int zynqmp_dpsub_kms_init(struct zynqmp_dpsub *dpsub)
 {
 	struct drm_encoder *encoder = &dpsub->drm->encoder;
@@ -436,7 +440,13 @@ static int zynqmp_dpsub_kms_init(struct zynqmp_dpsub *dpsub)
 
 	/* Create the encoder and attach the bridge. */
 	encoder->possible_crtcs |= drm_crtc_mask(&dpsub->drm->crtc);
-	drm_simple_encoder_init(&dpsub->drm->dev, encoder, DRM_MODE_ENCODER_NONE);
+	ret = drm_encoder_init(&dpsub->drm->dev, encoder,
+			       &zynqmp_dpsub_encoder_funcs,
+			       DRM_MODE_ENCODER_NONE, NULL);
+	if (ret) {
+		drm_err(&dpsub->drm->dev, "failed to initialize encoder\n");
+		return ret;
+	}
 
 	ret = drm_bridge_attach(encoder, dpsub->bridge, NULL,
 				DRM_BRIDGE_ATTACH_NO_CONNECTOR);

-- 
2.54.0

