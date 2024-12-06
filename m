Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F317F20765D
	for <linux-samsung-soc@vger.kernel.org>; Fri,  6 Dec 2024 10:16:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733480220; cv=none; b=a56on9XK8PDHT5xMFT89F3pID8gffRqLfwQhZgKakI1SYO2hI192CJ8/V6pxR871zkoszWJSR/xAX1kyUS3wg9730lnj6EcLY4zYUHpNLBQ/xo7dkzub1mbLL7dDaJiovkzcy59VuTixvXhYrKzgUh1tMu8tR0xRBh2rTKgZDOU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733480220; c=relaxed/simple;
	bh=b+kD+GGfMX4IeYm4/zVmi8YnnM9D7BF1gQ9GNsjSPBU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MSqjCcaDsEzLv3MSdDgEZfUGTqCD6vrGhblMjJUMm5+x7dfSqCNWztbPNkPUSISYFEhSrPfGrSIF0gHki1dZdlHRPnPdQcteFKceX85Ik2jTSfN+7hkxIiuCZheINx3uv52q3W/U6CJUoPkko3HRnmzXJT5JwqUgrI3MRS53zJE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=o0Q6v8aA; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="o0Q6v8aA"
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-53df80eeeedso1967691e87.2
        for <linux-samsung-soc@vger.kernel.org>; Fri, 06 Dec 2024 02:16:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733480214; x=1734085014; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=23NpFOv9+trBwXgoTdLMEtZogD9sP0WWw4oqP5QnN+o=;
        b=o0Q6v8aA+HXNg0m+7ZniFeipqNEOwEr51Sakm1lFFYfNkM9PSiMLVaYXfBR5lg+mv5
         nChbgHL1AAFyjMV9nlc2dIgnERsYIaDIzP7qIgndf9G8dCU4/eTVh5pWJhwDKy+E51Vb
         pPIdYPgNoCsh3reqoj3bKiNcLdh1iSsQAB7WyaqDbPz2Jl75UNfz8h2OYeaNQTkQMYe9
         57sTp5NzVArNR4vQXUIQLm1Fd+3DL9uz7VRoNJzG1j2cRAulRS0P+YqqeYQncYdvyGSJ
         YUXA8vxm7S9JbCgPyjp6QGUWxNdlxWszQubaYeeDA8l161jeml3qBQwgHNV3RFM8ZA3H
         gREg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733480214; x=1734085014;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=23NpFOv9+trBwXgoTdLMEtZogD9sP0WWw4oqP5QnN+o=;
        b=sozb7qBsl2WNdWu1QbevP3bfrjFMrCJRvet4wydfGVTDa8lPZfs7EuMzgRyVQRh63Z
         lWfgio43pa/LBnQjy/miKdUT0DmadMt9YuQfc12JeYr0qv/RN2cUgQwYN0pMbvX5rb+q
         pUv0m40VHxDpyDGEyd/kI0z2PaYpyqiXqY6Gxh5Bx7ZgZuPUKYRz/Rv8+JyXH4DQSsrf
         dJYpSoBdBa6M8KohjDgvfhtt6o3gw7hhl9Vdqsu647qaPjgRUV6dwc2uUu7+NPJvDZiW
         tMoy0xzp7tpiuhHAbEyQeYoPJl4YRDwZ0uUWAzAIJJBgutFvVseo4wYfS/rdY8HG4/rs
         yqfA==
X-Forwarded-Encrypted: i=1; AJvYcCWtgAZiSm7ESeJrx+e2q1QZndE7+n+qcOumfDHfZGp619rlV+wzk37iVpohlBPJsfJwxKoVgInU1kaRBiyHWnR6Rg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwoZmyw2nmy4JCJlZipDWmUo89kirP8fsBDVVet1UAvKU5lkIou
	fzk9mTkadbEdAWXCzDoDu/Y9hdD42qKdq8P/xl5PdJXA4w12OjUgGytUzujSu10=
X-Gm-Gg: ASbGncsjcKGiTvFIMD1Y+3ctBPUBl+hhGV8cCh+C4G8GJmGqFi9PU/zkogxf0Zlk0rh
	cOMCT5bTREM+vAA2l72sodT96hfQEq4T98JvGLddU/y/5c58RqxR7+FaE8LEJYq2C/R9x8tAa2w
	0LOg5lzCJR7bDiLKy9d3hpGg2GkFtBGEPp0UGF+Yg64ecJCJylFdtN5HJcNoWwz196me7jnpp+V
	Zgiv3sVJj1meyIqMvYIo9T5CbKb0Py/n2fnzyzuu+pn8zdE0DKNUhF7Iw==
