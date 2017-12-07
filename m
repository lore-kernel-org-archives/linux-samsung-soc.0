From: Inki Dae <inki.dae@samsung.com>
Subject: [GIT PULL] exynos-drm-fixes
Date: Thu, 07 Dec 2017 11:17:57 +0900
Message-ID: <1512613077-16804-1-git-send-email-inki.dae@samsung.com>
References: <CGME20171207021757epcas1p4a5d5acadbddee99b174908aa831eeb3b@epcas1p4.samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:14216 "EHLO
        mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752047AbdLGCSC (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 6 Dec 2017 21:18:02 -0500
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: airlied@linux.ie
Cc: dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org

Hi Dave,
   Just a regression fixup and several cleanups.

   Please kindly let me know if there is any problem.

   Thanks,
   Inki Dae

The following changes since commit bd3a3a2e92624942a143e485c83e641b2492d828:

  Merge tag 'drm-misc-fixes-2017-12-06' of git://anongit.freedesktop.org/drm/drm-misc into drm-fixes (2017-12-07 08:29:26 +1000)

are available in the git repository at:


  git://git.kernel.org/pub/scm/linux/kernel/git/daeinki/drm-exynos tags/exynos-drm-fixes-for-v4.15-rc3

for you to fetch changes up to 1cd6ae355bb2092a6a511558334564cb1f4ffd43:

  drm/exynos: remove unnecessary function declaration (2017-12-07 10:34:40 +0900)

----------------------------------------------------------------
- fix page fault issue due to using wrong device object in prime import.
- drop NONCONTIG flag without IOMMU support.
- remove unnecessary members and declaration.

----------------------------------------------------------------
Inki Dae (2):
      drm/exynos: remove unnecessary descrptions
      drm/exynos: remove unnecessary function declaration

Marek Szyprowski (2):
      drm/exynos: Fix dma-buf import
      drm/exynos: gem: Drop NONCONTIG flag for buffers allocated without IOMMU

 drivers/gpu/drm/exynos/exynos_drm_drv.c | 46 ++++++++++++++++-----------------
 drivers/gpu/drm/exynos/exynos_drm_drv.h |  5 ----
 drivers/gpu/drm/exynos/exynos_drm_gem.c | 15 +++++++++++
 drivers/gpu/drm/exynos/exynos_drm_gem.h |  2 ++
 4 files changed, 39 insertions(+), 29 deletions(-)
