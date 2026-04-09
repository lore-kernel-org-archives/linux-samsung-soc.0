Received: from mail-m32112.qiye.163.com (mail-m32112.qiye.163.com [220.197.32.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 808C034B404;
	Thu,  9 Apr 2026 07:08:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.32.112
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775718515; cv=none; b=pnBh3GC3wVFVNllcyYEFoWWN9f9eTXuo25Ms90qZOezmi4YfAVRjtNYimWbY95zL+bruMshQqLGMmErBqmrqYq8VNb1Vji5Oxsti/MFmbjfbq4wasj6Ge9XNodg01OXd53uHwD7MWnmtKH4MrdxrHnXKH/tDaBJWakqHM5AsmMg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775718515; c=relaxed/simple;
	bh=BQ1mx0HutItQvKf9elblEjZNZZN3jmRP8eShk2OqYrg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=L9InOM26FrtTjHOuEAQlXLhOSMe3qbktIYPoJS64JMw5w7SQG3UgNsVma1MsbMuo2C/wmncNcWTyuYwgiHi5Ou5ixe/JD4415Ik0bzGsXVIsB/A2NBnYAJe8EXp4LEykHHtHZvfkbhkL6h7enJLP7DgU7nuVX1p4cc1DEQ7RD1A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com; spf=pass smtp.mailfrom=rock-chips.com; dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b=Xo7+aaBL; arc=none smtp.client-ip=220.197.32.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b="Xo7+aaBL"
Received: from zyb-HP-ProDesk-680-G2-MT.. (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 3a11ab267;
	Thu, 9 Apr 2026 14:53:07 +0800 (GMT+08:00)
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
Subject: [PATCH v13 00/17] Apply drm_bridge_connector and panel_bridge helper for the Analogix DP driver
Date: Thu,  9 Apr 2026 14:52:44 +0800
Message-Id: <20260409065301.446670-1-damon.ding@rock-chips.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9d7104187803a3kunmc1f4d654403886
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZGUwZSVYZTRlLHk4dSRlJQkpWFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSEpKQk
	1VSktLVUpCWQY+
DKIM-Signature: a=rsa-sha256;
	b=Xo7+aaBLUCYHygoz86WU8z2q+B7f8DLerX8OJBixGDeM4Ox6/DPlK46BPva+6lRi/l8irGtvaVbmQ0psI6923Iw6iNR3/wExwnYxKaaOTYZsPy5u/ETJ75BKQqRWlcCptpDSvnPNyrXZrzbNv7NoE/gu1WR+SpG3KSFN+BmvcGo=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=ZB86Lne704ZIx6eyaPdFNQnX58PuyWT+mAjzcbjjxP4=;
	h=date:mime-version:subject:message-id:from;

PATCH 1 is to add a new parameter to store the point of next bridge.
PATCH 2 is to make legacy bridge driver more universal.
PATCH 3-10 are preparations for apply drm_bridge_connector helper.
PATCH 11 is to apply the drm_bridge_connector helper.
PATCH 12-14 are to move the panel/bridge parsing to the Analogix side.
PATCH 15 is to attach the next bridge on Analogix side uniformly.
PATCH 16-17 are to apply the panel_bridge helper.

Damon Ding (17):
  drm/bridge: analogix_dp: Add &analogix_dp_plat_data.next_bridge
  drm/bridge: Move legacy bridge driver out of imx directory for
    multi-platform use
  drm/exynos: exynos_dp: Remove &exynos_dp_device.ptn_bridge
  drm/exynos: exynos_dp: Remove unused &exynos_dp_device.connector
  drm/exynos: exynos_dp: Apply of-display-mode-bridge to parse the
    display-timings node
  drm/bridge: analogix_dp: Remove redundant
    &analogix_dp_plat_data.skip_connector
  drm/bridge: analogix_dp: Move the color format check to
    .atomic_check() for Rockchip platforms
  drm/bridge: analogix_dp: Remove unused
    &analogix_dp_plat_data.get_modes()
  drm/bridge: analogix_dp: Remove unused struct drm_connector* for
    &analogix_dp_plat_data.attach()
  drm/bridge: analogix_dp: Pass struct drm_atomic_state* for
    analogix_dp_bridge_mode_set()
  drm/bridge: analogix_dp: Apply drm_bridge_connector helper
  drm/bridge: analogix_dp: Add new API analogix_dp_finish_probe()
  drm/rockchip: analogix_dp: Apply analogix_dp_finish_probe()
  drm/exynos: exynos_dp: Apply analogix_dp_finish_probe()
  drm/bridge: analogix_dp: Attach the next bridge in
    analogix_dp_bridge_attach()
  drm/bridge: analogix_dp: Remove bridge disabing and panel unpreparing
    in analogix_dp_unbind()
  drm/bridge: analogix_dp: Apply panel_bridge helper

 drivers/gpu/drm/bridge/Kconfig                |  10 +
 drivers/gpu/drm/bridge/Makefile               |   1 +
 drivers/gpu/drm/bridge/analogix/Kconfig       |   1 +
 .../drm/bridge/analogix/analogix_dp_core.c    | 236 +++++++++---------
 .../drm/bridge/analogix/analogix_dp_core.h    |   1 -
 drivers/gpu/drm/bridge/imx/Kconfig            |  10 -
 drivers/gpu/drm/bridge/imx/Makefile           |   1 -
 .../gpu/drm/bridge/imx/imx-legacy-bridge.c    |  91 -------
 .../gpu/drm/bridge/of-display-mode-bridge.c   |  93 +++++++
 drivers/gpu/drm/exynos/Kconfig                |   2 +
 drivers/gpu/drm/exynos/exynos_dp.c            | 110 ++------
 drivers/gpu/drm/imx/ipuv3/Kconfig             |   4 +-
 drivers/gpu/drm/imx/ipuv3/imx-ldb.c           |   6 +-
 drivers/gpu/drm/imx/ipuv3/parallel-display.c  |   5 +-
 drivers/gpu/drm/rockchip/Kconfig              |   1 +
 .../gpu/drm/rockchip/analogix_dp-rockchip.c   |  67 +----
 include/drm/bridge/analogix_dp.h              |   8 +-
 include/drm/bridge/imx.h                      |  17 --
 include/drm/bridge/of-display-mode-bridge.h   |  17 ++
 19 files changed, 295 insertions(+), 386 deletions(-)
 delete mode 100644 drivers/gpu/drm/bridge/imx/imx-legacy-bridge.c
 create mode 100644 drivers/gpu/drm/bridge/of-display-mode-bridge.c
 delete mode 100644 include/drm/bridge/imx.h
 create mode 100644 include/drm/bridge/of-display-mode-bridge.h

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

Changes in v6:
- Move legacy bridge driver out of imx directory for multi-platform use.
- Apply DRM legacy bridge to parse display timings intead of implementing
  the same codes only for Exynos DP.
- Ensure last bridge determines EDID/modes detection capabilities in DRM
  bridge_connector driver.
- Remove unnecessary drm_bridge_get_modes() in
  analogix_dp_bridge_get_modes().
- Simplify analogix_dp_bridge_edid_read().
- If the next is a bridge, set DRM_BRIDGE_OP_DETECT and return
  connector_status_connected in analogix_dp_bridge_detect().
- Set flag DRM_BRIDGE_ATTACH_NO_CONNECTOR for bridge attachment while
  binding. Meanwhile, make DRM_BRIDGE_ATTACH_NO_CONNECTOR unsuppported
  in analogix_dp_bridge_attach().
- Move the next bridge attachment to the Analogix side rather than
  scattered on Rockchip and Exynos sides.
- Remove the unnecessary analogix_dp_bridge_get_modes().
- Squash [PATCH v5 15/17] into [PATCH v5 17/17].
- Fix the &drm_bridge->ops to DRM_BRIDGE_OP_EDID | DRM_BRIDGE_OP_DETECT.

Changes in v7:
- As Luca suggested, simplify the code and related comment for bridge_connector
  modifications. Additionally, move the commit related to bridge_connector to
  the top of this patch series.
- Rename legacy-bridge driver to of-display-mode-bridge driver.
- Remove unnecessary API drm_bridge_is_legacy() and apply a temporary flag
  &exynos_dp_device.has_of_bridge instead, which will be removed finally.
- Remove exynos_dp_legacy_bridge_init() and inline API
  devm_drm_of_display_mode_bridge().

Changes in v8:
- Adapt the related modifications to the newest bridge_connector driver.

Changes in v9:
- Fix the Kconfig help text for CONFIG_DRM_OF_DISPLAY_MODE_BRIDGE.
- Add Tested-by tag from Heiko.

Changes in v10:
- Fix to use dev_err_probe() in newly added API analogix_dp_finish_probe().
- Expaned commit message for [PATCH v9 9/15] and [PATCH v9 10/15].
- Split [PATCH v9 9/15] into serval smaller commits.
- Add Reviewed-by tags from Luca.

Changes in v11:
- Merge [PATCH v10 12/18] into [PATCH v10 11/18].
- Fix the bridge flag to 'flags | DRM_BRIDGE_ATTACH_NO_CONNECTOR' in
  [PATCH v10 11/18].
- Add Reviewed-by tags from Luca.

Changes in v12:
- Restore accidentally removed DRM_BRIDGE_CONNECTOR Kconfig in v10.

Changes in v13:
- Modify '(on rk3588)' to '# rk3588' for Tested-by tag as discussed in
  https://lore.kernel.org/all/571cc85a-3310-4b56-a3ef-3aab698192f6@rock-chips.com/
- Rebase [PATCH v12 2/17] after commit 02df94d98ff8 ("drm/imx: parallel-display:
  add DRM_DISPLAY_HELPER for DRM_IMX_PARALLEL_DISPLAY")
- Rebase [PATCH v12 7/17] and [PATCH v12 11/17] after commit 01962a191242
  ("drm/rockchip: analogix: Convert to drm_output_color_format")

-- 
2.34.1

