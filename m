Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FFAD377ED4
	for <linux-samsung-soc@vger.kernel.org>; Sat, 18 Jul 2026 23:36:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784417776; cv=none; b=fSrnbK4r0y/dWsYkIyrmyNGyXqmsjW9E7r/8de1pCgGg05bvBLhMbH4sX3Z+i7DYdrGKd3swMnEqiapZHssOE2MhouRvbqKOXwIDdF8leJNmkmPRgbqnYUtA6dpNsh6rvlney0fO88AQ3M/v3RH48snF7UNAAvXOaU9elE/pYe8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784417776; c=relaxed/simple;
	bh=4Aj055TlPMxBq8UoEMyCmOSuvgCOAi6uSPvqm4WRBDg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BUCTRxIgfjI8UKSmqOLPJuCON25e9RA+sft7v3lsnPwt38OlzpnJSVnLsxcilMBR0+5URyh5esXdcgHy7GbJUZNNZwMcNd8MWnou27raMleNYdduiS7byRVGh5Y7KzUeG1Ypd1dNFG1RYDAVKUxP4yrL5j+aP7oiAXPVD5jYSls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XnFx/1dt; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XnFx/1dt"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-495590ba856so844555e9.2
        for <linux-samsung-soc@vger.kernel.org>; Sat, 18 Jul 2026 16:36:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784417772; x=1785022572; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Hoju8K5XWFY53znMwRCcUMP/RKb2Y+W04UW3kIqcXC0=;
        b=XnFx/1dtm3RW6m9R0DWqGv1xBjRKS8nlj7WYVeLLTUirEGpNiF9SKFnvEHpweceN7g
         aFVc9eCoB57VfuoOwn/9Qbb4SItofgCiD2Br+ZIlUjbydII2Aldw1uRcAiofMGafvfyB
         ZTyTlnrUbYyS4l23FfhwAFl7AHn4JCi3L49WMg/RM3dV7887DAm3i9M85ZcBEqkBVRz3
         BDkU5rgHT3r5sQcbKqCXB7xQfQVoFAz0vXKPAPdBfqeA65frKeosUoeiEvdYwLMh+XNm
         SUIbXYFDRO2DoFvH6ozEL717LsQv+EXaSyNgvQbIxgHsJGK1u+Nzxm+uFFU+XnNBkDBW
         pGLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784417772; x=1785022572;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Hoju8K5XWFY53znMwRCcUMP/RKb2Y+W04UW3kIqcXC0=;
        b=srQ+zSOQXlrxWoKoK6VOMmUaIojU3WDGMB1v3kSTeyAIkMlSZOyFJpbBa3wvGB0wd8
         OWhXNHit/AjEqmKoyHQdoqHjhJu2XHEoa7e/wpW78xToAkaAR5HY9I0AFDQ7UII+0itl
         sSYyExb8nSnkwD2h7bcV6Cv9WwAv6UTc3v8+DPTupls+q7twnECz0OfAcXfa9UUYJ8mw
         ecQhCd0NkyuEWpXTEQOHiMgPXLHJbd2q1shaWbEMDc8pgG2N8yOrPQTmggClXSUJkdsm
         SxtQZWG6oeB9BgW7QuZg28m2X3EnMBNbOyYw5xhUor3PDklVnPUXJD0/MJAv+R3V9oeH
         z2/A==
X-Forwarded-Encrypted: i=1; AHgh+RpVDR9d7p63iEIhbB042Nz318aP3aSMwY7IPh8Phq8H2JBPweNOkJWpBicGd6wGvEtHwbpJxJZfrF0esgiOv+JR3A==@vger.kernel.org
X-Gm-Message-State: AOJu0YzwLaaSgFo4qlapMxy8xU8C0wh7cZQVwPPj/MSj3CX65P2KfAwo
	rwCBQIcjRnLCwp+5gKkXdZWhmG6rbV/IW/8IgNydyG755AyQMyOiCZXw
X-Gm-Gg: AfdE7ckQO81IPemWpYLsab12gDGWnPUJV2YkURlVGtR8oV/0h8fzz64r9cRNxkSzsJh
	rLwrGegmC5tvdR+RO5CTGcDydW06Xq7FwMotAwfpLZ9W+Mx6y7STnmwxmieAhnHg20USmA7jIuF
	F6sV9lutLh1dlZblgo/iKoF78KR8COMrhSxMnQDWYoWdj+PKCiv2owSWttTmDFt2KDnBkFgLcIA
	/lx/PC7jPHVyl18NhsGHXkDHUp2CS4x9wT1sGDnH76nrnCzk2c8VilyDzD+oYb6THobEADCVwpJ
	wZT3cABNDV4lKaKWLnpxPQh6fmoioAcjSJ27P8ZBKyFLGbIJerKNP7AQ9W4gXXf/X1KWy+Fg43x
	10gRJDqHvFrYCVIa+UZc3EiCO6QZH19Vwu8KvgFh5IZS8b1oXABUsAKDRDFSHU67VhmxrdPOqxG
	7BDSGDilYx8Q==
X-Received: by 2002:a05:600c:b85:b0:495:5365:c0d1 with SMTP id 5b1f17b1804b1-49553d85ea0mr35374355e9.14.1784417772455;
        Sat, 18 Jul 2026 16:36:12 -0700 (PDT)
Received: from [127.0.0.2] ([2a01:14:111:ccf0:645b:9e5c:7fe3:c09f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4954a2a24b6sm160964675e9.3.2026.07.18.16.36.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Jul 2026 16:36:11 -0700 (PDT)
From: Diogo Silva <diogompaissilva@gmail.com>
Date: Sun, 19 Jul 2026 01:35:35 +0200
Subject: [PATCH 04/15] drm/fsl-dcu: remove dependency on DRM simple helpers
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260719-drm_simple_encoder_init-v1-4-a78c509e3062@gmail.com>
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

Signed-off-by: Diogo Silva <diogompaissilva@gmail.com>
---
 drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_rgb.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_rgb.c b/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_rgb.c
index 84eff7519e32..c2b788bfa8f9 100644
--- a/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_rgb.c
+++ b/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_rgb.c
@@ -11,14 +11,18 @@
 
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_bridge.h>
+#include <drm/drm_encoder.h>
 #include <drm/drm_of.h>
 #include <drm/drm_panel.h>
 #include <drm/drm_probe_helper.h>
-#include <drm/drm_simple_kms_helper.h>
 
 #include "fsl_dcu_drm_drv.h"
 #include "fsl_tcon.h"
 
+static const struct drm_encoder_funcs fsl_dcu_encoder_funcs = {
+	.destroy = drm_encoder_cleanup,
+};
+
 int fsl_dcu_drm_encoder_create(struct fsl_dcu_drm_device *fsl_dev,
 			       struct drm_crtc *crtc)
 {
@@ -31,8 +35,8 @@ int fsl_dcu_drm_encoder_create(struct fsl_dcu_drm_device *fsl_dev,
 	if (fsl_dev->tcon)
 		fsl_tcon_bypass_enable(fsl_dev->tcon);
 
-	ret = drm_simple_encoder_init(fsl_dev->drm, encoder,
-				      DRM_MODE_ENCODER_LVDS);
+	ret = drm_encoder_init(fsl_dev->drm, encoder, &fsl_dcu_encoder_funcs,
+			       DRM_MODE_ENCODER_LVDS, NULL);
 	if (ret < 0)
 		return ret;
 

-- 
2.54.0

