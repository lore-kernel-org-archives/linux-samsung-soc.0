Received: from mail-m32105.qiye.163.com (mail-m32105.qiye.163.com [220.197.32.105])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65AE13976A9;
	Thu,  9 Apr 2026 08:09:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.32.105
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775722143; cv=none; b=fRE9BmeeVq+tyCxwcm3EqmVSRSEcj4/b/EVYPYDxPXukEp7z02StWQ+C3hophHFEQsF+JRr9Ap6FfxOFDWXeay4+Lt2MBs+qaMVWWOVgTouqMcTeHssmvw75SfmIpV1LbFql+LJgj/XnzWpouqQBt7yAcUTvYXhGWTpDNPWm/uA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775722143; c=relaxed/simple;
	bh=O/4WsXEP5JhXYhUW6xsCH4bcUYO2FywgNsvbD8J+ZyA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=G4UAUa60ROGhdlmhEp+oGwMZGibWx5ZwANvw35J3U2xEtD1wN2ESiZuwEsV9xb7qm24UcsBX+vAiRI6/9CFc7xeOg7Q6Im6wG9dMqsNgCXyQwaNdH4+KDMmIEAhbVu8OqS0gYBoJ3pDUJz/ncuwWrH/C/BcJMO65+rXPDmn9VFE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com; spf=pass smtp.mailfrom=rock-chips.com; dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b=Kpw4o5jw; arc=none smtp.client-ip=220.197.32.105
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b="Kpw4o5jw"
Received: from zyb-HP-ProDesk-680-G2-MT.. (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 3a11ab2ed;
	Thu, 9 Apr 2026 14:53:23 +0800 (GMT+08:00)
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
Subject: [PATCH v13 06/17] drm/bridge: analogix_dp: Remove redundant &analogix_dp_plat_data.skip_connector
Date: Thu,  9 Apr 2026 14:52:50 +0800
Message-Id: <20260409065301.446670-7-damon.ding@rock-chips.com>
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
X-HM-Tid: 0a9d7104594403a3kunmc1f4d65440398d
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZQx8ZH1ZCHR0eThpCGh9KTh9WFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSEpKQk
	1VSktLVUpCWQY+
DKIM-Signature: a=rsa-sha256;
	b=Kpw4o5jwXtjwDm5nIU9QFQ5tZUN+F2SufTLNJLWnBnpy/s+YhXj7QcN2WrdmmXs9TuI+k6cvoOU4bMs/kYwEkCQ151KKTR8l9QWsfikSFUQlODn3IJ537nUpiZNj/sTx6SuqqQvzZQCWx1ThFN3srxCN/S/HIG6KvkQ68vjhEnk=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=KCbAlwEoOBYk0fSV1riFaEt3+0NmP1XEH3WKYnb5FZc=;
	h=date:mime-version:subject:message-id:from;

The &analogix_dp_plat_data.skip_connector related check can be replaced
by &analogix_dp_plat_data.bridge.

Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>
Tested-by: Heiko Stuebner <heiko@sntech.de> # rk3588

---

Changes in v3:
- Squash the Exynos side commit and the Analogix side commit together.

Changes in v4:
- Rename the &analogix_dp_plat_data.bridge to
  &analogix_dp_plat_data.next_bridge.

Changes in v9:
- Add Tested-by tag.

Changes in v10:
- Add Reviewed-by tag.

Changes in v13:
- Modify '(on rk3588)' to '# rk3588' for Tested-by tag.
---
 drivers/gpu/drm/bridge/analogix/analogix_dp_core.c | 2 +-
 drivers/gpu/drm/exynos/exynos_dp.c                 | 1 -
 include/drm/bridge/analogix_dp.h                   | 1 -
 3 files changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
index 8dee5f2fbde5..88fb863fed78 100644
--- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
+++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
@@ -959,7 +959,7 @@ static int analogix_dp_bridge_attach(struct drm_bridge *bridge,
 		return -EINVAL;
 	}
 
-	if (!dp->plat_data->skip_connector) {
+	if (!dp->plat_data->next_bridge) {
 		connector = &dp->connector;
 		connector->polled = DRM_CONNECTOR_POLL_HPD;
 
diff --git a/drivers/gpu/drm/exynos/exynos_dp.c b/drivers/gpu/drm/exynos/exynos_dp.c
index ac16138a22fe..1eeb0b15f99a 100644
--- a/drivers/gpu/drm/exynos/exynos_dp.c
+++ b/drivers/gpu/drm/exynos/exynos_dp.c
@@ -200,7 +200,6 @@ static int exynos_dp_probe(struct platform_device *pdev)
 	dp->plat_data.power_on = exynos_dp_poweron;
 	dp->plat_data.power_off = exynos_dp_poweroff;
 	dp->plat_data.attach = exynos_dp_bridge_attach;
-	dp->plat_data.skip_connector = !!bridge;
 
 out:
 	dp->adp = analogix_dp_probe(dev, &dp->plat_data);
diff --git a/include/drm/bridge/analogix_dp.h b/include/drm/bridge/analogix_dp.h
index 582357c20640..f06da105d8f2 100644
--- a/include/drm/bridge/analogix_dp.h
+++ b/include/drm/bridge/analogix_dp.h
@@ -30,7 +30,6 @@ struct analogix_dp_plat_data {
 	struct drm_bridge *next_bridge;
 	struct drm_encoder *encoder;
 	struct drm_connector *connector;
-	bool skip_connector;
 
 	int (*power_on)(struct analogix_dp_plat_data *);
 	int (*power_off)(struct analogix_dp_plat_data *);
-- 
2.34.1

