Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CB2D14A617
	for <linux-samsung-soc@vger.kernel.org>; Tue, 24 Dec 2024 01:48:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735004894; cv=none; b=l+lbBooUF5lx1ZYBn2f6k/NauwNFt+QbRrZyB1IeRUEmgPOPdD+7pmRtNGtGZY/4bPhYXeS6vhe30Fq8myEnl6eI/Ic7nog/0+GhrrAuNyHSu3lwn53DI5Bs6c+tWoL1JOVsd6o5tn2nCsA8BN/u5zNgIZerq+rujFJD6UAbeQ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735004894; c=relaxed/simple;
	bh=+9/GofAGWhLy9wrqSmZOxY+l/2yzBqNah+8Tguhgp2M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=g7NA9xoEl0MWpuAQa1kaBkOueO1BX+T1Wa9qv9iaSI0lSUa5jhmESDMKGKHVarWLaY7R9+xNrVsv8HnNVtoVDw39uFJxjvMhltFG6FKUd0fl2sZZgIV0rhMt7iyW+iLe0LfQwwPGdVmYgfTD9VDSN1B8Ymlmh0jQ14kwWi2sofk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=cLnG/K/X; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cLnG/K/X"
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-53e28cf55cdso4254164e87.3
        for <linux-samsung-soc@vger.kernel.org>; Mon, 23 Dec 2024 17:48:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1735004890; x=1735609690; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NkfZ6eSBqH+U72PubeZQwmfij4Dp6Y/j7eiSX3PFWc4=;
        b=cLnG/K/XZI7OcKfj2+eSRG13s+hcNpVGM5xHllSfw+zI3sNnRQ/8j2TtEO4tLTpyUL
         SwnTGX2igQCVWjs8vm3bvYl9USF2JYR+fnHCTTmpY3sQsxW9i22EQmRCIM4WllCIpD6z
         H/4kw4M4Q7af9EZSqXunBpUfga1IxzXkMurvae+Xsj1M67Unc5iYKA712yuga2mx5Q5Z
         d9PlWxJYYArFjWK9bgYGKPzF2HxhYJJj18xOwBhP5Ayz00z2Yn6mazjFmp7iWFParcVd
         mF/SnoPhm5egGIFjWbYP170osRM6kOXFKmcOQxj2cy3szLib2FXHmqbYVU3vc9Ku00hl
         GCjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735004890; x=1735609690;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NkfZ6eSBqH+U72PubeZQwmfij4Dp6Y/j7eiSX3PFWc4=;
        b=aR/zoO0kqqwM86qL2vRMXqH3z7M94WXl8zzMpyTJRe+pLrOk7BgupcoGfNjd9hj/cK
         k75zh7fzU9qgIiCnDrKiMihCXGePUdHHTtdOibeZPcwX1G0cFadpDR+EjaZp6E3f/Ko5
         MnWm8aLwtW0Ido9/Mj+M4e+wxWcStYt2NVWdiLdPliXbapSsciEH1Wl1tfwjlgEQQrf3
         DKaoJxXQyAPQ1nxkFL0+C9jchSlwt3gCqJkganM6lUiOKs1La0ohNIWRZaHxZC4YGuYP
         CV2txta6f1S3Wrimg7fCIF9pIGwUEzaLrLvqRYO+ytLT1cY5U5exLI8FNYdnG4MOG0rF
         5x/A==
X-Forwarded-Encrypted: i=1; AJvYcCVa80l6lDxaXFydoqs3jlgqpT9EvB4d1TvogQnub9n3eYcv8EEMHVG/ruMQlQxTzpDs34nuyDLwXVGzpQ+mjVvFeg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxEosIMLDWQD75xvfR6DVLBiRB93tWtYhQhZKWWcrU0nDFk0C/O
	7W/lC+mqrfZ/SKx4IMp6gDFaZlbfMJT/8dvkF3LrA3MC8m6SqnTZuedBifyZp6E=
X-Gm-Gg: ASbGncui+kX8KUsUqSb6iFL7GBu9Wjpgs/g9KNnpqmg3O96JI12D5n2+klc+ugOKoSe
	U0usS3UCvt+4g/3PUeBB6WAbL+h4w0lDQya10lBoLxMACqLIX7cVtitUJ/c6aUaerpgqGnp9tr/
	MqfHq9Mf6B2Ic5AtHgiN0zIejXkW5eeYiGaIQswglk9PP+InVst2FOJYGY6oucfG25ruEnfl7Ol
	96RBM7SDYJWb0+6EgnHrRqGPiZ3kHioIQr1EDCXh7YLOduC7dhBGwOzTQ5OqcFc
