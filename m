From: Zain Wang <wzz@rock-chips.com>
Subject: [PATCH v3 0/6] Misc changes to Rockchip PSR drivers
Date: Tue, 18 Oct 2016 14:14:37 +0800
Message-ID: <1476771283-11398-1-git-send-email-wzz@rock-chips.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from regular1.263xmail.com ([211.150.99.135]:42452 "EHLO
        regular1.263xmail.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753749AbcJRGO6 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 18 Oct 2016 02:14:58 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sean Paul <seanpaul@chromium.org>, Daniel Vetter <daniel.vetter@ffwll.ch>, Inki Dae <inki.dae@samsung.com>, David Airlie <airlied@linux.ie>
Cc: Tomeu Vizoso <tomeu.vizoso@collabora.com>, Mika Kahola <mika.kahola@intel.com>, =?UTF-8?q?St=C3=A9phane=20Marchesin?= <marcheu@chromium.org>, Tomasz Figa <tfiga@chromium.org>, dianders@chromium.org, Thierry Reding <treding@nvidia.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Heiko Stuebner <heiko@sntech.de>, Jingoo Han <jingoohan1@gmail.com>, Javier Martinez Canillas <javier@osg.samsung.com>, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, Zain Wang <wzz@rock-chips.com>

This serise of patches works for saving power on eDP PHY and VOP during PSR.

BR,
- Zain

Changes in v3:
- add new patch to support fast link training.
- add new patch to make VOP standby when entry PSR.
- Misc changes.

Changes in v2:
- add spin_lock to protect dpms_mode
- misc changes.

Yakir Yang (1):
  drm/bridge: analogix_dp: detect Sink PSR state after configuring the
    PSR

zain wang (5):
  drm/bridge: analogix_dp: set psr activate/deactivate when
    enable/disable bridge
  drm/bridge: remove dp init from analogix_dp_bind
  drm: bridge/analogix: switch Main-link and eDP PHY when enable/disable
    psr
  drm: bridge/analogix: add fast link train for eDP
  drm: bridge/analogix: enable vop standby when entry PSR

 drivers/gpu/drm/bridge/analogix/analogix_dp_core.c | 218 +++++++++++++++------
 drivers/gpu/drm/bridge/analogix/analogix_dp_core.h |   7 +-
 drivers/gpu/drm/bridge/analogix/analogix_dp_reg.c  |  25 ++-
 drivers/gpu/drm/rockchip/analogix_dp-rockchip.c    |  33 +++-
 drivers/gpu/drm/rockchip/rockchip_drm_drv.h        |   1 +
 drivers/gpu/drm/rockchip/rockchip_drm_psr.c        |  30 ++-
 drivers/gpu/drm/rockchip/rockchip_drm_psr.h        |   4 +-
 drivers/gpu/drm/rockchip/rockchip_drm_vop.c        |  23 ++-
 8 files changed, 259 insertions(+), 82 deletions(-)

-- 
1.9.1