X-Google-Smtp-Source: AGHT+IHYoxoM7GYC/RXRXwsY9aIS+FgvCMwE8/kYFPGH+zE3IIcRoYFa8DmKuD5mvJKqJ85kxF63Tw==
X-Received: by 2002:a05:6512:e84:b0:539:e9f8:d45d with SMTP id 2adb3069b0e04-53e2c2ede3fmr750213e87.52.1733480213923;
        Fri, 06 Dec 2024 02:16:53 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53e2294738fsm462355e87.52.2024.12.06.02.16.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Dec 2024 02:16:52 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 06 Dec 2024 12:15:58 +0200
Subject: [PATCH v6 04/10] drm/bridge: connector: add support for HDMI codec
 framework
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241206-drm-bridge-hdmi-connector-v6-4-50dc145a9c06@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=7190;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=b+kD+GGfMX4IeYm4/zVmi8YnnM9D7BF1gQ9GNsjSPBU=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ3rQec7WHOaVG4Q3BLwzEHlil613kO2lc1aUw16pyxtU7
 96sSXTsZDRmYWDkYpAVU2TxKWiZGrMpOezDjqn1MINYmUCmMHBxCsBEjkax/6+3SdXnWqWzq1hQ
 r2rLD+UIs9eMS/c/PuO3N3SfuY3x4RcbVeYuuXszdMfyJwk98t/6+rvjloW/OqEvU1OgnJ6j7Gz
 csflks5z+VNF+AfnZ2X+u3rRwnr1ZQzLc9e7ve6+uCEhu2j97tzPTk7DzsZ1qd8S3e7FeVH29Yo
 u8aG20ZHx3Vvtp3zeCp1IqvS9zia7VuXwyUEdT40NpcbhSb0We/iIxtsQQi47KybYVu84vmpC5S
 qjSRebQAxFlG8vmeG737gPv2Pc9njrv1c8iRjblM4/v7UjztOFdcFWg9/36C6cLv0axPrQ8L7Et
 5kr7n7qwsvVhIUs55JLeCCt0Cdb5Kh+SiF3Y+/nw47K7AA==
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Add necessary glue code to be able to use new HDMI codec framework from
the DRM bridge drivers. The drm_bridge implements a limited set of the
hdmi_codec_ops interface, with the functions accepting both
drm_connector and drm_bridge instead of just a generic void pointer.

This framework is integrated with the DRM HDMI Connector framework, but
can also be used for DisplayPort connectors.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/display/drm_bridge_connector.c | 100 ++++++++++++++++++++++++-
 include/drm/drm_bridge.h                       |  38 ++++++++++
 2 files changed, 134 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/display/drm_bridge_connector.c b/drivers/gpu/drm/display/drm_bridge_connector.c
index 512ced87ea18c74e182a558a686ddd83de891814..4fa1bb73d430d02d5b79a1a184c203ec9e9c66e7 100644
--- a/drivers/gpu/drm/display/drm_bridge_connector.c
+++ b/drivers/gpu/drm/display/drm_bridge_connector.c
@@ -21,6 +21,8 @@
 #include <drm/display/drm_hdmi_helper.h>
 #include <drm/display/drm_hdmi_state_helper.h>
 
