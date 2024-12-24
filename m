Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 058FE156231
	for <linux-samsung-soc@vger.kernel.org>; Tue, 24 Dec 2024 01:48:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735004899; cv=none; b=cO8wsyphUp4e9PGk19xmob4Wn3owbOWv+sLJ8OccptcJynCeC+j5ZNJSHvrNDKlxrFB0wrDUubdMjFs+POND1rNpRZdW+EglwLdMe21SH5qBSE+CjevXkLomrjxUeI3rwgVKMRkWSWTIf7kbjSVBWB9+9be3I3bYBF/WQtiJjxM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735004899; c=relaxed/simple;
	bh=2s0WLoIO3OfL4EsRz0mMJb2gfo20/WlMm825XzWtaMs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sXcFOJj81x+THCmxbuMt8OWqgHw2hkkUGt8JzzB4s9CjIJhj83R+xqkBxRnmUIf8ARRPdDr+lG3PrpAZGwqZsly9RQeF03m9KV7gDnvF5gEBH1qx5R6wT+efT2cfvO7sruDngOrz/QtG/nyZv/4kf2g4aSSjrECv/tqj6Nv/Wio=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HyL+kYPS; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HyL+kYPS"
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-53df6322ea7so6452341e87.0
        for <linux-samsung-soc@vger.kernel.org>; Mon, 23 Dec 2024 17:48:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1735004895; x=1735609695; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=11MMq9bq76q5jZNjt/p/AELnXyaWnnWQAMGdIi+5im8=;
        b=HyL+kYPSdajXkp/nm8VZpuYDN0dyS5dbSB9uLGZOEfk6Sr11a4NRPHs1hxR9CZcDKe
         UY50OWE6cJhrgfgbt+ZK97JfqxGAjli9sh9xtoEi9pvcdMGHEHODpniUT00w4TMrQokj
         6muQ+6HtXn1ZqQcoDKHy5O2+IimOW5bAcfHKeMdZW9SrpOpXKL7CNDACUOMwpRVsM+xa
         /a9gswVHWpyX86dtf55+lTUegnESNGpF53gYVeFn8MCN51IdbqoNO9BUZD0f7oIiHbMH
         pgoLOijHlO0m6cvKNuLwd/72hfCQihTggca+Cit0i23SlMuPazyDXtFgU3x8xaz1LewF
         V9Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735004895; x=1735609695;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=11MMq9bq76q5jZNjt/p/AELnXyaWnnWQAMGdIi+5im8=;
        b=Lroq2wbh7Umf9hXd4s+hkcw/4L3QwaeSy9+kRIjr2LtbYigLUvWuV9UqpvSa6hVweg
         COaTjW8JN4vUMDZwwDiXXHuRupQ+9nCxLsGGlrevXQmnmiOgOXnntjoQ6EiUoqxawc04
         Mx7nPPJy7iURzjWoaUDdzWHEqF2QRXB/I3/hH68iaF0fWwn5G7OyobQyP9zQaryMJcp1
         kg66R5Ly9yWhSrVRLHFsnMoSpaQsDaZtfb9G4J8LvsJCXHxpwHwFBqeC3Zjg3N1ztl7/
         bGT5LDYRG0w7EfRO7zajnHj+LAbMzQXixiSpk2oRW9d6FY7u5loZPFu7/q4B6rT6RNre
         OQ1g==
X-Forwarded-Encrypted: i=1; AJvYcCV7wMJKkho0MqVuX8iwI621UGkqoE5vqgf88vgdGyusPkM72sRJrzPMM72cludKV6Xj0vdzwwCR1tOKJkIxPoYZvw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzmLn+REHRHE/BLR3PHSSqr1cBNnJ8FGmY7rApOCT768a33sU6d
	6Ro3Xutcjzc9VRbqJ8MNuNjfOvdq1UdvkSd10PGvcPhqjiZ88nE63AVCAJoTGYI=
X-Gm-Gg: ASbGncsoz6NMu0pu9oIMNwtCJh4tVPH1yQgCZp9UX/uh1fHujt6amDueTOZDHI8WcR1
	IiSNZyreI9kC75xckXsZpP5jvaTC9RnnyXOm5d/l2M5t28YJgC2iwM+6N+A4473Tij7spXJUt4O
	RC29kpGF6UzN0HQhr4+9njvsjvk38hTyEIw6qNydsWjqgmk6Zcp6wBsTb/cMckIQAWarATB3bYs
	JaI7UgafCiX/NBzcq03HzDmoU2JjPDw1nvVwn16tcMOHN6AmL1x/65IBOEDY4lB
