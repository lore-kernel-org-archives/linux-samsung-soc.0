From: Inki Dae <inki.dae@samsung.com>
Subject: [GIT PULL] exynos-drm-next
Date: Tue, 02 Jan 2018 09:36:17 +0900
Message-ID: <1514853377-10114-1-git-send-email-inki.dae@samsung.com>
References: <CGME20180102003618epcas2p2d82ece8ab037e5213f1bc0b83cdb1a43@epcas2p2.samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:11705 "EHLO
        mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752868AbeABAgU (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 1 Jan 2018 19:36:20 -0500
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: airlied@linux.ie
Cc: dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org

Hi Dave,

   Just removing lagacy IPP driver and several trivial cleanups.

   As discussed already, we are preparing a new version of IPP driver
   which will include rewritten code and API. Removing the lagacy
   IPP driver is a first step for use of the new driver.

   Please kindly let me know if there is any problem.

Happy new year~

Thanks,
Inki Dae

The following changes since commit 350877626faba5d60cbb8cef2bdeb524212c780b:

  Merge tag 'drm-intel-next-2017-12-22' of git://anongit.freedesktop.org/drm/drm-intel into drm-next (2017-12-28 05:20:31 +1000)

are available in the git repository at:


  git://git.kernel.org/pub/scm/linux/kernel/git/daeinki/drm-exynos tags/exynos-drm-next-for-v4.16

for you to fetch changes up to 8ded59413ccc58fe138ab4bf337d0d0b3131d46b:

  drm/exynos: ipp: Remove Exynos DRM IPP subsystem (2018-01-02 08:41:22 +0900)

----------------------------------------------------------------
Remove lagacy IPP driver
- This driver isn't used anymore so remove it. Marek is preparing new one
  which includes completely rewritten API so this driver will be replaced
  with the new version[1] later.
And cleanups.

[1] https://patches.linaro.org/cover/118386/

----------------------------------------------------------------
Fabio Estevam (1):
      drm/exynos: decon5433: Remove unnecessary platform_get_resource() error check

Krzysztof Kozlowski (2):
      drm/exynos/decon: Move headers from global to local place
      drm/exynos/decon: Add include guard to the Exynos7 header

Marek Szyprowski (1):
      drm/exynos: ipp: Remove Exynos DRM IPP subsystem

 drivers/gpu/drm/exynos/Kconfig                     |   11 +-
 drivers/gpu/drm/exynos/Makefile                    |    1 -
 drivers/gpu/drm/exynos/exynos5433_drm_decon.c      |    8 +-
 drivers/gpu/drm/exynos/exynos7_drm_decon.c         |    2 +-
 drivers/gpu/drm/exynos/exynos_drm_drv.c            |   12 -
 drivers/gpu/drm/exynos/exynos_drm_drv.h            |    2 -
 drivers/gpu/drm/exynos/exynos_drm_ipp.c            | 1806 --------------------
 drivers/gpu/drm/exynos/exynos_drm_ipp.h            |  252 ---
 .../gpu/drm/exynos/regs-decon5433.h                |    6 +-
 .../gpu/drm/exynos/regs-decon7.h                   |    8 +-
 include/uapi/drm/exynos_drm.h                      |  192 +--
 11 files changed, 15 insertions(+), 2285 deletions(-)
 delete mode 100644 drivers/gpu/drm/exynos/exynos_drm_ipp.c
 delete mode 100644 drivers/gpu/drm/exynos/exynos_drm_ipp.h
 rename include/video/exynos5433_decon.h => drivers/gpu/drm/exynos/regs-decon5433.h (98%)
 rename include/video/exynos7_decon.h => drivers/gpu/drm/exynos/regs-decon7.h (99%)
