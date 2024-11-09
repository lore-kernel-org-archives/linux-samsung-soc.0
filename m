Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49E651993AE
	for <linux-samsung-soc@vger.kernel.org>; Sat,  9 Nov 2024 12:48:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731156532; cv=none; b=fYNpgsqAtLi/tlofNnET8hNnd6RO7BTchYPdTsWtGef5NCST/5Ndq3+SklcF8Z9fOe3fRyJUhkErZaVquJmbIOyGsbzgG1n/eQcWup8KwUHNCv/ALxTRYYg66KMOHncKzpRsbQQKuonizYLi9+j8WsqyJq3526wED1l43xXkZws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731156532; c=relaxed/simple;
	bh=yRmYAaGG5FuJnzbiAwK+r8Wa4ofx1aRyHEGe3Ks/gxw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Ct2gh/HA/17XAaDmxvChSsgfNJctyekhR/k9JD7V5gmCv6dezEogBcG+BBUJVTm6tmHxPWwVBBlNHGFTn2uGDFAnVIjdb7MYzR114+Dk1u3AB2XUAPqdu7Rt2GOAY1PDeaah48+RFDxEMHm/yeQNTcpH2berzThUOYEi8YJsgXE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ECYh3ZWp; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ECYh3ZWp"
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-539f84907caso3357841e87.3
        for <linux-samsung-soc@vger.kernel.org>; Sat, 09 Nov 2024 04:48:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731156528; x=1731761328; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0+2GniAkdmp4BwJcsCVeiFyEwNMIk2x1tb1O8W07KrE=;
        b=ECYh3ZWpKCqa0b9ffTRhQslWBWRaWnBVWv4wBwsW2pE62mFz11OXPeNIC3p4KHiBS9
         dbpgOzep6RP2XmKBe9Nr1NdR83fRLYKazgZDVnuzFVz4Gd40zvBsOfEPLQhWdf8TRfrl
         WUMepLxQZxLp0yHVg2+PcQcTAxkpkKO6XDos0hod9vnGz9nwiQ9ahX9WXwI2Xn4MQmrW
         KlqIwtJ5CWMkl2x5mVvVv4A06WFxVEYLSXr47MyRHMIi0I1t2MeJJRWYgj5xfrDCDRi1
         VKwXlvMo4ShqjO+KjhtTdqzpihod/vrC1zl3K/8r1dUjt4OAok1L4GqD6af555ruiEdv
         m+8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731156528; x=1731761328;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0+2GniAkdmp4BwJcsCVeiFyEwNMIk2x1tb1O8W07KrE=;
        b=tYch2FEnX4dvoqUDc9FtgeXRFI247E89KoRjWZ+WlKKrxeu/cO6CcyoxCLL1Vastm+
         Y0i0SbnF4wzKGIX4eQWamxHoCUy2L2PPQlAGy4ZN21FQZVgwYzq91SKTsGN80q3xbioX
         1pcCjepn4x4OnFzpQXooE/i/YSD1RUNnuag/yJyLdWl/7IpL7TMPsRLrTmMvmQFY8PuO
         MdyK7CrZqVLzePWkiKckY1lgKEnziK4S5yH+R1VkxY/qrMBpm1V1FeL1ogy2Ntj3BzCX
         H0geWUf2PiR3rQ9gHIaZT98o+dPikznq9yt04xDs3+WlzNhuHWorNC5vkyIoswkS7Lza
         Rkug==
X-Forwarded-Encrypted: i=1; AJvYcCVhzdLto1KzaZsXKYGHRjZKeKB95wznK/1Yb0LJ4qsMOjY+pdiIiWiSOChhhexOYdHAKzxDyk7/VE3oyeEzqWXNtw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyK1EocEprH+zw93+DYObI4rgLZI926sISWbkzYSTMTxnsC3SXZ
	Ie3I+nIBbteicreFRSgNpH2TPOinabHIT8pqh1UNUBHOcPw6+ix+UJlh2kHf9jk=
X-Google-Smtp-Source: AGHT+IHTXV5Cz5pjd5Ce3JQaNt839BiITtgrMF3UnvNUaVEgnkA8D0ncy/dtINK9kj+DtzeoWo9CeA==
X-Received: by 2002:a05:6512:2254:b0:539:e776:71f7 with SMTP id 2adb3069b0e04-53d862ebe11mr3204121e87.37.1731156528375;
        Sat, 09 Nov 2024 04:48:48 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53d826a9b76sm929967e87.172.2024.11.09.04.48.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 Nov 2024 04:48:47 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 09 Nov 2024 14:48:33 +0200