X-Google-Smtp-Source: AGHT+IEnqRxDjCeeazsBTgHI7OCuUe1Vp/FdlFUFuT3jtGX/NcJpZR9vWjBPsZ3WUZOozuTNZ3MDbw==
X-Received: by 2002:a05:6512:23a0:b0:540:75d3:95a4 with SMTP id 2adb3069b0e04-54229538b24mr5215859e87.17.1735004895002;
        Mon, 23 Dec 2024 17:48:15 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-542235f6509sm1425988e87.25.2024.12.23.17.48.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Dec 2024 17:48:13 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 24 Dec 2024 03:47:58 +0200
Subject: [PATCH v10 06/10] drm/display/hdmi: implement hotplug functions
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241224-drm-bridge-hdmi-connector-v10-6-dc89577cd438@linaro.org>
References: <20241224-drm-bridge-hdmi-connector-v10-0-dc89577cd438@linaro.org>
In-Reply-To: <20241224-drm-bridge-hdmi-connector-v10-0-dc89577cd438@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=6555;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=2s0WLoIO3OfL4EsRz0mMJb2gfo20/WlMm825XzWtaMs=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnahLNxMawD6cVknB37e5e3k5Uhm/mSz2wAhYpK
 H+rJ2bQm5CJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ2oSzQAKCRCLPIo+Aiko
 1b9cB/0dqEXjqOcrvKbfKLUvLoZMXrr5x2OCQ3fyzEVeYrVc2yBzdJORHvsa7QE4Zhf5c/cEKvB
 bwUDvNqn8vx9YzVp4YoUrw2C6RNy5pRNjDSGhB/Lz7fazOYWRKoED1/PRtEGWl/EB43bQi+XOmK
 Z3Dq/EfeLI8b7hC9TCTwkl8L5xn5vSfH3+ROGVwkvWaUWy+7s5QGRZf0jGKv73p6qEba4P4hJWl
 +hUCMMbwprsSUDF7uA2/5FscifFml78DWTgYnvUyNCsQhjb07wRVN8I+zEzlIpVQ7H0vSMNJPV8
 zjTSYLf5UbyFr42aEeqsljxDDrEK5kes+XG1jaU2kKnqdam1
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

The HDMI Connectors need to perform a variety of tasks when the HDMI
connector state changes. Such tasks include setting or invalidating CEC
address, notifying HDMI codec driver, updating scrambler data, etc.

Implementing such tasks in a driver-specific callbacks is error prone.
Start implementing the generic helper function (currently handling only
the HDMI Codec framework) to be used by drivers utilizing HDMI Connector
framework.

Reviewed-by: Maxime Ripard <mripard@kernel.org>
Tested-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/display/Kconfig                 |  1 +
 drivers/gpu/drm/display/drm_hdmi_state_helper.c | 57 +++++++++++++++++++++++++
 include/drm/display/drm_hdmi_state_helper.h     |  5 +++
 include/drm/drm_connector.h                     | 16 +++++++
 4 files changed, 79 insertions(+)

diff --git a/drivers/gpu/drm/display/Kconfig b/drivers/gpu/drm/display/Kconfig
index 2619fa2476eb149e1befc3135131ed5aaeb5bb4c..8d22b7627d41f7bc015decf24ae02a05bc00f055 100644
--- a/drivers/gpu/drm/display/Kconfig
+++ b/drivers/gpu/drm/display/Kconfig
@@ -89,6 +89,7 @@ config DRM_DISPLAY_HDMI_HELPER
 
 config DRM_DISPLAY_HDMI_STATE_HELPER
 	bool
+	select DRM_DISPLAY_HDMI_AUDIO_HELPER
 	select DRM_DISPLAY_HDMI_HELPER
 	help
 	  DRM KMS state helpers for HDMI.
diff --git a/drivers/gpu/drm/display/drm_hdmi_state_helper.c b/drivers/gpu/drm/display/drm_hdmi_state_helper.c
index d678c635a6935050ca9c1ccafbb0865f21df5d4e..cfc2aaee1da08a103cbf933c891d5cc31b0886a8 100644
--- a/drivers/gpu/drm/display/drm_hdmi_state_helper.c
+++ b/drivers/gpu/drm/display/drm_hdmi_state_helper.c
@@ -5,6 +5,7 @@
 #include <drm/drm_edid.h>
 #include <drm/drm_print.h>
 
+#include <drm/display/drm_hdmi_audio_helper.h>
 #include <drm/display/drm_hdmi_helper.h>
 #include <drm/display/drm_hdmi_state_helper.h>
 
@@ -777,3 +778,59 @@ drm_atomic_helper_connector_hdmi_clear_audio_infoframe(struct drm_connector *con
 	return ret;
 }
 EXPORT_SYMBOL(drm_atomic_helper_connector_hdmi_clear_audio_infoframe);
