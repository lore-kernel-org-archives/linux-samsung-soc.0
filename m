Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5581419CC1C
	for <linux-samsung-soc@vger.kernel.org>; Fri,  1 Nov 2024 10:19:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730456361; cv=none; b=mCDa4USLZksn6S4CnUHPvVPHYOaKB0jVStRa1Vo+UBJUzKloDoQLm2V1EWlh+9OYctH2j/53HBsxvIzHR2mWwaJ4S2MCV9rPIC2G490UQA8My4zvckzgc7tzpwdk5YMmLwXt2ml7etq3Mc4IIt2NI13jSqpQ+BC8B3YfclxDAOo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730456361; c=relaxed/simple;
	bh=J73ORTWzhhODWeaq7deEswTDv9EGimfDnk75uuPwfvw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fHL/QM2nKNDYlW+nuRCdY7uKtY2fLry5YZoTPGuPHmIUsL2wO09EIXzLezBCKaVjHR8h9xWWmdNQkj6WL5Q69TxOH5zjXIWhP/RNW0srZy4QfwCR73WftpHpeHOiFKKesQgsjeisA3PLLs9WRAcmxoG5Zhjtcs0XqNDBBPHMLG0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=XRfMJ4Gi; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XRfMJ4Gi"
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-2fb5fa911aaso27852861fa.2
        for <linux-samsung-soc@vger.kernel.org>; Fri, 01 Nov 2024 03:19:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730456356; x=1731061156; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=h1/qiW+fnRl/FJlXPSiMeWJ1ccQQT9CkXDqCh4iuUkw=;
        b=XRfMJ4Gi//K4DfeMFu6qdRIiO4d2YO3JCAcd/AM5Dfb35OherOg6dLJCoGCEEoR9OG
         QwGqfsZECODYzIGIQ7RdpQDgk7W79XHjoz7hO6exN6aV/hmh7/I4lTCMb1HlirdYAuDy
         n5wjeHnEUCHaunGtPiC5m34GbQEWPNsa5EPr8I3+DaosnpJO2BB41rvbPXcCqKs1vR0e
         hdCPqQC6x9tS49+4UAD6lyslxQV3U5CZjoFXDefrSGOyX304LlNhHhz3DhdOWtC8zcp4
         O1HfoVMhAuzLB/ksq2QEwCDwT7B3beVhw56uOR84VHbzDhWdEzVu7OhNY5jhi4j7EgtB
         1m6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730456356; x=1731061156;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h1/qiW+fnRl/FJlXPSiMeWJ1ccQQT9CkXDqCh4iuUkw=;
        b=ZVlqcZJXg3HO9fJjYys9odG0/3/leJHL9i9rm8hl2xSZDKxEhLR40CnlLxnRZwAcEx
         ++UKOQ1t1ABVFaLrcoaizkh0gKACn6bbWF1Ar0hA/bBCsuUg5YNCmxmxpKCNSfRcu3SE
         ZRSCB+CpamUJAXxU7w5aWNMS5qiHj6zxdEtRxbd2u5ySS+yHTQBp3uZAZEgTL2Vw9Z4O
         6vPdm+63Ic8j38dqkZBWhsVZ/DCT89wulXiCUMUZkNqohk4yhYp1b1Qr45fekJDPeDj+
         +LKCQ30Ol8afTLrEAv4/IqaXsE2w5RBhhwOj4SLZ2VNCYOAG0F0HHLVZx2iaCm1Jgf7q
         KAsA==
X-Forwarded-Encrypted: i=1; AJvYcCWglT3wxfeBSozIx+YXOaknWzQcQjUorCP20AmJ6mB3jReU0I/i8RZaURicWXL+XkBN2/gwEJWImAoxi2J5dqpLPQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yykco3ghOageUZNIwsqV0C5L3t7rwx0lULnbzS5b+k0FfQkzWiI
	9T0wr8d21tSTeZGLuYERsXoyFW+xNQyc5fFfNZXo0YR83NCXy9bm3lzQ/94W9tI=
X-Google-Smtp-Source: AGHT+IGfOrAmvPqGnwkSe0ftz8Tmhn/NjuEb9mFY++/dM079TIBnXuB0aqnqlIdmYRkVJozLPc5G7Q==
X-Received: by 2002:a2e:bc27:0:b0:2fb:5bd:8ff2 with SMTP id 38308e7fff4ca-2fedb7a2d4fmr25045471fa.16.1730456356390;
        Fri, 01 Nov 2024 03:19:16 -0700 (PDT)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2fdef5d6ef4sm5197031fa.48.2024.11.01.03.19.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Nov 2024 03:19:14 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 01 Nov 2024 12:19:04 +0200
