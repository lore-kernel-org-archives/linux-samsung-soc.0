From: zain wang <wzz@rock-chips.com>
Subject: [PATCH v1 0/4] Misc changes to Rockchip PSR drivers
Date: Thu, 29 Sep 2016 22:46:36 +0800
Message-ID: <1475160400-30782-1-git-send-email-wzz@rock-chips.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Sean Paul <seanpaul@chromium.org>, Daniel Vetter <daniel.vetter@ffwll.ch>, Inki Dae <inki.dae@samsung.com>, David Airlie <airlied@linux.ie>
Cc: Tomeu Vizoso <tomeu.vizoso@collabora.com>, Mika Kahola <mika.kahola@intel.com>, =?UTF-8?q?St=C3=A9phane=20Marchesin?= <marcheu@chromium.org>, Tomasz Figa <tfiga@chromium.org>, dianders@chromium.org, Thierry Reding <treding@nvidia.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Heiko Stuebner <heiko@sntech.de>, Jingoo Han <jingoohan1@gmail.com>, Javier Martinez Canillas <javier@osg.samsung.com>, Yakir Yang <ykk@rock-chips.com>, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, zain wang <wzz@rock-chips.com>
List-Id: linux-samsung-soc@vger.kernel.org


1. prevent runing enable_psr when disabled bridge
2. get sync PM when init eDP
3. detect Sink PSR state after configuring the PSR
4. switch Main-Link and eDP phy when enable/disable psr

BR,
- Zain


Yakir Yang (1):
  drm/bridge: analogix_dp: detect Sink PSR state after configuring the
    PSR

zain wang (3):
  drm/bridge: analogix_dp: prevent runing enable_psr when disabled
    bridge.
  drm/bridge: analogix_dp: get sync PM when init eDP
  drm: bridge/analogix: switch Main-link and eDP PHY when enable/disable
    psr

 drivers/gpu/drm/bridge/analogix/analogix_dp_core.c | 107 +++++++++++----------
 drivers/gpu/drm/bridge/analogix/analogix_dp_core.h |   6 +-
 drivers/gpu/drm/bridge/analogix/analogix_dp_reg.c  |  25 ++++-
 drivers/gpu/drm/rockchip/analogix_dp-rockchip.c    |   8 +-
 4 files changed, 88 insertions(+), 58 deletions(-)

-- 
1.9.1
