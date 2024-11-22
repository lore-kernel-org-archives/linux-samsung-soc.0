Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 998237083F
	for <linux-samsung-soc@vger.kernel.org>; Fri, 22 Nov 2024 00:47:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732236479; cv=none; b=LJcKV1SNKFCGZRdVPOvnD+4aWOIXXYkOUxL64yd0Em3o4TC7gE+m5OJaxbBeYI5zGG5GRXzLCJc8eH5SH/+i8e2uDr0RYET7uNY+zQ34SwyVqIQZg+apKKQqV+wJuwqhmIWUkqeYT2oPUG2ce1pL8DISUYBBMr5fGGAia1gcuO0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732236479; c=relaxed/simple;
	bh=h4SDlLdLeTf2M3phGYhMa3icgLWVQxFU2Yi+KA0yVFA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jEuexoxFPAXbIoAa0iH6r6zexLJ9e17qnHNBepKVe0B9QcnyHePA4u7sZY7/PPTB5Yd4j+AFsNBTgNwiBafoHiKwQBO/xqN2bHO6Ar+aeK7Kf97usX07yHUI9lxEWOB8ceL/XpqUiY9W6+OkkNJd2kJtLze84Ivpb5IfBdmhNGI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=llRlhV5D; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="llRlhV5D"
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-2fc96f9c41fso17231691fa.0
        for <linux-samsung-soc@vger.kernel.org>; Thu, 21 Nov 2024 16:47:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732236476; x=1732841276; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AekznUw/DJYmSVBNFKXzyv34fWwrWZN8k5LwtkQDlbE=;
        b=llRlhV5Dk8RL+hoB142rd4CtFbuC9i7PPsIDnHVJQn91+hFMDQ1C5vZPjLuWiFP9Da
         hiCoB2Iu9sykeLvDGZkdaK/K2T3FMX+rlc8SkxTivl1QtD8qDWeIZTeTf8p8wOQKeO6e
         A4GPFG7FJElu2utiuPDceIaDF1PvVpaTtRLNnxduyiTtiOj+0Ogtj+3Y28f1SCCTxCKx
         X1BkVXTKebmhSZIbtbPKg0OvnmT246NXv+spi7CeXf5qX0W2oJmoyMS496w8TSz8bdy1
         57twFORKBNMAn/fbQFs0o9lYq+yf3ISUq6Dv50VA4Uqlhcs61K2ZW9EbKIX/fxOyFXba
         7IIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732236476; x=1732841276;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AekznUw/DJYmSVBNFKXzyv34fWwrWZN8k5LwtkQDlbE=;
        b=CV5kpljMET8IMOGmoo7stqyTP3deOKlhYsBUT7+fgtyWzuFZHzQZC0oLk9iwJY8DCP
         cLcMsNladJxooC/6BLg99JjnESL0j43t4srcbDiXfwf+6HpI66v3XbWaqEvVgZT+CMDn
         xDmsyUgIRUvhYt6gDH21DdIkIZBLGvD14M7KkqRZIYaRyApLjyM0vXpgUtqBybMcsU4V
         /VHvBglGeL8U6Ovbzc7MmbBTO6ObMVt0tOFEkays8yyZZmRmZXUwoD4329Zg+alpkcrE
         Zk1Oc5S0ywpAmntMfkq0gUFNyFGSL/Z1NtNACthgmQBU/x4GDTsT6+aNdzPzU0gQxV9I
         Q4Fw==
X-Forwarded-Encrypted: i=1; AJvYcCUjEDxlJ/zPhd4J9YrXSOfzttsV1qY5x1DbQmWFNtazih0NENXT3lKsUrfZmpWcHtnbK53phKpj9gs0EZpLAnGq9A==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzp+sVDvTH6CdcwoYX5cxOVzC5M/aFdIsjs/r33V7AXi2tINlfF
	dKQjiUrwHd020J5uuz6goRPF/Lz6ikWJt1wioTmSIzCQkiH3j0ZwlBaSEOIWYwk=
X-Gm-Gg: ASbGncuR1/jf+Iinf2zqbciEkGXXkA0j8f4J6ag94hux3/hCPHIqwZpYrkDCO9HbLK+
	ixIUiviCoe5qZTvtRW6iZhKVpzjyDDJv1qjLzeTydm5upGPvB5frbtzj/XaYJZvXdeTJ4RJTMXQ
	3SF2IXvuYGWvG0hae+aG4rLTUKSd9/FkdA0t00u7y7nK+iPy0Qp3RCy4FWUqdU6aCvX0Ik8hcqF
	vdjVX8fwyd8eudhoavWWJrkcGrGaUtg18oXYO3MXTC2ImElij7rXGCIzQ==