+
+static void
+drm_atomic_helper_connector_hdmi_update(struct drm_connector *connector,
+					enum drm_connector_status status)
+{
+	const struct drm_edid *drm_edid;
+
+	if (status == connector_status_disconnected) {
+		// TODO: also handle CEC and scramber, HDMI sink disconnected.
+		drm_connector_hdmi_audio_plugged_notify(connector, false);
+	}
+
+	if (connector->hdmi.funcs->read_edid)
+		drm_edid = connector->hdmi.funcs->read_edid(connector);
+	else
+		drm_edid = drm_edid_read(connector);
+
+	drm_edid_connector_update(connector, drm_edid);
+
+	drm_edid_free(drm_edid);
+
+	if (status == connector_status_connected) {
+		// TODO: also handle CEC and scramber, HDMI sink is now connected.
+		drm_connector_hdmi_audio_plugged_notify(connector, true);
+	}
+}
+
+/**
+ * drm_atomic_helper_connector_hdmi_hotplug - Handle the hotplug event for the HDMI connector
+ * @connector: A pointer to the HDMI connector
+ * @status: Connection status
+ *
+ * This function should be called as a part of the .detect() / .detect_ctx()
+ * callbacks, updating the HDMI-specific connector's data.
+ */
+void drm_atomic_helper_connector_hdmi_hotplug(struct drm_connector *connector,
+					      enum drm_connector_status status)
+{
+	drm_atomic_helper_connector_hdmi_update(connector, status);
+}
+EXPORT_SYMBOL(drm_atomic_helper_connector_hdmi_hotplug);
+
+/**
+ * drm_atomic_helper_connector_hdmi_force - HDMI Connector implementation of the force callback
+ * @connector: A pointer to the HDMI connector
+ *
+ * This function implements the .force() callback for the HDMI connectors. It
+ * can either be used directly as the callback or should be called from within
+ * the .force() callback implementation to maintain the HDMI-specific
+ * connector's data.
+ */
+void drm_atomic_helper_connector_hdmi_force(struct drm_connector *connector)
+{
+	drm_atomic_helper_connector_hdmi_update(connector, connector->status);
+}
+EXPORT_SYMBOL(drm_atomic_helper_connector_hdmi_force);
diff --git a/include/drm/display/drm_hdmi_state_helper.h b/include/drm/display/drm_hdmi_state_helper.h
index d6d65da6d8f9ee46de33114cce2d6fbe6098a862..9ae19f3caf727f9a0fe06e6afe5fc46db924444f 100644
--- a/include/drm/display/drm_hdmi_state_helper.h
+++ b/include/drm/display/drm_hdmi_state_helper.h
@@ -8,6 +8,8 @@ struct drm_connector;
 struct drm_connector_state;
 struct hdmi_audio_infoframe;
 
+enum drm_connector_status;
+
 void __drm_atomic_helper_connector_hdmi_reset(struct drm_connector *connector,
 					      struct drm_connector_state *new_conn_state);
 
@@ -19,6 +21,9 @@ int drm_atomic_helper_connector_hdmi_update_audio_infoframe(struct drm_connector
 int drm_atomic_helper_connector_hdmi_clear_audio_infoframe(struct drm_connector *connector);
 int drm_atomic_helper_connector_hdmi_update_infoframes(struct drm_connector *connector,
 						       struct drm_atomic_state *state);
+void drm_atomic_helper_connector_hdmi_hotplug(struct drm_connector *connector,
+					      enum drm_connector_status status);
+void drm_atomic_helper_connector_hdmi_force(struct drm_connector *connector);
 
 enum drm_mode_status
 drm_hdmi_connector_mode_valid(struct drm_connector *connector,
diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
index 1d4c27948e8750191e7daf8ff6cda97d944905b4..f13d597370a30dc1b14c630ee00145256052ba56 100644
--- a/include/drm/drm_connector.h
+++ b/include/drm/drm_connector.h
@@ -45,6 +45,7 @@ struct drm_property;
 struct drm_property_blob;
 struct drm_printer;
 struct drm_privacy_screen;
+struct drm_edid;
 struct edid;
 struct hdmi_codec_daifmt;
 struct hdmi_codec_params;
@@ -1247,6 +1248,21 @@ struct drm_connector_hdmi_funcs {
 	int (*write_infoframe)(struct drm_connector *connector,
 			       enum hdmi_infoframe_type type,
 			       const u8 *buffer, size_t len);
+
+	/**
+	 * @read_edid:
+	 *
+	 * This callback is used by the framework as a replacement for reading
+	 * the EDID from connector->ddc. It is still recommended to provide
+	 * connector->ddc instead of implementing this callback. Returned EDID
+	 * should be freed via the drm_edid_free().
+	 *
+	 * The @read_edid callback is optional.
+	 *
+	 * Returns:
+	 * Valid EDID on success, NULL in case of failure.
+	 */
+	const struct drm_edid *(*read_edid)(struct drm_connector *connector);
 };
 
 /**

-- 
2.39.5

