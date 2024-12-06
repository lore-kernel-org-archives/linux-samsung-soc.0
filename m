Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 325A4202C2F
	for <linux-samsung-soc@vger.kernel.org>; Fri,  6 Dec 2024 10:16:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733480218; cv=none; b=fnHfdw7EA5Vvqs50UxKlb/eHuH7t08jttslPwKT5NroP1G/gu8lhUNK7zz44dxyDGrea122tqf9uU4olojjPD6DlP/5eQPo3zm9bq/giVO+HtCag1/Prqfx393IuXlAk+KuhrCD+xjGhGVfIl6KYVgvaLBf7SyIcrlvpbRHkV74=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733480218; c=relaxed/simple;
	bh=0yfSAj+Ddm4WUhYXZ6Zpqkhn0w9mLLpLbC5N4C3p0Yc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JGfB081uZpOm0x5hUi5XGBioQxOefBFUb8dwcVPfAe/dw9jssIPSZUfqL5jJdNwpk1Nvhj5s5xzx7it21kiq/yw4EbnHI612dhOc2AwP7W1i1jEwLbNglfmhJejag9iqJGKvyYeeM5SQqj/hlr9mY1vsVJDvI46YPmDTXqwEU/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=QYtSs1u+; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QYtSs1u+"
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-53de8ecb39bso2524030e87.2
        for <linux-samsung-soc@vger.kernel.org>; Fri, 06 Dec 2024 02:16:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733480212; x=1734085012; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RHKs//nOKBy23KEY06Dh0ph1h3nqemTg+AYacD+4hL8=;
        b=QYtSs1u+N815SzBZtw2xtwhVWxvr0i6S8w+hHPcvKwB3di6CM1epM1RXAklbnJxziF
         YG7oYOzjoBLm8J5Usfk9W/OQ6hVmmvPz5tTlsIGcSlKlBtBaRADbFy9eYgqiwpI1NW8g
         DZWRPGCCZsZ+BVqXBgzHLJpMHyhIFI5iyMFDfnyDTBvlVJ9372hyjGOJD/0oHh3rlALq
         sKB4Ijn52n1WYblnkEKra8cWKW8k0jI9AhzgjMcSra8Ls2hDmb1wu4tlFqDAaBPslX08
         3zYRvTgqzEFOUdMNFa2F/leFTLhSevphsmTbtthXmnTALSAbFpH2dSC1RZtDNUq9OavN
         fahg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733480212; x=1734085012;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RHKs//nOKBy23KEY06Dh0ph1h3nqemTg+AYacD+4hL8=;
        b=cYShrtQqKB9ZDAfC6VpLvu0jeXtEK3eqQxW7u+L2LAXGimBuwPTGpIrEGoDpf/hGH/
         UyKics0yGRM2Nh7uAbW6TAL3Wlodvu9UZ8KX2nqv2t3Bpui9wz49RiwqW1msWRgp/Krb
         VhTY/2T+Pw1gU6lXYRAdEhhMBVco4plQocxDUc8YcEjTBhfzW7wctuIl5TDkL2wY5iJK
         Vsw7zE06FU3C8aNa3KQZmtfDat92tmw0KyJeB/H8jKPk61zKWmL6RMW4WZTFHvrc214B
         CYA8+cl5dmHqgdFdHeqH/yU4oKFq7yiOvsLsSmyaAjGrBeG+ToQpzp/mZZK8OKLuh8FN
         XB4g==
X-Forwarded-Encrypted: i=1; AJvYcCXR2d5JYrVykdhx/WBqxl8XqcIR5Qgtn6E1EmtMH5aLxvCDLQkUg2FyPWN3vgqt6Ew2HqkrUtpzTv1m0lIMrD9y/g==@vger.kernel.org
X-Gm-Message-State: AOJu0YxlmbZbyLpAVVDh5mCcG7y85JeZbFhrb2h7S4NxQn9pUOlHokTX
	w+8n3HaQzETEaNX1pqZ/4DIi7eFi+hVPduOzRVZ4h+EKDA649elZbWUB9OrydPU=
X-Gm-Gg: ASbGncszXq8Kkop6ipPczTSHuirFgMSXcmg77KtYnKHZvDiowGRki7N96Ji1/RAAIcu
	8kpb25h2NM/ajjJqrvMButmAwgN2eGBmEPUDc7aH8Vykwn8MTX+k4qIveFw5nWuR2QEBu0gr/eU
	ujF5x97EadxjjcOUbIubhKLEXNll2fvhcrY1yDdEdiSGPAT3LICVAUjm0g/tIELSsJlyKdctt+m
	ftpCjO+ldgpBiKbsTB6aQtvRlF+YaAOpIsgJVuruV2oStg3IVC23i16og==
