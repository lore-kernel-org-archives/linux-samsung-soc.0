Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C01037F8DD
	for <linux-samsung-soc@vger.kernel.org>; Sat, 18 Jul 2026 23:36:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784417806; cv=none; b=c7EXrneM1ZbnFTzHAo5i0JL318UcN5aqN70qny+npJG6w0hqJk1bV9uJKvk45WS3Xe5JtoO/e6rtcjcy6hjSVUy1yqbqO9FqSP2c1nmYgxRaOojdA02/XBaJepz+HHbnFif8Au82K+RPL3ThKZ4KFAWkuoTXdoAFCrxeyVG5HqE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784417806; c=relaxed/simple;
	bh=0WsQRBQILDRGD9A8dPkA4+m9eQEodKM+eJPiDyQ5lmM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=juks3WNISkMheAMq80qt9wWxR+jeu9qJcSeEyz/xyoRG7NSAp34wdNiSwH/yRnUques5O/18UnQ75MwXVg7attvXzLeYyvUf4Gvr8Kc+O0IdgGQ+EORuf9dypNFJQ9hLay1JGVEYWykHS/36uk8L3VuUgPPI2oHaSz2sixJemYo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qV3fq94o; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qV3fq94o"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-49558ce01afso914015e9.1
        for <linux-samsung-soc@vger.kernel.org>; Sat, 18 Jul 2026 16:36:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784417802; x=1785022602; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ITwMWTyjPOpmiBS75ZF02CenxzeBHARaB0ED7f6Tp6A=;
        b=qV3fq94o41XdcAxw9aD6EuLVMPhlzfNrRBrp5JoTWHLxaz60ybPMuoL3eEAt8vc36m
         CExrM+bfbzZmIIEqhAn9x2Sz2GluIx/lPnbx4RzosrFCAlyq5thv3irnCbPZbQ19UkQz
         46T01ejnust9AfSgLAfVaCJphAV+yw6mz8AoxAcHBqJfyB8Y8MFN+g+r3bBwC1Ec3NSi
         GWtBrkPle9A7zCm2P9cfV4KRtXA4l3Pmg+KUkh/9f6oSye1jtE+YLd/oXNBeOsxrr64q
         knCMFSibgObJnkQb31vfX5rfvIAmex8KxFezwPzWrg6HqqoaC+yQON+uvGA2r9HlLkz9
         IcLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784417802; x=1785022602;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ITwMWTyjPOpmiBS75ZF02CenxzeBHARaB0ED7f6Tp6A=;
        b=Us2x4P0vta9mczi8dBgL4XA/pt8LB1H6XB9pxq+qpSubq+DCu6k3FQVUy6MCoVMV2b
         FqW1fGp0/wHhWoqUu3Crt+o/2GBj4s+5QnyXPKkLoiTDqFThmjVYb+h7mE4pDZ6WAPnS
         XvVC1VmwfG9QgqZRzLu4fg+zrJXEaocdTBWUks59druO2o5Olp9aU0cK4U/iw7hRaq0E
         Aj8qTZvZH4RU/pDkAyZfMKwGGmlD4ReLgAcyx2xCX8eQxns6XucrYE3L8116xkTYW+UA
         KUzwd0RtBFMfR1crxiRQcAcVmZEZ1UzEYzoIkndt7f5Vpql+CzkWGk9eTklYV+sftu8D
         Nq5Q==
X-Forwarded-Encrypted: i=1; AHgh+RrMrq3yeoQhiJ7DcsWm+zw8DqdxIIIx4bnaIyTqct1EAwee7V9hXkBKTGtPqZVXL+lzCIMspNDqjQe1V9/qxLYeGg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzoGlsZATG975c3/K9m5wmBspXGGrZwFkWEM8RGacGNNcbiGjfB
	EYQTmdUobjjOJWhkQGc012B8uWejE9uu5qXHwKMWtUa4IuRLMlFfn+xt
