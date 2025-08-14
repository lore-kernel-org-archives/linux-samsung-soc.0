Received: from mail-m3286.qiye.163.com (mail-m3286.qiye.163.com [220.197.32.86])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8188318148;
	Thu, 14 Aug 2025 10:48:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.32.86
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755168491; cv=none; b=Kr5d0inhaBPQ82YDz/DthycWiurhOeUMrwSyz8a1rl+k0CBuNgznitDwncwOrbY+gUmrzsiZlm6wpMUBs0LcaYQMyVQPAokAJKFz1R8lWszZ7cgtaoLLZJRxVQJbojoYG59Xhh8egU3/CaIDqmkRr77VQh+ipSC24czJ6X31pEg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755168491; c=relaxed/simple;
	bh=tSwryOwZXYn8ie0bPRKZEwyBfs+9RQVMBc07SgrbFjA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=ihrHOcOQY+lB63J3uL7p8ElPrFIvXuk1aZxUJzBJCiBp294MXhzA6rBL69rSYN+H5IAeO7xNAs4CiZugbYei2l9UsNbbwbIXYX3EmSIU4s4CADQY4VfCyVBF+l1lNwaN9zg2fAqHh1f1dzN7R0+tdJGfuclHptmjCNNgWh5wIAk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com; spf=pass smtp.mailfrom=rock-chips.com; dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b=fpU8maqO; arc=none smtp.client-ip=220.197.32.86
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b="fpU8maqO"
Received: from zyb-HP-ProDesk-680-G2-MT.. (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 1f6374285;
	Thu, 14 Aug 2025 18:47:56 +0800 (GMT+08:00)
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
Subject: [PATCH v4 00/13] Apply drm_bridge_connector and panel_bridge helper for the Analogix DP driver
Date: Thu, 14 Aug 2025 18:47:40 +0800
Message-Id: <20250814104753.195255-1-damon.ding@rock-chips.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a98a8318ccc03a3kunm254826283f21b4
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZGU1KSFYeHksaSU5LSkoYTE9WFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSEpKQk
	1VSktLVUpCWQY+
DKIM-Signature: a=rsa-sha256;
	b=fpU8maqOXymklUU3EQ5KVGEmjqYawnDbehY7qcPlJd+vLrS48uYcnywZIh3ZgllsTuYPYsubkZ8S37oivvbFIzs8nXPuVKsIVitR/5b8LuBiG9cd7UQlrXM2eZgnriCxLVd/ISJ+uZj2LpGnVnt0ziQJeR+fKYdtFFtNhKncocQ=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=fiW3oNSgQWks1QFd7U+WAAuyO3yPUb10+EqJH/a8PPw=;
	h=date:mime-version:subject:message-id:from;

PATCH 1 is a small format optimization for struct analogid_dp_device.
PATCH 2 is to perform mode setting in &drm_bridge_funcs.atomic_enable.
PATCH 3-6 are preparations for apply drm_bridge_connector helper.
PATCH 7 is to apply the drm_bridge_connector helper.
PATCH 8-10 are to move the panel/bridge parsing to the Analogix side.
PATCH 11-12 are preparations for apply panel_bridge helper.
PATCH 13 is to apply the panel_bridge helper.

Damon Ding (13):
  drm/bridge: analogix_dp: Formalize the struct analogix_dp_device
  drm/bridge: analogix_dp: Move &drm_bridge_funcs.mode_set to
    &drm_bridge_funcs.atomic_enable
  drm/bridge: analogix_dp: Add &analogix_dp_plat_data.next_bridge
  drm/exynos: exynos_dp: Remove &exynos_dp_device.ptn_bridge
  drm/bridge: exynos_dp: Remove unused &exynos_dp_device.connector
  drm/bridge: analogix_dp: Remove redundant
    &analogix_dp_plat_data.skip_connector
  drm/bridge: analogix_dp: Apply drm_bridge_connector helper
  drm/bridge: analogix_dp: Add new API analogix_dp_finish_probe()
  drm/rockchip: analogix_dp: Apply analogix_dp_finish_probe()
  drm/exynos: exynos_dp: Apply analogix_dp_finish_probe()
  drm/bridge: analogix_dp: Remove panel disabling and enabling in
    analogix_dp_set_bridge()
  drm/bridge: analogix_dp: Remove bridge disabing and panel unpreparing
    in analogix_dp_unbind()
  drm/bridge: analogix_dp: Apply panel_bridge helper

 .../drm/bridge/analogix/analogix_dp_core.c    | 384 ++++++++++--------
 .../drm/bridge/analogix/analogix_dp_core.h    |   5 +-
 drivers/gpu/drm/exynos/exynos_dp.c            |  48 +--
 .../gpu/drm/rockchip/analogix_dp-rockchip.c   |  49 +--
 include/drm/bridge/analogix_dp.h              |   7 +-
 5 files changed, 248 insertions(+), 245 deletions(-)

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

-- 
2.34.1

