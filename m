Received: from mail-m32122.qiye.163.com (mail-m32122.qiye.163.com [220.197.32.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97657274FF5;
	Thu, 24 Jul 2025 08:18:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.32.122
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753345133; cv=none; b=mPf7yHNxENDyOGzTVUa8/gTXG+Vn9RtWvVZVEZTM5+Kt3lE4i+x6Pmwlen7PxKp353vbC8BdKFBWRiyH7/HOiomoXHsBRMG714hHh+Iof8rh4J/oZzXIGDiHKtcAPRzqXZ8iIH547OHfkFOLdeQf7hN34rZ55fcVbZdU8nPQuBA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753345133; c=relaxed/simple;
	bh=D4O6+IZwQcZkm/LCKBJpW+5k3LU4a066cVhpttkbT3g=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=unnltb9brirmRPPn6WOwjpINY2TVa6Zv02NCTpK8amIgId/Hm/AzIAkholvgy9reRMD9norKH7kJIVbMJrCgvSDwOucB8CxyLy1AHFD0ZEsv0HO6aYGbK8NQE+UiCyDA/GNmi4y1CDyf61nv4/ZPcp6gSbHm69kUhSt27Lv05yg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com; spf=pass smtp.mailfrom=rock-chips.com; dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b=IjVR4Stf; arc=none smtp.client-ip=220.197.32.122
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b="IjVR4Stf"
Received: from zyb-HP-ProDesk-680-G2-MT.. (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 1d1c343e3;
	Thu, 24 Jul 2025 16:03:29 +0800 (GMT+08:00)
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
	l.stach@pengutronix.de,
	dianders@chromium.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	Damon Ding <damon.ding@rock-chips.com>
Subject: [PATCH v3 06/14] drm/bridge: exynos_dp: Remove unused &exynos_dp_device.connector
Date: Thu, 24 Jul 2025 16:02:56 +0800
Message-Id: <20250724080304.3572457-7-damon.ding@rock-chips.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250724080304.3572457-1-damon.ding@rock-chips.com>
References: <20250724080304.3572457-1-damon.ding@rock-chips.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a983b7571e103a3kunmbbba7af29ee7
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZGU9JTlYdHkhOGk8YGh8dHxhWFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0
	hVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=IjVR4StfYegeQwZGEx6upd0cgwFT6wvzbKO5XBUrMCMqyGfsSfWnGbizh3QBNMM02QP5Cbcnk7BjsnoffMGHFYyP/VCXVjYvLxja3Exz64w62o2Hvq5KNJcz9iprWRY2rsxcTsIkE5nwnP/FHcW4jpx14nOaaLdFCnZu5gjm4sM=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=kJrmzWG8o3w3Fx2XvyBvGH6uPr9lyKcjsz1Ja3HmYE0=;
	h=date:mime-version:subject:message-id:from;

The &exynos_dp_device.connector is assigned in exynos_dp_bridge_attach()
but never used. It should make sense to remove it.

Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
---
 drivers/gpu/drm/exynos/exynos_dp.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_dp.c b/drivers/gpu/drm/exynos/exynos_dp.c
index 1e8f6b4d399e..004ab9db5216 100644
--- a/drivers/gpu/drm/exynos/exynos_dp.c
+++ b/drivers/gpu/drm/exynos/exynos_dp.c
@@ -35,7 +35,6 @@
 
 struct exynos_dp_device {
 	struct drm_encoder         encoder;
-	struct drm_connector       *connector;
 	struct drm_device          *drm_dev;
 	struct device              *dev;
 
@@ -102,8 +101,6 @@ static int exynos_dp_bridge_attach(struct analogix_dp_plat_data *plat_data,
 	struct exynos_dp_device *dp = to_dp(plat_data);
 	int ret;
 
-	dp->connector = connector;
-
 	/* Pre-empt DP connector creation if there's a bridge */
 	if (plat_data->bridge) {
 		ret = drm_bridge_attach(&dp->encoder, plat_data->bridge, bridge,
-- 
2.34.1

