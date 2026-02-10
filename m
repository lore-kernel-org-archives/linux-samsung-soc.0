Received: from mail-m3296.qiye.163.com (mail-m3296.qiye.163.com [220.197.32.96])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B7B0333436;
	Tue, 10 Feb 2026 07:17:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.32.96
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770707878; cv=none; b=gygxaHBqpqf24BfGvhKZI+ggCJuKJ9aoP8g33Zg7Rci9ADUsWkO/IA+X2ik+yG6915CUPAp5I6XqA+N+HYPHaIQWEbDZ02Glb2V1WMo5qimUwi6jiZl/tBr1fBN1HsT/PA2I3OkqW1xhkkilLJBkSE8KXIPhIQqWI5jrNnPdeQU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770707878; c=relaxed/simple;
	bh=FEQdWciCqV4VIEIkLCbuq/rcA900DgIu+iENv81uPpY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=XwhLhlvGD6NQPNTqRwogy97sin8u/dXb1TitZwIR1zLw0ke2FTD3gCBUYOhKGM07uE8huvDSN4VrP9oXWCS2Ccnkl8SS4Ijhe7DVZdBm2OCLk2dTqVLPfdCLdIQO2oF5jlKLaAL1u8FE51cFQr2wc3NukWBhhLchqz1Sabw0+18=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com; spf=pass smtp.mailfrom=rock-chips.com; dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b=Z+Fj5r0R; arc=none smtp.client-ip=220.197.32.96
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b="Z+Fj5r0R"
Received: from zyb-HP-ProDesk-680-G2-MT.. (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 33b5149dd;
	Tue, 10 Feb 2026 15:12:36 +0800 (GMT+08:00)
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
Subject: [PATCH v9 00/15] Apply drm_bridge_connector and panel_bridge helper for the Analogix DP driver
Date: Tue, 10 Feb 2026 15:12:10 +0800
Message-Id: <20260210071225.2566099-1-damon.ding@rock-chips.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9c4665191003a3kunm1f53a888aef912
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZGUpOGVYaTE1PSh5OHhoYQx1WFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSEpKQk
	1VSktLVUpCWQY+
DKIM-Signature: a=rsa-sha256;
	b=Z+Fj5r0Rw1TMebwxAp/4AFkzMNHl7nhEpGZTGNoK7G4F/I09AU2uhdwlKZtQzerkflmeS2gxIXdGipUfu+ckPNo6KgjdowPmGtbaSZHX4e9EC25tcK9fFAAnjQxboPMLKwsf7WB1ub6Im76zhIDmmkTZRqLCOkLK1Zq1XWYGXvE=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=cz6ol091hNjcahKRiP2xNfbtwfL7XDz0jE84BlXHPkU=;
	h=date:mime-version:subject:message-id:from;

Picked from:
https://lore.kernel.org/all/20251217093321.3108939-1-damon.ding@rock-chips.com/

PATCH 1 is to add a new parameter to store the point of next bridge.
PATCH 2 is to make legacy bridge driver more universal.
PATCH 3-8 are preparations for apply drm_bridge_connector helper.
PATCH 9 is to apply the drm_bridge_connector helper.
PATCH 10-12 are to move the panel/bridge parsing to the Analogix side.
PATCH 13 is to attach the next bridge on Analogix side uniformly.
PATCH 14-15 are to apply the panel_bridge helper.

The following reviewed commits, which to make codes more concise, are
rebased to the front of this patch series:

https://lore.kernel.org/all/20251110085823.1197472-1-damon.ding@rock-chips.com/
https://lore.kernel.org/all/20251111022103.1350183-1-damon.ding@rock-chips.com/

Damon Ding (15):
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
 .../drm/bridge/analogix/analogix_dp_core.c    | 238 +++++++++---------
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
 19 files changed, 297 insertions(+), 386 deletions(-)
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

-- 
2.34.1

