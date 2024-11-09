Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA817192B9E
	for <linux-samsung-soc@vger.kernel.org>; Sat,  9 Nov 2024 12:48:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731156529; cv=none; b=Oq4Ku6PvGUPUtOZntKlFt4zvDDNJzaDyXwibdYCaUyBxLLeep/iMh/Xzs/x/AO82kO33re24Xpt02SbYQ35Ip5PH0P1KNPfdJEbd1hM4tuduiDJ6jW08Olhod44cV36E7rxjR5CUVt6IIR81PrgS3KEjGWIqEchI2wjZqJv6AJc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731156529; c=relaxed/simple;
	bh=0rIRHIOV78l4xOlDNT90+qbvGFV0Mz2FHXQAMpwi9s8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YPSTuNyOF3GsG9F6YY4wboKbqUfxOGJ9F0uO7GZM0PwV0dsqOO2UBcOJH7Li33bqmc5+KC2fSnY+eZoAev3fRJgFENabOTsIdewVKsXLnFJYjfF8oXcHbw7m80hcu5jHGiP1BM4oyyEgneuRGyARDyA2PjhQJieLx+cqnbrSVks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=w2fE2cCV; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="w2fE2cCV"
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-539f1292a9bso3880329e87.2
        for <linux-samsung-soc@vger.kernel.org>; Sat, 09 Nov 2024 04:48:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731156526; x=1731761326; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=I0No8ap6yrBgF/zpJhH8LFZGYsC9p4wbKlDOOUj0WtE=;
        b=w2fE2cCV/La+WlQ+nT58aV+gOlt9/dnEZYSb4Ia962ZqXS3Lm9LHggoI53IGz4BhUI
         NAHMWbW39tj5iIPYwXVVG/W1/thS/OgitR7VqFUIVcl+24y7lUT8gYZChPChgFDJbU+5
         j9QqIC2hbYUjKvisuQUyanSDriOhwgFK8xaQ9yr6LUpCGlyJrfZaVhVrryRsNonhqYF1
         OZ9k1PfSDHYkkwApKiztjI3RnIi0Vcz7rafydQHoy7jOHuSzINk+IFmGhgKz4K1203D3
         3YDu/GBHEXdWpgOA8SBZkJoBWyognSJ2Xjbx4jQsAF9akDpacqcbB9h21/jUHWmgr3a8
         WemQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731156526; x=1731761326;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=I0No8ap6yrBgF/zpJhH8LFZGYsC9p4wbKlDOOUj0WtE=;
        b=BpDCeVTpCFMtQHq1KXfLirxCeRtVpWAZmkbSSIkwYptED2RuSML6n74d7hxeS/uelh
         kMTCmirHLfcb6xwAT56uEFc1M43VOugHJneKS71g/rknQ1wRiJ8LwKZOpDpomvZxV/tr
         EhyLb1+RKjGWs2jq7bBVOZUaishIiSGlYuhdou+xNc0kU+WWMuOaIMhtXkGo5nCrjxsY
         DWevHuBtDYclJx2u7BcAtBlHaAXzKHTeT4Rdry1+fES0YeW23amitmof+WQr3RyNU1jb
         WQrzfoP94A9UDC1wTm7+bV1xJyllLrXJdhD2481xPtiqNqo59rSeVWx5HusCRV/u1xjH
         Ii7w==
X-Forwarded-Encrypted: i=1; AJvYcCVoggLxLmvacL2eEnZn8tt6mi1DB9mu4UsYRR1kmKi84p1JiHhqiykkVyoMQXMkBn0v9wIXpAPBuIrq9oY9Nr8viQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzy85ni+vbXbnTWB3J05yIqAESQttDcTwXDFWGmUy70KGHjCBNh
	BSyTkTfPBXf7kZsibfjRVZ4VJLiLXBlKjAqJ+J0wBd4nvKUbw4J3OoKTFlk7kMQ=
X-Google-Smtp-Source: AGHT+IF1snp8hmbIprhuLbAaPklMzRONrEfLzKFk3MHXaYlX7Kfdq5ocDentIlF/eo4E/8CWA9vtDg==
X-Received: by 2002:a05:6512:3c97:b0:539:e776:71f2 with SMTP id 2adb3069b0e04-53d862eb5bamr3254572e87.52.1731156525731;
        Sat, 09 Nov 2024 04:48:45 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53d826a9b76sm929967e87.172.2024.11.09.04.48.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 Nov 2024 04:48:45 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 09 Nov 2024 14:48:32 +0200
Subject: [PATCH v3 6/7] drm/display/hdmi: implement connector update
 functions
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241109-drm-bridge-hdmi-connector-v3-6-c15afdca5884@linaro.org>
References: <20241109-drm-bridge-hdmi-connector-v3-0-c15afdca5884@linaro.org>
In-Reply-To: <20241109-drm-bridge-hdmi-connector-v3-0-c15afdca5884@linaro.org>
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
 Andy Yan <andy.yan@rock-chips.com>, Alain Volmat <alain.volmat@foss.st.com>
