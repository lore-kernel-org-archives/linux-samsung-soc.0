From: =?UTF-8?q?Pawe=C5=82=20Chmiel?= <pawel.mikolaj.chmiel@gmail.com>
Subject: [PATCH 0/2] drm/exynos: fimd: Add support for S5PV210
Date: Fri, 20 Apr 2018 18:32:14 +0200
Message-ID: <1524241936-10295-1-git-send-email-pawel.mikolaj.chmiel@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: inki.dae@samsung.com, jy0922.shim@samsung.com, sw0312.kim@samsung.com, kyungmin.park@samsung.com
Cc: airlied@linux.ie, kgene@kernel.org, krzk@kernel.org, dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, =?UTF-8?q?Pawe=C5=82=20Chmiel?= <pawel.mikolaj.chmiel@gmail.com>
List-Id: linux-samsung-soc@vger.kernel.org

This patch series compose of 2 patches.

First patch, adding support for S5PV210 FIMD variant to Exynos driver.
Compatible for this soc was already existing in documentation.

Second patch, brings back possibility to use drivers depending on
DRM_EXYNOS, on Samsung S5PV210/S5PC110 series based systems.

Both patches has been tested on (not yet mainlined), an S5PV210 based
Samsung Galaxy S (i9000) phone.

Paweł Chmiel (1):
  drm/exynos: Allow DRM_EXYNOS on s5pv210.

Tomasz Figa (1):
  drm/exynos: fimd: Add support for S5PV210 FIMD variant

 drivers/gpu/drm/exynos/Kconfig           | 2 +-
 drivers/gpu/drm/exynos/exynos_drm_fimd.c | 8 ++++++++
 2 files changed, 9 insertions(+), 1 deletion(-)

-- 
2.7.4
