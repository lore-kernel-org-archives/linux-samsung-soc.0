Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3396F81ADA
	for <linux-samsung-soc@vger.kernel.org>; Fri, 22 Nov 2024 00:47:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732236482; cv=none; b=ToO+3mQ294YNpC4fMgQxtG0nVTTGXSXmjlee3zjEIs2Egg2KZdCJx+XLU86GuUhHieq4RWM/TTbKKFRYQQAf4PRwbQjJMuxWm1d9Gfg2qwS7FAX8tqLetAOeQitZhauYuZv8GGSU57K0aUiRlYyiTxjZuJ5VhJVeN95iNcmlPRw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732236482; c=relaxed/simple;
	bh=yRmYAaGG5FuJnzbiAwK+r8Wa4ofx1aRyHEGe3Ks/gxw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fMOS28nHk2wi4KfPLK7j9FRQGu9B2LIXGm2AEfV4TTK4BMI37HHexxXinV7OvuflyJyalC0L5JxGdYxQHFNYdTU6ujfmXeQtYR0yH1wvSBhxgmf0SQj6Y/Zx7lq/wsacfD4CyU543Iu8PcIOBtrTytEBejUGrHcSozrKXDw7sc0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Z3lBJG1Q; arc=none smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Z3lBJG1Q"
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-2ff5d2b8f0eso14252851fa.3
        for <linux-samsung-soc@vger.kernel.org>; Thu, 21 Nov 2024 16:47:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732236478; x=1732841278; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0+2GniAkdmp4BwJcsCVeiFyEwNMIk2x1tb1O8W07KrE=;
        b=Z3lBJG1QOo4IBc92lTxc12r3HuzHUURWXBSIWhVyCS2T4zeAJPSpGfPRIDWXx4+7yW
         DlhNyL1Um2r/qA8ROjcE98/YTlCCeKw/ik1MRlBSOfPJiQHjtTvIvYUHDbCGAKarVP6z
         WKIObBradW5dP+mb3AIT4dxjD9EElkXj5Jf4u2/7amz2Z7ESAHWaSYHiyMuHnEFd0HOo
         xkYZEgmXAB92NtgbfJB+Eadz7q4rKcuQcHQlotpBXI0jVigwSSDMwLRuonObtQIKbjn1
         MDdTQhO3zExHYLgzfoF+/blMvY+tNRGG+OQCfMb/KjNbMEUidvQhC40QxkmB2KMARjOb
         ZW0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732236478; x=1732841278;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0+2GniAkdmp4BwJcsCVeiFyEwNMIk2x1tb1O8W07KrE=;
        b=kG6RtW7PUU76jfX7PWsbmNRi6SYdNdl31HmvZuwdpIbsZUTrnINEojNyJS92slGSB/
         hmSFVe6O1pHtdii51oOIscNxc+d/IJj0LKuT+oVm7BHNgQ1PnZH40Oj9Uu5dOeZxLgGc
         R/LtCraCQfpaSPAmyJbRaqBpdjtvTjkam0oL3xX8fBx022c8164le+WdhKuUxnjY+ebV
         tVEvXOH0T+2kP17tD8Jq/Rail9rM17I+Wk4Wcrw8fCa4vZjoLOSaGIXe9jYW6jhscbUd
         fyOnAuMKhiN+e8sMwMuGKE0ksrTJnKVBOcBOv37lqKHGytM1qzfFL6IBpCvewauD+9lg
         9RUA==
X-Forwarded-Encrypted: i=1; AJvYcCUu4oA1Vjod0rjYYSQaSvssVB5V6wuL+d7PkvrZ1SMowz+mUejS8cGVpThahKmS8WjdQRTSq+m2udg4DSvZ7GoVwA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzNPjcoXZm9Fjmpm9C4fE6vur+D5X4KS77Nv9zp16nE0Kvm1Bdl
	QSM7dAWuipMHkn2RGSAORgjoKJpT15qkrNu6kqGtWl4w7mYZrbRHed8Vv/5A32Q=
X-Gm-Gg: ASbGncvf83aCQ5ntz0vPeaoKdmVlpsIWGuRlsBWu2MjTjVw+uT6MK7Khb9145w8baP0
	piXORUTKS83Z3y2YEslC3fc+CzDaeN+C0G8DeQHM3+WQOzAa5f2NSyFopMxSvpNXkUKBK1h7jzs
	HFw0u9m54jE/orNSoe6CdhEe1fwtthfJ1mi0tsdNGpz2S9V2qmGYEdzTLL/w2Oj5RZKrc30wojJ
	MDQef01j4Nqm0w8rmID3Q8w8f9XEgGxqlynVrPDNR5+38y1iDDlhuocFA==
X-Google-Smtp-Source: AGHT+IHaHNlUP8086xz3tRzLnaul8Avo5PbX/8+kDiLnQ5OGtpX084LsUh/kakZmuNiZbNZCIacxWw==
X-Received: by 2002:a2e:a58d:0:b0:2fa:d978:a6a2 with SMTP id 38308e7fff4ca-2ffa716cecamr3853321fa.27.1732236478310;
        Thu, 21 Nov 2024 16:47:58 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2ffa5375caesm1083071fa.85.2024.11.21.16.47.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Nov 2024 16:47:56 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 22 Nov 2024 02:47:37 +0200
Subject: [PATCH v4 7/7] drm/bridge_connector: hook
 drm_atomic_helper_connector_hdmi_update_edid()
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241122-drm-bridge-hdmi-connector-v4-7-b4d69d6e3bd9@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4107;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=yRmYAaGG5FuJnzbiAwK+r8Wa4ofx1aRyHEGe3Ks/gxw=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnP9SpVDpn/N8z6K6hlLcRgonLl5v1k8kXcTVuO
 Og+AMEkfmSJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZz/UqQAKCRCLPIo+Aiko
 1dLPB/wLm/x1f8KlUeomrCfmp3UZ6g0DI5BUacJw80/8n2QLtYdBuGeBGuVq2z7lkL3AHGUhaHY
 gZn/7tubJGIZ3vjMeKLSgs49f7JxTUS6dJBGNbBYpupT5L25MoRX3pe9lCr+eDE/wpGoALXBcmE
 PYfPqUfPhHmNEOGYcD1oL742/t4WqmXtKa1ni1Hv+otodOq367Sfr44Xyqic+u1VV5eN4WWqpoU
 LtUDOu58YxNAOkrtyEGmrV/bbh6D4P9e6DioI4eij6CMhhiLhAp29UjK/+78DvZ3TgpR5uqrrOb
 ERZMg7fJCawdHkXiMo8nIfO8uK5pR0cgN6c6V904Ac5pSqFu
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

