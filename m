Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36554435A95
	for <linux-samsung-soc@vger.kernel.org>; Mon, 20 Jul 2026 15:41:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784562088; cv=none; b=uek4r4sLWTGQRp/hHCfIJesP5xH8EBrVocSG/mT3rOd5wHXrL9DqLY+rNs18117dRG6etVECVW27/A4gsFyDkrqhmX8JCKvnMinVtotQ625KdmInQ6cQfW5Gti0HuR2ruQGwBiD/Kbw2FdPjtgH11sB72f3BiuhEaXzaGode9w4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784562088; c=relaxed/simple;
	bh=l+SJq54PDPW0D7z8ZwWtaXQW066KSgEiZsyj7f7pch8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=npdao2WA2w95DNP5F7y594ouMHZuxrp02WJ5DcE0cbC58ihUGk05OMech202P+WiamdVtJKVvzhoX2zJY16bLb2U82ZQ3QC341kBsQqvs7wURN1WxcDaARWdEK/AjM8dwqNeYCaI9ESb3uJp5NziTO/y3s4Xt2NV/FdXcxL96Gw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BQVswAsy; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BQVswAsy"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-493b966dd74so43621715e9.3
        for <linux-samsung-soc@vger.kernel.org>; Mon, 20 Jul 2026 08:41:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784562084; x=1785166884; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=46qE/+7MkuQ3i6sxWImy8gxRhDtZKExvMlDvjet5bv4=;
        b=BQVswAsyvORrB0Suv9iO7ee9CFbv4m7Qp5uBZceX3awFykXTV7igkVlICzS79hmSsi
         QYJh0Q98f41z2g8Pz3H8eRPyddyqHwlxsuXkr1QBjVqrm0ad7FB7dfk7w9E4grKYakW0
         +KKjr484w0MnJYFv+fs68TxU5mtyTph6kVNwri4jngahLs0t+g7TYR4AgLEH9vQahfFL
         C/s/XfIZFinwh0Dcxqqdtvf5ZCDc1Jcqn9HZTUwGRu3mvGw0EGPibo3XkdXQLO0dh1jS
         JZav6ej9sm3G3wOUil+nWX6hanU+Z63UoxRJiyUijMwecxw2TLYLxUVlY28WeApIew++
         +Z7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784562084; x=1785166884;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=46qE/+7MkuQ3i6sxWImy8gxRhDtZKExvMlDvjet5bv4=;
        b=n+YY3pvr8IRU8nPuMq+IC4Z2E129gHUQMiWY6WkTxX8Gh7Pdd7z6pvGtyPR0mMzCIv
         tULfLD2c4L/VvRn1kiSCKTF8OwbUpJmFZwdX0jVCRZspG2xthieDQVfiQ4oNv7s39JMv
         5KgMn1CxVViOb5ppOVLTxNALXodWNHEw8wvlo4sdowwL4FShMR5S+HHU9baMf6+VCdvL
         qWLP4pMurb71zUhCjnRNuJEPIeN0hVyVfuujZaBoc//pQFA0ikeLDHqCfqMvO0jqleUc
         u7RO7+apGKahzs+C0E0dsrlI7ewWFT+z1q8CbwiuVuogpYpGzh7yBqz8zxFG/Ku6g4Y2
         QjHw==
X-Forwarded-Encrypted: i=1; AHgh+Rr93hRPcpk89ttANLNu9k0j0K83SkTXyFTfHbwpXJmEbB9su8uZR3AWEqYQiR7PtuMvYWiiCFeSxHB6Tylz1XQukg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyl5eGY8tmK6fpdSu9qipoa0GNxwrhPqKiR6QTQuKiyCvLY6HOL
	yVhE74pidzgZmBQi4bDaMFXMxC6qpdlCH45cKXVESY8myg82ddca3F5P