Subject: [PATCH RFC v2 3/7] drm/connector: implement generic HDMI codec
 helpers
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241101-drm-bridge-hdmi-connector-v2-3-739ef9addf9e@linaro.org>
References: <20241101-drm-bridge-hdmi-connector-v2-0-739ef9addf9e@linaro.org>
In-Reply-To: <20241101-drm-bridge-hdmi-connector-v2-0-739ef9addf9e@linaro.org>
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Phong LE <ple@baylibre.com>, Inki Dae <inki.dae@samsung.com>, 
 Seung-Woo Kim <sw0312.kim@samsung.com>, 
 Kyungmin Park <kyungmin.park@samsung.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, Russell King <linux@armlinux.org.uk>, 
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>, Alain Volmat <alain.volmat@foss.st.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-mediatek@lists.infradead.org, 
 linux-rockchip@lists.infradead.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=12993;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=J73ORTWzhhODWeaq7deEswTDv9EGimfDnk75uuPwfvw=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnJKsYvIjxTMttagkeB2+A7smBCSZdSiTLwEmCC
 iC1d9AOSPqJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZySrGAAKCRCLPIo+Aiko
 1XznCACFHBGN2p5UoUoct++a+ZJxpE7/7drc9tW7VJwvZbQV/K2O7Le5BHpcnAWXHtQz4ZFgJA4
 43kHY6Ma0+3qEqDSowKogCBTNFl7hX7zLxkPumHsGeLYBF9NwBAPKfX3MoSSc3da374ibYMbz0S
 CP8+B57H12e4rWyP1D3KKhWyKfDHQLDMOPjlW0iVAaewNAivxYB+smHWxxSeA7PPzDrXn7jUNQz
 3Vx2mcqpoZ16RNS/0n5VYq5mNFVPVJv7WUuzn19z/FzFgUVPKlexlWLN7uwK/kX4dhRAUSYSWBT
 b1bPx50dDKoW8z9x1LZ/vjqwWAU67nJFRyO/tuHNjiWVqysN
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Several DRM drivers implement HDMI codec support (despite its name it
applies to both HDMI and DisplayPort drivers). Implement generic
framework to be used by these drivers. This removes a requirement to
implement get_eld() callback and provides default implementation for
codec's plug handling.

The framework is integrated with the DRM HDMI Connector framework, but
can be used by DisplayPort drivers.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/Makefile                   |   1 +
 drivers/gpu/drm/drm_connector.c            |  10 ++
 drivers/gpu/drm/drm_connector_hdmi_codec.c | 186 +++++++++++++++++++++++++++++
 drivers/gpu/drm/drm_internal.h             |   5 +
 include/drm/drm_connector.h                |  80 +++++++++++++
 5 files changed, 282 insertions(+)

diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
index 463afad1b5ca6275e61223adc8ca036c3d4d6b03..ab5b052ad5229229ac46e3804be77dd1d1680f58 100644
--- a/drivers/gpu/drm/Makefile
+++ b/drivers/gpu/drm/Makefile
@@ -42,6 +42,7 @@ drm-y := \
 	drm_cache.o \
 	drm_color_mgmt.o \
 	drm_connector.o \
+	drm_connector_hdmi_codec.o \
 	drm_crtc.o \
 	drm_displayid.o \
 	drm_drv.o \
diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
index fc35f47e2849ed6786d6223ac9c69e1c359fc648..1a155a9fb401f687e5a88e72faca1e81d944b6d2 100644
--- a/drivers/gpu/drm/drm_connector.c
+++ b/drivers/gpu/drm/drm_connector.c
@@ -279,6 +279,7 @@ static int __drm_connector_init(struct drm_device *dev,
 	mutex_init(&connector->mutex);
 	mutex_init(&connector->edid_override_mutex);
 	mutex_init(&connector->hdmi.infoframes.lock);
+	mutex_init(&connector->hdmi_codec.lock);
 	connector->edid_blob_ptr = NULL;
 	connector->epoch_counter = 0;
 	connector->tile_blob_ptr = NULL;
@@ -533,6 +534,12 @@ int drmm_connector_hdmi_init(struct drm_device *dev,
 
 	connector->hdmi.funcs = hdmi_funcs;
 
+	if (connector->hdmi_codec.i2s || connector->hdmi_codec.spdif) {
+		ret = drm_connector_hdmi_codec_init(connector);
+		if (ret)
+			return ret;
+	}
+
 	return 0;
 }
 EXPORT_SYMBOL(drmm_connector_hdmi_init);
@@ -631,6 +638,8 @@ void drm_connector_cleanup(struct drm_connector *connector)
 		    DRM_CONNECTOR_REGISTERED))
 		drm_connector_unregister(connector);
 
