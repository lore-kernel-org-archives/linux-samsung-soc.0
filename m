From: Christoph Manszewski <c.manszewski@samsung.com>
Subject: [PATCH 0/3] drm/exynos: mixer: Cleanup and add properties
Date: Fri, 21 Sep 2018 14:24:35 +0200
Message-ID: <20180921122607eucas1p1d8d56bd57fcfc8285469208b1db3fa3b~WaefRJq8x0332003320eucas1p1W@eucas1p1.samsung.com>
References: <CGME20180921122607eucas1p1d8d56bd57fcfc8285469208b1db3fa3b@eucas1p1.samsung.com>
Content-Type: text/plain; charset="utf-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: dri-devel@lists.freedesktop.org
Cc: Christoph Manszewski <c.manszewski@samsung.com>, Inki Dae <inki.dae@samsung.com>, Joonyoung Shim <jy0922.shim@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, David Airlie <airlied@linux.ie>, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Andrzej Hajda <a.hajda@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

Hello,

This patch series adds two new configurable properties to exynos_mixer,
and introduces use of helper functions in exynos_drm_plane_reset.

Patch 1 incorporate use of helper functions, to correctly initialize
parameters used in following patches.
Patch 2 add pixel blend mode property.
Patch 3 add window alpha property.

Regards,
Chris

Christoph Manszewski (3):
  drm/exynos: drm_plane: Correct exynos_drm_plane_reset
  drm/exynos: mixer: Make pixel blend mode configurable
  drm/exynos: mixer: Make plane alpha configurable

 drivers/gpu/drm/exynos/exynos_drm_drv.h   |  2 ++
 drivers/gpu/drm/exynos/exynos_drm_plane.c | 16 ++++++---
 drivers/gpu/drm/exynos/exynos_mixer.c     | 56 +++++++++++++++++++++----------
 drivers/gpu/drm/exynos/regs-mixer.h       |  5 ++-
 4 files changed, 57 insertions(+), 22 deletions(-)

-- 
2.7.4
