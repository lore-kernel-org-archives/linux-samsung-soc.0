Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=210.79.60.125
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795605743;
	b=C7bYKWDr9VO2BJLzQrwPaWshzN2ERFaAGsRj4iholIXqHpjph3Bn3Q/Ygf1SG2TYq8W7
	 rzoWSvXoSYYaBS0rq0OVZdOAQWGKP/Aq8/qoZNP6417AO75fxEgzB4/AuztlFlmqJ9BiW
	 o+qpozVjgFuZJJnLjdcTnUgA7tyo9/f5cYrGg5+RS+Aa2qnbR27Yy635jtpdpCtvRK//k
	 W5OCVw7wMpDxhlu3NV9s/cHXYdErqZXKMdmg4We2dJ5XjYETS6bhF5KFltvKFM5vroSf4
	 xlcMLzHmbI4rvS99eWVhzXobDzv5pFsU2tUI4LMXesL8Q1pgjGsImCNniZR0SGtkLCw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795605743;
	h=DMARC-Filter:Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:
	 X-HM-Tid:X-HM-MType:X-HM-Spam-Status:DKIM-Signature;
	bh=8wdlz0LG+mt5/jNeMcYINGDfpLpelVy5XiXlc9r/roo=;
	b=PuvlqLMqWFC8vjESAaU+bhEQwqun62+uryUoOFJguh0j7NpYIwlbxK7cUSO7mFr0vdgb
	 /VuVIdR6zuzw5UY4NBz2VyM1d8KFTjV7SnMAqnOlOGAnA24zIiLpqJyBVzGOGCIgq+iCx
	 I4xDyqBCH7TiXH+rXKhCyT5DlduPPEWNjxus1Jb3H9JDWq9CeqysR2XyCcN2nm0cmjHdY
	 25ZXjF219H/ifLvRqmXScUZSCX2rgmMhsHF5AV+TY1E40bBq69EdcuSQvr7Eyh+h0snRt
	 hcVzQdbu5dA2BK9odwGNlCifLbRVhhaJMs8EoDbPVn3xFBIHGTMxmgYf7MxfjVbJFFg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=rock-chips.com;
	spf=pass smtp.mailfrom=rock-chips.com;
	dkim=pass header.d=rock-chips.com header.i=@rock-chips.com header.a=rsa-sha256 header.s=default header.b=Iwfl+96T;
	arc=none smtp.remote-ip=210.79.60.125
Received: from mail-m60125.netease.com (mail-m60125.netease.com [210.79.60.125])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5672160A3814;
	Wed, 25 Nov 2026 11:22:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5672160A3814
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.a=rsa-sha256 header.s=default header.b=Iwfl+96T
Received: from zyb-HP-ProDesk-680-G2-MT.. (unknown [61.154.14.86])
	by smtp.qiye.163.com (Hmail) with ESMTP id 55f816069;
	Wed, 25 Nov 2026 19:22:12 +0800 (GMT+08:00)
From: Damon Ding <damon.ding@rock-chips.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Jingoo Han <jingoohan1@gmail.com>,
	Inki Dae <inki.dae@samsung.com>,
	Seung-Woo Kim <sw0312.kim@samsung.com>,
	Kyungmin Park <kyungmin.park@samsung.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Sandy Huang <hjc@rock-chips.com>,
	Andy Yan <andyshrk@163.com>
Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	Damon Ding <damon.ding@rock-chips.com>
Subject: [PATCH v7 14/20] drm/rockchip: analogix_dp: Unbind bridge when connector init fails
Date: Wed, 25 Nov 2026 19:21:35 +0800
Message-Id: <20261125112141.1434903-15-damon.ding@rock-chips.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261125112141.1434903-1-damon.ding@rock-chips.com>
References: <20261125112141.1434903-1-damon.ding@rock-chips.com>
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Post: <mailto:linux-samsung-soc@vger.kernel.org>
List-Help: <mailto:linux-samsung-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-samsung-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0aa212711e2703a8kunm17c230507758d2
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkZTx9IVklLHU1OS01CSEMYTFYVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlNSlVKTk9VSk9VQ01ZV1kWGg8SFR0UWUFZT0tIVUpLSE
	pKQk1VSktLVUpCWQY+
DKIM-Signature: a=rsa-sha256;
	b=Iwfl+96TVBGB7FAGE+rGSWA2yQq/vmKqPlgYhhIyBsga7Y1ekKEPBl0eYaVttVJua9OHTOLyzupetvuNEHhAJnBYytJNrlD3+Sv4h7TnqxXJGZmgq+/yWjCiqD1a6B27MrzUd8V3hrKvZVv1k8f7C/H5AKwIQvE9fxkJ23C91/A=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=8wdlz0LG+mt5/jNeMcYINGDfpLpelVy5XiXlc9r/roo=;
	h=date:mime-version:subject:message-id:from;

The rockchip_dp_bind() returns without unwinding analogix_dp_bind()
when drm_bridge_connector_init() fails.  The aux device registered by
analogix_dp_bind() is then left behind with a dangling drm_dev
pointer, which could be accessed on later AUX transfers.

Call analogix_dp_unbind() in the error path to release the aux device.

Fixes: 99a49ff5ef7a ("drm/bridge: analogix_dp: Apply drm_bridge_connector helper")
Tested-by: Heiko Stuebner <heiko@sntech.de>
Signed-off-by: Damon Ding <damon.ding@rock-chips.com>

---

Changes in v6:
- Add Tested-by tag.

Changes in v7:
- Add Fixes tag.
---
 drivers/gpu/drm/rockchip/analogix_dp-rockchip.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c b/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
index 635146746b42..39eca3ec7160 100644
--- a/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
+++ b/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
@@ -419,6 +419,7 @@ static int rockchip_dp_bind(struct device *dev, struct device *master,
 	if (IS_ERR(connector)) {
 		ret = PTR_ERR(connector);
 		dev_err(dp->dev, "Failed to initialize bridge_connector\n");
+		analogix_dp_unbind(dp->adp);
 		goto err_cleanup_encoder;
 	}
 
-- 
2.34.1