X-Google-Smtp-Source: AGHT+IHtxun07cCQGIYy5GzbDRT7RywktOpcnRRNxTstaYFKRJFzbVhCoSlmNO8+c+wLXmREDFQKgg==
X-Received: by 2002:a05:6512:2246:b0:540:29ac:bda5 with SMTP id 2adb3069b0e04-542295253e3mr5145842e87.4.1735004890183;
        Mon, 23 Dec 2024 17:48:10 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-542235f6509sm1425988e87.25.2024.12.23.17.48.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Dec 2024 17:48:08 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 24 Dec 2024 03:47:56 +0200
Subject: [PATCH v10 04/10] drm/bridge: connector: add support for HDMI
 codec framework
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241224-drm-bridge-hdmi-connector-v10-4-dc89577cd438@linaro.org>
References: <20241224-drm-bridge-hdmi-connector-v10-0-dc89577cd438@linaro.org>
In-Reply-To: <20241224-drm-bridge-hdmi-connector-v10-0-dc89577cd438@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=8614;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=+9/GofAGWhLy9wrqSmZOxY+l/2yzBqNah+8Tguhgp2M=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnahLN7YJA8KENNOPYS1IrnR6yERZJRFuEDXA97
 HVEaFacuQ+JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ2oSzQAKCRCLPIo+Aiko
 1UfuB/9B/olJux/HNMLNreK1OOYv4+VQyFDDyj8OsKrRSRG1Oxtn3F9IoAbaTfRzN1MedaGXsS9
 g9WuoE4W9lOftm9b6K3QVkiLbACLE0b5V56lemQIYiQink7INNRBF0w3iWl5FgxvGm0lZaiv/Y1
 gbTNCSwa0jef0Q1uTAZDbNK4LA4YfDLos62SC20B9zPtCOjBBU/omVJ/da/FveicaenkG9yFlrm
 txw40CGAhqKeagq16ShQuz2YbNVF/Vk83ryTVD5doPNyn8Lpnw6k0GOHtb6kdpAddeOBHkYdNHL
 NG8v5q32P/s64upAFChwB6akHUmxLrrI8aMZzlDW3tZcmv2k
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Add necessary glue code to be able to use new HDMI codec framework from
the DRM bridge drivers. The drm_bridge implements a limited set of the
hdmi_codec_ops interface, with the functions accepting both
drm_connector and drm_bridge instead of just a generic void pointer.

This framework is integrated with the DRM HDMI Connector framework, but
can also be used for DisplayPort connectors.

Reviewed-by: Maxime Ripard <mripard@kernel.org>
Tested-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/display/Kconfig                |  1 +
 drivers/gpu/drm/display/drm_bridge_connector.c | 99 ++++++++++++++++++++++++--
 include/drm/drm_bridge.h                       | 74 +++++++++++++++++++
 3 files changed, 170 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/display/Kconfig b/drivers/gpu/drm/display/Kconfig
index 80c1953cac14a088d764acd45df03debfcb95e7c..2619fa2476eb149e1befc3135131ed5aaeb5bb4c 100644
--- a/drivers/gpu/drm/display/Kconfig
+++ b/drivers/gpu/drm/display/Kconfig
@@ -15,6 +15,7 @@ if DRM_DISPLAY_HELPER
 
 config DRM_BRIDGE_CONNECTOR
 	bool
+	select DRM_DISPLAY_HDMI_AUDIO_HELPER
 	select DRM_DISPLAY_HDMI_STATE_HELPER
 	help
 	  DRM connector implementation terminating DRM bridge chains.
diff --git a/drivers/gpu/drm/display/drm_bridge_connector.c b/drivers/gpu/drm/display/drm_bridge_connector.c
index 512ced87ea18c74e182a558a686ddd83de891814..3f18495c30a4a7fcdaf93b161cf1d30020788772 100644
--- a/drivers/gpu/drm/display/drm_bridge_connector.c
+++ b/drivers/gpu/drm/display/drm_bridge_connector.c
@@ -18,6 +18,7 @@
 #include <drm/drm_managed.h>
 #include <drm/drm_modeset_helper_vtables.h>
 #include <drm/drm_probe_helper.h>
