Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0085200139
	for <linux-samsung-soc@vger.kernel.org>; Fri,  6 Dec 2024 10:16:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733480211; cv=none; b=X3CBn9E7VJrBAvD89H+f+xMGKhTWTks3aThPAKaOUCtotu7PadXhtLxoXmts+oxK9na3GsKt7dV7JXDK4cX08rUO70rtJfcwNWTzKDJT6UMOWtIJIEoznDLgF684+aClmO9w4XVoc7tO4P0nz98EpAK6KqWWhprO3hno4VLEpvk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733480211; c=relaxed/simple;
	bh=mf+Mbo35eir6B+rLArs//796iJiX64HF7YQK4dBg7Bc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EXLOnsrCA/2JBUJIBDaVabRE1jo82gw3iZt8/JZUQtXK/oymSt/Db19DZklAJMqMHhV9vuwn5FQb0TKtBxznnNk85cxdAvs3Au41hgoGHFSTT/xGFjJJEVuIEy8ZubvyvuBQmnx2vnguc1S9gTCHQcmHxrmSey8Ym02fNbwEJXI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bhjs0qV7; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bhjs0qV7"
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-53df6322ea7so2196650e87.0
        for <linux-samsung-soc@vger.kernel.org>; Fri, 06 Dec 2024 02:16:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733480207; x=1734085007; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XdpsanGAJq/HJAcg8LOfnw7m4WhAfgPQTWEy7/V+0WA=;
        b=bhjs0qV7oOhBS6EOCUhMvAuCGFUKJ+1sLHr7K/zyAFidF/OA99ZiC+DJLJW4WOaZ+p
         MJ4lPmGBPgluTr0FjZtcqI1ZkzZkEwFABB9jKECLjIk4xGZM0sZHR+mpmBzRBHuB6BGD
         SERUfruYSd3yqidIzm7WFR8NCv3HUTg+m8G0vGXKdE5JFENBX8zDGOskZbuslugIU0Dd
         2j8NkdOgqjD4MLpHcVSO9k29lW58GgUhraYKkLVHG1s9LUYIGljSMf+fkaGBA3wCU5xC
         NhhnGmZMA6IgMJrvm8RnboeR7hiK2zANzK6iTMExwpq32I1IWvHggY1UwJDcSO8mrr/o
         8YAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733480207; x=1734085007;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XdpsanGAJq/HJAcg8LOfnw7m4WhAfgPQTWEy7/V+0WA=;
        b=eX8Cipt4dGRkEDRfAZ6rtc8ElDCr3WtRzFfKjQtcaCQg4TjvaSHFPXLXTwlqfQF+Ec
         Wj2KnreOp+e3dDpUnhruV8m3RlUWpfp3521bpcc7ji8IzN5rCuP01SNFu7EY6V5bMmR+
         D8ndQoAkcY8Mk5EN/SGEkLZ6j9O/XtSqDpriBXFGv5J0m/8nkunSzl5kUUd+qsh84jA8
         TbmZWjY7ek/iRTR1roJ3P8yvOHgI/5JD/xdUSBfRaoh0f+rJK330MxKJw+iM8mt+nuE8
         LNCXbiNqUJYT2yF4LgY0evwA2BCIkURnmIkeGe/GdAMsk8t8TlUeBPnrbwSx5HpI+C9E
         7xzw==
X-Forwarded-Encrypted: i=1; AJvYcCUqRufVDzR+z/pQ/20B/AixbA4oj+ZByWEeqRepd3yWG4WRCYjqvcqOHilXA3/ZwhCaMh7RqOIhbcJg+tojTESyDg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzjKPOj6GdAm+zz7buqO9YYm9kd/ZFx0veBQ8Fv4D0wKBoF4a0o
	KKpCJOa20GEljd7DDot3c6YAN5Kz5tja7AkotQjG7XRg9obdJXUTpekV4kcyWq0=
X-Gm-Gg: ASbGncssEI9LOZi/jNMnlY0hUrgb2LI/M42X2xP6EK/UypX+wDDVx3wh4eqlMoQT7j1
	M/BPphQoY/AXP9P+f+eNlT1/6D6dF/UArXWpSyphSiKKjrcpFSSNCKn3V43fAxT6ssiEAKqe8O8
	aXxcIu5wukWN+EMWqzjQMuPvsDinFFuhN6ZeyWkXVBzZd6A+nH0jR+U3g2/7IQkCWMKao2qV/Yi
	RP6PGcVvkeM7tPi1pvk9gAcV0VoLh3UahyZ26uJwAQcAUompKJRziqO5w==
