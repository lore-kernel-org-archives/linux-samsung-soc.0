Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B64AF192D86
	for <linux-samsung-soc@vger.kernel.org>; Mon, 23 Dec 2024 02:59:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734922769; cv=none; b=sZJBVzS6oRUEBmqrHMvR03s8WRgzTYREILkQzVO1wuDqqcyn2EiOk80midnqwvKDqt6Gi4G/nwny2MEryEqwbj1PkT28eEERajdVzmenc3hhTEkZq1AZwo2FvAQT6hfZWuOeGMhpVzCo1pvt99DvlD3A8SvjdDDxhz5kzxDvztw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734922769; c=relaxed/simple;
	bh=XEE5uVlLO0AwRnx9UbXjwAPIkR4mEqLYJ4bDyDXWCRU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FWOgHrK35CtFUhAkRwb96Ia6xdypKfD2+KBcJcFn3ty2YwsdzgcuDB44rDb/JSq9dlE9sLCINNDOzFIbuyyIuAgk9d7kQLNaSiBWuTOSIUcp0WToj9DHwg45h/mzhCLTj4nenoDJc/Lh8sejXLNCEj/LYAJ8rvubRfJNnRRB+Yo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=g6b67nQQ; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="g6b67nQQ"
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5401bd6cdb4so4216641e87.2
        for <linux-samsung-soc@vger.kernel.org>; Sun, 22 Dec 2024 18:59:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734922765; x=1735527565; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+6v2ksJ04CWu1mQJ1yZzlo4VCCiYvzQqRtU1InzFo7k=;
        b=g6b67nQQX8SJgG9SiA2LaQKdednzs0YBs2n0JfEKislL2rq6BYQBQqKwhx9blYxtf9
         brn3KD/NkA41LHX0oHQpd70+LSX3V/eKxQlZIKF+ndih+r9L8za2p9tm3FyYkanfjn5S
         PE+zVpI1WCoyLaNeOTYpSh35SQfa87Os/sPcU1VK9ZwBMW2u1KPZF2kR3f/PyNSu2RQB
         9VhYMWFEihTTpzFn/8acYF+1W6x0CbcPofEdhYmrMW+gBkaugF8thYy6ur1jIGkuMOsW
         4lZFMg90NID/XsY+4n4Hqij+ADTv7jRGldb7+UtuD8245+oA5tdGcazgeMUQzTeiXB0n
         yRug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734922765; x=1735527565;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+6v2ksJ04CWu1mQJ1yZzlo4VCCiYvzQqRtU1InzFo7k=;
        b=rR1asLXa0S/RDeOH1YyN9ehNK/KeZOeff69F7KEQKIb7WnpIjXMg5F2UdpXOLFy7i8
         xRWOmT8a/1heqRndqjVr8FSz+3NWNVtLvuhug3YcW5QFbDT915oU8sIzg/dBT2HIh4p0
         JoqF79Z7hYiUWT87Pf/9/xPUunbcIkGKozoLFVq32Ioltgae5oJdBOqtu+i8kKS3sUvW
         uVyuV8NJ/5akxCKgNLLNDh7EgR0QOf//djrHdCFHvY+uS2epLdIpXh7W/rjULlvhBnXK
         dS+xOUGZCy0eIiDBCakYoZBSLXIumwsEAqzYV8Q75lCspJ0Ji2i1MZTmzpU08+PnYpYA
         0BJw==
X-Forwarded-Encrypted: i=1; AJvYcCUCJe5QzTCmrSaBSBlFjqZgSQWT+wOD5kDiHuaRhWgsSjADn719EW/4l+/MeSbEJ8HhBGkxLUItFSjWmT6PG/CNbw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxXvpVTMCAEdst57pglUM21tVXVFy19FSwazxQL6tZC+mwgfNvh
	YGRQHXBCO2HQyZECa8Kw7eNRwGfLSOERaHnPSyQYC2KqM/YMh527aaPQrZ8LUsw=
X-Gm-Gg: ASbGncsmN/FxCuknkj7ICayvcIBvTOK9S2aBGNAT34gpVnHzsjRQwfjLMMCspz+4I8h
	9rkGsb3LBRe/mDkQs1ClIuh3nCTWZEnlP7CB6RWg76XpkapQAJ8Pic1Kkt2/D7LUjetnNI0nXVe
	fccFFEJwD+Vc86ykBElvXUhDUa7hJReTtqd+kO5Qh0VL+R6hda4PKXnmSHOB7T3W5JposDXS3+R
	qh21/Ui214L7lwHLwLA77FsylRYNlErX1ZsLG4MoVNxltiOne1bgx7G6Dma3AKU
