Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E73B442040
	for <linux-samsung-soc@vger.kernel.org>; Fri, 22 Nov 2024 00:47:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732236473; cv=none; b=PVWg/L8UR9uH4+7Iq7jEK5Q3zHz1QFRZE8yw4Zb7HyeKkH0o9WdQOp4VrDUBp1WhQVlnaOhT3qBkKGmJIws3LgyDhPrmlB21ji7iqUpXyBoSlSyzcKNjziOBEnYlLBGraq5F5s/IHIFtITeZjFA3mIQfv8NizvUEEeXK/48MDnQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732236473; c=relaxed/simple;
	bh=VCAvQVMxBhx8BnYWztLsVnSCZi3RzfwM/RTfomnZ9hc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CHK6XM6r07roxuRRv5ueQ6T+soLGEw14SqZIKNVOHTiwx7uGctZvpE40zuCqDNw1Dk8AA/XR7DRHYWw6suxMgEMlNHjUSiHpbh/+kHrzNcsNLTj5CWo4jEGSLe+hEHwQ37vYa1zDaW7DpQxUupTQP1L83KxINcZSpFSFXEjkF60=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Xlxe3qWq; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Xlxe3qWq"
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-2ff57619835so23796231fa.0
        for <linux-samsung-soc@vger.kernel.org>; Thu, 21 Nov 2024 16:47:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732236470; x=1732841270; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UmsNhbcOu0CL1PS3KGzwEdaRMJlXKDzwHWxwdzXZd0g=;
        b=Xlxe3qWqjZOWlyXKbA97ZhlDhPK4dIutvAZfhCwjBoK/mLuDDv9HNVoEeutS4aFtmk
         gBXJYM8Mc+U0bSBTr429vgP8ZD6m9B8psqLkGtxqnQueSb7umRMg+RTeDGXgKZfUrth3
         PEGiNcHr7XuYNMtOOFNaau3d9kg/nfFITd3fPk1diLZqrgGfNyREsQIhtmOgxBakYOgc
         DcJE9VmhcgKuJ0drlRuJEYueymO/tc8qnIYOe5rX4vwFW7FL9H6OQfy2g501lpqnJT3N
         UNJ3zXgnaOiL+mRQiRqz6Zhv6cbzWWRTk2saHI2o/Wp5AmIBUrjx3uWa3TFlx5+mEQN7
         FHuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732236470; x=1732841270;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UmsNhbcOu0CL1PS3KGzwEdaRMJlXKDzwHWxwdzXZd0g=;
        b=ncDDmLL4tBs7l8pz9JJ8bxdPafzzJEfxYBJNSdZa58j3gp4chmXFJ4hMsLS9pishCC
         +/BQfVRx6p5kn43c00aKOtMj1LmWjN2YYYt8ChMvf6Bji1PK08JK6JuzSNe4zZ17xx1u
         OyJz5SZwsg1JjedRN2XEurS4+KJspYeBVfbxXbDIZzNlTqqHjfDBCpiga455OWp1JUE1
         z4DtfPRnaaA9YY9zkylQJy1jNl/PBz8DGt83Ay2AxNGmppb2LMlTmRuDs++ALk0q9LPq
         bHZtYdNBtCbSvehBohycBVrE9a4SEgBxcwS8enKE00zrVfXgbuGSnevSc6TOtIKOpH/u
         C1aw==
X-Forwarded-Encrypted: i=1; AJvYcCWLo+hc7aC830XJ0QXcqvoN3zhWNwQBeVRcDXh0oFdit3zm5J0Ou4xstlpNrGAcMK7dZ4XCF7nmtGSBiVrXYJON0w==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyq9GZcNgZN3ZKMHu5QqLMpgXjJqTOmOCU8FJhuYafNM9zrcGRB
	AeC6EZ+Fm126VdyhRnzvzcAnQTFB35hBsgVN/aAxtBJB/9mbJrnxda/lnaMV7cg=
X-Gm-Gg: ASbGncvFeyPD9NuB2yqSE2mgTRMYRC4S1xVrlEQZpxZUeE7g/gyAf0u8wqG78Kww55m
	rI8Mn8p2E1/l3lOANlqNkY7DPlfSUn7zLSLWuKt1chEgftAVZprbDpRtw2A+97sRaprz2OGj4Eu
	WCpys/xTrbE89mPvNjFPjTItqvYWwIJY7JW0vjs9aKk9xvzG2QaBeSohzvZX9VGC4uFJd2m9fNw
	MucOd6Gykf9yZ9CUR587YzlDsPTnFJm6Wk2H9EsB86+TMBMnJSw0ryCMw==
X-Google-Smtp-Source: AGHT+IHMUBebaip5YS2333T99HLNYNQnqajAn6gIrSEoon9GZQlCjBJW4sy6ZaybDfZqPdwcSk1J5Q==
X-Received: by 2002:a05:651c:2122:b0:2fb:510c:7203 with SMTP id 38308e7fff4ca-2ffa4d810ffmr3580851fa.3.1732236470136;
        Thu, 21 Nov 2024 16:47:50 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2ffa5375caesm1083071fa.85.2024.11.21.16.47.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Nov 2024 16:47:48 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 22 Nov 2024 02:47:34 +0200
