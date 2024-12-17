Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79C2418E1F
	for <linux-samsung-soc@vger.kernel.org>; Tue, 17 Dec 2024 00:40:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734396035; cv=none; b=GCMCp3VqNuma2ycKbbK5OweT42e9KO25u/Y39qdaA5zoZpzxW0bY/NIbrlq+Pfil8jiSig/GQQoaXR4nz73Jpn9k/coX6Z24Pq1DfTyCuHjELDpfAoWMyRa2Y9cQyulU7m6SS4vCdyZmHHRZN0U+BqAU2PaATE2gss0TWQLC0JQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734396035; c=relaxed/simple;
	bh=WNxJPw3rN8QoSaOiLaqtgwQcUQnVr/fSlXdgMNDRgSc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=N36aACw+IzNRAgyAxIEFRTna4JxAFuc1EPL23dN0DYqbcnF/Sr4Q+PU90SIKeiLgJOF1XA4OKewSU5LBxs1CpM0Ej7V0Otdcsgo04O9eYL/VGnmPNvz/nJhd4SR1tDG5UMAViiDHo5pq5rp+zClv26/WHR30rd45K8yTsNgyRqw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=P58KhSVn; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="P58KhSVn"
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-53df80eeeedso4705363e87.2
        for <linux-samsung-soc@vger.kernel.org>; Mon, 16 Dec 2024 16:40:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734396030; x=1735000830; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SRWRciqYcfp6LVsVpZ1pOQMYwHQFKDTd0yUpsCVVwDs=;
        b=P58KhSVnZ9EA/ijXSh6VFdZJ/nmImzLaJByhAC11fTyDjDo9VrJAN1DJQEj2kpv+lk
         QoOIRfhNhfH4U1SpHOA5GiBzzq7hw9TaKLC/WdMUFa+eO3HFJ8d75iXGfPSeWjVGircE
         BuO6RtRjM170jb/ygwDob4ZZv2HPRxuElIje+Xmv0efRFwraP8+9B8CZNc4t0AH6k8vC
         +IKZ9APzkGZE7pil1OwyWDeSksW/BfF3DMvHDESG5Qvb4DXw3hyFQtUcj9MD3KVloCTt
         cvWcZESHBP0GhcMc5UflZbRCCoHQUwlFiNg5lo+9K8cvTNU/y8naaT76N09Vlc8m+EWg
         PWSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734396030; x=1735000830;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SRWRciqYcfp6LVsVpZ1pOQMYwHQFKDTd0yUpsCVVwDs=;
        b=I19q7duZql7DGi1TwDJyfTPt7zQd7XP34lB6luBFx5qNgFST0S7+EUjvhe4CaOdgTb
         vaakAzXp1WLaa1mfJjXtdC4/H7jP8Qns5lOqmdffQIAgQVf293DPwM1SIdcWZ1PhL220
         M5yYLRBZ5s8gH/kY/a09S2cUPgYV8GD8gTxUWXmhkmIh7UuGuk9i3He1phYJgMr7NLu0
         0vvdG0DIMH93i21Q5fogH6FVSX0aRYWJHfyuG4EtR6P4RAlT+hPkfL0BhMclTw3hX6uR
         q0Ofoz5ZTDCPt3Rx2Kp9TDh0j7VediHsOxoTCUzAQnVyUAwH0mY8/pGksRyZbUGsfXp5
         eq2Q==
X-Forwarded-Encrypted: i=1; AJvYcCW8pVjAWDUCv5uw8bGa3NvAENYFebmRZZVrekFhajoiCNj7L37gawnKa3Uc9EoWhBRfxOj/Grt/eYvd+UtW7OFLKA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzMyC1ww+6ZaYcXauShw4xl4dmHWW24wKL0p/+OjjGWx9hoEZ/q
	YtZsIYiRYcwMDoReWOoWJ80UxscWid+vN87RSJuaPChglTOE55eiaFZrySbf+Ac=
X-Gm-Gg: ASbGncvx+/clgxI26rXOT1msssq7eEhaPW56Lx43I0eeOja/ufFakOJyICZfl18B3Fx
	6kVP4iAxdAKiSJ6HTjZ1ADKhF4t7zWYXYAs87uPK7tgF1cpRscwncXZzLbm1lGnFPIeSm7Wh5Yq
	jnPDyZVupirg1dVN/wz3end/UhAEg9S8GIyg5+62bjRdRnSzAhoFRJhvWjGICZ3BYOtFwwVthTN
	admUcwF4BtvHsP+NOTv+zKXRHuYBYwIluZM6l0Tr80+aB0yYY5+z4PE0d71DRxs
X-Google-Smtp-Source: AGHT+IFEVL9/gmk5u41kyQWxRYG7YS3h/SXoQIsw9zZvnut7Pj6UKnx0tdi7DeO9H+LK10mw5qX8OA==
X-Received: by 2002:a05:6512:23a4:b0:540:2542:cba6 with SMTP id 2adb3069b0e04-54090558260mr4343724e87.21.1734396030516;
        Mon, 16 Dec 2024 16:40:30 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54120ba9ab2sm1009122e87.74.2024.12.16.16.40.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Dec 2024 16:40:30 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 17 Dec 2024 02:40:23 +0200
Subject: [PATCH v7 01/10] ASoC: hdmi-codec: pass data to get_dai_id too
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241217-drm-bridge-hdmi-connector-v7-1-cb9df2b6a515@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=5692;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=WNxJPw3rN8QoSaOiLaqtgwQcUQnVr/fSlXdgMNDRgSc=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnYMh4eNPg8d72Zxo1tiKfiMAIb9OsMZ5NxEgtj
 eXcTKeslbeJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ2DIeAAKCRCLPIo+Aiko
 1Y57B/4mKoHyoArNRLDdJ64GZgI2q0PsI4Ij1HTJt+/2pgZJ/0lHRRFXUbAbi5F7eFrp4yCfbjS
 WQKZ6dMssyXYheMl9eTW/snPHMZ/u3sd0EPl/BSz4biVLfhIyHUprnSgw3CQxW+V7g+C33yZ3FI
 gw0SSU+D/A/hIj8/R3hjGZPO4Ul0IhVsohyzkBsz6wbst0xRxn7frbQ2k3ST63LjEWSE5Vl2U/O
 hCF40OR7XYnez7jd/JmPCEv+9HniwiLS7PaJPWLhk59HrbpVvynCtDpeA4P+/CbRZHJuGDM+OsR
 LlDR0k9HfsyA7eTFE1vPgjioV33uP75fwEEzGhgK3iz87f3T
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
index 6238eabd23282d5f7e59a05d267737f40211aaf3..d65680d1bc8f2f27927b8a9d6926b72531791614 100644
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
index 74f726efc74613460a6eb9c41f0bbad2ab06208f..698a9a01783d28edc734b6932a7768978de65ffc 100644
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
index db9a5466060b663e88d58e85f24bf2d58d74a81c..f4c3ff1fdc6923eb7a8c0d8f7f92e7649c797d77 100644
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
index 127da22011b3235b049c38413e56d50414cf36fb..a02d30c0ba4221d7fee0eb50892ab4d8e8436004 100644
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
index f1c5a8d0fa90e2eb2ee488b6a5871b005f797ea1..2c903c9fe8052ab721445188fd2b75270a55f2b0 100644
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

