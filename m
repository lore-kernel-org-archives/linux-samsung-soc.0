From: Peter Rosin <peda@axentia.se>
Subject: [PATCH 0/3] drm: fix some bridge api misunderstandings
Date: Wed,  2 May 2018 09:40:22 +0200
Message-ID: <20180502074025.12421-1-peda@axentia.se>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: Peter Rosin <peda@axentia.se>, Inki Dae <inki.dae@samsung.com>, Joonyoung Shim <jy0922.shim@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, David Airlie <airlied@linux.ie>, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, Sandy Huang <hjc@rock-chips.com>, =?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>, Benjamin Gaignard <benjamin.gaignard@linaro.org>, Vincent Abriou <vincent.abriou@st.com>, dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-rockchip@lists.infradead.org
List-Id: linux-samsung-soc@vger.kernel.org

Hi!

While looking at various drm bridge users, I came across these
issues.

Cheers,
Peter

Peter Rosin (3):
  drm/sti: do not remove the drm_bridge that was never added
  drm/rockchip: lvds: avoid duplicating drm_bridge_attach
  drm/exynos: hdmi: avoid duplicating drm_bridge_attach

 drivers/gpu/drm/exynos/exynos_hdmi.c     | 2 --
 drivers/gpu/drm/rockchip/rockchip_lvds.c | 2 --
 drivers/gpu/drm/sti/sti_hda.c            | 1 -
 drivers/gpu/drm/sti/sti_hdmi.c           | 1 -
 4 files changed, 6 deletions(-)

-- 
2.11.0
