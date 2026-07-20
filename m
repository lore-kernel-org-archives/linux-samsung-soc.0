Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DEEC433BDE
	for <linux-samsung-soc@vger.kernel.org>; Mon, 20 Jul 2026 15:41:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784562080; cv=none; b=nzniEXQ3YwRHIfT90dHKeaxQQlgEHRpDndMIu6D+P8kHAkDBlFIIP5UMmPHFtSX5jANuUP3u7ebZKGdDCwc5dBb/aXIG7sROCHrKQ/msGLRM15Hx1MXxUuOQFut1nPf0xCL1yiYEtcy4a+yCW0vpsXAtnvClGN0X7vkKN2g37gc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784562080; c=relaxed/simple;
	bh=BI9R2SvxdH2gwqK0B92kFqt0y5mZiDZk7s7kVtduUr4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=t6Z1JJbHdjdlnZFD1Cuu7GH/ClN0JGGrHiDYZRZkwvWB7XjVr65kjt81SXM6SG6VQdJvTYwiinHbvzK745X96j4cOrD9JKtbs3fn0mGYIpxW42HGAiiBXwR6lA69lKs4T8R4WiQ7z8PuenQFsZcGw4I07obJJ1/42KynM0UGo2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Wijl3SHi; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Wijl3SHi"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4921eed3fa2so78722575e9.0
        for <linux-samsung-soc@vger.kernel.org>; Mon, 20 Jul 2026 08:41:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784562077; x=1785166877; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3qoMRiXvV6BHSei+lkJBYDW1cqZXXpht0BCmlOitIE4=;
        b=Wijl3SHix+Alxt5fLRQ6SRd1dqTIDMAFMS3QUuexer5f1gYgCvzFTKcCIe5XnKn8t4
         qtgtr6PyAMZbOws6qGo/Pl1pddDjjopDtxCVgSv0sJNwpxqAzCknU+7K4mvzKh6DrktZ
         4+qfBJ1QNoU5HmSU7Hyu3uFu9CcMFUTMvLawIVxGenmqhegY8XFfYK/HYiIgULj3e/Y1
         37dPx30aES7FRkGr/SYCuBhp70MEsB//RxtQrn7Eq7gr2zywN7KJwQdaAT+TAWjD5clc
         8S1Mi7rsZbzs1eITPAzf6wUW/jG00V8oDKQWHsYTJketIuz6DnYmoG4yddiMPp0unKQc
         T9Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784562077; x=1785166877;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3qoMRiXvV6BHSei+lkJBYDW1cqZXXpht0BCmlOitIE4=;
        b=OuRL5rxxNJGxnO8HrHwnwP2UmBzlYgvSA5hT9cNuvtlKgVyd/XWTp/GUc/B6cnLZXB
         WraxxcicoAUOJw4MegSpsWtzux0/KZVuQ2dN++YOkKM6JzXSYri/c/Tu6gAPAMUH2F+x
         vOAIfkMW2Ebgfj/tXx/hzlFYYRiyughXNwoRMOY88DBqDkr4a79TkvKjrPgr301ne3TL
         mlaGdg9H0YL89kcJNZTARVtP/tabItjKH4if8ZFd8YBADZsBOrBdqU/rKNHcbNEgSynX
         zIDTb20iwubDkmKTJcaYKZqsgu/GpvdqT9RXfrUY8ezJgI7EWKJ6VZCjwvuIrq8gKJjs
         OixQ==
X-Forwarded-Encrypted: i=1; AHgh+RqX+FU08DzZwiUQNqGm/PAQ5VUIkLDWta9QOJEpZhF8zS/Xq4+4/Tcjj72lGJdA8aqBFaKITiQ16NHuKJiJ3O252Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YzSgE6ty12SpCCQNYtiyA+7DiVjPgHLMHArbPzlhnTbDqC+bjZv
	oFj8mz7ywn7AJYz3LbdqMQKLlu2mKGVmNlX8Pq+mfWwdZf2r1J/KCiWB
X-Gm-Gg: AfdE7cnLPg09/QcvWIvn3pLbsrH5phFjx2dm9nP1VnMfTVcxg1Gd8CDteA+CTffkIn/
	JnBocZ3jUsvs6rQFkdysXN77PAR10eZIomMQUigdNM4X+Ouxh32yqL7LGf+jEkDKs9VaaL9s95l
	UyMPVbwYxrNm1ZJm2/wA6NR2zdS5zgDSJ74cPLTdxOQDUwmvAtKEde8PlYD6CHEuJJKCOk092fi
	Yu9UxjWAVl3h8njD+YOMjmJ/Y7Y3hTxks1MteQlRxZz2toSPuV2gjbg81rG+BdNXgMcqlb3sgq2
	VDLKbfcbc3o3rthB0K62cKjU1vP+dXc/giTS4MzuauaghuJEv2fjIRtVaEP+YkB1hFvBo8znsMh
	QYX3hbyZq47TauhbPVZMMGKeFrVVPnQJObZFqsw3H8lckwsi1/Xqx0Fpj4niXhRIHV0qBhVAFIv
	mm9x1YsOmmuQ==
X-Received: by 2002:a05:600c:6b69:b0:493:e583:7053 with SMTP id 5b1f17b1804b1-4954a41431cmr113435805e9.35.1784562076586;
        Mon, 20 Jul 2026 08:41:16 -0700 (PDT)
Received: from [127.0.0.2] ([2a01:14:111:ccf0:e9c1:2f80:10a9:c708])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f67466e09sm32667936f8f.21.2026.07.20.08.41.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 08:41:16 -0700 (PDT)
From: Diogo Silva <diogompaissilva@gmail.com>
Date: Mon, 20 Jul 2026 17:40:40 +0200
Subject: [PATCH v2 08/15] drm/imx: remove dependency on DRM simple helpers
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260720-drm_simple_encoder_init-v2-8-5020b630668a@gmail.com>
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
 drivers/gpu/drm/imx/dc/dc-kms.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/imx/dc/dc-kms.c b/drivers/gpu/drm/imx/dc/dc-kms.c
index 0f8cfaf4c4d1..a9adcfc68b84 100644
--- a/drivers/gpu/drm/imx/dc/dc-kms.c
+++ b/drivers/gpu/drm/imx/dc/dc-kms.c
@@ -17,7 +17,6 @@
 #include <drm/drm_mode_config.h>
 #include <drm/drm_print.h>
 #include <drm/drm_probe_helper.h>
-#include <drm/drm_simple_kms_helper.h>
 #include <drm/drm_vblank.h>
 
 #include "dc-de.h"
@@ -30,6 +29,10 @@ static const struct drm_mode_config_funcs dc_drm_mode_config_funcs = {
 	.atomic_commit = drm_atomic_helper_commit,
 };
 
+static const struct drm_encoder_funcs dc_kms_encoder_funcs = {
+	.destroy = drm_encoder_cleanup,
+};
+
 static int dc_kms_init_encoder_per_crtc(struct dc_drm_device *dc_drm,
 					int crtc_index)
 {
@@ -55,7 +58,8 @@ static int dc_kms_init_encoder_per_crtc(struct dc_drm_device *dc_drm,
 	}
 
 	encoder = &dc_drm->encoder[crtc_index];
-	ret = drm_simple_encoder_init(drm, encoder, DRM_MODE_ENCODER_NONE);
+	ret = drm_encoder_init(drm, encoder, &dc_kms_encoder_funcs,
+			       DRM_MODE_ENCODER_NONE, NULL);
 	if (ret) {
 		dev_err(dev, "failed to initialize encoder for CRTC%u: %d\n",
 			crtc->index, ret);

-- 
2.54.0

