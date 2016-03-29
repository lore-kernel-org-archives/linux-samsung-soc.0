From: Javier Martinez Canillas <javier@osg.samsung.com>
Subject: [PATCH 0/3] drm/exynos: Kconfig dependency fixes
Date: Mon, 28 Mar 2016 21:28:54 -0400
Message-ID: <1459214937-18686-1-git-send-email-javier@osg.samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from lists.s-osg.org ([54.187.51.154]:58819 "EHLO lists.s-osg.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751302AbcC2B3Q (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 28 Mar 2016 21:29:16 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>, Javier Martinez Canillas <javier@osg.samsung.com>, Kukjin Kim <kgene@kernel.org>, Seung-Woo Kim <sw0312.kim@samsung.com>, dri-devel@lists.freedesktop.org, Inki Dae <inki.dae@samsung.com>, linux-samsung-soc@vger.kernel.org, Kyungmin Park <kyungmin.park@samsung.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, David Airlie <airlied@linux.ie>, Joonyoung Shim <jy0922.shim@samsung.com>, linux-arm-kernel@lists.infradead.org

Hello Inki,

This patch series contains some fixes for the Kconfig symbol dependencies
of the Exynos DRM driver. They make sure that the Exynos DRM components
and the media platform drivers that makes use of the same HW IP block are
not enabled at the same time.

Best regards,
Javier


Javier Martinez Canillas (3):
  drm/exynos: Use VIDEO_SAMSUNG_S5P_G2D=n as G2D Kconfig dependency
  drm/exynos: Use VIDEO_SAMSUNG_EXYNOS_GSC=n as GSC Kconfig dependency
  drm/exynos: Make DRM_EXYNOS_FIMC depend on VIDEO_S5P_FIMC=n

 drivers/gpu/drm/exynos/Kconfig | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

-- 
2.5.0