X-Gm-Gg: AfdE7cmtM487lJEZVe4Pv1AMkJLIWizNdNHTI2/3I9ED+kBvuIltyCzJJYbdamN4YEw
	LASGoYY6OMSBDf1rz+XD191ry/6fV3kVWZsVwJsbCkPhFu8bKGmrJJ25PhKJGpERpG3UDzG+fvg
	HAvf55LW8+JXlS7w1x82p/6g+NGVkVoVG6h/q4kl6IHA37uHqDMbV5hCHV7qVd42k2OnBOzB9o2
	vOEcHsIm59P2Bjr1nfct1trAI5i9yxIDWQpkOT4cLjFFc/QriGeVOky7+34BYVHq1D79ZgJWX+x
	uAOdikovdFlcGnZtFHqBi+1plNgAzyGuJNM6XcbrASrib50yuSJYjUALOfp6+Sg0QfoP1VyQ0nG
	bzJQkgTr/6OA+KdKzYLpT/7Hm2WInjLm7ZMEUEHade78IySl2B2V8Rn06Sc8gPMpXSahdq2NBbq
	Fbfp/O0t2S2g==
X-Received: by 2002:a05:600c:1509:b0:495:3f5e:e7a with SMTP id 5b1f17b1804b1-4954a51dee6mr63721895e9.34.1784417802374;
        Sat, 18 Jul 2026 16:36:42 -0700 (PDT)