+	drm_connector_hdmi_codec_cleanup(connector);
+
 	if (connector->privacy_screen) {
 		drm_privacy_screen_put(connector->privacy_screen);
 		connector->privacy_screen = NULL;
@@ -669,6 +678,7 @@ void drm_connector_cleanup(struct drm_connector *connector)
 		connector->funcs->atomic_destroy_state(connector,
 						       connector->state);
 
+	mutex_destroy(&connector->hdmi_codec.lock);
 	mutex_destroy(&connector->hdmi.infoframes.lock);
 	mutex_destroy(&connector->mutex);
 
diff --git a/drivers/gpu/drm/drm_connector_hdmi_codec.c b/drivers/gpu/drm/drm_connector_hdmi_codec.c
new file mode 100644
index 0000000000000000000000000000000000000000..cec727d3fc1493684e954195264b1a5d85a7a2ff
--- /dev/null
+++ b/drivers/gpu/drm/drm_connector_hdmi_codec.c
@@ -0,0 +1,186 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright (c) 2024 Linaro Ltd
+ */
+
+#include <linux/mutex.h>
+#include <linux/of_graph.h>
+#include <linux/platform_device.h>
+
+#include <drm/drm_connector.h>
+#include <drm/drm_device.h>
+
+#include <sound/hdmi-codec.h>
+
+#include "drm_internal.h"
+
+static int drm_connector_hdmi_codec_audio_startup(struct device *dev, void *data)
+{
+	struct drm_connector *connector = data;
+	const struct drm_connector_hdmi_codec_funcs *funcs =
+		connector->hdmi.funcs->codec_funcs;
+
+	if (funcs->audio_startup)
+		return funcs->audio_startup(connector);
+
+	return 0;
+}
+
+static int drm_connector_hdmi_codec_prepare(struct device *dev, void *data,
+					    struct hdmi_codec_daifmt *fmt,
+					    struct hdmi_codec_params *hparms)
+{
+	struct drm_connector *connector = data;
+	const struct drm_connector_hdmi_codec_funcs *funcs =
+		connector->hdmi.funcs->codec_funcs;
+
+	return funcs->prepare(connector, fmt, hparms);
+}
+
+static void drm_connector_hdmi_codec_audio_shutdown(struct device *dev, void *data)
+{
+	struct drm_connector *connector = data;
+	const struct drm_connector_hdmi_codec_funcs *funcs =
+		connector->hdmi.funcs->codec_funcs;
+
+	return funcs->audio_shutdown(connector);
+}
+
+static int drm_connector_hdmi_codec_mute_stream(struct device *dev, void *data,
+						bool enable, int direction)
+{
+	struct drm_connector *connector = data;
+	const struct drm_connector_hdmi_codec_funcs *funcs =
+		connector->hdmi.funcs->codec_funcs;
+
+	if (funcs->mute_stream)
+		return funcs->mute_stream(connector, enable, direction);
+
+	return -ENOTSUPP;
+}
+
+static int drm_connector_hdmi_codec_get_dai_id(struct snd_soc_component *comment,
+		  struct device_node *endpoint,
+		  void *data)
+{
+	struct drm_connector *connector = data;
+	struct of_endpoint of_ep;
+	int ret;
+
+	if (connector->hdmi_codec.sound_dai_port < 0)
+		return -ENOTSUPP;
+
+	ret = of_graph_parse_endpoint(endpoint, &of_ep);
+	if (ret < 0)
+		return ret;
+
+	if (of_ep.port == connector->hdmi_codec.sound_dai_port)
+		return 0;
+
+	return -EINVAL;
+}
+
+static int drm_connector_hdmi_codec_get_eld(struct device *dev, void *data,
+					    uint8_t *buf, size_t len)
+{
+	struct drm_connector *connector = data;
+
+	//  FIXME: locking against drm_edid_to_eld ?
+	memcpy(buf, connector->eld, min(sizeof(connector->eld), len));
+
+	return 0;
+}
+
+static int drm_connector_hdmi_codec_hook_plugged_cb(struct device *dev,
+						    void *data,
+						    hdmi_codec_plugged_cb fn,
+						    struct device *codec_dev)
+{
+	struct drm_connector *connector = data;
+
+	mutex_lock(&connector->hdmi_codec.lock);
+
+	connector->hdmi_codec.plugged_cb = fn;
+	connector->hdmi_codec.plugged_cb_dev = codec_dev;
+
+	fn(codec_dev, connector->hdmi_codec.last_state);
+
+	mutex_unlock(&connector->hdmi_codec.lock);
+
+	return 0;
+}
+
+void drm_connector_hdmi_codec_plugged_notify(struct drm_connector *connector,
+					     bool plugged)
+{
+	mutex_lock(&connector->hdmi_codec.lock);
+
+	connector->hdmi_codec.last_state = plugged;
+
+	if (connector->hdmi_codec.plugged_cb &&
+	    connector->hdmi_codec.plugged_cb_dev)
+		connector->hdmi_codec.plugged_cb(connector->hdmi_codec.plugged_cb_dev,
+						 connector->hdmi_codec.last_state);
+
+	mutex_unlock(&connector->hdmi_codec.lock);
+}
+EXPORT_SYMBOL(drm_connector_hdmi_codec_plugged_notify);
+
+static const struct hdmi_codec_ops drm_connector_hdmi_codec_ops = {
+	.audio_startup = drm_connector_hdmi_codec_audio_startup,
+	.prepare = drm_connector_hdmi_codec_prepare,
+	.audio_shutdown = drm_connector_hdmi_codec_audio_shutdown,
+	.mute_stream = drm_connector_hdmi_codec_mute_stream,
+	.get_eld = drm_connector_hdmi_codec_get_eld,
+	.get_dai_id = drm_connector_hdmi_codec_get_dai_id,
+	.hook_plugged_cb = drm_connector_hdmi_codec_hook_plugged_cb,
+};
+
+/**
+ * drm_connector_hdmi_codec_cleanup - Cleanup the HDMI Codec for the connector
+ * @connector: A pointer to the connector to cleanup
+ *
+ * Cleanup the HDMI codec device created for the specified connector.
+ * Can be called even if the codec wasn't allocated.
+ */
+void drm_connector_hdmi_codec_cleanup(struct drm_connector *connector)
+{
+	platform_device_unregister(connector->hdmi_codec.codec_pdev);
+}
+
+/**
+ * drm_connector_hdmi_init - Initialize HDMI Codec device for the DRM connector
+ * @connector: A pointer to the connector to allocate codec for
+ *
+ * Create a HDMI codec device to be used with the specified connector.
+ *
+ * Returns:
+ * Zero on success, error code on failure.
+ */
+int drm_connector_hdmi_codec_init(struct drm_connector *connector)
+{
+	struct hdmi_codec_pdata codec_pdata = {};
+	struct platform_device *pdev;
+
+	if (!connector->hdmi.funcs->codec_funcs->prepare ||
+	    !connector->hdmi.funcs->codec_funcs->audio_shutdown ||
+	    !connector->hdmi_codec.dev)
+		return -EINVAL;
+
+	codec_pdata.ops = &drm_connector_hdmi_codec_ops;
+	codec_pdata.i2s = connector->hdmi_codec.i2s,
+	codec_pdata.spdif = connector->hdmi_codec.spdif,
+	codec_pdata.max_i2s_channels = connector->hdmi_codec.max_i2s_channels,
+	codec_pdata.data = connector;
+
+	pdev = platform_device_register_data(connector->hdmi_codec.dev,
+					     HDMI_CODEC_DRV_NAME,
+					     PLATFORM_DEVID_AUTO,
+					     &codec_pdata, sizeof(codec_pdata));
+	if (IS_ERR(pdev))
+		return PTR_ERR(pdev);
+
+	connector->hdmi_codec.codec_pdev = pdev;
+
+	return 0;
+}
diff --git a/drivers/gpu/drm/drm_internal.h b/drivers/gpu/drm/drm_internal.h
index b2b6a8e49dda46f1cb3b048ef7b28356dd3aaa4e..8ed58e482fac4662b659276e8bc17690e1fdb9b7 100644
--- a/drivers/gpu/drm/drm_internal.h
+++ b/drivers/gpu/drm/drm_internal.h
@@ -280,4 +280,9 @@ void drm_framebuffer_print_info(struct drm_printer *p, unsigned int indent,
 				const struct drm_framebuffer *fb);
 void drm_framebuffer_debugfs_init(struct drm_device *dev);
 
+/* drm_connector_hdmi_codec.c */
+
+int drm_connector_hdmi_codec_init(struct drm_connector *connector);
+void drm_connector_hdmi_codec_cleanup(struct drm_connector *connector);
+
 #endif /* __DRM_INTERNAL_H__ */
diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
index e3fa43291f449d70f3b92a00985336c4f2237bc6..b89f791cfa2be86ce1c5aa124c0f071d7c8a6489 100644
--- a/include/drm/drm_connector.h
+++ b/include/drm/drm_connector.h
@@ -46,6 +46,8 @@ struct drm_property_blob;
 struct drm_printer;
 struct drm_privacy_screen;
 struct edid;
+struct hdmi_codec_daifmt;
+struct hdmi_codec_params;
 struct i2c_adapter;
 
 enum drm_connector_force {
@@ -1141,6 +1143,52 @@ struct drm_connector_state {
 	struct drm_connector_hdmi_state hdmi;
 };
 
+struct drm_connector_hdmi_codec_funcs {
+	/**
+	 * @audio_startup:
+	 *
+	 * Called when ASoC starts an audio stream setup. The
+	 * @hdmi_audio_startup is optional.
+	 *
+	 * Returns:
+	 * 0 on success, a negative error code otherwise
+	 */
+	int (*audio_startup)(struct drm_connector *connector);
+
+	/**
+	 * @prepare:
+	 * Configures HDMI-encoder for audio stream. Can be called
+	 * multiple times for each setup. Mandatory.
+	 *
+	 * Returns:
+	 * 0 on success, a negative error code otherwise
+	 */
+	int (*prepare)(struct drm_connector *connector,
+		       struct hdmi_codec_daifmt *fmt,
+		       struct hdmi_codec_params *hparms);
+	/**
+	 * @audio_shutdown:
+	 *
+	 * Shut down the audio stream. Mandatory.
+	 *
+	 * Returns:
+	 * 0 on success, a negative error code otherwise
+	 */
+	void (*audio_shutdown)(struct drm_connector *connector);
+
+	/**
+	 * @mute_stream:
+	 *
+	 * Mute/unmute HDMI audio stream. The @mute_stream callback is
+	 * optional.
+	 *
+	 * Returns:
+	 * 0 on success, a negative error code otherwise
+	 */
+	int (*mute_stream)(struct drm_connector *connector,
+			   bool enable, int direction);
+};
+
 /**
  * struct drm_connector_hdmi_funcs - drm_hdmi_connector control functions
  */
@@ -1198,6 +1246,14 @@ struct drm_connector_hdmi_funcs {
 	int (*write_infoframe)(struct drm_connector *connector,
 			       enum hdmi_infoframe_type type,
 			       const u8 *buffer, size_t len);
+
+	/**
+	 * @codec_funcs:
+	 *
+	 * Implementation of the HDMI codec functionality to be used by the DRM
+	 * HDMI Codec framework.
+	 */
+	const struct drm_connector_hdmi_codec_funcs *codec_funcs;
 };
 
 /**
@@ -1660,6 +1716,22 @@ struct drm_cmdline_mode {
 	bool tv_mode_specified;
 };
 
+struct drm_connector_hdmi_codec {
+	struct platform_device *codec_pdev;
+	struct device *dev;
+
+	struct mutex lock; /* protects last_state and plugged_cb */
+	void (*plugged_cb)(struct device *dev, bool plugged);
+	struct device *plugged_cb_dev;
+	bool last_state;
+
+	int max_i2s_channels;
+	uint i2s: 1;
+	uint spdif: 1;
+
+	int sound_dai_port;
+};
+
 /*
  * struct drm_connector_hdmi - DRM Connector HDMI-related structure
  */
@@ -2118,6 +2190,11 @@ struct drm_connector {
 	 * @hdmi: HDMI-related variable and properties.
 	 */
 	struct drm_connector_hdmi hdmi;
+
+	/**
+	 * @hdmi_codec: HDMI codec properties and non-DRM state.
+	 */
+	struct drm_connector_hdmi_codec hdmi_codec;
 };
 
 #define obj_to_connector(x) container_of(x, struct drm_connector, base)
@@ -2151,6 +2228,9 @@ void drm_connector_unregister(struct drm_connector *connector);
 int drm_connector_attach_encoder(struct drm_connector *connector,
 				      struct drm_encoder *encoder);
 
+void drm_connector_hdmi_codec_plugged_notify(struct drm_connector *connector,
+					     bool plugged);
+
 void drm_connector_cleanup(struct drm_connector *connector);
 
 static inline unsigned int drm_connector_index(const struct drm_connector *connector)

-- 
2.39.5

