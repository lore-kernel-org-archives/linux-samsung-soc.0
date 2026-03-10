Received: from mail-m8154.xmail.ntesmail.com (mail-m8154.xmail.ntesmail.com [156.224.81.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F01171FC0EF;
	Tue, 10 Mar 2026 01:25:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.224.81.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773105958; cv=none; b=WbZ4O2Xb8Pn3PU26uZhdjW+awBSMuFYwwVDFmiNwhXIR2d4XNBrYgVVZL7TLv94prIbejO5jbDCmMAYy4VFyhq8cQx7TupXAAEffCfUca6JOPK6VX8bEXhOFKmBoF8AFIBzUnwF25HT2uv6gUv0bHXprJ+PoJXDgZf/LQpPQbYg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773105958; c=relaxed/simple;
	bh=Eh2jYRMS4D3MPwAMWZnxwj/t6ayw/jhXE30qY+5Z9/k=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=fz+bowCmghMAjq2X7gCR4ztYk1I7Y3jtK+3DtGdwx6415q3VdIJXarP2qwXRI51TxP8qTSuG8OVbAI+h5HV7oWVUBUSjpDVbDD+tfPWnwhYs6FQmaWYsx10coQPVeVKLoan6sgIRyL8wrcZA+Xg16chKuctGvCMUnlF9LvualDo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com; spf=pass smtp.mailfrom=rock-chips.com; dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b=C/rTvtqu; arc=none smtp.client-ip=156.224.81.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b="C/rTvtqu"
Received: from zyb-HP-ProDesk-680-G2-MT.. (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 3653ae81e;
	Tue, 10 Mar 2026 09:25:43 +0800 (GMT+08:00)
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
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	inki.dae@samsung.com,
	sw0312.kim@samsung.com,
	kyungmin.park@samsung.com,
	krzk@kernel.org,
	alim.akhtar@samsung.com,
	jingoohan1@gmail.com,
	p.zabel@pengutronix.de,
	hjc@rock-chips.com,
	heiko@sntech.de,
	andy.yan@rock-chips.com,
	dmitry.baryshkov@oss.qualcomm.com,
	dianders@chromium.org,
	m.szyprowski@samsung.com,
	luca.ceresoli@bootlin.com,
	jani.nikula@intel.com,
	linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	Damon Ding <damon.ding@rock-chips.com>
Subject: [PATCH v10 09/18] drm/bridge: analogix_dp: Remove unused struct drm_connector* for &analogix_dp_plat_data.attach()
Date: Tue, 10 Mar 2026 09:24:49 +0800
Message-Id: <20260310012458.169272-10-damon.ding@rock-chips.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260310012458.169272-1-damon.ding@rock-chips.com>
References: <20260310012458.169272-1-damon.ding@rock-chips.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9cd559959a03a3kunm2771af5030dfe6
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZQksYTlYYGRkaQ01KSh4YGR5WFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSEpKQk
	1VSktLVUpCWQY+
DKIM-Signature: a=rsa-sha256;
	b=C/rTvtqu28pNqs5PnAP6x1cYR6W0qWPPQcI/zm2tgMpVN8WhUKFvkxYy6ujd3oUeTl15Be7cYOJpNlZW7YIs4xQBbHi49kKl9l+rdrvI6fXQHOedywpmxMnvcHVal6/JQARL6WD2cdpCtk1yBZ9fsCAcagiDc/DXDXdMIeMd/9U=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=XvXas63UaXEdWzKWMjI2P5fdbJFHqnb1pM1cRO6D7Sw=;
	h=date:mime-version:subject:message-id:from;

For both Rockchip and Exynos sides, the struct drm_connector* is
never used in callback &analogix_dp_plat_data.attach(). After
applying drm_bridge_connector helper, this parameter will no longer
be used at all.

Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
---
 drivers/gpu/drm/bridge/analogix/analogix_dp_core.c | 2 +-
 drivers/gpu/drm/exynos/exynos_dp.c                 | 3 +--
 include/drm/bridge/analogix_dp.h                   | 3 +--
 3 files changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
index b0bc96693fdb..3efd910ea463 100644
--- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
+++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
@@ -991,7 +991,7 @@ static int analogix_dp_bridge_attach(struct drm_bridge *bridge,
 	 * point after plat attached.
 	 */
 	if (dp->plat_data->attach) {
-		ret = dp->plat_data->attach(dp->plat_data, bridge, connector);
+		ret = dp->plat_data->attach(dp->plat_data, bridge);
 		if (ret) {
 			DRM_ERROR("Failed at platform attach func\n");
 			return ret;
diff --git a/drivers/gpu/drm/exynos/exynos_dp.c b/drivers/gpu/drm/exynos/exynos_dp.c
index 1eeb0b15f99a..71a00ee97782 100644
--- a/drivers/gpu/drm/exynos/exynos_dp.c
+++ b/drivers/gpu/drm/exynos/exynos_dp.c
@@ -70,8 +70,7 @@ static int exynos_dp_poweroff(struct analogix_dp_plat_data *plat_data)
 }
 
 static int exynos_dp_bridge_attach(struct analogix_dp_plat_data *plat_data,
-				   struct drm_bridge *bridge,
-				   struct drm_connector *connector)
+				   struct drm_bridge *bridge)
 {
 	struct exynos_dp_device *dp = to_dp(plat_data);
 	enum drm_bridge_attach_flags flags = 0;
diff --git a/include/drm/bridge/analogix_dp.h b/include/drm/bridge/analogix_dp.h
index 3301392eda5f..3428ffff24c5 100644
--- a/include/drm/bridge/analogix_dp.h
+++ b/include/drm/bridge/analogix_dp.h
@@ -33,8 +33,7 @@ struct analogix_dp_plat_data {
 
 	int (*power_on)(struct analogix_dp_plat_data *);
 	int (*power_off)(struct analogix_dp_plat_data *);
-	int (*attach)(struct analogix_dp_plat_data *, struct drm_bridge *,
-		      struct drm_connector *);
+	int (*attach)(struct analogix_dp_plat_data *, struct drm_bridge *);
 };
 
 int analogix_dp_resume(struct analogix_dp_device *dp);
-- 
2.34.1

