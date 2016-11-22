From: Inki Dae <inki.dae@samsung.com>
Subject: [GIT PULL] exynos-drm-fixes
Date: Tue, 22 Nov 2016 14:48:05 +0900
Message-ID: <1479793685-5074-1-git-send-email-inki.dae@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:36610 "EHLO
        mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750942AbcKVFsI (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 22 Nov 2016 00:48:08 -0500
Received: from epcpsbgm2new.samsung.com (epcpsbgm2 [203.254.230.27])
 by mailout3.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0OH101U154419K40@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 22 Nov 2016 14:48:05 +0900 (KST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: airlied@linux.ie
Cc: dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org

Hi Dave,

   No critial patch but it make sure to unmap the region
   if HDMI probing failed, and it includes two trivial fixups.

   Please kindly let me know if there is any problem.

Thanks,
Inki Dae

The following changes since commit c2ee69d83b2b14d68ad7ee1773fc1d40e97f201d:

  Merge tag 'drm-intel-fixes-2016-11-17' of ssh://git.freedesktop.org/git/drm-intel into drm-fixes (2016-11-18 10:33:28 +1000)

are available in the git repository at:


  git://git.kernel.org/pub/scm/linux/kernel/git/daeinki/drm-exynos exynos-drm-fixes

for you to fetch changes up to 0260e20f4bf3f4f70240fed70726c7eb19a99fd5:

  drm/exynos: gsc: fix spelling mistakes (2016-11-21 14:03:49 +0900)

----------------------------------------------------------------
Arvind Yadav (1):
      gpu/drm/exynos/exynos_hdmi - Unmap region obtained by of_iomap

Colin Ian King (1):
      drm/exynos: gsc: fix spelling mistakes

Shuah Khan (1):
      exynos-drm: Fix error messages to print flags and size

 drivers/gpu/drm/exynos/exynos_drm_fimc.c | 2 +-
 drivers/gpu/drm/exynos/exynos_drm_gem.c  | 4 ++--
 drivers/gpu/drm/exynos/exynos_drm_gsc.c  | 2 +-
 drivers/gpu/drm/exynos/exynos_hdmi.c     | 5 +++++
 4 files changed, 9 insertions(+), 4 deletions(-)
