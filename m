From: Christoph Manszewski <c.manszewski@samsung.com>
Subject: [PATCH v2 0/2] drm/exynos: fimd: Add properties
Date: Thu, 25 Oct 2018 17:23:48 +0200
Message-ID: <20181025152409eucas1p22b08bb21ed0de710560ec0ced77958a7~g41o9kz2u0946109461eucas1p2r@eucas1p2.samsung.com>
References: <CGME20181025152409eucas1p22b08bb21ed0de710560ec0ced77958a7@eucas1p2.samsung.com>
Content-Type: text/plain; charset="utf-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: dri-devel@lists.freedesktop.org
Cc: Christoph Manszewski <c.manszewski@samsung.com>, Inki Dae <inki.dae@samsung.com>, Joonyoung Shim <jy0922.shim@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, David Airlie <airlied@linux.ie>, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Andrzej Hajda <a.hajda@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

Hello,

This patch series adds two new configurable properties
to exynos_drm_fimd.

Patch 1 add window alpha property.
Patch 2 add pixel blend mode propery.

Regards,
Chris

Changes in v2:
 - add premultiplied pixel blend mode (i. e. make it functional),
 - correct issues from v1,
 - refactor code in order to adapt above changes.

Christoph Manszewski (2):
  drm/exynos: fimd: Make plane alpha configurable
  drm/exynos: fimd: Make pixel blend mode configurable

 drivers/gpu/drm/exynos/exynos_drm_fimd.c | 123 +++++++++++++++++++++++++------
 include/video/samsung_fimd.h             |  10 +++
 2 files changed, 110 insertions(+), 23 deletions(-)

-- 
2.7.4