+#include <drm/display/drm_hdmi_audio_helper.h>
 #include <drm/display/drm_hdmi_helper.h>
 #include <drm/display/drm_hdmi_state_helper.h>
 
@@ -374,6 +375,75 @@ static const struct drm_connector_hdmi_funcs drm_bridge_connector_hdmi_funcs = {
 	.write_infoframe = drm_bridge_connector_write_infoframe,
 };
 
+static int drm_bridge_connector_audio_startup(struct drm_connector *connector)
+{
+	struct drm_bridge_connector *bridge_connector =
+		to_drm_bridge_connector(connector);
+	struct drm_bridge *bridge;
+
+	bridge = bridge_connector->bridge_hdmi;
+	if (!bridge)
+		return -EINVAL;
+
+	if (!bridge->funcs->hdmi_audio_startup)
+		return 0;
+
+	return bridge->funcs->hdmi_audio_startup(connector, bridge);
+}
+
+static int drm_bridge_connector_audio_prepare(struct drm_connector *connector,
+					      struct hdmi_codec_daifmt *fmt,
+					      struct hdmi_codec_params *hparms)
+{
+	struct drm_bridge_connector *bridge_connector =
+		to_drm_bridge_connector(connector);
+	struct drm_bridge *bridge;
+
+	bridge = bridge_connector->bridge_hdmi;
+	if (!bridge)
+		return -EINVAL;
+
+	return bridge->funcs->hdmi_audio_prepare(connector, bridge, fmt, hparms);
+}
+
+static void drm_bridge_connector_audio_shutdown(struct drm_connector *connector)
+{
+	struct drm_bridge_connector *bridge_connector =
+		to_drm_bridge_connector(connector);
+	struct drm_bridge *bridge;
+
+	bridge = bridge_connector->bridge_hdmi;
+	if (!bridge)
+		return;
+
+	bridge->funcs->hdmi_audio_shutdown(connector, bridge);
+}
+
+static int drm_bridge_connector_audio_mute_stream(struct drm_connector *connector,
+					    bool enable, int direction)
+{
+	struct drm_bridge_connector *bridge_connector =
+		to_drm_bridge_connector(connector);
+	struct drm_bridge *bridge;
+
+	bridge = bridge_connector->bridge_hdmi;
+	if (!bridge)
+		return -EINVAL;
+
+	if (bridge->funcs->hdmi_audio_mute_stream)
+		return bridge->funcs->hdmi_audio_mute_stream(connector, bridge,
+							     enable, direction);
+	else
+		return -ENOTSUPP;
+}
+
+static const struct drm_connector_hdmi_audio_funcs drm_bridge_connector_hdmi_audio_funcs = {
+	.startup = drm_bridge_connector_audio_startup,
+	.prepare = drm_bridge_connector_audio_prepare,
+	.shutdown = drm_bridge_connector_audio_shutdown,
+	.mute_stream = drm_bridge_connector_audio_mute_stream,
+};
+
 /* -----------------------------------------------------------------------------
  * Bridge Connector Initialisation
  */