X-Google-Smtp-Source: AGHT+IFoZ5ueeUOEXYSyd4R1xuvjuurob1TxEo4XEcBMUHjq9cOf/AGkf0uiijvLLApbZ4leIfX3jg==
X-Received: by 2002:a05:6512:159a:b0:53e:1bb7:5896 with SMTP id 2adb3069b0e04-53e2c504beemr1108332e87.57.1733480212198;
        Fri, 06 Dec 2024 02:16:52 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53e2294738fsm462355e87.52.2024.12.06.02.16.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Dec 2024 02:16:50 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 06 Dec 2024 12:15:57 +0200
Subject: [PATCH v6 03/10] drm/connector: implement generic HDMI codec
 helpers
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241206-drm-bridge-hdmi-connector-v6-3-50dc145a9c06@linaro.org>
References: <20241206-drm-bridge-hdmi-connector-v6-0-50dc145a9c06@linaro.org>
In-Reply-To: <20241206-drm-bridge-hdmi-connector-v6-0-50dc145a9c06@linaro.org>
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
 Andy Yan <andy.yan@rock-chips.com>, Alain Volmat <alain.volmat@foss.st.com>, 
 Raphael Gallais-Pou <rgallaispou@gmail.com>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>
Cc: Jani Nikula <jani.nikula@linux.intel.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-mediatek@lists.infradead.org, 
 linux-rockchip@lists.infradead.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=12561;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=0yfSAj+Ddm4WUhYXZ6Zpqkhn0w9mLLpLbC5N4C3p0Yc=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnUs8JRec8DWqtmbtDXZu9wSfsxHl4brT7Brggb
 vwUiPLPB0OJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ1LPCQAKCRCLPIo+Aiko
 1U+UCACY4/MKhlAYB+OSf5BzHkkzwLeU0XSn55IY8RNYYZ8W6G2BAJz/Fbw5z+bNyH8hr2IQygn
 x0ud/l642NPfXRszQtev8kFWNwYE+MHypoBTrV5n4ITa3r0keTPbv2rno7l2jurM5rknk7Xxpd/
 5ibwWAeEa3tFWxmYx3iEANfxhjZmBEtDsx+Wc+45Fy0/dCv/mrJiwSCRatuIDmc/0n4v8DJWkLl
 meXp1j6MU9VQ7w3yqO0B0ehEX+cosrE8yhNdFhn01soWMY3zDaHOx9ic+BKX9BmyfXHFKIx8oWI
 yYCJ7dGP5lAsX3U+K7d/QHpC6UNDfqHYESafuXhhwdUMuejs
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
 drivers/gpu/drm/drm_connector.c            |   5 +
 drivers/gpu/drm/drm_connector_hdmi_codec.c | 185 +++++++++++++++++++++++++++++
 include/drm/drm_connector.h                |  80 +++++++++++++
 4 files changed, 271 insertions(+)

diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
index 1677c1f335fbb0c6114bdb4cc0b12eb407d84564..afdd9268ca23ac7602e73bbe45f3f9cd090a3afd 100644
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
index bbdaaf7022b62d84594a29f1b60144920903a99a..4abfbded962bf45b793a2bd5b1b5c4d9f478a1f7 100644
--- a/drivers/gpu/drm/drm_connector.c
+++ b/drivers/gpu/drm/drm_connector.c
@@ -33,6 +33,7 @@
 #include <drm/drm_sysfs.h>
 #include <drm/drm_utils.h>
 
+#include <linux/platform_device.h>
 #include <linux/property.h>
 #include <linux/uaccess.h>
 
@@ -280,6 +281,7 @@ static int __drm_connector_init(struct drm_device *dev,
 	mutex_init(&connector->eld_mutex);
 	mutex_init(&connector->edid_override_mutex);
 	mutex_init(&connector->hdmi.infoframes.lock);
+	mutex_init(&connector->hdmi_codec.lock);
 	connector->edid_blob_ptr = NULL;
 	connector->epoch_counter = 0;
 	connector->tile_blob_ptr = NULL;
@@ -632,6 +634,8 @@ void drm_connector_cleanup(struct drm_connector *connector)
 		    DRM_CONNECTOR_REGISTERED))
 		drm_connector_unregister(connector);
 