X-Google-Smtp-Source: AGHT+IHkN4nXkCVt6nZPpHcWzC2bWbGpwg4sMZCFQ0fvcq24XIw4gri2A5l4rqWLYlEyB/ESg+byOw==
X-Received: by 2002:a2e:a593:0:b0:2fa:d086:bca0 with SMTP id 38308e7fff4ca-2ff969a16ddmr15367841fa.10.1732236475685;
        Thu, 21 Nov 2024 16:47:55 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2ffa5375caesm1083071fa.85.2024.11.21.16.47.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Nov 2024 16:47:54 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 22 Nov 2024 02:47:36 +0200
Subject: [PATCH v4 6/7] drm/display/hdmi: implement connector update
 functions
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241122-drm-bridge-hdmi-connector-v4-6-b4d69d6e3bd9@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4091;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=h4SDlLdLeTf2M3phGYhMa3icgLWVQxFU2Yi+KA0yVFA=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnP9SoeZGpNl267MxKzahXC2JqO9fXLs+4r7B2b
 jseNQkh83WJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZz/UqAAKCRCLPIo+Aiko
 1RYrCACo07vR5CSktkmxVEZbETbBqQjxDEeirXgkPjqknr/6Ldh0teXQADgZkx9HHdy58CDSdc+
 ga4kgK0+ZJXjgpg7TnqA4pPgCDv7PJoOvu6y0R7OjtUAaSt01YNT2WdetJ/IKZIgYMz5us0+iaQ
 k0/tU7kVnXK5+fblJV+pE18lR12Yt+SV+MVUlmv/ftN7GvhZJEJ6Df6cHgmGNg/Sdy8rSrFHBFR
 w3uWFPjcHPScLXfZLrdBHstD1OaRB/6FKaVApC2rme2tOi4WXrmB2Itk78OwNOC/b64r9oLTmhO
 inwbgxXewxRuJicQQlp2xm2P+7/BdBVJMjpy58NyXHJAQ+3f
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
 include/drm/display/drm_hdmi_state_helper.h     |  5 +++
 2 files changed, 64 insertions(+)

diff --git a/drivers/gpu/drm/display/drm_hdmi_state_helper.c b/drivers/gpu/drm/display/drm_hdmi_state_helper.c
index feb7a3a759811aed70c679be8704072093e2a79b..2230b7fc92cfee46a9cad2479edce71822d30934 100644
--- a/drivers/gpu/drm/display/drm_hdmi_state_helper.c
+++ b/drivers/gpu/drm/display/drm_hdmi_state_helper.c
@@ -748,3 +748,62 @@ drm_atomic_helper_connector_hdmi_clear_audio_infoframe(struct drm_connector *con
 	return ret;
 }
 EXPORT_SYMBOL(drm_atomic_helper_connector_hdmi_clear_audio_infoframe);
+
+/**
+ * drm_atomic_helper_connector_hdmi_update_edid - Update the HDMI Connector basing on passed EDID
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
index 2d45fcfa461985065a5e5ad67eddc0b1c556d526..61c43e744051886ba5f2024197fcc90688670ebe 100644
--- a/include/drm/display/drm_hdmi_state_helper.h
+++ b/include/drm/display/drm_hdmi_state_helper.h
@@ -6,6 +6,7 @@
 struct drm_atomic_state;
 struct drm_connector;
 struct drm_connector_state;
+struct drm_edid;
 struct hdmi_audio_infoframe;
 
 void __drm_atomic_helper_connector_hdmi_reset(struct drm_connector *connector,
@@ -20,4 +21,8 @@ int drm_atomic_helper_connector_hdmi_clear_audio_infoframe(struct drm_connector
 int drm_atomic_helper_connector_hdmi_update_infoframes(struct drm_connector *connector,
 						       struct drm_atomic_state *state);
 
+int drm_atomic_helper_connector_hdmi_update_edid(struct drm_connector *connector,
+						 const struct drm_edid *drm_edid);
+int drm_atomic_helper_connector_hdmi_update(struct drm_connector *connector);
+
 #endif // DRM_HDMI_STATE_HELPER_H_

-- 
2.39.5

