Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFFEC20CCE1
	for <linux-samsung-soc@vger.kernel.org>; Fri,  6 Dec 2024 10:16:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733480222; cv=none; b=cDLoUXP/vLktkyiUqqeOUTjnTdOlk6fzuk/aM17SK+UHzTW2ZuqW0Bza1bsqRNzeCQlKGbuZVFQ5jQUuKrnTvNH9IGG+fQe3O7VUqtjBh3pYePdoQSlRvHPp0IwLu8wqw7xZdlqIdCdOqkjPTZ1nUexZ7vi5B0OpBKZKxxtMkQ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733480222; c=relaxed/simple;
	bh=cLr7rcMCKctpWvNtnt4BFuThw021W03l57sijxoziRQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=psmTlXi6QqnpUcTLbRrthAzDi42f+9N9570Z58cdvyYx7tmE7mOZx+LuTBjaZaU50HnaeKJfwth5gG0tBNKkLX8/hhsq8PLYY2OsEfgLLXYS0DKxFyOlQyRl0v5siuqIgolRKzQslmptTRhDWhqu8kH7pIK1LKOwldyESq9j1lo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=r8rygyiW; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="r8rygyiW"
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-53df80eeeedso1967749e87.2
        for <linux-samsung-soc@vger.kernel.org>; Fri, 06 Dec 2024 02:16:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733480217; x=1734085017; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GHXQ08P5B8mUzCAvgp3K0OAFdV2V7CRGE9vgNvuacPg=;
        b=r8rygyiW6eJuHAaHLtGnYJBI2F+A5P0n1PIS4yOBSP7c5C822aa1tKzhh1USr2FqQf
         EXbvMOkfeRLNNoU+Y7pDhy9rIo8g6fFIWKXvW6ZCram6P7itXYibaJ6CQf5c0PwCi+Id
         WX8E7/InPpGe+3xKVRnH0HvEecYWihkHdya6Wa8i5TRM71VYsKXSJnWkmtf5vIKmukV2
         U5SxxxNtEKFs/9tOcpzqOOYrUfS31td+LJ9K9n6aru+0g4IHIzg2s1jcoq2Zm6qTvlii
         dnMO/NMckmu9SgyphgOyli1/h/EBbwyPKmamzVZ5cp0sz/sF9hRqLYmMbOhUB8cP5edX
         SHnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733480217; x=1734085017;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GHXQ08P5B8mUzCAvgp3K0OAFdV2V7CRGE9vgNvuacPg=;
        b=CYoC8XW0iSk+okwAZfmEYJsyAp6DHbD2hb42Lhi8h9TnwbfFbCF2FYcEpUueJKuS+l
         g83bzBguCKH0R4qgxDXzm9CCx8iDWJYz1gFwkpe4YilgKJbRczBLTLqlaELS8ZQhedro
         hV448OznRMV55taky/kMKWxhJJvKdDVgX5XKFEnY69HymOjudPnjbO9HPBbMUB8BGlBg
         wJcYo8+IHN3PxZnAoQCHrBqz42J+ZdjI8PkHxtfyXGPAAFnBozKQw0RirI2xr0emUdmF
         UdOOEiwZUfChULkBOt+Zq+DzKq8pc9OIS/0AOfS9e3CvwP0gSE7cgLxSzqkIMczwvxUO
         9qMw==
X-Forwarded-Encrypted: i=1; AJvYcCUOBfmndBp2YO6J8IHi+LOyzxuKqlN0Pet9PJ+6mPG+OoBZHBT2gFP1P5j1J9NPSPPCf8Uw9dieMgr5z9d/YNER9Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YwEFqR5944f1cqdvDpE+rM9oh3qQdH50nyCaic2SMTzl4wRNu7f
	8dlVlH1g9b3Ur18esqj4wruVFLW25Nwnef7lJwLydtkJiqxhTxz2315/PtuEmcU=