+	platform_device_unregister(connector->hdmi_codec.codec_pdev);
+
 	if (connector->privacy_screen) {
 		drm_privacy_screen_put(connector->privacy_screen);
 		connector->privacy_screen = NULL;
@@ -670,6 +674,7 @@ void drm_connector_cleanup(struct drm_connector *connector)
 		connector->funcs->atomic_destroy_state(connector,
 						       connector->state);
 
+	mutex_destroy(&connector->hdmi_codec.lock);
 	mutex_destroy(&connector->hdmi.infoframes.lock);
 	mutex_destroy(&connector->mutex);
 
diff --git a/drivers/gpu/drm/drm_connector_hdmi_codec.c b/drivers/gpu/drm/drm_connector_hdmi_codec.c
new file mode 100644
index 0000000000000000000000000000000000000000..1934fb53b4d128434559970c9fea548bbc4bedda
--- /dev/null
+++ b/drivers/gpu/drm/drm_connector_hdmi_codec.c
@@ -0,0 +1,185 @@
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
+	if (connector->hdmi_codec.dai_port < 0)
+		return -ENOTSUPP;
+
+	ret = of_graph_parse_endpoint(endpoint, &of_ep);
+	if (ret < 0)
+		return ret;
+
+	if (of_ep.port == connector->hdmi_codec.dai_port)
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
+	mutex_lock(&connector->eld_mutex);
+	memcpy(buf, connector->eld, min(sizeof(connector->eld), len));
+	mutex_unlock(&connector->eld_mutex);
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
+ * drm_connector_hdmi_codec_init - Initialize HDMI Codec device for the DRM connector
+ * @connector: A pointer to the connector to allocate codec for
+ * @hdmi_codec_dev: device to be used as a parent for the HDMI Codec
+ * @max_i2s_playback_channels: maximum number of playback I2S channels
+ * @spdif_playback: set if HDMI codec has S/PDIF playback port
+ * @dai_port: sound DAI port, -1 if it is not enabled
+ *
+ * Create a HDMI codec device to be used with the specified connector.
+ *
+ * Returns:
+ * Zero on success, error code on failure.
+ */
+int drm_connector_hdmi_codec_init(struct drm_connector *connector,
+				  struct device *hdmi_codec_dev,
+				  unsigned int max_i2s_playback_channels,
+				  bool spdif_playback,
+				  int dai_port)
+{
+	struct hdmi_codec_pdata codec_pdata = {
+		.ops = &drm_connector_hdmi_codec_ops,
+		.max_i2s_channels = max_i2s_playback_channels,
+		.i2s = !!max_i2s_playback_channels,
+		.spdif = spdif_playback,
+		.no_i2s_capture = true,
+		.no_spdif_capture = true,
+		.data = connector,
+	};
+	struct platform_device *pdev;
+
+	connector->hdmi_codec.dai_port = dai_port;
+
+	if (!connector->hdmi.funcs->codec_funcs->prepare ||
+	    !connector->hdmi.funcs->codec_funcs->audio_shutdown)
+		return -EINVAL;
+
+	pdev = platform_device_register_data(hdmi_codec_dev,
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
+EXPORT_SYMBOL(drm_connector_hdmi_codec_init);
diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
index 1e2b25e204cb523d61d30f5409faa059bf2b86eb..1d113c0ceec7ce8196a412d7c00a1737175c6fbe 100644
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
@@ -1660,6 +1716,17 @@ struct drm_cmdline_mode {
 	bool tv_mode_specified;
 };
 
+struct drm_connector_hdmi_codec {
+	struct platform_device *codec_pdev;
+
+	struct mutex lock; /* protects last_state and plugged_cb */
+	void (*plugged_cb)(struct device *dev, bool plugged);
+	struct device *plugged_cb_dev;
+	bool last_state;
+
+	int dai_port;
+};
+
 /*
  * struct drm_connector_hdmi - DRM Connector HDMI-related structure
  */
@@ -2121,6 +2188,11 @@ struct drm_connector {
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
@@ -2148,12 +2220,20 @@ int drmm_connector_hdmi_init(struct drm_device *dev,
 			     struct i2c_adapter *ddc,
 			     unsigned long supported_formats,
 			     unsigned int max_bpc);
+int drm_connector_hdmi_codec_init(struct drm_connector *connector,
+				  struct device *hdmi_codec_dev,
+				  unsigned int max_i2s_playback_channels,
+				  bool spdif_playback,
+				  int sound_dai_port);
 void drm_connector_attach_edid_property(struct drm_connector *connector);
 int drm_connector_register(struct drm_connector *connector);
 void drm_connector_unregister(struct drm_connector *connector);
 int drm_connector_attach_encoder(struct drm_connector *connector,
 				      struct drm_encoder *encoder);
 
+void drm_connector_hdmi_codec_plugged_notify(struct drm_connector *connector,
+					     bool plugged);
+
 void drm_connector_cleanup(struct drm_connector *connector);
 
 static inline unsigned int drm_connector_index(const struct drm_connector *connector)

-- 
2.39.5

