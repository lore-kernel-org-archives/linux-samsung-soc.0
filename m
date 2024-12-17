Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6925E537F8
	for <linux-samsung-soc@vger.kernel.org>; Tue, 17 Dec 2024 00:40:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734396042; cv=none; b=CXcml8i1YH8cIim9BsIcI5Iw40fQRs35CvGgjHZavOJiUfvgopl1dHfWKvZQmRfjRmAe9CwapeIXhZY6B9mbEQVz/l0B6g0oMdMjOpizDSC7EaEUMQ6SNhNH3LnVoO9UPyHuUASh2r4fMMnXB6CQSYUsi9oyqnfzpCuGyqct7Iw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734396042; c=relaxed/simple;
	bh=oRt1uc2dMf9+pijMkP+eCrRG9ChsIEKJSkVSymmIkws=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TlMrf1Y3CzA/HpY+BLjZuCUn2ygWskwcsbosv0q4DGHr5/qEAISstkfc32KigUzCeTz8CJue+7InGao+jkcNLw8QbFC2D8gEbuP8jovVCSPiN9j1XubgKnyvXCpqVDoCjihmFa88dQqcvWNetELF4RycNu9JwNp/Ln79FLRzMMQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dz0dHJ0x; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dz0dHJ0x"
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5401c52000fso4726397e87.2
        for <linux-samsung-soc@vger.kernel.org>; Mon, 16 Dec 2024 16:40:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734396039; x=1735000839; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9/uHPXK/8E1yESmbWnhFymql7tY9M8diwZIDgU0aHhE=;
        b=dz0dHJ0xqa34pbwAWSAI98ZZb6ChfK2uzEL3rZ/I0KqKzq2+78p6RLPhrCU9H5OlfN
         XUBrLLaEtyVBvo7VvPRrIAJ1yrn5tXI9t8S/h1MvAgFLpEgST0mB0oLiTS+R6KuZn0O3
         eqYy5wJXxc0N8vNDVCcf0duV1CEmnrN0xMpNw275oFgx/ET1Sn50KvR9+qnNSbE6qWUk
         vqX1j6jr93v0kB6QEotj20Mzw29C/urNhInpgPVE0JlN2I/RJeMzKLmGWGI8L+xNo/CO
         FUb5yWrH7LHATmHIVj48J3ruvr34raFtpDCELcQXGQVPMQefYStp+offkCkPC33V08dR
         /aHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734396039; x=1735000839;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9/uHPXK/8E1yESmbWnhFymql7tY9M8diwZIDgU0aHhE=;
        b=VzCsOq1XAMdhuKx6epsvwJoNqkrQzFcw9sXv8SdlYsjzuwXx1u8QOO8sXh7ut5dV7B
         qnVCOT+OtaeVfklqoY2TKAgUMOeWzhx25jzB7Puf2FQVhEn1KUfaXdZm0zXljUMB0CTB
         Yl37BCqLSwt0JtxSXafFQOPIHalMdjDmrKMDLildMWRrF2+Aef1TaRdpEqtHdBZ+ZcY0
         Gme6JrR7v5XmoQ6kZcUUFiQT7vaXembj+tVIEpe2wd0OeNKiLO4M2WEDlybVqmpBzTse
         mjHcCJTIQQiz3ZueH7Q8smHYRa4MCcX+xZNXD8B3d53y7rY2XthnNa8FiFGKYs/6qeTM
         Lz7Q==
X-Forwarded-Encrypted: i=1; AJvYcCXbAsknVNzaS6RDO6iL53dAqlO18Uap+IGnmwwPfJ91f0B6+OX7cwqZ+TmZMMrZvf2C2vM5gqCzYZ3Kbx0QDNAYAQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywz+RYzCGxjZedGz8SRxBEj8W0o4u0fof/GdWgo/0Nl3WiIu85N
	Sncbfr1rle9HLAYtAh51SD+b6pC12z/n8Bl7d6bfnVmRmqgTPor9zsfWGueBZio=
X-Gm-Gg: ASbGncs5XR66+/svYYxZpz8JZ5GAx7JiExQmXdlegmHtYhss3xBTPcgjZAltT3WTLoQ
	iWX0q0mR7qFjib+irVBaGPIGksGnazq0xlUgWL02PLghm914ZSt31Fw5UgAZr9d4MXaMSnfBOIQ
	kJEgLDcuQCoyJkXGEPp6hq6Es+1KRKN9NgIE+NeQ18EI55xT4gj4EomCY+hm/7yhgy2IKIUcsSL
	SkHSWlb9LgGJQosovng9jwIAgWenW63K1vUX88srTuzlCvr1+qLYVaGG8oypgN8