X-Gm-Gg: AfdE7cmqZJ3dYKrqfOkORjsbT8pfaxAOHjwMXSh/Jy55qVO7RYH+yy2dEZrP120eyDv
	WDpDMNPSmP1fAb6Ex/YLm0/cSy+i8ZewgrgeXCegDBE8zkaVfZczyOLGTyIbZVkUW7nkPmabmOi
	JKZYeTTfl1TNI37cktv6dr4v3J3dePXTXMNAGPLdi8mK8QkTpUfZ2i4X/v03LDjn7A7ckSAOtAs
	dsR9umGU2/fGl3uX7Z++F/4/AtXo6LzXr1UNuOMm5o3JgVpZ9SBlixSRNxQQ97khpFyg+tY19wm
	y+lMDhMXDT9+b0vOQNDpGs0zC+MWxjjjVuugZC6HIJ52SjSduycBLCMlj61dLE4I2Tw0VJI4UCM
	4/RfNTNgeSNM8Lbg5Xps0N1KUyBj4IeMHmx4w8fYtohB66nTa1esCcACJi1EnFrSjzPoizhRbHO
	3fQCag8u3h2g==
X-Received: by 2002:a05:600c:4fc2:b0:495:5b02:23b0 with SMTP id 5b1f17b1804b1-4955b0224c7mr79919205e9.26.1784562084325;
        Mon, 20 Jul 2026 08:41:24 -0700 (PDT)
Received: from [127.0.0.2] ([2a01:14:111:ccf0:e9c1:2f80:10a9:c708])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f67466e09sm32667936f8f.21.2026.07.20.08.41.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 08:41:23 -0700 (PDT)
From: Diogo Silva <diogompaissilva@gmail.com>
Date: Mon, 20 Jul 2026 17:40:42 +0200
Subject: [PATCH v2 10/15] drm/renesas/shmobile: remove dependency on DRM
 simple helpers
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260720-drm_simple_encoder_init-v2-10-5020b630668a@gmail.com>
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
 drivers/gpu/drm/renesas/shmobile/shmob_drm_crtc.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/renesas/shmobile/shmob_drm_crtc.c b/drivers/gpu/drm/renesas/shmobile/shmob_drm_crtc.c
index 1a2b9b68af6f..2dc477c7eda6 100644
--- a/drivers/gpu/drm/renesas/shmobile/shmob_drm_crtc.c
+++ b/drivers/gpu/drm/renesas/shmobile/shmob_drm_crtc.c
@@ -21,6 +21,7 @@
 #include <drm/drm_bridge_connector.h>
 #include <drm/drm_crtc.h>
 #include <drm/drm_crtc_helper.h>
+#include <drm/drm_encoder.h>
 #include <drm/drm_fb_dma_helper.h>
 #include <drm/drm_fourcc.h>
 #include <drm/drm_framebuffer.h>
@@ -29,7 +30,6 @@
 #include <drm/drm_modeset_helper_vtables.h>
 #include <drm/drm_panel.h>
 #include <drm/drm_probe_helper.h>
-#include <drm/drm_simple_kms_helper.h>
 #include <drm/drm_vblank.h>
 
 #include <video/videomode.h>
@@ -436,6 +436,10 @@ static const struct drm_encoder_helper_funcs encoder_helper_funcs = {
 	.mode_fixup = shmob_drm_encoder_mode_fixup,
 };
 
+static const struct drm_encoder_funcs shmob_encoder_funcs = {
+	.destroy = drm_encoder_cleanup,
+};
+
 /* -----------------------------------------------------------------------------
  * Encoder
  */
@@ -448,8 +452,8 @@ int shmob_drm_encoder_create(struct shmob_drm_device *sdev)
 
 	encoder->possible_crtcs = 1;
 
-	ret = drm_simple_encoder_init(&sdev->ddev, encoder,
-				      DRM_MODE_ENCODER_DPI);
+	ret = drm_encoder_init(&sdev->ddev, encoder, &shmob_encoder_funcs,
+			       DRM_MODE_ENCODER_DPI, NULL);
 	if (ret < 0)
 		return ret;
 

-- 
2.54.0

