From: Christoph Manszewski <c.manszewski@samsung.com>
Subject: [PATCH 0/2] drm/exynos: fimd: Add properties
Date: Mon,  8 Oct 2018 11:33:00 +0200
Message-ID: <20181008093326eucas1p24634c69cc44d324b377755af1f761241~bmFkaQ-gm0356403564eucas1p2g@eucas1p2.samsung.com>
References: <20181003094053eucas1p107c7a8a60c48dd68625fdaa223ef1996~aD9p3GwpI1866618666eucas1p1B@eucas1p1.samsung.com>
        <CGME20181008093326eucas1p24634c69cc44d324b377755af1f761241@eucas1p2.samsung.com>
Content-Type: text/plain; charset="utf-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181003094053eucas1p107c7a8a60c48dd68625fdaa223ef1996~aD9p3GwpI1866618666eucas1p1B@eucas1p1.samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: dri-devel@lists.freedesktop.org
Cc: Christoph Manszewski <c.manszewski@samsung.com>, Inki Dae <inki.dae@samsung.com>, Joonyoung Shim <jy0922.shim@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, David Airlie <airlied@linux.ie>, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Andrzej Hajda <a.hajda@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

Hello,

This patch series adds two new configurable properties
to exynos_drm_fimd.

Patch 1 add window alpha property.
Patch 2 add pixel blend mode property.

Regards,
Chris


Christoph Manszewski (2):
  drm/exynos: fimd: Make plane alpha configurable
  drm/exynos: fimd: Make pixel blend mode configurable

 drivers/gpu/drm/exynos/exynos_drm_fimd.c | 87 ++++++++++++++++++++++++--------
 include/video/samsung_fimd.h             |  2 +
 2 files changed, 69 insertions(+), 20 deletions(-)

-- 
2.7.4