X-Google-Smtp-Source: AGHT+IFkrbYIrOOX+notTKc9sLOnekf4EyYqfJ1UPx3hlsMd+eSwOGD1rvbmH6UCcVPjOPfN3YJGzQ==
X-Received: by 2002:ac2:5212:0:b0:53e:2ed9:8122 with SMTP id 2adb3069b0e04-53e2ed98271mr483402e87.22.1733480207015;
        Fri, 06 Dec 2024 02:16:47 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53e2294738fsm462355e87.52.2024.12.06.02.16.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Dec 2024 02:16:45 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 06 Dec 2024 12:15:55 +0200
Subject: [PATCH v6 01/10] ASoC: hdmi-codec: pass data to get_dai_id too
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241206-drm-bridge-hdmi-connector-v6-1-50dc145a9c06@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=5692;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=mf+Mbo35eir6B+rLArs//796iJiX64HF7YQK4dBg7Bc=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnUs8IaYJW+k5SE3hHwYqHHBuqemef33RuRKCYf
 kdE0NK2gquJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ1LPCAAKCRCLPIo+Aiko
 1bSBCACCtZjKIQS+Bj+44o3OJdoyxZmYPBE6MN//iugAoMcK5In7DBzfTnazsoUgTXTlJV+KBzs
 K6VspCTgwjXkFNiH18fKKUpEoIblZrZeBNA54jsgl/75JHwhjlILpGNMzV0lJBIo8lBXgNRV5eE
 E06RaRtbicWAG/0OLMg6mHDo84Mrjz+ZkZUuGHOJUDN/Ssh5ykbFVbytxek+cFeC9IPAdQkmGw2
 pRkjnWyIDW3lVFvTJWIm5m767qmw/GNwPGZNllOJBhOkjd0rWVf8PyVasjzuZE0D7sQ1jypZYWF
 b5EcXqqIdOsFD4zZYm5ADR/o1EstOZMJ740FO/kps0HNPO//
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

The upcoming DRM connector HDMI codec implementation is going to use
codec-specific data in the .get_dai_id to get drm_connector. Pass data
to the callback, as it is done with other hdmi_codec_ops callbacks.

Acked-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/bridge/adv7511/adv7511_audio.c      | 3 ++-
 drivers/gpu/drm/bridge/analogix/anx7625.c           | 3 ++-
 drivers/gpu/drm/bridge/lontium-lt9611.c             | 3 ++-
 drivers/gpu/drm/bridge/lontium-lt9611uxc.c          | 3 ++-
 drivers/gpu/drm/bridge/sii902x.c                    | 3 ++-
 drivers/gpu/drm/bridge/synopsys/dw-hdmi-i2s-audio.c | 3 ++-
 include/sound/hdmi-codec.h                          | 3 ++-
 sound/soc/codecs/hdmi-codec.c                       | 2 +-
 8 files changed, 15 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/bridge/adv7511/adv7511_audio.c b/drivers/gpu/drm/bridge/adv7511/adv7511_audio.c
