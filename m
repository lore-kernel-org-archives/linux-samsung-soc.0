From: Christoph Manszewski <c.manszewski@samsung.com>
Subject: [PATCH v3 0/2] drm/exynos: decon: Add properties
Date: Thu, 18 Oct 2018 14:51:45 +0200
Message-ID: <20181018125205eucas1p1d1883ebf537df8268e1e0ce2bc92f032~etP3p4mTk0073500735eucas1p1P@eucas1p1.samsung.com>
References: <CGME20181018125205eucas1p1d1883ebf537df8268e1e0ce2bc92f032@eucas1p1.samsung.com>
Content-Type: text/plain; charset="utf-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: dri-devel@lists.freedesktop.org
Cc: Christoph Manszewski <c.manszewski@samsung.com>, Inki Dae <inki.dae@samsung.com>, Joonyoung Shim <jy0922.shim@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, David Airlie <airlied@linux.ie>, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, Gustavo Padovan <gustavo@padovan.org>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Sean Paul <sean@poorly.run>, Lowry Li <lowry.li@arm.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Andrzej Hajda <a.hajda@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

Hello,

In patchset v2, accidentally wrong patches were sent - sorry for that.

Regards,
Chris

Changes in v3:
 - fix compilation error,

Changes in v2: 
 - add premultiplied pixel blend mode (i.e. make it functional),
 - correct minor issues from v1, 
 - refactor code in order to adapt to above changes.

Christoph Manszewski (2):
  drm/exynos: decon: Make plane alpha configurable
  drm/exynos: decon: Make pixel blend mode configurable

 drivers/gpu/drm/exynos/exynos5433_drm_decon.c | 84 ++++++++++++++++++++++++++-
 drivers/gpu/drm/exynos/regs-decon5433.h       | 22 +++++++
 2 files changed, 104 insertions(+), 2 deletions(-)

-- 
2.7.4
