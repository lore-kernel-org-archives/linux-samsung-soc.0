Received: from mail-m1973180.qiye.163.com (mail-m1973180.qiye.163.com [220.197.31.80])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E956C283FF0;
	Fri, 12 Sep 2025 09:34:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.80
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757669671; cv=none; b=Znim9Dr2HHriY7zpbi/PF6WiES/+WT17g9a3zpS6TXxfg8zzp4MbOsrgLUzVCafw/dnLWPAOcvwYY8Y/9hNFosyPxqvLjFXkyH8Ae9pa43pxYGyZgbP76nLBu3C1VtziI9KSrUgrEHMF14w/gQf2nIHSg8nHRerFMflMP0SuNb0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757669671; c=relaxed/simple;
	bh=uiNh0g1KX7QgFhSgrk6vn2WeiOVUW8Mr5wukV5hLE6s=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=iJqTdn6dpELvJ2GXDrDOUY3ztYTTZ+pcI2rdvbAO+1H15Igd0UjDwElRNK6TK4diD9YWv3tmak/mpJt+894CXvfgpJL7BSRLfY+XokBY2mkXZGCyEaZCMOnP1T54NCyqVRZDRhBDfOQ/STgmvHe5FxWrkWOqxgefSjkAZaQ/Ybs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com; spf=pass smtp.mailfrom=rock-chips.com; dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b=EG5VTGyU; arc=none smtp.client-ip=220.197.31.80
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b="EG5VTGyU"
Received: from zyb-HP-ProDesk-680-G2-MT.. (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 229880954;
	Fri, 12 Sep 2025 16:58:57 +0800 (GMT+08:00)
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
Subject: [PATCH v5 00/17] Apply drm_bridge_connector and panel_bridge helper for the Analogix DP driver
Date: Fri, 12 Sep 2025 16:58:29 +0800
Message-Id: <20250912085846.7349-1-damon.ding@rock-chips.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a993d26337803a3kunm813a8c8ea45a9e
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZQxpISlYeQkJLTEJNTEsaHkxWFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSEpKQk
	1VSktLVUpCWQY+
DKIM-Signature: a=rsa-sha256;
	b=EG5VTGyUNw8venNSly95BGXmrGSInpXQGCNY6hi/RYrpXS3cImt9gKsHB0RD+Jg8OXbsmaOL5mAExSM7FFAL7BGm3XQv1F9g92dPFdjx8N69dGViS0rcnBrtHY0W6uREDqcB3pcG2o//9bIG/tsVbGLZtJ0Zn/TCpokF43SDCR0=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=/x7v4jP7eXTOw5aGuOH5mOPGRkmDaE4FhfdUnrHFHA4=;
	h=date:mime-version:subject:message-id:from;

PATCH 1 is a small format optimization for struct analogid_dp_device.
PATCH 2 is to perform mode setting in &drm_bridge_funcs.atomic_enable.
PATCH 3-9 are preparations for apply drm_bridge_connector helper.
PATCH 10 is to apply the drm_bridge_connector helper.
PATCH 11-14 are to move the panel/bridge parsing to the Analogix side.
PATCH 15-16 are preparations for apply panel_bridge helper.
PATCH 17 is to apply the panel_bridge helper.

Damon Ding (17):
  drm/bridge: analogix_dp: Formalize the struct analogix_dp_device
  drm/bridge: analogix_dp: Move &drm_bridge_funcs.mode_set to
    &drm_bridge_funcs.atomic_enable
  drm/bridge: analogix_dp: Add &analogix_dp_plat_data.next_bridge
  drm/exynos: exynos_dp: Remove &exynos_dp_device.ptn_bridge
  drm/exynos: exynos_dp: Remove unused &exynos_dp_device.connector
  drm/bridge: analogix_dp: Remove redundant
    &analogix_dp_plat_data.skip_connector
  drm/exynos: exynos_dp: Add legacy bridge to parse the display-timings
    node
  drm/bridge: analogix_dp: Move the color format check to
    .atomic_check() for Rockchip platforms
  drm/bridge: analogix_dp: Remove unused
    &analogix_dp_plat_data.get_modes()
  drm/bridge: analogix_dp: Apply drm_bridge_connector helper
  drm/bridge: analogix_dp: Add new API analogix_dp_finish_probe()
  drm/rockchip: analogix_dp: Apply analogix_dp_finish_probe()
  drm/rockchip: analogix_dp: Apply &analogix_dp_plat_data.attach() to
    attach next bridge
  drm/exynos: exynos_dp: Apply analogix_dp_finish_probe()
  drm/bridge: analogix_dp: Remove panel disabling and enabling in
    analogix_dp_set_bridge()
  drm/bridge: analogix_dp: Remove bridge disabing and panel unpreparing
    in analogix_dp_unbind()
  drm/bridge: analogix_dp: Apply panel_bridge helper

 drivers/gpu/drm/bridge/analogix/Kconfig       |   1 +
 .../drm/bridge/analogix/analogix_dp_core.c    | 394 ++++++++++--------
 .../drm/bridge/analogix/analogix_dp_core.h    |   5 +-
 drivers/gpu/drm/exynos/exynos_dp.c            | 168 ++++----
 drivers/gpu/drm/rockchip/Kconfig              |   1 -
 .../gpu/drm/rockchip/analogix_dp-rockchip.c   |  74 ++--
 include/drm/bridge/analogix_dp.h              |   9 +-
 7 files changed, 342 insertions(+), 310 deletions(-)

---

Changes in v2:
- Update Exynos DP driver synchronously.
- Move the panel/bridge parsing to the Analogix side.

Changes in v3:
- Rebase for the existing devm_drm_bridge_alloc() applying commit.
- Fix the typographical error of panel/bridge check in exynos_dp_bind().
- Squash all commits related to skip_connector deletion in both Exynos and
  Analogix code into one.
- Apply panel_bridge helper to make the codes more concise.
- Fix the handing of bridge in analogix_dp_bridge_get_modes().
- Remove unnecessary parameter struct drm_connector* for callback
  &analogix_dp_plat_data.attach().
- In order to decouple the connector driver and the bridge driver, move
  the bridge connector initilization to the Rockchip and Exynos sides.

Changes in v4:
- Rebase for the applied &drm_bridge_funcs.detect() modification commit.
- Rename analogix_dp_find_panel_or_bridge() to analogix_dp_finish_probe().
- Drop the drmm_encoder_init() modification commit.
- Rename the &analogix_dp_plat_data.bridge to
  &analogix_dp_plat_data.next_bridge.

Changes in v5:
- Add legacy bridge to parse the display-timings node under the dp node
  for Exynos side.
- Move color format check to &drm_connector_helper_funcs.atomic_check()
  in order to get rid of &analogix_dp_plat_data.get_modes().
- Remove unused callback &analogix_dp_plat_data.get_modes().
- Distinguish the &drm_bridge->ops of Analogix bridge based on whether
  the downstream device is a panel, a bridge or neither.
- Select DRM_DISPLAY_DP_AUX_BUS for DRM_ANALOGIX_DP, and remove it for
  ROCKCHIP_ANALOGIX_DP.
- Apply rockchip_dp_attach() to support the next bridge attachment for
  the Rockchip side.
- Move next_bridge attachment from Analogix side to Rockchip/Exynos sides.

-- 
2.34.1

