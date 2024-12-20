Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAB8E227BA9
	for <linux-samsung-soc@vger.kernel.org>; Fri, 20 Dec 2024 19:17:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734722246; cv=none; b=LMrp8NSyFUy8e0gkzH+eNTKvDmM+HWocu+XrgTis84sKnGbKTUXsGyxsu2CZC2FM0QKdNXelCSjEWiP+hMwPC1nc0dh6E0D46q0pbJoPI7S1yHbteY0AO7bocxB/OAgUu7uH7T4nOGQYayMbyPCb07hS/Lv9BF9FDNEZMEHwlks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734722246; c=relaxed/simple;
	bh=qie1G35P6Yl7cippcpWCMVmv6O7BDmJcfLKNOKKg6kE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FZmXLmT+GNOhsKnR+Y5ABkqUV1Q6THpPU7NMHuATa6dFDHULC3f1YECOfOwvszrg2awNCSD5jRnyUYE+2dXTRHAjoNFi+HAOgSCi4TDsNKvxs6mhbIiCB2CIOczRrJc47eP7LaPw3kFNSY+yfo1/cwBOWDHOVlQwLWQETeKK3LA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=XipsNkqh; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XipsNkqh"
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5401bd6ccadso2289373e87.2
        for <linux-samsung-soc@vger.kernel.org>; Fri, 20 Dec 2024 11:17:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734722242; x=1735327042; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hqnxj6s3/EgjVuNjxM9/sx/Q8vGKE4sDTiUqotmlFDQ=;
        b=XipsNkqhyzn7O+inhoOVmYZgLErEg//zGEpouIRy3mikg3OSUY/umrLs0YTf5yL7a3
         HYxqCQ7R9PhqQqhswFX5Eqj3bZuvLkCMCeB054aVqtXHHzqmnaOenK2x0gCtnqSNQUC8
         ArN0qDtXlTmEyhLtLYeWKz8ZeaNFh2NH3Twl+ZP3FzTHIIlMO+PHQzBjAWiwTOsp65+I
         WcA9FbE1aT8YBeqkxiOoAmzWeNgiMYZk006zFw/zl1SFzB9SRgSp8eRBUJnyVrY0yLJl
         dnn8TkVcfQ7cvpLhO+2Hiz06UGuehfh0q37efPT6m3a6eQH32YhHqScfOLfUxtr2N/BI
         nN6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734722242; x=1735327042;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hqnxj6s3/EgjVuNjxM9/sx/Q8vGKE4sDTiUqotmlFDQ=;
        b=nJyJsR86rMykTbzAe/ZCYoFkPcoErsFcznBqcKPv37jBLSlTshSQm+hOEsUUBgpFn3
         AWcSWhrvf/kPjn9Rls4AL0QP6kHVHzkM2x0xRKZ4RemIvgBmDXuSOO9p4T+tQcKdbVXq
         S/IvPOy18x4hZa537QtifHtAAZmJNC074UI5jtAX9dF6Uvkj47n4yDr8G8Q7I28HctwP
         uQS1jGNMYm0L870DLi1fIYXjA/drA370eyJhFa+xRWZQgskUrI3+75Oh9oRUjChdekrQ
         1x22q6RSxMSPXX6UeSpozuIPZIRwVm5ntFmPWhpeG1jzkDCtKcYl6qxktk+rt7tLFJFP
         Cxkw==
X-Forwarded-Encrypted: i=1; AJvYcCU3j9dkDbperx0e/3HxaHFsMuWKTyV20sZXCLv7S38ibwNZiUiaSDps2ashGrM63vNnIpYOru13RKKE04kXaAYncg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwEYibsY9r1YqXcR2X5C9/x2fF6h6UTdsv1L4Hemq8MY3/58snl
	4O0Io4ZNLg+KjCjd1dMD6jsEd8yh+Gv5mSyN80hBft7iGAFPONo+dDwbwGyWBgw=
X-Gm-Gg: ASbGnct/qK25HlH/XAYKZ4cN9cqxkKvGPUCKKIOkBxiiE6m+26KwLunurUSJxO1tAK0
	RnysdITcu0PSsDI18r+2FCAOPkmEjCfX0r5UZY+KSGqcyicOTrafdoWEIDOIDFaQqBLbjEqlD95
	fnomryB4+xdobxJz5vI8ONYTIo6CpWjOUbQVrDD2/GtODbjjbjnIJXVjyUykYldyPfwHcYhDHe2
	ffjznMhz+YLFFXfBSI+7mKOx7smTtB+fyOsrbnj5FFRAD5Lhp7v0GStWzv3fkx6
X-Google-Smtp-Source: AGHT+IEptTJIjjBHJb6drHS6Ssf3ip8D9nli87J1i3Tl5U5BIoRVUbAgr22Q8lEZaYRdhxbZ2aDt2A==
X-Received: by 2002:a05:6512:ba9:b0:542:232c:d3eb with SMTP id 2adb3069b0e04-54229530111mr1143607e87.19.1734722241963;
        Fri, 20 Dec 2024 11:17:21 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54223813877sm545141e87.149.2024.12.20.11.17.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Dec 2024 11:17:20 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 20 Dec 2024 21:17:04 +0200
