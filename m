Received: from mail-m3299.qiye.163.com (mail-m3299.qiye.163.com [220.197.32.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4204D275847;
	Fri, 12 Sep 2025 09:14:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.32.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757668492; cv=none; b=BQ2X6I4Oq3pskUDKeXM557o1elrs2AEeaDlsXiEWA8C6zO891CcGmZXNj9nAyzS8K314o2DZC+atuYFOUUNhgWA2sCF2n6X94V2cxfcF9hMlGkz/Xx2atiBIas6XhN76fJiHkobO6lfWDA2PZ/ks+cxbwri4Ih2BoA0fWkxgGdY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757668492; c=relaxed/simple;
	bh=1fDB1QfKnJBFPzFMrvfW2plsqnZmZmQx8g6K8JhO3g0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=hZkJOpahHrRkx8F7SHCMxwbcNqeylrJAKU7gglCQoptSODaG6ESL2ia5xTgJ8s+uRUKwYat5o0faX/Sh39MiB9Qdz3K0h+Cm5i/0Fsz1BNc1Tp8EyBq1/TStsluQiYegVhvCy25WDUFsx6MP+FLbm+IOYy2XmqCegjMYmT+ARG4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com; spf=pass smtp.mailfrom=rock-chips.com; dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b=CWgCB7fL; arc=none smtp.client-ip=220.197.32.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b="CWgCB7fL"
Received: from zyb-HP-ProDesk-680-G2-MT.. (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 2298a0eb7;
	Fri, 12 Sep 2025 16:59:29 +0800 (GMT+08:00)
From: Damon Ding <damon.ding@rock-chips.com>
To: andrzej.hajda@intel.com,
	neil.armstrong@linaro.org,
	rfoss@kernel.org
Cc: Laurent.pinchart@ideasonboard.com,
	jonas@kwiboo.se,
	jernej.skrabec@gmail.com,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	jingoohan1@gmail.com,
	inki.dae@samsung.com,
	sw0312.kim@samsung.com,
	kyungmin.park@samsung.com,
	krzk@kernel.org,
	alim.akhtar@samsung.com,
	hjc@rock-chips.com,
	heiko@sntech.de,
	andy.yan@rock-chips.com,
	dmitry.baryshkov@oss.qualcomm.com,
	dianders@chromium.org,
	m.szyprowski@samsung.com,
	luca.ceresoli@bootlin.com,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	Damon Ding <damon.ding@rock-chips.com>
Subject: [PATCH v5 13/17] drm/rockchip: analogix_dp: Apply &analogix_dp_plat_data.attach() to attach next bridge
Date: Fri, 12 Sep 2025 16:58:42 +0800
Message-Id: <20250912085846.7349-14-damon.ding@rock-chips.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250912085846.7349-1-damon.ding@rock-chips.com>
References: <20250912085846.7349-1-damon.ding@rock-chips.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a993d26af9e03a3kunm813a8c8ea46246
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZGh5NSFZPQh9MHh8ZHktJQh9WFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSEpKQk
	1VSktLVUpCWQY+
DKIM-Signature: a=rsa-sha256;
	b=CWgCB7fLwrYIZriaNXhZT1Te5EP55AOQjxHvsSmGLb1gWwXIE2A37p9EmaR9hpOhf4GqYQGKdMJJQXWEmqC+o8THptUrVCtLj7KcWCI8jUmNjiCUMdBYHR5RuzWiXQfIOWdGhm4VXSjSkS0HpFPxUuS+sDW6fOhLUwiHqSLlVpE=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=jSqkJBK8n7ly5U0nAnm+/OksXDHVIBn6HmUmV6qYAJ8=;
	h=date:mime-version:subject:message-id:from;

There may be the panel or bridge after &analogix_dp_device.bridge.
Add rockchip_dp_attach() to support the next bridge attachment for
the Rockchip side.

Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
---
 .../gpu/drm/rockchip/analogix_dp-rockchip.c   | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c b/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
index 0784f19a2ed9..39f1ed293c75 100644
--- a/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
+++ b/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
@@ -164,6 +164,24 @@ static int rockchip_dp_powerdown(struct analogix_dp_plat_data *plat_data)
 	return 0;
 }
 
+static int rockchip_dp_attach(struct analogix_dp_plat_data *plat_data,
+				     struct drm_bridge *bridge)
+{
+	struct rockchip_dp_device *dp = pdata_encoder_to_dp(plat_data);
+	int ret;
+
+	if (plat_data->next_bridge) {
+		ret = drm_bridge_attach(&dp->encoder.encoder, plat_data->next_bridge, bridge,
+					DRM_BRIDGE_ATTACH_NO_CONNECTOR);
+		if (ret) {
+			dev_err(dp->dev, "failed to attach following panel or bridge (%d)\n", ret);
+			return ret;
+		}
+	}
+
+	return 0;
+}
+
 static bool
 rockchip_dp_drm_encoder_mode_fixup(struct drm_encoder *encoder,
 				   const struct drm_display_mode *mode,
@@ -452,6 +470,7 @@ static int rockchip_dp_probe(struct platform_device *pdev)
 	dp->plat_data.dev_type = dp->data->chip_type;
 	dp->plat_data.power_on = rockchip_dp_poweron;
 	dp->plat_data.power_off = rockchip_dp_powerdown;
+	dp->plat_data.attach = rockchip_dp_attach;
 	dp->plat_data.ops = &rockchip_dp_component_ops;
 
 	ret = rockchip_dp_of_probe(dp);
-- 
2.34.1

