From: Inki Dae <inki.dae@samsung.com>
Subject: [GIT PULL] exynos-drm-next-v2
Date: Thu, 09 Nov 2017 20:49:51 +0900
Message-ID: <1510228191-671-1-git-send-email-inki.dae@samsung.com>
References: <CGME20171109114952epcas2p41f68b869f642937875e188ff51a20854@epcas2p4.samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:62697 "EHLO
        mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752066AbdKILty (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 9 Nov 2017 06:49:54 -0500
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: airlied@linux.ie
Cc: dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org

Hi Dave,

   Just added new IPP driver since previous pull request.

   We rewrited Exynos DRM IPP driver due to below limitations and issues,
   - Userspace API covers memory-2-memory picture operations together with
     CRTC writeback and duplicating features, which belongs to video plane.
   - Lack of support of the all required image formats (for example NV12
     Samsung-tiled cannot be used due to lack of pixel format modifier
     support).
   - Userspace API designed only to mimic hardware behaviour, not easy to
     understand.
   - Lack of proper input validation in the core, drivers also didn't do that
     correctly, so it was possible to set incorrect parameters and easil
     trigger IOMMU fault or memory trash.
   - Drivers were partially disfunctional or supported only a subset of modes.

   There is no user who uses old API excepting Tizen platform[1]
   we are developing, and we will update the platform with new version.

   Sample applications for new version,
   https://www.spinics.net/lists/linux-samsung-soc/msg60498.html
   https://github.com/tobiasjakobi/libdrm/blob/ippv2/exynos/exynos_ipp.c


   Please kindly let me know if there is any problem.

[1] https://www.tizen.org/

Thanks,
Inki Dae

The following changes since commit d65d31388a23b14df9494135ad6c6549a59a3caa:

  Merge tag 'drm-misc-next-fixes-2017-11-07' of git://anongit.freedesktop.org/drm/drm-misc into drm-next (2017-11-08 05:22:49 +1000)

are available in the git repository at:


  git://git.kernel.org/pub/scm/linux/kernel/git/daeinki/drm-exynos tags/exynos-drm-next-for-v4.15-v2

for you to fetch changes up to e3e0028489c9eb3f0157f980a078c4197da8f9de:

  drm/exynos: Add driver for Exynos Scaler module (2017-11-09 19:59:22 +0900)

----------------------------------------------------------------
- Improved HDMI and Mixer drivers
  . It moves mode setup and plane update code to commit
    like other CRTC drivers
  . It makes mode commit to be called in enable callback only one time
  . some cleanup and fixup to HDMI and Mixer drivers.
  . It adds 1024x768, 1280x1024 and 1366x768 modes support
- Added HDMI audio interface driver
  . As of now, HDMI audio worked on boards with external audio codec connected
    in parallel with the HDMI audio transmitter's I2S interface.
    This patch is required to support HDMI audio properly.
- Remove old version of Exynos DRM IPP driver and add new version.
- Convert each post processing driver - Rotator, GScaler and FIMC - to new API.

----------------------------------------------------------------
Andrzej Hajda (10):
      drm/exynos/mixer: abstract out output mode setup code
      drm/exynos/mixer: move mode commit to enable callback
      drm/exynos/mixer: move resolution configuration to single function
      drm/exynos/mixer: fix mode validation code
      drm/exynos/mixer: remove mixer_resources sub-structure
      drm/exynos/hdmi: remove redundant mode field
      drm/exynos: add mode_fixup callback to exynos_drm_crtc_ops
      drm/exynos/mixer: pass actual mode on MIXER to encoder
      drm/exynos/hdmi: quirk for support mode timings conversion
      drm/exynos/mixer: enable support for 1024x768 and 1280x1024 modes

Andrzej Pietrasiewicz (1):
      drm/exynos: Add driver for Exynos Scaler module

Daniel Drake (1):
      drm/exynos/hdmi: add 85.5MHz pixel clock for v14 HDMI PHY

Marek Szyprowski (5):
      drm/exynos: ipp: Remove Exynos DRM IPP subsystem
      drm/exynos: ipp: Add IPP v2 framework
      drm/exynos: rotator: Convert driver to IPP v2 core API
      drm/exynos: gsc: Convert driver to IPP v2 core API
      drm/exynos: fimc: Convert driver to IPP v2 core API

Sylwester Nawrocki (1):
      drm: exynos: Add driver for HDMI audio interface

 .../devicetree/bindings/gpu/samsung-scaler.txt     |   27 +
 drivers/gpu/drm/exynos/Kconfig                     |   18 +-
 drivers/gpu/drm/exynos/Makefile                    |    1 +
 drivers/gpu/drm/exynos/exynos_drm_crtc.c           |   15 +
 drivers/gpu/drm/exynos/exynos_drm_drv.c            |   28 +-
 drivers/gpu/drm/exynos/exynos_drm_drv.h            |   15 +-
 drivers/gpu/drm/exynos/exynos_drm_fimc.c           | 1035 +++------
 drivers/gpu/drm/exynos/exynos_drm_fimc.h           |   23 -
 drivers/gpu/drm/exynos/exynos_drm_gsc.c            | 1063 +++------
 drivers/gpu/drm/exynos/exynos_drm_gsc.h            |   24 -
 drivers/gpu/drm/exynos/exynos_drm_ipp.c            | 2256 ++++++--------------
 drivers/gpu/drm/exynos/exynos_drm_ipp.h            |  337 ++-
 drivers/gpu/drm/exynos/exynos_drm_rotator.c        |  758 ++-----
 drivers/gpu/drm/exynos/exynos_drm_rotator.h        |   19 -
 drivers/gpu/drm/exynos/exynos_drm_scaler.c         |  694 ++++++
 drivers/gpu/drm/exynos/exynos_hdmi.c               |  310 ++-
 drivers/gpu/drm/exynos/exynos_mixer.c              |  460 ++--
 drivers/gpu/drm/exynos/regs-hdmi.h                 |    8 +-
 drivers/gpu/drm/exynos/regs-scaler.h               |  426 ++++
 include/uapi/drm/exynos_drm.h                      |  328 +--
 20 files changed, 3478 insertions(+), 4367 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/gpu/samsung-scaler.txt
 delete mode 100644 drivers/gpu/drm/exynos/exynos_drm_fimc.h
 delete mode 100644 drivers/gpu/drm/exynos/exynos_drm_gsc.h
 delete mode 100644 drivers/gpu/drm/exynos/exynos_drm_rotator.h
 create mode 100644 drivers/gpu/drm/exynos/exynos_drm_scaler.c
 create mode 100644 drivers/gpu/drm/exynos/regs-scaler.h