X-Google-Smtp-Source: AGHT+IFYrXFMGnhjQ3bQDb7oI+kO+vAQWTCO7iUyJKhslsY9vA02Ya9MFO24iaLirmiV7N9WURYCMA==
X-Received: by 2002:a05:6512:3b8d:b0:53e:395c:6887 with SMTP id 2adb3069b0e04-5408ad7f875mr4185848e87.2.1734396038601;
        Mon, 16 Dec 2024 16:40:38 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54120ba9ab2sm1009122e87.74.2024.12.16.16.40.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Dec 2024 16:40:37 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 17 Dec 2024 02:40:26 +0200
Subject: [PATCH v7 04/10] drm/bridge: connector: add support for HDMI codec
 framework
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241217-drm-bridge-hdmi-connector-v7-4-cb9df2b6a515@linaro.org>
References: <20241217-drm-bridge-hdmi-connector-v7-0-cb9df2b6a515@linaro.org>
In-Reply-To: <20241217-drm-bridge-hdmi-connector-v7-0-cb9df2b6a515@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=6797;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=oRt1uc2dMf9+pijMkP+eCrRG9ChsIEKJSkVSymmIkws=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ3rCicop/Y/Omi8IsuboCzqw982my1pzWO9vL/VREtwjd
 6NhZ1BGJ6MxCwMjF4OsmCKLT0HL1JhNyWEfdkythxnEygQyhYGLUwAmIi/A/j/KRUnowBerA/qn
 TIV+LpBlndnK1Jdgr+gQ9KjfS81i2sqLvbxfNWo1t1ouzmWf0lTHfLo+dPsvpyC73qXNjfUyzEu
 D9hzj4Oy9nKUwRbnNLjJkn1n6Gz7zdl19CS6W20XK8vvjKzUnLm9sfzbjQEWF9sSzGcKM/28fZg
 l6V/Jvnx/z+cYL7BVzq3PlU11r7pya7K5i9mhHNtcX/Yx3R7t2Vjqnf0/y/P1k7+TqWsWy39+DO
 6zYZIKm7J12T/7DNS4e/27ThJazLt8580LfHZdiPCf/ovp2L8vl9RoSZRHfJmjsq2tWe6yyyODm
 qUV2wS1JMyxs5OZpdQV/N8r/1m13bVrz9q1MU43O1YkAAA==
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Add necessary glue code to be able to use new HDMI codec framework from
the DRM bridge drivers. The drm_bridge implements a limited set of the
hdmi_codec_ops interface, with the functions accepting both
drm_connector and drm_bridge instead of just a generic void pointer.

This framework is integrated with the DRM HDMI Connector framework, but
can also be used for DisplayPort connectors.

Reviewed-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/display/drm_bridge_connector.c | 98 ++++++++++++++++++++++++--
 include/drm/drm_bridge.h                       | 38 ++++++++++
 2 files changed, 132 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/display/drm_bridge_connector.c b/drivers/gpu/drm/display/drm_bridge_connector.c
index 512ced87ea18c74e182a558a686ddd83de891814..be46d2e7cb5cec262ca5dd6f42f8f31b0187a0f7 100644
--- a/drivers/gpu/drm/display/drm_bridge_connector.c
+++ b/drivers/gpu/drm/display/drm_bridge_connector.c
@@ -374,6 +374,75 @@ static const struct drm_connector_hdmi_funcs drm_bridge_connector_hdmi_funcs = {
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
+	if (!bridge->funcs->hdmi_codec_audio_startup)
+		return 0;
+
+	return bridge->funcs->hdmi_codec_audio_startup(connector, bridge);
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
 /* -----------------------------------------------------------------------------
  * Bridge Connector Initialisation
  */
@@ -473,7 +542,9 @@ struct drm_connector *drm_bridge_connector_init(struct drm_device *drm,
 	if (connector_type == DRM_MODE_CONNECTOR_Unknown)
 		return ERR_PTR(-EINVAL);
 
-	if (bridge_connector->bridge_hdmi)
+	if (bridge_connector->bridge_hdmi) {
+		bridge = bridge_connector->bridge_hdmi;
+
 		ret = drmm_connector_hdmi_init(drm, connector,
 					       bridge_connector->bridge_hdmi->vendor,
 					       bridge_connector->bridge_hdmi->product,
@@ -482,12 +553,31 @@ struct drm_connector *drm_bridge_connector_init(struct drm_device *drm,
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
+			ret = drm_connector_hdmi_audio_init(connector,
+							    bridge->hdmi_codec_dev,
+							    &drm_bridge_connector_hdmi_codec_funcs,
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