+#include <sound/hdmi-codec.h>
+
 /**
  * DOC: overview
  *
@@ -368,10 +370,80 @@ static int drm_bridge_connector_write_infoframe(struct drm_connector *connector,
 	return bridge->funcs->hdmi_write_infoframe(bridge, type, buffer, len);
 }
 
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
+	if (bridge->funcs->hdmi_codec_audio_startup)
+		return bridge->funcs->hdmi_codec_audio_startup(connector, bridge);
+	else
+		return 0;
+}
+
+static int drm_bridge_connector_prepare(struct drm_connector *connector,
+					struct hdmi_codec_daifmt *fmt,
+					struct hdmi_codec_params *hparms)
+{
+	struct drm_bridge_connector *bridge_connector =
+		to_drm_bridge_connector(connector);
+	struct drm_bridge *bridge;
+
+	bridge = bridge_connector->bridge_hdmi;
+	if (!bridge)
+		return -EINVAL;
+
+	return bridge->funcs->hdmi_codec_prepare(connector, bridge, fmt, hparms);
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
+	bridge->funcs->hdmi_codec_audio_shutdown(connector, bridge);
+}
+
+static int drm_bridge_connector_mute_stream(struct drm_connector *connector,
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
+	if (bridge->funcs->hdmi_codec_mute_stream)
+		return bridge->funcs->hdmi_codec_mute_stream(connector, bridge,
+							     enable, direction);
+	else
+		return -ENOTSUPP;
+}
+
+static const struct drm_connector_hdmi_codec_funcs drm_bridge_connector_hdmi_codec_funcs = {
+	.audio_startup = drm_bridge_connector_audio_startup,
+	.prepare = drm_bridge_connector_prepare,
+	.audio_shutdown = drm_bridge_connector_audio_shutdown,
+	.mute_stream = drm_bridge_connector_mute_stream,
+};
+
 static const struct drm_connector_hdmi_funcs drm_bridge_connector_hdmi_funcs = {
 	.tmds_char_rate_valid = drm_bridge_connector_tmds_char_rate_valid,
 	.clear_infoframe = drm_bridge_connector_clear_infoframe,
 	.write_infoframe = drm_bridge_connector_write_infoframe,
+	.codec_funcs = &drm_bridge_connector_hdmi_codec_funcs,
 };
 
 /* -----------------------------------------------------------------------------
@@ -473,7 +545,9 @@ struct drm_connector *drm_bridge_connector_init(struct drm_device *drm,
 	if (connector_type == DRM_MODE_CONNECTOR_Unknown)
 		return ERR_PTR(-EINVAL);
 
-	if (bridge_connector->bridge_hdmi)
+	if (bridge_connector->bridge_hdmi) {
+		bridge = bridge_connector->bridge_hdmi;
+
 		ret = drmm_connector_hdmi_init(drm, connector,
 					       bridge_connector->bridge_hdmi->vendor,
 					       bridge_connector->bridge_hdmi->product,
@@ -482,12 +556,30 @@ struct drm_connector *drm_bridge_connector_init(struct drm_device *drm,
 					       connector_type, ddc,
 					       supported_formats,
 					       max_bpc);
-	else
+		if (ret)
+			return ERR_PTR(ret);
+
+		if (bridge->hdmi_codec_max_i2s_playback_channels ||
+		    bridge->hdmi_codec_spdif_playback) {
+			if (!bridge->funcs->hdmi_codec_prepare ||
+			    !bridge->funcs->hdmi_codec_audio_shutdown)
+				return ERR_PTR(-EINVAL);
+
+			ret = drm_connector_hdmi_codec_init(connector,
+							    bridge->hdmi_codec_dev,
+							    bridge->hdmi_codec_max_i2s_playback_channels,
+							    bridge->hdmi_codec_spdif_playback,
+							    bridge->hdmi_codec_dai_port);
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
index e8d735b7f6a480468c88287e2517b387ceec0f22..fd7ad7315a8bfda90f02b0704c33ba0e356899fb 100644
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
@@ -676,6 +678,21 @@ struct drm_bridge_funcs {
 				    enum hdmi_infoframe_type type,
 				    const u8 *buffer, size_t len);
 
+	int (*hdmi_codec_audio_startup)(struct drm_connector *connector,
+					struct drm_bridge *bridge);
+
+	int (*hdmi_codec_prepare)(struct drm_connector *connector,
+				  struct drm_bridge *bridge,
+				  struct hdmi_codec_daifmt *fmt,
+				  struct hdmi_codec_params *hparms);
+
+	void (*hdmi_codec_audio_shutdown)(struct drm_connector *connector,
+					  struct drm_bridge *bridge);
+
+	int (*hdmi_codec_mute_stream)(struct drm_connector *connector,
+				      struct drm_bridge *bridge,
+				      bool enable, int direction);
+
 	/**
 	 * @debugfs_init:
 	 *
@@ -859,6 +876,27 @@ struct drm_bridge {
 	 * @DRM_BRIDGE_OP_HDMI is set.
 	 */
 	unsigned int max_bpc;
+
+	/**
+	 * @hdmi_codec_dev: device to be used as a parent for the HDMI Codec
+	 */
+	struct device *hdmi_codec_dev;
+
+	/**
+	 * @hdmi_codec_max_i2s_playback_channels: maximum number of playback
+	 * I2S channels for the HDMI codec
+	 */
+	int hdmi_codec_max_i2s_playback_channels;
+
+	/**
+	 * @hdmi_codec_spdif_playback: set if HDMI codec has S/PDIF playback port
+	 */
+	unsigned int hdmi_codec_spdif_playback : 1;
+
+	/**
+	 * @hdmi_codec_dai_port: sound DAI port, -1 if it is not enabled
+	 */
+	int hdmi_codec_dai_port;
 };
 
 static inline struct drm_bridge *

-- 
2.39.5