Cc: Jani Nikula <jani.nikula@linux.intel.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-mediatek@lists.infradead.org, 
 linux-rockchip@lists.infradead.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3860;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=0rIRHIOV78l4xOlDNT90+qbvGFV0Mz2FHXQAMpwi9s8=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnL1oeIblR/unQZIwmnM6WdC96PZBguzu1woQcD
 SVQdlnYBieJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZy9aHgAKCRCLPIo+Aiko
 1ZOyB/9p6aVrjmHtzLjrNly9np+bYEQfuJ0QIYM/EXaWea+FP44i4iA6sf8TWgd/MRGZSJNjwWn
 pOuP30YciUdt6CB0jFvYmqKXQSFfDKvHj4qsgQl5dlC4J/1NXp/H+ndbMA6LtyFbnPcotAEad+1
 405gfgt8h8uIOTegJXrH2jon/Tz5gLToAX/76eQEDXYRAArBK6m3jfQpLW0Dt6eb7iQ1r7wOFGF
 ZMt5zjfqbobPGkXshJrL3DysSuhsEbVuY66N0oCjBlexOXcdIL7p3QRNBseAQIGqcZ1W4NAxpB4
 tKJ5Xpn2k6sPIaiV85FgyP1bO84YR/aNqxQdf2VVWprNjybJ
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

The HDMI Connectors need to perform a variety of tasks when the HDMI
connector state changes. Such tasks include setting or invalidating CEC
address, notifying HDMI codec driver, updating scrambler data, etc.

Implementing such tasks in a driver-specific callbacks is error prone.
Start implementing the generic helper function (currently handling only
the HDMI Codec framework) to be used by driver utilizing HDMI Connector
framework.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/display/drm_hdmi_state_helper.c | 59 +++++++++++++++++++++++++
 include/drm/display/drm_hdmi_state_helper.h     |  4 ++
 2 files changed, 63 insertions(+)

diff --git a/drivers/gpu/drm/display/drm_hdmi_state_helper.c b/drivers/gpu/drm/display/drm_hdmi_state_helper.c
index feb7a3a759811aed70c679be8704072093e2a79b..91073456cadb4a48caacf661cbc8236c7857de9d 100644
--- a/drivers/gpu/drm/display/drm_hdmi_state_helper.c
+++ b/drivers/gpu/drm/display/drm_hdmi_state_helper.c
@@ -748,3 +748,62 @@ drm_atomic_helper_connector_hdmi_clear_audio_infoframe(struct drm_connector *con
 	return ret;
 }
 EXPORT_SYMBOL(drm_atomic_helper_connector_hdmi_clear_audio_infoframe);
+
+/**
+ * __drm_atomic_helper_connector_hdmi_update_edid - Update the HDMI Connector basing on passed EDID
+ * @connector: A pointer to the HDMI connector
+ * @drm_edid: EDID to process
+ *
+ * This function should be called as a part of the .detect() / .detect_ctx()
+ * and .force() callbacks, updating the HDMI-specific connector's data. Most of
+ * the drivers should be able to use @drm_atomic_helper_connector_hdmi_update()
+ * instead.
+ *
+ * Returns:
+ * Zero on success, error code on failure.
+ */
+int
+drm_atomic_helper_connector_hdmi_update_edid(struct drm_connector *connector,
+					     const struct drm_edid *drm_edid)
+{
+	drm_edid_connector_update(connector, drm_edid);
+
+	if (!drm_edid) {
+		drm_connector_hdmi_codec_plugged_notify(connector, false);
+
+		// TODO: also handle CEC and scramber, HDMI sink disconnected.
+
+		return 0;
+	}
+
+	drm_connector_hdmi_codec_plugged_notify(connector, true);
+
+	// TODO: also handle CEC and scramber, HDMI sink is now connected.
+
+	return 0;
+}
+EXPORT_SYMBOL(drm_atomic_helper_connector_hdmi_update_edid);
+
+/**
+ * drm_atomic_helper_connector_hdmi_update - Update the HDMI Connector after reading the EDID
+ * @connector: A pointer to the HDMI connector
+ *
+ * This function should be called as a part of the .detect() / .detect_ctx()
+ * and .force() callbacks, updating the HDMI-specific connector's data.
+ *
+ * Returns:
+ * Zero on success, error code on failure.
+ */
+int
+drm_atomic_helper_connector_hdmi_update(struct drm_connector *connector)
+{
+	const struct drm_edid *drm_edid;
+	int ret;
+
+	drm_edid = drm_edid_read(connector);
+	ret = drm_atomic_helper_connector_hdmi_update_edid(connector, drm_edid);
+	drm_edid_free(drm_edid);
+
+	return ret;
+}
+EXPORT_SYMBOL(drm_atomic_helper_connector_hdmi_update);
diff --git a/include/drm/display/drm_hdmi_state_helper.h b/include/drm/display/drm_hdmi_state_helper.h
index 2d45fcfa461985065a5e5ad67eddc0b1c556d526..9698351307eb3d3dd69bafdff8e321a90a15495f 100644
--- a/include/drm/display/drm_hdmi_state_helper.h
+++ b/include/drm/display/drm_hdmi_state_helper.h
@@ -20,4 +20,8 @@ int drm_atomic_helper_connector_hdmi_clear_audio_infoframe(struct drm_connector
 int drm_atomic_helper_connector_hdmi_update_infoframes(struct drm_connector *connector,
 						       struct drm_atomic_state *state);
 
+int drm_atomic_helper_connector_hdmi_update_edid(struct drm_connector *connector,
+						 const struct drm_edid *drm_edid);
+int drm_atomic_helper_connector_hdmi_update(struct drm_connector *connector);
+
 #endif // DRM_HDMI_STATE_HELPER_H_

-- 
2.39.5