Received: from [127.0.0.2] ([2a01:14:111:ccf0:645b:9e5c:7fe3:c09f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4954a2a24b6sm160964675e9.3.2026.07.18.16.36.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Jul 2026 16:36:41 -0700 (PDT)
From: Diogo Silva <diogompaissilva@gmail.com>
Date: Sun, 19 Jul 2026 01:35:44 +0200
Subject: [PATCH 13/15] drm/meson: remove dependency on DRM simple helpers
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260719-drm_simple_encoder_init-v1-13-a78c509e3062@gmail.com>
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
 drivers/gpu/drm/meson/meson_encoder_cvbs.c | 11 ++++++++---
 drivers/gpu/drm/meson/meson_encoder_dsi.c  | 11 ++++++++---
 drivers/gpu/drm/meson/meson_encoder_hdmi.c | 11 ++++++++---
 3 files changed, 24 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/meson/meson_encoder_cvbs.c b/drivers/gpu/drm/meson/meson_encoder_cvbs.c
index 22cacb1660c4..cdb84d2283f8 100644
--- a/drivers/gpu/drm/meson/meson_encoder_cvbs.c
+++ b/drivers/gpu/drm/meson/meson_encoder_cvbs.c
@@ -17,8 +17,8 @@
 #include <drm/drm_bridge_connector.h>
 #include <drm/drm_device.h>
 #include <drm/drm_edid.h>
+#include <drm/drm_encoder.h>
 #include <drm/drm_probe_helper.h>
-#include <drm/drm_simple_kms_helper.h>
 
 #include "meson_registers.h"
 #include "meson_vclk.h"
@@ -218,6 +218,10 @@ static const struct drm_bridge_funcs meson_encoder_cvbs_bridge_funcs = {
 	.atomic_create_state = drm_atomic_helper_bridge_create_state,
 };
 
+static const struct drm_encoder_funcs meson_encoder_cvbs_funcs = {
+	.destroy = drm_encoder_cleanup,
+};
+
 int meson_encoder_cvbs_probe(struct meson_drm *priv)
 {
 	struct drm_device *drm = priv->drm;
@@ -257,8 +261,9 @@ int meson_encoder_cvbs_probe(struct meson_drm *priv)
 	meson_encoder_cvbs->priv = priv;
 
 	/* Encoder */
-	ret = drm_simple_encoder_init(priv->drm, &meson_encoder_cvbs->encoder,
-				      DRM_MODE_ENCODER_TVDAC);
+	ret = drm_encoder_init(priv->drm, &meson_encoder_cvbs->encoder,
+			       &meson_encoder_cvbs_funcs,
+			       DRM_MODE_ENCODER_TVDAC, NULL);
 	if (ret)
 		return dev_err_probe(priv->dev, ret,
 				     "Failed to init CVBS encoder\n");
diff --git a/drivers/gpu/drm/meson/meson_encoder_dsi.c b/drivers/gpu/drm/meson/meson_encoder_dsi.c
index 3e422b612f74..faa309cb97a6 100644
--- a/drivers/gpu/drm/meson/meson_encoder_dsi.c
+++ b/drivers/gpu/drm/meson/meson_encoder_dsi.c
@@ -10,10 +10,10 @@
 #include <linux/of_graph.h>
 
 #include <drm/drm_atomic_helper.h>
-#include <drm/drm_simple_kms_helper.h>
 #include <drm/drm_bridge.h>
 #include <drm/drm_bridge_connector.h>
 #include <drm/drm_device.h>
+#include <drm/drm_encoder.h>
 #include <drm/drm_probe_helper.h>
 
 #include "meson_drv.h"
@@ -99,6 +99,10 @@ static const struct drm_bridge_funcs meson_encoder_dsi_bridge_funcs = {
 	.atomic_create_state = drm_atomic_helper_bridge_create_state,
 };
 
+static const struct drm_encoder_funcs meson_encoder_dsi_funcs = {
+	.destroy = drm_encoder_cleanup,
+};
+
 int meson_encoder_dsi_probe(struct meson_drm *priv)
 {
 	struct meson_encoder_dsi *meson_encoder_dsi;
@@ -133,8 +137,9 @@ int meson_encoder_dsi_probe(struct meson_drm *priv)
 	meson_encoder_dsi->priv = priv;
 
 	/* Encoder */
-	ret = drm_simple_encoder_init(priv->drm, &meson_encoder_dsi->encoder,
-				      DRM_MODE_ENCODER_DSI);
+	ret = drm_encoder_init(priv->drm, &meson_encoder_dsi->encoder,
+			       &meson_encoder_dsi_funcs, DRM_MODE_ENCODER_DSI,
+			       NULL);
 	if (ret)
 		return dev_err_probe(priv->dev, ret,
 				     "Failed to init DSI encoder\n");
diff --git a/drivers/gpu/drm/meson/meson_encoder_hdmi.c b/drivers/gpu/drm/meson/meson_encoder_hdmi.c
index 0c7a72cb514a..c4355c5cc340 100644
--- a/drivers/gpu/drm/meson/meson_encoder_hdmi.c
+++ b/drivers/gpu/drm/meson/meson_encoder_hdmi.c
@@ -23,8 +23,8 @@
 #include <drm/drm_bridge_connector.h>
 #include <drm/drm_device.h>
 #include <drm/drm_edid.h>
+#include <drm/drm_encoder.h>
 #include <drm/drm_probe_helper.h>
-#include <drm/drm_simple_kms_helper.h>
 
 #include <linux/media-bus-format.h>
 #include <linux/videodev2.h>
@@ -369,6 +369,10 @@ static const struct drm_bridge_funcs meson_encoder_hdmi_bridge_funcs = {
 	.atomic_create_state = drm_atomic_helper_bridge_create_state,
 };
 
+static const struct drm_encoder_funcs meson_encoder_hdmi_funcs = {
+	.destroy = drm_encoder_cleanup,
+};
+
 int meson_encoder_hdmi_probe(struct meson_drm *priv)
 {
 	struct meson_encoder_hdmi *meson_encoder_hdmi;
@@ -407,8 +411,9 @@ int meson_encoder_hdmi_probe(struct meson_drm *priv)
 	meson_encoder_hdmi->priv = priv;
 
 	/* Encoder */
-	ret = drm_simple_encoder_init(priv->drm, &meson_encoder_hdmi->encoder,
-				      DRM_MODE_ENCODER_TMDS);
+	ret = drm_encoder_init(priv->drm, &meson_encoder_hdmi->encoder,
+			       &meson_encoder_hdmi_funcs,
+			       DRM_MODE_ENCODER_TMDS, NULL);
 	if (ret) {
 		dev_err_probe(priv->dev, ret, "Failed to init HDMI encoder\n");
 		goto err_put_node;

-- 
2.54.0

