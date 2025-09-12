Received: from mail-m19731106.qiye.163.com (mail-m19731106.qiye.163.com [220.197.31.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 207E0272E5E;
	Fri, 12 Sep 2025 09:04:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.106
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757667870; cv=none; b=LU926YANwTi3UY/jM/jAJw8vbxWlJyQKjIGJTYRhw/vHyLxyZGzeW+26VB6TuQUNbneNT3aJ8InbxrJkjdRR8+zHmgYZB7F38S3VzFoC9ayiL0gbLmY0En4oLXNI6n2ZxfCNvahZTBMfva/3WCv3Jmt1hfUzNX4ICC4xlqwOfQM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757667870; c=relaxed/simple;
	bh=mOn8QULe/bOAL5pC5wG/LodrRRkL3FBWi7ZWhI374Ew=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=BL6F2HtMHcrwO+/LOEGo6Q7QzfRRv4i0ne1rCZnrvmgoExOvpf4M5D6CGtfrAoNioDOnUNHovG1nsRD2g0a1cyxiCNy8h2bSWJ6zDfY1tPSffjy3Ubi83L1dZHeuKuU8RxpukBG1C9O7SFDcriRp6hAp/D2lGkE/OOkWDd/uTxw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com; spf=pass smtp.mailfrom=rock-chips.com; dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b=a4iVBdDq; arc=none smtp.client-ip=220.197.31.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b="a4iVBdDq"
Received: from zyb-HP-ProDesk-680-G2-MT.. (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 2298809a1;
	Fri, 12 Sep 2025 16:59:09 +0800 (GMT+08:00)
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
Subject: [PATCH v5 05/17] drm/exynos: exynos_dp: Remove unused &exynos_dp_device.connector
Date: Fri, 12 Sep 2025 16:58:34 +0800
Message-Id: <20250912085846.7349-6-damon.ding@rock-chips.com>
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
X-HM-Tid: 0a993d2662d503a3kunm813a8c8ea45bd7
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZQksfGlYfGkMeHUJMQ0tOGRhWFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSEpKQk
	1VSktLVUpCWQY+
DKIM-Signature: a=rsa-sha256;
	b=a4iVBdDqD3IEpuZnxqSdbkS1C8eUGQa4Qe4IbLrDVNLLqZD5W+UvP2UCzmkd6iIucgV/rypuK3WMXCz4VV0ePG5p409YmizKJO8ILyxPBetmCp5FKgyzBxg6obmSVU9+snmiXulszuQGUBvWQZmcyhZC0iHD4yLQCo/ACdP1lXc=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=f5VJaXQGMo+dFo+XJeCcfSPVK0akHGQ19iMkCao5QKY=;
	h=date:mime-version:subject:message-id:from;

The &exynos_dp_device.connector is assigned in exynos_dp_bridge_attach()
but never used. It should make sense to remove it.

Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

---

Changes in v5:
- Fix the 'drm/bridge' to 'drm/exynos' in commit message.
---
 drivers/gpu/drm/exynos/exynos_dp.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_dp.c b/drivers/gpu/drm/exynos/exynos_dp.c
index f469ac5b3c2a..e20513164032 100644
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
 	if (plat_data->next_bridge) {
 		ret = drm_bridge_attach(&dp->encoder, plat_data->next_bridge, bridge,
-- 
2.34.1