@@ -473,7 +543,9 @@ struct drm_connector *drm_bridge_connector_init(struct drm_device *drm,
 	if (connector_type == DRM_MODE_CONNECTOR_Unknown)
 		return ERR_PTR(-EINVAL);
 
-	if (bridge_connector->bridge_hdmi)
+	if (bridge_connector->bridge_hdmi) {
+		bridge = bridge_connector->bridge_hdmi;
+
 		ret = drmm_connector_hdmi_init(drm, connector,
 					       bridge_connector->bridge_hdmi->vendor,
 					       bridge_connector->bridge_hdmi->product,
@@ -482,12 +554,31 @@ struct drm_connector *drm_bridge_connector_init(struct drm_device *drm,
 					       connector_type, ddc,
 					       supported_formats,
 					       max_bpc);
-	else
+		if (ret)
+			return ERR_PTR(ret);
+
+		if (bridge->hdmi_audio_max_i2s_playback_channels ||
+		    bridge->hdmi_audio_spdif_playback) {
+			if (!bridge->funcs->hdmi_audio_prepare ||
+			    !bridge->funcs->hdmi_audio_shutdown)
+				return ERR_PTR(-EINVAL);
+
+			ret = drm_connector_hdmi_audio_init(connector,
+							    bridge->hdmi_audio_dev,
+							    &drm_bridge_connector_hdmi_audio_funcs,
+							    bridge->hdmi_audio_max_i2s_playback_channels,
+							    bridge->hdmi_audio_spdif_playback,
+							    bridge->hdmi_audio_dai_port);
+			if (ret)
+				return ERR_PTR(ret);
+		}
+	} else {
 		ret = drmm_connector_init(drm, connector,
 					  &drm_bridge_connector_funcs,
 					  connector_type, ddc);
-	if (ret)
-		return ERR_PTR(ret);
+		if (ret)
+			return ERR_PTR(ret);
+	}
 
 	drm_connector_helper_add(connector, &drm_bridge_connector_helper_funcs);
 
diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
index e8d735b7f6a480468c88287e2517b387ceec0f22..4b84faf14e368310dd20aa964e8178ec80aa6fa7 100644
--- a/include/drm/drm_bridge.h
+++ b/include/drm/drm_bridge.h
@@ -41,6 +41,8 @@ struct drm_display_info;
 struct drm_minor;
 struct drm_panel;
 struct edid;
+struct hdmi_codec_daifmt;
+struct hdmi_codec_params;
 struct i2c_adapter;
 
 /**
@@ -676,6 +678,57 @@ struct drm_bridge_funcs {
 				    enum hdmi_infoframe_type type,
 				    const u8 *buffer, size_t len);
 
+	/**
+	 * @hdmi_audio_startup:
+	 *
+	 * Called when ASoC starts an audio stream setup. The
+	 * @hdmi_audio_startup() is optional.
+	 *
+	 * Returns:
+	 * 0 on success, a negative error code otherwise
+	 */
+	int (*hdmi_audio_startup)(struct drm_connector *connector,
+				  struct drm_bridge *bridge);
+
+	/**
+	 * @prepare:
+	 * Configures HDMI-encoder for audio stream. Can be called multiple
+	 * times for each setup. Mandatory if HDMI audio is enabled in the
+	 * bridge's configuration.
+	 *
+	 * Returns:
+	 * 0 on success, a negative error code otherwise
+	 */
+	int (*hdmi_audio_prepare)(struct drm_connector *connector,
+				  struct drm_bridge *bridge,
+				  struct hdmi_codec_daifmt *fmt,
+				  struct hdmi_codec_params *hparms);
+
+	/**
+	 * @hdmi_audio_shutdown:
+	 *
+	 * Shut down the audio stream. Mandatory if HDMI audio is enabled in
+	 * the bridge's configuration.
+	 *
+	 * Returns:
+	 * 0 on success, a negative error code otherwise
+	 */
+	void (*hdmi_audio_shutdown)(struct drm_connector *connector,
+				    struct drm_bridge *bridge);
+
+	/**
+	 * @hdmi_audio_mute_stream:
+	 *
+	 * Mute/unmute HDMI audio stream. The @hdmi_audio_mute_stream callback
+	 * is optional.
+	 *
+	 * Returns:
+	 * 0 on success, a negative error code otherwise
+	 */
+	int (*hdmi_audio_mute_stream)(struct drm_connector *connector,
+				      struct drm_bridge *bridge,
+				      bool enable, int direction);
+
 	/**
 	 * @debugfs_init:
 	 *
@@ -859,6 +912,27 @@ struct drm_bridge {
 	 * @DRM_BRIDGE_OP_HDMI is set.
 	 */
 	unsigned int max_bpc;
+
+	/**
+	 * @hdmi_audio_dev: device to be used as a parent for the HDMI Codec
+	 */
+	struct device *hdmi_audio_dev;
+
+	/**
+	 * @hdmi_audio_max_i2s_playback_channels: maximum number of playback
+	 * I2S channels for the HDMI codec
+	 */
+	int hdmi_audio_max_i2s_playback_channels;
+
+	/**
+	 * @hdmi_audio_spdif_playback: set if HDMI codec has S/PDIF playback port
+	 */
+	unsigned int hdmi_audio_spdif_playback : 1;
+
+	/**
+	 * @hdmi_audio_dai_port: sound DAI port, -1 if it is not enabled
+	 */
+	int hdmi_audio_dai_port;
 };
 
 static inline struct drm_bridge *

-- 
2.39.5

