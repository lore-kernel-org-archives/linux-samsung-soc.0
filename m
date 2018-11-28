From: Christoph Manszewski <c.manszewski@samsung.com>
Subject: [PATCH 0/2] drm/exynos: mixer: Fix color format and range setting
Date: Wed, 28 Nov 2018 16:32:10 +0100
Message-ID: <1543419132-16099-1-git-send-email-c.manszewski@samsung.com>
References: <CGME20181128153231eucas1p1bd79250c2b5170c84e5614d22070826b@eucas1p1.samsung.com>
Content-Type: text/plain; charset="utf-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: dri-devel@lists.freedesktop.org
Cc: Christoph Manszewski <c.manszewski@samsung.com>, Inki Dae <inki.dae@samsung.com>, Joonyoung Shim <jy0922.shim@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, David Airlie <airlied@linux.ie>, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Andrzej Hajda <a.hajda@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

Hello,

This patch series fixes the color format and color range setting
in exynos_mixer.c

Patch 1 fixes color format setting.
Patch 2 fixes color range setting.

Regards,
Chris

Christoph Manszewski (2):
  drm/exynos: mixer: Fix color format setting
  drm/exynos: mixer: Fix color range setting

 drivers/gpu/drm/exynos/exynos_mixer.c | 25 +++++++++++++------------
 drivers/gpu/drm/exynos/regs-mixer.h   |  9 +++++----
 2 files changed, 18 insertions(+), 16 deletions(-)

-- 
2.7.4
