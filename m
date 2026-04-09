Received: from mail-m49232.qiye.163.com (mail-m49232.qiye.163.com [45.254.49.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74C2F36E494;
	Thu,  9 Apr 2026 07:08:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.254.49.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775718535; cv=none; b=tyd/f8+nloH/cJIXXoA8z34i3p/BVbnTf/yKBCkOAMQMB+75OhB1GcdDJOxEDdVzfmJ6JW9Sdf+W0p5DoX0m2da2KdgutH/XXzDzhZc9MIfmNvxoAD4JCmTv9fD670QbLGPuGk7xUJaRl9SnXuk25esgY5rVD8qxbzSKIuzmm5M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775718535; c=relaxed/simple;
	bh=B7+Mu51fr9l2xuJetndZ+NdfBYrQ1YVbyYlLVKIkWIs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=AaBxLHBKynQHYqhL3F9/AfiNIKl5MlicGRKiVb7QlUXblFgVqEHvMX5w0/daDB3am7O8qLv6RnukoI0YtU6J+gm0d55sEj/g9Z4MKx+8Ia12y4SEwVRFRc1sY+Hj/cbGgWy3qN69i6ConKMVIDiHHZixazhC+1OWt+O7tqK3V84=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com; spf=pass smtp.mailfrom=rock-chips.com; dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b=BH637uRO; arc=none smtp.client-ip=45.254.49.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b="BH637uRO"
Received: from zyb-HP-ProDesk-680-G2-MT.. (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 3a11ab330;
	Thu, 9 Apr 2026 14:53:32 +0800 (GMT+08:00)
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
	Frank.Li@nxp.com,
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
Subject: [PATCH v13 09/17] drm/bridge: analogix_dp: Remove unused struct drm_connector* for &analogix_dp_plat_data.attach()
Date: Thu,  9 Apr 2026 14:52:53 +0800
Message-Id: <20260409065301.446670-10-damon.ding@rock-chips.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260409065301.446670-1-damon.ding@rock-chips.com>
References: <20260409065301.446670-1-damon.ding@rock-chips.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9d710479ff03a3kunmc1f4d654403a1e
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZQh5CSFYeSB1LQhgdGhgdQ0NWFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSEpKQk
	1VSktLVUpCWQY+
DKIM-Signature: a=rsa-sha256;
	b=BH637uROx3Uz1jzLoLjI0WnGQs4+udACqqHixEXVkAzYK+0IC2zFbSOPSjvrTYO4N1mO2v2tsxxr1hSk8gIB3E07IN64BN9kBBBWZ3WNiQcE/l3TLt9HCw9Aeg0gu8UnmCU+ppnru6QoNW07errorDAeL9FDnqXf+fP29z1miWM=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=efAzOdGpxugXCm0pOz7tZTfN60xV7vKk8UmjiJijrB0=;
	h=date:mime-version:subject:message-id:from;

For both Rockchip and Exynos sides, the struct drm_connector* is
never used in callback &analogix_dp_plat_data.attach(). After
applying drm_bridge_connector helper, this parameter will no longer
be used at all.

Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

---

Changes in v11:
- Add Reviewed-by tag.
---
 drivers/gpu/drm/bridge/analogix/analogix_dp_core.c | 2 +-
 drivers/gpu/drm/exynos/exynos_dp.c                 | 3 +--
 include/drm/bridge/analogix_dp.h                   | 3 +--
 3 files changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
index 09b8b5e4fa23..840c1963e60e 100644
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

