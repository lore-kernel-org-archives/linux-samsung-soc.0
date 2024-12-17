Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7456814C5B3
	for <linux-samsung-soc@vger.kernel.org>; Tue, 17 Dec 2024 00:40:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734396057; cv=none; b=jtpHx7rjZMLtlFBDbqLVi+rgXyWCuVKala4pqBw3r+Jw5UQTEPuTA6kX0VK20AT6ssuJn3ekQGzLtCnPgtZ1KCYCVtj28b9llTRivfJCOl8cX6Ln1KXbY7J5SsUE+BXtm27MT8HqhJw2MrIHR/gRRi5indn86E95R7FfhAecLJ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734396057; c=relaxed/simple;
	bh=7s/0WO/aTzEx9yhjto9LxdTyBBJwSv9ES82NKKPeNQ4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kaCRuwnEixvJXyPPWUeq6ue0qiv7yzbe5tocdd+f0+hMqoNqqNbW5qBzno5ylCwK/f7WQ7B5Vf2+zwASx9450vLZGWROfAbMI5mBuFG8NP7noqPvwHvRb+jJArrO9YpLWgcxyJWWQk5iUGIJTvYaVU4NcV+2K5PpMyIBgl25M+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ED+Ppexr; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ED+Ppexr"
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-53f22fd6832so4964662e87.1
        for <linux-samsung-soc@vger.kernel.org>; Mon, 16 Dec 2024 16:40:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734396054; x=1735000854; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Lunr+AM74GTPPfWmRn+AT8+K2i2rNeiOvxZLJo+1HHg=;
        b=ED+Ppexr4fWWEoP04SGR15GW2Vr+7bO6iBk7pTng6Qc+s9nqfIpCFoAMpXLHhhRXti
         4LAG1DXRmk6znOfdrKsZ5RcjZdRcGq87CaDwvo7OSitVWsu0N3SRWDt9mKFV1QVtAipL
         xb3IdE3mfz0ODoUsQg6ZbYvdBBImn4OC5lUw8+qylseZKYomQCzJ3i/Ejc5Irfw0V47n
         Zd3tY0wxNS0epgXv31/zVYnwZvV3OULujs7PKGPqGrdpCHKoDdXPiadF4ECohPrHh+hq
         pbhRK0TY6ZNCjoipid1DUH62GfHyTNOhJMQpF3Lt+0P9+1gvRKodoDJkwcXX8OUOkAHs
         s/vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734396054; x=1735000854;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Lunr+AM74GTPPfWmRn+AT8+K2i2rNeiOvxZLJo+1HHg=;
        b=Q+PpxhmU69QVUdLiJunrJcHGYN0zZlASARH9NP8xporsZV49H9VMPwnxVc/RkbEMW+
         YyhJGQdcjYNg61AmjpIbHQiuqUFiPf7DAqyEG7PqFZRbrstOJCUyTlaHHV7YL9h7XRVt
         oMAl0BHZ4HlITXjxonEmsXZpiroFv9P7vj3OjY/D2aGdueWG1VviwrJ7jpHudOQyyrsY
         m1TMdiH/Y8tzeKDo2TJHEzxsgloc4Cinjk9tphVWm4lHsfik7CVQ7pPRVvpmR9q2X3Mi
         mER89PTLaH2cbQfkqErNZfCAsGCswXK2easZlWN+zH3P9VUBg94IWMuHesbC+oflwnL4
         NfgA==
X-Forwarded-Encrypted: i=1; AJvYcCVqVWNJUYk68tTSdB1TvBJEm5gYrPISs8CBVm3HLgyaWs6CY47nIwdmD00uoHDu3aFI1BE+QjU0iP9scQDvWJN0cQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0jPPCf4OhS4Klcn2wKHnzvhCJbmKXam6Sq7hJlf5b1lA/EMrI
	xZz420VkGUCcfGP63vjdTZpNSuU6lY/xvOc3tObYvtb8xt7xZTnQ6BaZ/385HaY=
X-Gm-Gg: ASbGncvgOTaFi2ipqIxhmtZ3gBJfVnSYbYUTcnzMZ62gzRZgJQQxZreWebDGN5vHUKv
	5JIp9QVzLNLRFWL2kQ0p7Y4RAupSfbcnvWBXf8sYNj6LS7fgSdN2X24V/WkQk0OdA3z0udxd6Bq
	x9ZZ+lsCjXqq0ZlZl08YpPW8vmm609VR4PdDyEzd195lIh+o4+7t3SQXYM2fm43mSHg05UVNcSZ
	EhtOc125/g3Hskovcgzd0uupm55VXqdM+JoQBz5KIkCm9QVajIbHaVp1WM7Dkuy
X-Google-Smtp-Source: AGHT+IGe0QdLZY73JsApHksPxAww/oxjVlJdjygOnTwbgrdsohY4NxxLR2cwt2MC32di//BAmFafkQ==
X-Received: by 2002:a05:6512:b06:b0:540:17ac:b371 with SMTP id 2adb3069b0e04-54099b6ecdcmr4290758e87.56.1734396053589;
        Mon, 16 Dec 2024 16:40:53 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54120ba9ab2sm1009122e87.74.2024.12.16.16.40.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Dec 2024 16:40:52 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 17 Dec 2024 02:40:32 +0200
Subject: [PATCH v7 10/10] drm/vc4: hdmi: use
 drm_atomic_helper_connector_hdmi_hotplug_edid()
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241217-drm-bridge-hdmi-connector-v7-10-cb9df2b6a515@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1868;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=7s/0WO/aTzEx9yhjto9LxdTyBBJwSv9ES82NKKPeNQ4=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnYMh66KurD/so/4BhoqlDVPuK2xAohhbIWN/EG
 x67827EyE2JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ2DIegAKCRCLPIo+Aiko
 1ZsiCACZHuxK0m8L9MH1NhE2yPwWUTbzhXV2jMuyyQcJBcJKvwYMEAdKnau9ASgbjUyjrS0EqxK
 PG9HYh7v6OQuoktgWtwxcZgo8DyLPYPsH3ep2lhRl3cz3v19tta06Uegl+D5MxWNoOployl5pF4
 LYT81VevjzV55DOYBg/jYXMGpIZF+9d3Umz+KLMKQZ5DXC85lct2mD6XBUBijzLjKir8Yn92L2b
 o6p48mzqad3L+E2Mxe5QGYoLg5IvVV+ouFScCpgfmP28rZL9PzfgkdmP0ahbxw/xtzK1kfWSxSI
 2DH1/dpfUzApuoHsTjp/y0HbjKkiH/BbrYduZ4L2RBFNDDAi
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Use the helper function to update the connector's information. This
makes sure that HDMI-related events are handled in a generic way.
Currently it is limited to the HDMI state reporting to the sound system.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index bb5e8738845c74d975c1e0e1262ced46e4ef8fde..328a845ce0c4168b5463d344b3ad1f77a5437cff 100644
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

