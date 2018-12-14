From: Christoph Manszewski <c.manszewski@samsung.com>
Subject: [PATCH 0/6] drm/exynos: mixer: Add color range property
Date: Fri, 14 Dec 2018 13:10:15 +0100
Message-ID: <1544789421-5265-1-git-send-email-c.manszewski@samsung.com>
References: <CGME20181214121030eucas1p265a68ae4067344ea2da52c8291cbc8cf@eucas1p2.samsung.com>
Content-Type: text/plain; charset="utf-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: dri-devel@lists.freedesktop.org
Cc: Christoph Manszewski <c.manszewski@samsung.com>, Inki Dae <inki.dae@samsung.com>, Joonyoung Shim <jy0922.shim@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, David Airlie <airlied@linux.ie>, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <maxime.ripard@bootlin.com>, Sean Paul <sean@poorly.run>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Andrzej Hajda <a.hajda@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

Hi,

This patch series adds rgb input buffer range property to exynos_mixer.
It applies on top of drm-exynos/exynos-drm-next with patches:
- [PATCH 1/2] drm/edid: Add colorimetry helper function,
- [PATCH 2/2] drm/exynos: mixer: Use colorimetry helper function

Patch 1 Add apropriate labels
Patch 2 Split color properties function
Patch 3 Add default range field to exynos_drm_plane config
Patch 4 Minor code cleanup
Patch 5 Add optional range property to exynos plane
Patch 6 Make input rgb range configurable in exynos_mixer

Regards,
Chris

Christoph Manszewski (6):
  include/drm: color_mgmt: Add enum labels
  drm: color_mgmt: Split create_color_properties function
  drm/exynos: drm_drv: Extend exynos_drm_plane_config
  drm/exynos: plane: Minor cleanup
  drm/exynos: plane: Add range property to exynos plane
  drm/exynos: mixer: Make input buffer color range configurable

 drivers/gpu/drm/drm_color_mgmt.c          | 93 ++++++++++++++++++++++++-------
 drivers/gpu/drm/exynos/exynos_drm_drv.h   |  2 +
 drivers/gpu/drm/exynos/exynos_drm_plane.c | 15 ++++-
 drivers/gpu/drm/exynos/exynos_mixer.c     | 57 +++++++++++++++++--
 drivers/gpu/drm/exynos/regs-mixer.h       |  2 +
 include/drm/drm_color_mgmt.h              | 10 ++++
 6 files changed, 152 insertions(+), 27 deletions(-)

-- 
2.7.4
