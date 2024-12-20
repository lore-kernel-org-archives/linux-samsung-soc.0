Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 499FE229139
	for <linux-samsung-soc@vger.kernel.org>; Fri, 20 Dec 2024 19:17:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734722251; cv=none; b=CuxZTKmSvw3DWqPQ7LD6fkP48jUOLSNi/2KNqgbYG88Mm40xAwevBEvpveV1EZweEBp7FQJypbSuFCsF9ST2yrPUoK8ZTLylh6+OnwDfgBhRMrF/0wTdqls/B4T/Gg3Aa/3WwH69dZQQgvj79eqGGtURfIJjFSuGt+DnwzXDdK0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734722251; c=relaxed/simple;
	bh=XEE5uVlLO0AwRnx9UbXjwAPIkR4mEqLYJ4bDyDXWCRU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VX9RmCJwzACrCN+a+y7a8NiIf/tWJNCVVcMA50ocu6paZTh7nXa5Ls4simXBH+VxWu+Tpa6AwyQXVGRA+/98l685015zYLcHZqxVHxEG2mBdWP+KU/c7rZi0YFTsv/KUPviCyA+15FYmM2P6gQv4firCQjCZCAwuENgIvGcSOtc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=QB743iK8; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QB743iK8"
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-53e3a90336eso2430525e87.3
        for <linux-samsung-soc@vger.kernel.org>; Fri, 20 Dec 2024 11:17:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734722247; x=1735327047; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+6v2ksJ04CWu1mQJ1yZzlo4VCCiYvzQqRtU1InzFo7k=;
        b=QB743iK8KZVXeziXgIUmBRRk2JEOm+c0+wTfIPHTuUyUMOaNt2H5GmfUmTYDJi9quu
         gazMUGwSVeUp8qC8dr00aJmvnXq896LAbD40wI7SP/BbBNJhEI8TK450419BnowDQ1Zy
         8zEQGieEfrB9nNXXSNyQnTPXwhDP2u+xlySo8JFMWomH562+HbgC5aFsAKq8En7AigYa
         +XCFPeXGR1O8nxAExhk3PpHVpjlLpoWy+GAJlsNMiwZs/7bjfuitOG/4wqqpm31jnxIh
         lGXNElAKU9RU76jyVEHTkugvgQq5YsGs63RBf9PNm99sQ4RUWXBuNmXVNNI2Q+3fG4bx
         iwEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734722247; x=1735327047;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+6v2ksJ04CWu1mQJ1yZzlo4VCCiYvzQqRtU1InzFo7k=;
        b=tUCk2ysVEYT+1E64QufbxZME2xn0GvQwX8bv6DJG/pndggDHWr89g6cYrkBQxQTx87
         iPxzRBUufpXgFdzIppDf1duuF+KkDXQk/aJP7oWIcA7kSc+X3AjLY4phD9q98ejXUu4W
         APd6h6bTTBrHzvkGnVdN/ZSfTpWTrpc5Bf8M+uLU1bwUbpm/rH3aH/j5sqBwPCxprq18
         KQS9PbnDX8M312iWkigWWqxn+jtNthKJ0yRbPmwXuvKJJ0PjHZVZoHoC3kdMVCgTfH9I
         gjhN7XMFBh+j88WS/EjR2SZj5hjF0El5TBVas4cATICP+LzefE/S8OGiqgjjcyaXPZVb
         bi6Q==
X-Forwarded-Encrypted: i=1; AJvYcCVQWCAeoQvfAAA4bpqITgjA9ls242MeLuVfPzHKIPOeOdQas+3rJnD6s/SCDyeo4a0SKp0zbse72rUFGvMGXDXWfg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0Qr1KRZSLGugfdqDaaPwh/uMOO2dF6xh657uWDOABBzkg/MIH
	cT+/5c4en8zJ/L8JZy3FCBKlr1pTzAMzL245x0TVS/DqnO7YyjYJCz+3TCdTqoA=
X-Gm-Gg: ASbGncuSV8yadSB1/hBVAuoZTE+N8RFn36xmxfJmWJ22oWDsLcu4TlQLVYV7oOf4f7o
	XeL5rdsP5KZ5JX73xKiqkp4MOsOquMmo0hO5TZDqaNVmdZMqVFc9yq4qoLEA36B3rWX8N1XDZLo
	C6nKogx/kmcBuEkuq9hhqk42USi6hDmrCc/yza1m/OaRBTa7RdTTjxuLLScDxdMX5Mp5brUIa6c
	KkraNBNJ92ggjBpfWV0fa2UFM8sx+5Z1rIFQep32c/WYTrYwopB2Jl3KITvdZwm
X-Google-Smtp-Source: AGHT+IHe0mc2T0S/fidLlcXnIvV7arb5jH5l4ZSKmlo5D0G6qA4hbXh5msEHs+cmKpxC6EOLciu+6g==
X-Received: by 2002:a05:6512:4019:b0:540:202f:4955 with SMTP id 2adb3069b0e04-542295603c8mr1276517e87.46.1734722247275;
        Fri, 20 Dec 2024 11:17:27 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54223813877sm545141e87.149.2024.12.20.11.17.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Dec 2024 11:17:26 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 20 Dec 2024 21:17:07 +0200
Subject: [PATCH v8 10/10] drm/vc4: hdmi: use
 drm_atomic_helper_connector_hdmi_hotplug()
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241220-drm-bridge-hdmi-connector-v8-10-2399dbae2990@linaro.org>
References: <20241220-drm-bridge-hdmi-connector-v8-0-2399dbae2990@linaro.org>
In-Reply-To: <20241220-drm-bridge-hdmi-connector-v8-0-2399dbae2990@linaro.org>
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
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnZcKve9DZuQ8ppU/Q/ZnyEt45kRCo+xjVXVr/0
 f2RRu93maOJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ2XCrwAKCRCLPIo+Aiko
 1eW0B/93izm2Wfmdhsv3zy3rGU9m1u1l5dcOmfJb35f/JiJzpMofuBUPhBiSOWvd/xJyc4tPmAi
 V80XUFJHu877in1Juq8fESbqqMCPvLTEDfMXFnmUvu8oboli6HpOqnnb6g9JhbJvNtL6HsDxvZt
 KgZFkLtZeGCpHWBDeaWXihbv2a7VhnSpusAa0AcqSAdlvM9psDa1JF8yYo3tkqxTeRODSb+QDKu
 l9biQtscdPSlOgu/xKywBpVtaNFC0rbQj12YLxzL/BOf6Q60quSYWiwXp4pC/0A2NjFTe9Bby7o
 nutFS8MabwTox6OJ+b76xLxzmyaD1PeBBPIoGgP5pBsG2cop
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

