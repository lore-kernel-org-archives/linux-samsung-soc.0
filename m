From: Yakir Yang <ykk@rock-chips.com>
Subject: [PATCH v1 0/8] Add RK3399 eDP support and fix some bugs to analogix_dp driver.
Date: Mon, 25 Apr 2016 19:29:08 +0800
Message-ID: <1461583748-5777-1-git-send-email-ykk@rock-chips.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from lucky1.263xmail.com ([211.157.147.131]:48633 "EHLO
	lucky1.263xmail.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754211AbcDYLbW (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 25 Apr 2016 07:31:22 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: David Airlie <airlied@linux.ie>, Thierry Reding <treding@nvidia.com>, Jingoo Han <jingoohan1@gmail.com>, Mark Yao <yzq@rock-chips.com>, Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh+dt@kernel.org>
Cc: Inki Dae <inki.dae@samsung.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, emil.l.velikov@gmail.com, Dan Carpenter <dan.carpenter@oracle.com>, Yakir Yang <ykk@rock-chips.com>, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org, linux-rockchip@lists.infradead.org


RK3399 and RK3288 shared the same eDP IP controller, only some light
difference with VOP configure and GRF configure.

Also same misc fix to analogix_dp driver:
- Hotplug invalid which report by Dan Carpenter
- Make panel detect to an optional action
- correct the register bit define error in ANALOGIX_DP_PLL_REG_1



Yakir Yang (8):
  drm: bridge: analogix_dp: rename RK3288_DP to ROCKCHIP_DP
  drm: rockchip: analogix_dp: split the lcdc select setting into device
    data
  drm/rockchip: analogix_dp: add rk3399 eDP support
  drm: bridge: analogix_dp: correct the register bit define error in
    ANALOGIX_DP_PLL_REG_1
  drm/rockchip: analogix_dp: make panel detect to an optional action
  drm/bridge: analogix_dp: introduce connector mode_valid callback to
    plat driver
  drm: rockchip: analogix_dp: correct the connector display color format
    and bpc
  drm: bridge: analogix/dp: fix no drm hpd event when panel plug in

 .../bindings/display/bridge/analogix_dp.txt        |   1 +
 .../display/rockchip/analogix_dp-rockchip.txt      |   2 +-
 drivers/gpu/drm/bridge/analogix/analogix_dp_core.c |  19 ++-
 drivers/gpu/drm/bridge/analogix/analogix_dp_core.h |   8 +-
 drivers/gpu/drm/bridge/analogix/analogix_dp_reg.c  |   6 +-
 drivers/gpu/drm/bridge/analogix/analogix_dp_reg.h  |   4 +-
 drivers/gpu/drm/rockchip/analogix_dp-rockchip.c    | 149 +++++++++++++++------
 include/drm/bridge/analogix_dp.h                   |   6 +-
 8 files changed, 140 insertions(+), 55 deletions(-)

-- 
1.9.1