Subject: [PATCH v3 7/7] drm/bridge_connector: hook
 drm_atomic_helper_connector_hdmi_update_edid()
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241109-drm-bridge-hdmi-connector-v3-7-c15afdca5884@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4107;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=yRmYAaGG5FuJnzbiAwK+r8Wa4ofx1aRyHEGe3Ks/gxw=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ7p+lFxRuV8WF0di+7PrL76Ihi3eyqsmfkm3TtdLbPHfu
 Kv8e1o6GY1ZGBi5GGTFFFl8ClqmxmxKDvuwY2o9zCBWJpApDFycAjCR5AIOhoaNT+94f9VgurjW
 63et8pWUF1u7C14yvWF1yLnWKWVrq5RnYdFxJvjIztNnN+cGJ5ZUF3E+WFWh8tP/xY+tPcoVGWs
 kdS+e688Szr0xvfpM6ob/a6791d7Z37ef8dXtPTG/hL9GbG6oftp7X/Omcre2U7DNu1tTz+yb/e
 ZnNafE9mo2Tr/wzjfaIWqvF5oELDBtWn/7/cxjNZJ1S5dJ62SacfxzlKmynMBtITLV1PnEcgkxl
 2q3/TNdA9cIb3gkm9X8yCfJgvPclJ83tYq2LXreWfTycrXvDaXIZyer3WO6HteXZlycK5KVnTH7
 kbZP2QY92btBCVe5rItu/uB/IV9UJGS8bUqp2suFBlpiAA==
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Extend drm_bridge_connector code to read the EDID and use it to update
connector status if the bridge chain implements HDMI bridge. Performing
it from the generic location minimizes individual bridge's code and
enforces standard behaviour from all corresponding drivers.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/display/drm_bridge_connector.c | 67 ++++++++++++++++++++------
 1 file changed, 53 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/display/drm_bridge_connector.c b/drivers/gpu/drm/display/drm_bridge_connector.c
index 12ab9f14cc8a8672478ae2804c9a68d766d88ea5..71ae3b2c9049016d1cc0d39a787f6461633efd53 100644
--- a/drivers/gpu/drm/display/drm_bridge_connector.c
+++ b/drivers/gpu/drm/display/drm_bridge_connector.c
@@ -17,6 +17,7 @@
 #include <drm/drm_edid.h>
 #include <drm/drm_managed.h>
 #include <drm/drm_modeset_helper_vtables.h>
+#include <drm/drm_print.h>
 #include <drm/drm_probe_helper.h>
 #include <drm/display/drm_hdmi_state_helper.h>
 
@@ -175,17 +176,55 @@ static void drm_bridge_connector_disable_hpd(struct drm_connector *connector)
  * Bridge Connector Functions
  */
 
+static const struct drm_edid *
+drm_bridge_connector_read_edid(struct drm_connector *connector,
+			       enum drm_connector_status status)
+{
+	struct drm_bridge_connector *bridge_connector =
+		to_drm_bridge_connector(connector);
+	const struct drm_edid *drm_edid;
+	struct drm_bridge *bridge;
+
+	bridge = bridge_connector->bridge_edid;
+	if (!bridge)
+		return NULL;
+
+	if (status != connector_status_connected)
+		return NULL;
+
+	drm_edid = drm_bridge_edid_read(bridge, connector);
+	if (!drm_edid_valid(drm_edid)) {
+		drm_edid_free(drm_edid);
+		return NULL;
+	}
+
+	return drm_edid;
+}
+
 static enum drm_connector_status
 drm_bridge_connector_detect(struct drm_connector *connector, bool force)
 {
 	struct drm_bridge_connector *bridge_connector =
 		to_drm_bridge_connector(connector);
 	struct drm_bridge *detect = bridge_connector->bridge_detect;
+	struct drm_bridge *hdmi = bridge_connector->bridge_hdmi;
 	enum drm_connector_status status;
 
 	if (detect) {
 		status = detect->funcs->detect(detect);
 
+		if (hdmi) {
+			const struct drm_edid *drm_edid;
+			int ret;
+
+			drm_edid = drm_bridge_connector_read_edid(connector, status);
+			ret = drm_atomic_helper_connector_hdmi_update_edid(connector, drm_edid);
+			if (ret)
+				drm_warn(connector->dev, "updating EDID failed with %d\n", ret);
+
+			drm_edid_free(drm_edid);
+		}
+
 		drm_bridge_connector_hpd_notify(connector, status);
 	} else {
 		switch (connector->connector_type) {
@@ -246,29 +285,29 @@ static const struct drm_connector_funcs drm_bridge_connector_funcs = {
 static int drm_bridge_connector_get_modes_edid(struct drm_connector *connector,
 					       struct drm_bridge *bridge)
 {
+	struct drm_bridge_connector *bridge_connector =
+		to_drm_bridge_connector(connector);
+	struct drm_bridge *hdmi = bridge_connector->bridge_hdmi;
 	enum drm_connector_status status;
 	const struct drm_edid *drm_edid;
-	int n;
 
 	status = drm_bridge_connector_detect(connector, false);
 	if (status != connector_status_connected)
-		goto no_edid;
+		return 0;
 
-	drm_edid = drm_bridge_edid_read(bridge, connector);
-	if (!drm_edid_valid(drm_edid)) {
+	/* In HDMI setup the EDID has been read and handled as a part of .detect() */
+	if (!hdmi) {
+		drm_edid = drm_bridge_connector_read_edid(connector, status);
+		if (!drm_edid) {
+			drm_edid_connector_update(connector, NULL);
+			return 0;
+		}
+
+		drm_edid_connector_update(connector, drm_edid);
 		drm_edid_free(drm_edid);
-		goto no_edid;
 	}
 
-	drm_edid_connector_update(connector, drm_edid);
-	n = drm_edid_connector_add_modes(connector);
-
-	drm_edid_free(drm_edid);
-	return n;
-
-no_edid:
-	drm_edid_connector_update(connector, NULL);
-	return 0;
+	return drm_edid_connector_add_modes(connector);
 }
 
 static int drm_bridge_connector_get_modes(struct drm_connector *connector)

-- 
2.39.5

