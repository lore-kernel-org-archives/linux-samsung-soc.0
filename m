Received: from mail-m1973190.qiye.163.com (mail-m1973190.qiye.163.com [220.197.31.90])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0773296BA4;
	Thu, 19 Mar 2026 07:50:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.90
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773906652; cv=none; b=YBsN3mO6EWtaN1HteCwjzFwV9RSkubvXYX9mlSHWBLDoQcxDKc+ymexA6ywkoD6pWaXaiNQd7cGQT9GB/A8WlxvZZHJjcdJT9UCNuPtR5HIqlrK8rmRRk1K1BgQBGYu2AmucAMGI8ITSMb9KpqsS3pf1EALw2zBpLLocFgqbtXo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773906652; c=relaxed/simple;
	bh=O7RzHCzDaB7q7ZccfTgUrHJSSd1farFQEKVuGjb3swg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=RDshlY8IY9jbjsPHuG7uO/ltAI0Mi4Ir4qCVk9sKup4ceBGFalhD2ZB9FIfCVfsce3YXKIsUfTHA1pwVj3q6iwTlQZGcxy0vcl2jy/W1Of+FLYQdU1AUR4iX1rCRmXIBSRB0KUObjgRCUMSosHl1KvkI2N55SeZPhUlbQ/OZwkA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com; spf=pass smtp.mailfrom=rock-chips.com; dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b=CRH4QCN8; arc=none smtp.client-ip=220.197.31.90
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b="CRH4QCN8"
Received: from zyb-HP-ProDesk-680-G2-MT.. (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 3788743b4;
	Thu, 19 Mar 2026 15:15:11 +0800 (GMT+08:00)
From: Damon Ding <damon.ding@rock-chips.com>
To: andrzej.hajda@intel.com,
	neil.armstrong@linaro.org,
	rfoss@kernel.org,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	victor.liu@nxp.com,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	inki.dae@samsung.com,
	sw0312.kim@samsung.com,
	kyungmin.park@samsung.com,
	krzk@kernel.org,
	jingoohan1@gmail.com,
	p.zabel@pengutronix.de,
	hjc@rock-chips.com,
	heiko@sntech.de,
	andy.yan@rock-chips.com
Cc: Laurent.pinchart@ideasonboard.com,
	jonas@kwiboo.se,
	jernej.skrabec@gmail.com,
	kernel@pengutronix.de,
	festevam@gmail.com,
	alim.akhtar@samsung.com,
	dmitry.baryshkov@oss.qualcomm.com,
	luca.ceresoli@bootlin.com,
	nicolas.frattaroli@collabora.com,
	dianders@chromium.org,
	m.szyprowski@samsung.com,
	linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	Damon Ding <damon.ding@rock-chips.com>
Subject: [PATCH v11 01/17] drm/bridge: analogix_dp: Add &analogix_dp_plat_data.next_bridge
Date: Thu, 19 Mar 2026 15:14:36 +0800
Message-Id: <20260319071452.1961274-2-damon.ding@rock-chips.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260319071452.1961274-1-damon.ding@rock-chips.com>
References: <20260319071452.1961274-1-damon.ding@rock-chips.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9d04f2c1a303a3kunm86e540ee396488
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZQ0MYSVZLT04aTUsfQ0tLGBpWFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSEpKQk
	1VSktLVUpCWQY+
DKIM-Signature: a=rsa-sha256;
	b=CRH4QCN8yD3JR2u9I+6o6U+yUf8WZS1qMIo8ORgmWY7CaBpP6UQ9I7B4MdzFiF41OnlHtYDPf1SwPl84aRGzsc+dDUp7JBPl+vXa3ZHB5ah6NuVcShJyEHZe2ztvm5tJVPab4LGNEWpG4Uj5CraA4a2UPh+lqLqfm3+lEcycrwM=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=1qcQ7gNd/FYZLVi0CLYQ36BgxuUYuY4ez1oRTlI1iEA=;
	h=date:mime-version:subject:message-id:from;

In order to move the panel/bridge parsing and attachmenet to the
Analogix side, add component struct drm_bridge *next_bridge to
platform data struct analogix_dp_plat_data.

The movement makes sense because the panel/bridge should logically
be positioned behind the Analogix bridge in the display pipeline.

Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>
Tested-by: Heiko Stuebner <heiko@sntech.de> (on rk3588)

---

Changes in v4:
- Rename the &analogix_dp_plat_data.bridge to
  &analogix_dp_plat_data.next_bridge

Changes in v9:
- Add Reviewed-by and Tested-by tags.
---
 include/drm/bridge/analogix_dp.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/drm/bridge/analogix_dp.h b/include/drm/bridge/analogix_dp.h
index cf17646c1310..582357c20640 100644
--- a/include/drm/bridge/analogix_dp.h
+++ b/include/drm/bridge/analogix_dp.h
@@ -27,6 +27,7 @@ static inline bool is_rockchip(enum analogix_dp_devtype type)
 struct analogix_dp_plat_data {
 	enum analogix_dp_devtype dev_type;
 	struct drm_panel *panel;
+	struct drm_bridge *next_bridge;
 	struct drm_encoder *encoder;
 	struct drm_connector *connector;
 	bool skip_connector;
-- 
2.34.1

