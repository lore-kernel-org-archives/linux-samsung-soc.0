From: Inki Dae <inki.dae@samsung.com>
Subject: [GIT PULL] exynos-drm-next
Date: Tue, 25 Nov 2014 21:41:07 +0900
Message-ID: <1416919267-23540-1-git-send-email-inki.dae@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:48540 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752919AbaKYMlJ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 25 Nov 2014 07:41:09 -0500
Received: from epcpsbgr2.samsung.com
 (u142.gpu120.samsung.co.kr [203.254.230.142])
 by mailout4.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0NFL008XRHWJITA0@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 25 Nov 2014 21:41:07 +0900 (KST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: airlied@linux.ie
Cc: dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org

Hi Dave,

   Add Exynos4415 SoC support, some fixups and cleanups.
   
   Summary:
   - Resolve kernel lockup issue incurred by probe request in probe context.
     . For this, it moves all register codes of sub drivers into init function
       and adds component binding support for vidi driver.
   - Add Exynos4415 SoC support.
   - Make each manager and display object to be embedded
     in each driver context.
   - Fix and clean up FIMD and MIPI-DSI drivers.
   - Clean up unnecesary or wrong descriptions.
   - And trivial cleanups.

   Please kindly let me know if there is my missing point.

Thanks,
Inki Dae


The following changes since commit ed1e8777a56f3523712506d608a29f57ed37b613:

  Merge branch 'drm-next-3.19' of git://people.freedesktop.org/~agd5f/linux into drm-next (2014-11-21 12:17:43 +1000)

are available in the git repository at:


  git://git.kernel.org/pub/scm/linux/kernel/git/daeinki/drm-exynos exynos-drm-next

for you to fetch changes up to 5baf5d44fbcde002d7f3f8148e69305f520770dd:

  drm/exynos: avoid leak if exynos_dpi_probe() fails (2014-11-25 11:58:43 +0900)

----------------------------------------------------------------
Andrzej Hajda (19):
      drm/exynos: remove ifdeferry from initialization code
      drm/exynos: dsi: remove global variable exynos_dsi_display
      drm/exynos: dsi: simplify device pointer evaluation
      drm/exynos: dsi: remove redundant encoder field
      drm/exynos: dsi: stop using display->ctx pointer
      drm/exynos/mixer: embed manager into private context
      drm/exynos/mixer: stop using manager->ctx pointer
      drm/exynos/vidi: embed manager into private context
      drm/exynos/vidi: stop using manager->ctx pointer
      drm/exynos/fimd: embed manager into private context
      drm/exynos/fimd: stop using manager->ctx pointer
      drm/exynos/hdmi: embed display into private context
      drm/exynos/hdmi: stop using display->ctx pointer
      drm/exynos/vidi: embed display into private context
      drm/exynos/vidi: stop using display->ctx pointer
      drm/exynos/dp: embed display into private context
      drm/exynos/dp: stop using display->ctx pointer
      drm/exynos/dpi: embed display into private context
      drm/exynos/dpi: stop using display->ctx pointer

Gustavo Padovan (13):
      drm/exynos: remove uneeded declaration of struct dma_iommu_mapping
      drm/exynos: remove extra declaration of struct exynos_drm_manager
      drm/exynos: remove extra declaration of struct exynos_overlay
      drm/exynos: Replace repeated declaration by include <drm/drmP.h>
      drm/exynos: Replace repeated declarations by #include "exynos_drm_drv.h"
      drm/exynos: remove unused wait_for macro
      drm/exynos: Save up space using bool var as bitfields
      drm/exynos: update documentation to reflect code changes
      drm/exynos: remove leftover hdmi function declarations
      Revert "drm/exynos: fix null pointer dereference issue"
      drm/exynos: move Exynos platform drivers registration to init
      drm/exynos: Fix exynos_dpi_remove() parameter
      drm/exynos: avoid leak if exynos_dpi_probe() fails

Inki Dae (8):
      drm/exynos: resolve infinite loop issue on multi-platform
      drm/exynos: resolve infinite loop issue on non multi-platform
      drm/exynos: g2d: fix null pointer dereference
      drm/exynos: fix possible infinite loop issue
      drm/exynos: fix null pointer dereference issue
      drm/exynos: clean up machine compatible string check
      drm/exynos: fix exynos_drm_component_del
      drm/exynos: vidi: add component support

Joonyoung Shim (3):
      drm/exynos: add has_vtsel flag
      drm/exynos: move triggering checking
      drm/exynos: use irq_flags instead of triggering

Julia Lawall (1):
      drm/exynos/ipp: fix error return code

Krzysztof Kozlowski (1):
      drm/exynos: Fix DSI resuming fail because power domain being off

Vivek Gautam (1):
      drm/exynos: dp: Remove support for unused dptx-phy

YoungJun Cho (12):
      drm/exynos: dsi: support Exynos4415 SoC
      drm/exynos: fimd: support Exynos4415 SoC
      drm/exynos: fimd: remove unnecessary waiting vblank routine
      drm/exynos: fimd: move handle vblank position in TE handler
      drm/exynos: dsi: move DSIM_STATE_ENABLED set position
      drm/exynos: fimd: move shadow unprotection position
      drm/exynos: fimd: add fimd_enable_video_output() to cleanup
      drm/exynos: fimd: add fimd_enable_shadow_channel_path() to cleanup
      drm/exynos: fimd: modify I80 i/f irq relevant routine
      drm/exynos: fimd: add triggering unset routine in fimd_trigger()
      drm/exynos: dsi: move TE irq handler registration position
      drm/exynos: dsi: set TE GPIO IRQ status as IRQ_NOAUTOEN

 .../devicetree/bindings/video/exynos_dsim.txt      |    1 +
 .../devicetree/bindings/video/samsung-fimd.txt     |    1 +
 drivers/gpu/drm/exynos/exynos_dp_core.c            |  132 ++++------
 drivers/gpu/drm/exynos/exynos_dp_core.h            |    5 +-
 drivers/gpu/drm/exynos/exynos_drm_crtc.h           |    5 +-
 drivers/gpu/drm/exynos/exynos_drm_dpi.c            |   42 ++--
 drivers/gpu/drm/exynos/exynos_drm_drv.c            |  257 ++++++++-----------
 drivers/gpu/drm/exynos/exynos_drm_drv.h            |   83 ++----
 drivers/gpu/drm/exynos/exynos_drm_dsi.c            |  127 +++++-----
 drivers/gpu/drm/exynos/exynos_drm_encoder.h        |    2 -
 drivers/gpu/drm/exynos/exynos_drm_fimd.c           |  266 +++++++++++---------
 drivers/gpu/drm/exynos/exynos_drm_g2d.c            |    9 +-
 drivers/gpu/drm/exynos/exynos_drm_iommu.h          |    1 -
 drivers/gpu/drm/exynos/exynos_drm_ipp.c            |    3 +
 drivers/gpu/drm/exynos/exynos_drm_vidi.c           |  150 ++++++-----
 drivers/gpu/drm/exynos/exynos_hdmi.c               |   65 +++--
 drivers/gpu/drm/exynos/exynos_mixer.c              |  126 +++++-----
 17 files changed, 609 insertions(+), 666 deletions(-)