X-Google-Smtp-Source: AGHT+IELf7Q9dKbwaApXTdiac6rXIdbml/bGXuPDMlX/oPVs9y7YxdDq3vkjKfSAR1daoK1hDBNZTw==
X-Received: by 2002:a05:6512:e8c:b0:542:2905:ae52 with SMTP id 2adb3069b0e04-54229582562mr3253920e87.45.1734922764852;
        Sun, 22 Dec 2024 18:59:24 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-542235f658csm1124639e87.44.2024.12.22.18.59.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Dec 2024 18:59:23 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 23 Dec 2024 04:59:01 +0200
Subject: [PATCH v9 10/10] drm/vc4: hdmi: use
 drm_atomic_helper_connector_hdmi_hotplug()
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241223-drm-bridge-hdmi-connector-v9-10-6ce16bcedb8b@linaro.org>
References: <20241223-drm-bridge-hdmi-connector-v9-0-6ce16bcedb8b@linaro.org>
In-Reply-To: <20241223-drm-bridge-hdmi-connector-v9-0-6ce16bcedb8b@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1974;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=XEE5uVlLO0AwRnx9UbXjwAPIkR4mEqLYJ4bDyDXWCRU=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnaNHx7x+4SbLumBUmOEkbtu6Fr6hU1V56PPenf
 rTlgrJow96JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ2jR8QAKCRCLPIo+Aiko
 1evYB/9rPAzB3kkXRyr5OKaHMHSiShXf4rybV/gUkj3QflXjD9f8CPYW/cyNWoJQtSWoK8S9WTG
 Hfj6UgBsGVxS2w97497ZGuAlKy/qxgFdBiXqhOUD7TcjvPJwX/QX57ZzOuDajdo8WqeLrDtYU0s
 nxyhgsO1hqWEZ6EhXrJJQrwsgZWJyArs3jqtvSNURojm1mh3pntNVs0ZPYtB0DZvAeVNN+F3Iqu
 ftO2or9x4WGL8Bi2fIxxRaweVXdxK7nLNQH6PvvOeJnKAC1cD0oBV896Z9tP2SAFpG3WmCD4Pzd
 f/F/DTBdG0+u6dDWeil9xt7qN2QO/kPVNagQ1xbmxphKStOP
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Use the helper function to update the connector's information. This
makes sure that HDMI-related events are handled in a generic way.
Currently it is limited to the HDMI state reporting to the sound system.

Acked-by: Maxime Ripard <mripard@kernel.org>
Tested-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index 5282dd765cc9478361a705dca85f615015b12e8e..82eeb08c183420b000b351da1e05f9a47baeda90 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -383,7 +383,6 @@ static void vc4_hdmi_handle_hotplug(struct vc4_hdmi *vc4_hdmi,
 				    enum drm_connector_status status)
 {
 	struct drm_connector *connector = &vc4_hdmi->connector;
-	const struct drm_edid *drm_edid;
 	int ret;
 
 	/*
@@ -405,17 +404,14 @@ static void vc4_hdmi_handle_hotplug(struct vc4_hdmi *vc4_hdmi,
 		return;
 	}
 
-	drm_edid = drm_edid_read_ddc(connector, vc4_hdmi->ddc);
+	drm_atomic_helper_connector_hdmi_hotplug(connector, status);
 
-	drm_edid_connector_update(connector, drm_edid);
 	cec_s_phys_addr(vc4_hdmi->cec_adap,
 			connector->display_info.source_physical_address, false);
 
-	if (!drm_edid)
+	if (status != connector_status_connected)
 		return;
 
-	drm_edid_free(drm_edid);
-
 	for (;;) {
 		ret = vc4_hdmi_reset_link(connector, ctx);
 		if (ret == -EDEADLK) {
@@ -549,6 +545,7 @@ static void vc4_hdmi_connector_reset(struct drm_connector *connector)
 }
 
 static const struct drm_connector_funcs vc4_hdmi_connector_funcs = {
+	.force = drm_atomic_helper_connector_hdmi_force,
 	.fill_modes = drm_helper_probe_single_connector_modes,
 	.reset = vc4_hdmi_connector_reset,
 	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,

-- 
2.39.5