Subject: [PATCH v4 4/7] drm/bridge: connector: add support for HDMI codec
 framework
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241122-drm-bridge-hdmi-connector-v4-4-b4d69d6e3bd9@linaro.org>
References: <20241122-drm-bridge-hdmi-connector-v4-0-b4d69d6e3bd9@linaro.org>
In-Reply-To: <20241122-drm-bridge-hdmi-connector-v4-0-b4d69d6e3bd9@linaro.org>
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
 Raphael Gallais-Pou <rgallaispou@gmail.com>
Cc: Jani Nikula <jani.nikula@linux.intel.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-mediatek@lists.infradead.org, 
 linux-rockchip@lists.infradead.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=6723;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=VCAvQVMxBhx8BnYWztLsVnSCZi3RzfwM/RTfomnZ9hc=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnP9So9qMT3ZtFSACzG1F69b6sWsU/NKcanhYPD
 U7fAUazNZuJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZz/UqAAKCRCLPIo+Aiko
 1aswB/4o4XWFPj5i22aq4AhbTDk7K898EseN5rIUmg+inr5nuvgvyBw6gxjBEBD+i3qMV6QRQdN
 NXPyJA55z/eEGXBv018b2hA6dwtlEtYfUDyA8DQDSxffIrlNJRhADyNex8/J3VIJ+rL1MWRk2bs
 6Gy8KMfrHyoUepjN5cD2Qq7NbNJWKL9hOXZS28PsQ9qleYId6mE9a7aGMEYAAEMnD31lazAJdcq
 Cd+2IzTdQoEdzzwFQ74JZgBeVPH8Ku4eT/unWo6xRSeE38v5B2+kF1/x4QK1ZrQf/KRQPvPgNkf
 XYdVNJCDdKAYFPPPUZL13q8AYThzeeiLsgJULnY3xFaQgLgw
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
 drivers/gpu/drm/display/drm_bridge_connector.c | 95 +++++++++++++++++++++++++-
 include/drm/drm_bridge.h                       | 23 +++++++
 2 files changed, 116 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/display/drm_bridge_connector.c b/drivers/gpu/drm/display/drm_bridge_connector.c
index 320c297008aaa8b6ef5b1f4c71928849b202e8ac..12ab9f14cc8a8672478ae2804c9a68d766d88ea5 100644
--- a/drivers/gpu/drm/display/drm_bridge_connector.c
+++ b/drivers/gpu/drm/display/drm_bridge_connector.c
@@ -20,6 +20,8 @@
 #include <drm/drm_probe_helper.h>
 #include <drm/display/drm_hdmi_state_helper.h>
 
+#include <sound/hdmi-codec.h>
+
 /**
  * DOC: overview
  *
@@ -354,10 +356,80 @@ static int drm_bridge_connector_write_infoframe(struct drm_connector *connector,
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
@@ -459,7 +531,25 @@ struct drm_connector *drm_bridge_connector_init(struct drm_device *drm,
 	if (connector_type == DRM_MODE_CONNECTOR_Unknown)
 		return ERR_PTR(-EINVAL);
 
-	if (bridge_connector->bridge_hdmi)
+	if (bridge_connector->bridge_hdmi) {
+		bridge = bridge_connector->bridge_hdmi;
+
+		if (bridge->hdmi_codec_i2s ||
+		    bridge->hdmi_codec_spdif) {
+			if (!bridge->funcs->hdmi_codec_prepare ||
+			    !bridge->funcs->hdmi_codec_audio_shutdown)
+				return ERR_PTR(-EINVAL);
+
+			bridge_connector->bridge_hdmi = bridge;
+
+			connector->hdmi_codec.dev = bridge->hdmi_codec_dev;
+			connector->hdmi_codec.i2s = bridge->hdmi_codec_i2s;
+			connector->hdmi_codec.spdif = bridge->hdmi_codec_spdif;
+			connector->hdmi_codec.max_i2s_channels =
+				bridge->hdmi_codec_max_i2s_channels;
+			connector->hdmi_codec.sound_dai_port = bridge->hdmi_codec_dai_port;
+		}
+
 		ret = drmm_connector_hdmi_init(drm, connector,
 					       bridge_connector->bridge_hdmi->vendor,
 					       bridge_connector->bridge_hdmi->product,
@@ -468,10 +558,11 @@ struct drm_connector *drm_bridge_connector_init(struct drm_device *drm,
 					       connector_type, ddc,
 					       supported_formats,
 					       max_bpc);
-	else
+	} else {
 		ret = drmm_connector_init(drm, connector,
 					  &drm_bridge_connector_funcs,
 					  connector_type, ddc);
+	}
 	if (ret)
 		return ERR_PTR(ret);
 
diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
index e8d735b7f6a480468c88287e2517b387ceec0f22..0ef9580ef6669f84327bdcb85a24fc83f76541bb 100644
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
@@ -859,6 +876,12 @@ struct drm_bridge {
 	 * @DRM_BRIDGE_OP_HDMI is set.
 	 */
 	unsigned int max_bpc;
+
+	struct device *hdmi_codec_dev;
+	int hdmi_codec_max_i2s_channels;
+	unsigned int hdmi_codec_i2s : 1;
+	unsigned int hdmi_codec_spdif : 1;
+	int hdmi_codec_dai_port;
 };
 
 static inline struct drm_bridge *

-- 
2.39.5