X-Gm-Gg: ASbGncsRatyEEviKgYvPWHp4/w90YTNmpvblF1o/CZrutFUX0FBAEIdG1oi73pc9saE
	8kortAd9iKR2g3D6af/lICb301l5k6MMFR0TwZY6RF4aNeorzrBDMRngmBnR+9/EtAZj//Tenrh
	YNgoMcswbAJf5Ilvjo48GqBgT83aFsOkMxgtg7CUs6THPh2WLVAn/BwL8oLXOkPz2J+DLZJhBPo
	wHb1navIfA1euhXKFXiXa50Q+S4GVxugwHofpwju+v2orRDhpqmRvuDPA==
X-Google-Smtp-Source: AGHT+IHBBgF3TADMfzDewRh0RnUMlgyT5sj2IpwAyXtVR/5eduL7M8O2TXvbBzwVKqS3LKRU2nISMQ==
X-Received: by 2002:a05:6512:3b06:b0:53d:ef60:ca9d with SMTP id 2adb3069b0e04-53e2c2ededcmr746863e87.55.1733480217491;
        Fri, 06 Dec 2024 02:16:57 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53e2294738fsm462355e87.52.2024.12.06.02.16.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Dec 2024 02:16:56 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 06 Dec 2024 12:16:00 +0200
Subject: [PATCH v6 06/10] drm/display/hdmi: implement hotplug functions
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241206-drm-bridge-hdmi-connector-v6-6-50dc145a9c06@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4668;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=cLr7rcMCKctpWvNtnt4BFuThw021W03l57sijxoziRQ=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnUs8J3TYcPOcFa14DxHDG+xCfnhUgeaSE3pmsZ
 R3RuvxUPtiJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ1LPCQAKCRCLPIo+Aiko
 1bY7B/4+CK2IPr0ZGyjRDhrjaTsOqjmocrfgRtyl3xVEfwHzU9LuHdX6kQQeAuBpj8yrhP95Lrc
 mJaqwUlGlJVWI2p41ZWrO45zfQXvGkclr3viN4DqtVp1wOkUrySmjzdDtwWb8O955/CXSlOkPj4
 shNBlMA/0EzPl4Sey9z5n5owN0nB1SFzkv7pXmLDh+ueroDtWgyLV6lM8aK/oC2d2vB3p5NonFj
 iq5QAwa4io9tByWFbLUrhaD3YP49rrj6olPhm2uUF+4vE+bhp+jb5smE9iwO6URvP0KGtG7W5Y8
 gww2J/ZuOGHRT1+pbIcV3exbZQ1jdd0TnTjcc8oprf9DeMWO
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

The HDMI Connectors need to perform a variety of tasks when the HDMI
connector state changes. Such tasks include setting or invalidating CEC
address, notifying HDMI codec driver, updating scrambler data, etc.

Implementing such tasks in a driver-specific callbacks is error prone.
Start implementing the generic helper function (currently handling only
the HDMI Codec framework) to be used by drivers utilizing HDMI Connector
framework.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/display/drm_hdmi_state_helper.c | 61 +++++++++++++++++++++++++
 include/drm/display/drm_hdmi_state_helper.h     |  8 ++++
 2 files changed, 69 insertions(+)

diff --git a/drivers/gpu/drm/display/drm_hdmi_state_helper.c b/drivers/gpu/drm/display/drm_hdmi_state_helper.c
index 80bf2829ba89b5f84fed4fa9eb1d6302e10a4f9e..4cdeb63688b9e48acd8e8ae87a45b6253f7dd12b 100644
--- a/drivers/gpu/drm/display/drm_hdmi_state_helper.c
+++ b/drivers/gpu/drm/display/drm_hdmi_state_helper.c
@@ -769,3 +769,64 @@ drm_atomic_helper_connector_hdmi_clear_audio_infoframe(struct drm_connector *con
 	return ret;
 }
 EXPORT_SYMBOL(drm_atomic_helper_connector_hdmi_clear_audio_infoframe);
