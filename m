From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: [PATCH v3 0/3] drm/exynos: Add device tree support for IPP driver
Date: Tue, 23 Apr 2013 13:34:35 +0200
Message-ID: <1366716878-5692-1-git-send-email-s.nawrocki@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:32450 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755332Ab3DWLfG (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 23 Apr 2013 07:35:06 -0400
Received: from epcpsbgm1.samsung.com (epcpsbgm1 [203.254.230.26])
 by mailout3.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MLP00NROHIE4N11@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 23 Apr 2013 20:35:04 +0900 (KST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: inki.dae@samsung.com
Cc: linux-samsung-soc@vger.kernel.org, kyungmin.park@samsung.com, sw0312.kim@samsung.com, chulspro.kim@samsung.com, jaejoon.seo@samsung.com, jmock.shin@samsung.com, jy0.jeon@samsung.com, th908.kim@samsung.com, lsmin.lee@samsung.com, dri-devel@lists.freedesktop.org, devicetree-discuss@lists.ozlabs.org, Sylwester Nawrocki <s.nawrocki@samsung.com>

Hi,

This small patch series adds device tree support for the DRM FIMC driver.
The binding documentation can be found in -next at Documentation/devicetree/
bindings/media/samsung-fimc.txt.

Changes since v2:
 - dropped addition of 'dev' field to struct fimc_context,
 - added more error logs and comments,
 - fixed error paths in fimc_setup_clocks() function.

Changes since v1:
 - removed devm_kfree() that got erroneously re-added in patch 2/3 during
   rebase.

Thanks,
Sylwester

Sylwester Nawrocki (3):
  drm/exynos: remove redundant devm_kfree()
  drm/exynos: rework fimc clocks handling
  drm/exynos: add device tree support for fimc ipp driver

 drivers/gpu/drm/exynos/Kconfig           |    2 +-
 drivers/gpu/drm/exynos/exynos_drm_fimc.c |  273 +++++++++++++++++-------------
 drivers/gpu/drm/exynos/regs-fimc.h       |    7 +-
 3 files changed, 157 insertions(+), 125 deletions(-)

--
1.7.9.5
