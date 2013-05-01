From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: [PATCH 0/4] drm/exynos: fimd: Add support for S3C6400/S3C6410
Date: Wed,  1 May 2013 21:02:25 +0200
Message-ID: <1367434949-14838-1-git-send-email-tomasz.figa@gmail.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ea0-f173.google.com ([209.85.215.173]:36596 "EHLO
	mail-ea0-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755858Ab3EATCj (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 1 May 2013 15:02:39 -0400
Received: by mail-ea0-f173.google.com with SMTP id m14so756530eaj.18
        for <linux-samsung-soc@vger.kernel.org>; Wed, 01 May 2013 12:02:38 -0700 (PDT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: dri-devel@lists.freedesktop.org
Cc: linux-samsung-soc@vger.kernel.org, inki.dae@samsung.com, jy0922.shim@samsung.com, t.figa@samsung.com, Tomasz Figa <tomasz.figa@gmail.com>

Much of the code in Exynos DRM subsystem is generic enough to use
it for older (non-Exynos) Samsung SoCs as well, after minor modifications.

This series starts adding support for previous SoCs to Exynos DRM by
introducing S3C64xx support to exynos_drm_fimd driver.

Adding support for remaining SoCs between S3C64xx and Exynos4 (S5PC100,
S5P64x0 and S5PV210) should be rather straightforward, but at the moment
I can test only on S3C6410, so I limited my changes only to this SoC.

On Tiny6410 (Mini6410-compatible) board based on Samsung S3C6410 SoC,
using my to-be-resubmitted patches for Device Tree support:

Tested-by: Tomasz Figa <tomasz.figa@gmail.com>

Tomasz Figa (4):
  drm/exynos: fimd: Hold pointer to driver data in context struct
  drm/exynos: fimd: Add support for FIMD versions without SHADOWCON
    register
  drm/exynos: fimd: Add support for FIMD variants with clock selection
  drm/exynos: fimd: Add support for S3C64xx SoCs

 drivers/gpu/drm/exynos/exynos_drm_fimd.c | 90 ++++++++++++++++++++++++--------
 1 file changed, 68 insertions(+), 22 deletions(-)

-- 
1.8.2.1