Subject: [PATCH v8 07/10] drm/bridge_connector: hook
 drm_atomic_helper_connector_hdmi_hotplug()
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241220-drm-bridge-hdmi-connector-v8-7-2399dbae2990@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4313;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=qie1G35P6Yl7cippcpWCMVmv6O7BDmJcfLKNOKKg6kE=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnZcKvRQ1DyEvUZ1bVLVKWFGtt2tlzDFohZ6VEy
 cv513jnLgOJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ2XCrwAKCRCLPIo+Aiko
 1VZZB/48AgSV1kDPiMY882P+b8lEru7SsHx6YLD9T1fz/l553VfG8tGAZ4zSgd8lyhfFF3Ugvw4
 zy5oID9hdz885xTx+UUeywPsD2hrB/WzGlsawx1pwmKboE6XIU214KCydAEFuFXTAb1Ncd1P4T/
 TqQvi7thRLweENmH/lapmF6aDNJ74rfeJrrgZTzyf6rjNMkOzMvwFjg03adlbeISOAYcjf993ja
 6H5af0Us6KBcRMkdKLbmesZB0TGqYhynDCbOVjJid3zmoIDD35wUb/CdkzrFHTDQUebxUfzdD9x
 TPLhFJiPj9m/4tUNtSPH40RcFpTeoTCnjwALIZ68OmXM++JX
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Extend drm_bridge_connector code to read the EDID and use it to update
connector status if the bridge chain implements HDMI bridge. Performing
it from the generic location minimizes individual bridge's code and
enforces standard behaviour from all corresponding drivers.

Reviewed-by: Maxime Ripard <mripard@kernel.org>
Tested-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/display/drm_bridge_connector.c | 39 ++++++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/drivers/gpu/drm/display/drm_bridge_connector.c b/drivers/gpu/drm/display/drm_bridge_connector.c
index cc955ee008d843d73fedb891e97143a4168fd311..66e4ab81fa0c2717490193e896389757f0a903f2 100644
--- a/drivers/gpu/drm/display/drm_bridge_connector.c
+++ b/drivers/gpu/drm/display/drm_bridge_connector.c
@@ -17,6 +17,7 @@
 #include <drm/drm_edid.h>
 #include <drm/drm_managed.h>
 #include <drm/drm_modeset_helper_vtables.h>
+#include <drm/drm_print.h>
 #include <drm/drm_probe_helper.h>
 #include <drm/display/drm_hdmi_helper.h>
 #include <drm/display/drm_hdmi_state_helper.h>
@@ -180,11 +181,15 @@ drm_bridge_connector_detect(struct drm_connector *connector, bool force)
 	struct drm_bridge_connector *bridge_connector =
 		to_drm_bridge_connector(connector);
 	struct drm_bridge *detect = bridge_connector->bridge_detect;
+	struct drm_bridge *hdmi = bridge_connector->bridge_hdmi;
 	enum drm_connector_status status;
 
 	if (detect) {
 		status = detect->funcs->detect(detect);
 
+		if (hdmi)
+			drm_atomic_helper_connector_hdmi_hotplug(connector, status);
+
 		drm_bridge_connector_hpd_notify(connector, status);
 	} else {
 		switch (connector->connector_type) {
@@ -203,6 +208,16 @@ drm_bridge_connector_detect(struct drm_connector *connector, bool force)
 	return status;
 }
 
+static void drm_bridge_connector_force(struct drm_connector *connector)
+{
+	struct drm_bridge_connector *bridge_connector =
+		to_drm_bridge_connector(connector);
+	struct drm_bridge *hdmi = bridge_connector->bridge_hdmi;
+
+	if (hdmi)
+		drm_atomic_helper_connector_hdmi_force(connector);
+}
+
 static void drm_bridge_connector_debugfs_init(struct drm_connector *connector,
 					      struct dentry *root)
 {
@@ -231,6 +246,7 @@ static void drm_bridge_connector_reset(struct drm_connector *connector)
 static const struct drm_connector_funcs drm_bridge_connector_funcs = {
 	.reset = drm_bridge_connector_reset,
 	.detect = drm_bridge_connector_detect,
+	.force = drm_bridge_connector_force,
 	.fill_modes = drm_helper_probe_single_connector_modes,
 	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
 	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
@@ -276,6 +292,14 @@ static int drm_bridge_connector_get_modes(struct drm_connector *connector)
 		to_drm_bridge_connector(connector);
 	struct drm_bridge *bridge;
 
+	/*
+	 * If there is a HDMI bridge, EDID has been updated as a part of
+	 * the .detect(). Just update the modes here.
+	 */
+	bridge = bridge_connector->bridge_hdmi;
+	if (bridge)
+		return drm_edid_connector_add_modes(connector);
+
 	/*
 	 * If display exposes EDID, then we parse that in the normal way to
 	 * build table of supported modes.
@@ -368,10 +392,25 @@ static int drm_bridge_connector_write_infoframe(struct drm_connector *connector,
 	return bridge->funcs->hdmi_write_infoframe(bridge, type, buffer, len);
 }
 
+static const struct drm_edid *
+drm_bridge_connector_read_edid(struct drm_connector *connector)
+{
+	struct drm_bridge_connector *bridge_connector =
+		to_drm_bridge_connector(connector);
+	struct drm_bridge *bridge;
+
+	bridge = bridge_connector->bridge_edid;
+	if (!bridge)
+		return NULL;
+
+	return drm_bridge_edid_read(bridge, connector);
+}
+
 static const struct drm_connector_hdmi_funcs drm_bridge_connector_hdmi_funcs = {
 	.tmds_char_rate_valid = drm_bridge_connector_tmds_char_rate_valid,
 	.clear_infoframe = drm_bridge_connector_clear_infoframe,
 	.write_infoframe = drm_bridge_connector_write_infoframe,
+	.read_edid = drm_bridge_connector_read_edid,
 };
 
 static int drm_bridge_connector_audio_startup(struct drm_connector *connector)

-- 
2.39.5

