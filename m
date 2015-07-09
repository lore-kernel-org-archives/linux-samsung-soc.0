From: Andrzej Hajda <a.hajda@samsung.com>
Subject: [PATCH 0/7] drm/exynos/hdmi: refactoring/cleanup patches
Date: Thu, 09 Jul 2015 16:28:05 +0200
Message-ID: <1436452092-20757-1-git-send-email-a.hajda@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:46351 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751315AbbGIO2V (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 9 Jul 2015 10:28:21 -0400
Received: from eucpsbgm1.samsung.com (unknown [203.254.199.244])
 by mailout1.w1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0NR800A635J6SI80@mailout1.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 09 Jul 2015 15:28:18 +0100 (BST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Inki Dae <inki.dae@samsung.com>
Cc: Andrzej Hajda <a.hajda@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Joonyoung Shim <jy0922.shim@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, linux-samsung-soc@vger.kernel.org, dri-devel@lists.freedesktop.org

Hi Inki, Joonyoung,

These patches removes obsolete and old structures, to simplify further
development. They should not change behavior of the driver.

The patchset is based on exynos-drm-next plus my HDMI related fixes [1].

The patchset was tested on Universal and Odroid U3.

[1]: http://permalink.gmane.org/gmane.comp.video.dri.devel/132348

Regards
Andrzej


Andrzej Hajda (7):
  drm/exynos/hdmi: remove old platform data code
  drm/exynos/hdmi: Simplify HPD gpio handling
  drm/exynos/hdmi: remove private lock code
  drm/exynos/hdmi: add driver data pointer to private context
  drm/exynos/hdmi: remove redundant configuration fields
  drm/exynos/hdmi: remove hdmi_v13_conf struct
  drm/exynos/hdmi: remove hdmi_v14_conf struct

 drivers/gpu/drm/exynos/exynos_hdmi.c | 860 ++++++++++-------------------------
 1 file changed, 245 insertions(+), 615 deletions(-)

-- 
1.9.1
