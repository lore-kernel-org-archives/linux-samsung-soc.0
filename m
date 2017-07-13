From: Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: [PATCH 0/4] drm/sun4i: Fix a register access bug
Date: Thu, 13 Jul 2017 16:41:12 +0200
Message-ID: <cover.75b0c7f741ed33015a7ad44941bed1f6152a48a9.1499956639.git-series.maxime.ripard@free-electrons.com>
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>, Jani Nikula <jani.nikula@linux.intel.com>, Sean Paul <seanpaul@chromium.org>, Inki Dae <inki.dae@samsung.com>, Joonyoung Shim <jy0922.shim@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Mark Yao <mark.yao@rock-chips.com>, Heiko Stuebner <heiko@sntech.de>, Chen-Yu Tsai <wens@csie.org>, Maxime Ripard <maxime.ripard@free-electrons.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org
List-Id: linux-samsung-soc@vger.kernel.org

The Allwinner backend has a commit bit in order to push the new
configuration to the actual hardware. We've always been using that bit.

However, we also should poll for that bit to clear, which we don't.
Accessing any register while a commit is pending is forbidden, and will for
example show a symptom of reading another, random, register.

If you get this during a read/modify/write cycle, this will result in
random register corruption, which are pretty bad.

This can be shown using the following program (while the backend is
active):
http://code.bulix.org/gdl44p-161437?raw

Fortunately for us, this is not really likely to happen. The window where
it can happen is quite thin, and it only happens during a modeset, since
it's the only time we commit some new configuration.

Unfortunately for us, QT does a ridiculous amount of modeset, and will just
hit that window after a while, creating a distorded (since the register we
read/modify/write also has scaling attributes) or with weird colors (since
it also has a invertion of red and blue components). And might fix itself
later on by reading another random register with proper values for these
fields.

Let me know what you think,
Maxime

Maxime Ripard (4):
  drm/atomic: implement drm_atomic_helper_commit_tail for runtime_pm users
  drm/sun4i: Use the runtime_pm commit_tail variant
  drm/sun4i: engine: Add commit_poll function
  drm/sun4i: make sure we don't have a commit pending

 drivers/gpu/drm/drm_atomic_helper.c        | 47 +++++++++++++++--------
 drivers/gpu/drm/exynos/exynos_drm_fb.c     | 27 +-------------
 drivers/gpu/drm/rcar-du/rcar_du_kms.c      | 18 +---------
 drivers/gpu/drm/rockchip/rockchip_drm_fb.c | 21 +----------
 drivers/gpu/drm/sun4i/sun4i_backend.c      | 14 +++++++-
 drivers/gpu/drm/sun4i/sun4i_crtc.c         |  3 +-
 drivers/gpu/drm/sun4i/sun4i_framebuffer.c  |  6 +++-
 drivers/gpu/drm/sun4i/sunxi_engine.h       | 14 +++++++-
 include/drm/drm_atomic_helper.h            |  1 +-
 9 files changed, 73 insertions(+), 78 deletions(-)

base-commit: a70e9c77d0f09e7d00b62a8d618a61b2dfc5d889
-- 
git-series 0.9.1