+
+/**
+ * drm_atomic_helper_connector_hdmi_hotplug_edid - Handle the hotplug event for the HDMI connector passing custom EDID
+ * @connector: A pointer to the HDMI connector
+ * @status: Connection status
+ * @drm_edid: EDID to process
+ *
+ * This function should be called as a part of the .detect() / .detect_ctx()
+ * and .force() callbacks, updating the HDMI-specific connector's data. Most
+ * drivers should be able to use @drm_atomic_helper_connector_hdmi_hotplug()
+ * instead.
+ *
+ * Returns:
+ * Zero on success, error code on failure.
+ */
+int
+drm_atomic_helper_connector_hdmi_hotplug_edid(struct drm_connector *connector,
+					      enum drm_connector_status status,
+					      const struct drm_edid *drm_edid)
+{
+	if (status == connector_status_disconnected) {
+		// TODO: also handle CEC and scramber, HDMI sink disconnected.
+		drm_connector_hdmi_codec_plugged_notify(connector, false);
+	}
+
+	drm_edid_connector_update(connector, drm_edid);
+
+	if (status == connector_status_connected) {
+		// TODO: also handle CEC and scramber, HDMI sink is now connected.
+		drm_connector_hdmi_codec_plugged_notify(connector, true);
+	}
+
+	return 0;
+}
+EXPORT_SYMBOL(drm_atomic_helper_connector_hdmi_hotplug_edid);
+
+/**
+ * drm_atomic_helper_connector_hdmi_hotplug - Handle the hotplug event for the HDMI connector
+ * @connector: A pointer to the HDMI connector
+ * @status: Connection status
+ *
+ * This function should be called as a part of the .detect() / .detect_ctx()
+ * and .force() callbacks, updating the HDMI-specific connector's data.
+ *
+ * Returns:
+ * Zero on success, error code on failure.
+ */
+int
+drm_atomic_helper_connector_hdmi_hotplug(struct drm_connector *connector,
+					 enum drm_connector_status status)
+{
+	const struct drm_edid *drm_edid;
+	int ret;
+
+	drm_edid = drm_edid_read(connector);
+	ret = drm_atomic_helper_connector_hdmi_hotplug_edid(connector, status, drm_edid);
+	drm_edid_free(drm_edid);
+
+	return ret;
+}
+EXPORT_SYMBOL(drm_atomic_helper_connector_hdmi_hotplug);
diff --git a/include/drm/display/drm_hdmi_state_helper.h b/include/drm/display/drm_hdmi_state_helper.h
index d6d65da6d8f9ee46de33114cce2d6fbe6098a862..4ffd40d73d50d89449508b7a5ce5836a596638a1 100644
--- a/include/drm/display/drm_hdmi_state_helper.h
+++ b/include/drm/display/drm_hdmi_state_helper.h
@@ -6,8 +6,11 @@
 struct drm_atomic_state;
 struct drm_connector;
 struct drm_connector_state;
+struct drm_edid;
 struct hdmi_audio_infoframe;
 
+enum drm_connector_status;
+
 void __drm_atomic_helper_connector_hdmi_reset(struct drm_connector *connector,
 					      struct drm_connector_state *new_conn_state);
 
@@ -19,6 +22,11 @@ int drm_atomic_helper_connector_hdmi_update_audio_infoframe(struct drm_connector
 int drm_atomic_helper_connector_hdmi_clear_audio_infoframe(struct drm_connector *connector);
 int drm_atomic_helper_connector_hdmi_update_infoframes(struct drm_connector *connector,
 						       struct drm_atomic_state *state);
+int drm_atomic_helper_connector_hdmi_hotplug(struct drm_connector *connector,
+					     enum drm_connector_status status);
+int drm_atomic_helper_connector_hdmi_hotplug_edid(struct drm_connector *connector,
+						  enum drm_connector_status status,
+						  const struct drm_edid *drm_edid);
 
 enum drm_mode_status
 drm_hdmi_connector_mode_valid(struct drm_connector *connector,

-- 
2.39.5