index 61f4a38e7d2bf6905683cbc9e762b28ecc999d05..51fb9a574b4e28450b2598a92e2930ace5128b71 100644
--- a/drivers/gpu/drm/bridge/adv7511/adv7511_audio.c
+++ b/drivers/gpu/drm/bridge/adv7511/adv7511_audio.c
@@ -204,7 +204,8 @@ static void audio_shutdown(struct device *dev, void *data)
 }
 
 static int adv7511_hdmi_i2s_get_dai_id(struct snd_soc_component *component,
-					struct device_node *endpoint)
+					struct device_node *endpoint,
+					void *data)
 {
 	struct of_endpoint of_ep;
 	int ret;
diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.c b/drivers/gpu/drm/bridge/analogix/anx7625.c
index c036bbc92ba96ec4663c55cca091cd5da9f6d271..943dd3cf57738d8c232d57d793756eb2e3bf1c5a 100644
--- a/drivers/gpu/drm/bridge/analogix/anx7625.c
+++ b/drivers/gpu/drm/bridge/analogix/anx7625.c
@@ -1952,7 +1952,8 @@ static void anx7625_audio_shutdown(struct device *dev, void *data)
 }
 
 static int anx7625_hdmi_i2s_get_dai_id(struct snd_soc_component *component,
-				       struct device_node *endpoint)
+				       struct device_node *endpoint,
+				       void *data)
 {
 	struct of_endpoint of_ep;
 	int ret;
diff --git a/drivers/gpu/drm/bridge/lontium-lt9611.c b/drivers/gpu/drm/bridge/lontium-lt9611.c
index 1ffbe473e4103dfc315a8cd3571e9407bf518797..60b7305c0fd1935e35742713c78937392b7faa79 100644
--- a/drivers/gpu/drm/bridge/lontium-lt9611.c
+++ b/drivers/gpu/drm/bridge/lontium-lt9611.c
@@ -1057,7 +1057,8 @@ static void lt9611_audio_shutdown(struct device *dev, void *data)
 }
 
 static int lt9611_hdmi_i2s_get_dai_id(struct snd_soc_component *component,
-				      struct device_node *endpoint)
+				      struct device_node *endpoint,
+				      void *data)
 {
 	struct of_endpoint of_ep;
 	int ret;
diff --git a/drivers/gpu/drm/bridge/lontium-lt9611uxc.c b/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
index f89af8203c9d67cb05b629b27f66cf996baedd16..77bc09b875323d88f7346db9d24ea89a355c99b1 100644
--- a/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
+++ b/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
@@ -522,7 +522,8 @@ static void lt9611uxc_audio_shutdown(struct device *dev, void *data)
 }
 
 static int lt9611uxc_hdmi_i2s_get_dai_id(struct snd_soc_component *component,
-					 struct device_node *endpoint)
+					 struct device_node *endpoint,
+					 void *data)
 {
 	struct of_endpoint of_ep;
 	int ret;
diff --git a/drivers/gpu/drm/bridge/sii902x.c b/drivers/gpu/drm/bridge/sii902x.c
index 9be9cc5b902594ebe6e1ac29ab8684623e336796..f0be803cc2274ca2199ed7661cf752b0a91434b6 100644
--- a/drivers/gpu/drm/bridge/sii902x.c
+++ b/drivers/gpu/drm/bridge/sii902x.c
@@ -815,7 +815,8 @@ static int sii902x_audio_get_eld(struct device *dev, void *data,
 }
 
 static int sii902x_audio_get_dai_id(struct snd_soc_component *component,
-				    struct device_node *endpoint)
+				    struct device_node *endpoint,
+				    void *data)
 {
 	struct of_endpoint of_ep;
 	int ret;
diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-i2s-audio.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-i2s-audio.c
index 26c187d20d973dc65801a3baa59ecf57d20072eb..86c412e9cbc80bb82bad5db3aa0263a7acd9c2d7 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-i2s-audio.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-i2s-audio.c
@@ -148,7 +148,8 @@ static int dw_hdmi_i2s_get_eld(struct device *dev, void *data, uint8_t *buf,
 }
 
 static int dw_hdmi_i2s_get_dai_id(struct snd_soc_component *component,
-				  struct device_node *endpoint)
+				  struct device_node *endpoint,
+				  void *data)
 {
 	struct of_endpoint of_ep;
 	int ret;
diff --git a/include/sound/hdmi-codec.h b/include/sound/hdmi-codec.h
index 5e1a9eafd10f5d4f831abbb6f4c0fff661909584..b3407b47b4a7878532ecf3b08eeecd443d6fdb07 100644
--- a/include/sound/hdmi-codec.h
+++ b/include/sound/hdmi-codec.h
@@ -105,7 +105,8 @@ struct hdmi_codec_ops {
 	 * Optional
 	 */
 	int (*get_dai_id)(struct snd_soc_component *comment,
-			  struct device_node *endpoint);
+			  struct device_node *endpoint,
+			  void *data);
 
 	/*
 	 * Hook callback function to handle connector plug event.
diff --git a/sound/soc/codecs/hdmi-codec.c b/sound/soc/codecs/hdmi-codec.c
index d9df29a26f4f213a30a2ebcdb63a593f9cf4b901..f536ca60e162dca6b50b37854ca6de2c114bc2a1 100644
--- a/sound/soc/codecs/hdmi-codec.c
+++ b/sound/soc/codecs/hdmi-codec.c
@@ -995,7 +995,7 @@ static int hdmi_of_xlate_dai_id(struct snd_soc_component *component,
 	int ret = -ENOTSUPP; /* see snd_soc_get_dai_id() */
 
 	if (hcp->hcd.ops->get_dai_id)
-		ret = hcp->hcd.ops->get_dai_id(component, endpoint);
+		ret = hcp->hcd.ops->get_dai_id(component, endpoint, hcp->hcd.data);
 
 	return ret;
 }

-- 
2.39.5

