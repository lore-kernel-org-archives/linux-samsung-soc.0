From: Inki Dae <inki.dae@samsung.com>
Subject: [GIT PULL] exynos-drm-next
Date: Tue, 18 Apr 2017 11:05:09 +0900
Message-ID: <1492481109-2863-1-git-send-email-inki.dae@samsung.com>
References: <CGME20170418020509epcas5p2e54f307dee164846dabf0470c5f134eb@epcas5p2.samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:56680 "EHLO
        epoutp01.samsung.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1755463AbdDRCFM (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 17 Apr 2017 22:05:12 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: airlied@linux.ie
Cc: dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org

Hi Dave,

   Some improvements, fixups and cleanups to Exynos DRM.

   Ps. this pull-reuqest includes a merge tag from Krzysztof Kozlowski
   who is a Exynos SoC maintainer, which includes dt patches because
   these should be merged together with below one,
      drm/exynos: dsi: Fix the parse_dt function

   Please kindly let me know if there is any problem.

Thanks,
Inki Dae

The following changes since commit ab6eb211b07a42a6346e284056422fd9a8576a99:

  Merge tag 'drm/panel/for-4.12-rc1' of git://anongit.freedesktop.org/tegra/linux into drm-next (2017-04-13 06:17:40 +1000)

are available in the git repository at:


  git://git.kernel.org/pub/scm/linux/kernel/git/daeinki/drm-exynos exynos-drm-next

for you to fetch changes up to ad1a14690ae7114e5230deba27cdbbe42c69a813:

  drm/exynos/decon5433: remove useless check (2017-04-18 10:28:50 +0900)

----------------------------------------------------------------
Summary:
- Fix dt binding of MIPI-DSI driver
- Rework vblank handling
  . This patch series adds frame counter callback and removes
    unnecessary pipe relevnt fields and simplifies event handling.
- Implement and fix sw-trigger relevant code
  . This patch moves TE relevant code from Panel and HDMI to DECON driver
    to fix a race between interrupt handlers and DECON disable,
    and to fix timeout issue at wait-for-vblank.
  . It removes unnecessary flags and check code specific to Exynos driver.

----------------------------------------------------------------
Andi Shyti (2):
      arm64: dts: exynos: Enable ir-spi in the TM2 and TM2E boards
      arm64: dts: exynos: Add stmfts touchscreen node for TM2 and TM2E

Andrzej Hajda (21):
      drm/exynos: simplify completion event handling
      drm/exynos/decon5433: implement frame counter
      drm/exynos: kill exynos_drm_crtc::pipe
      drm/exynos: kill exynos_drm_private::pipe
      drm/exynos: set plane possible_crtcs in exynos_plane_init
      drm/exynos: kill pipe field from drivers contexts
      drm/exynos: kill mode_set_nofb callback
      drm/exynos/decon5433: kill DECON_UPDATE workaround
      drm/exynos/decon5433: kill BIT_IRQS_ENABLED
      drm/exynos/decon5433: simplify shadow protect code
      drm/exynos/hdmi: fix pipeline disable order
      drm/exynos/dsi: fix bridge_node DT parsing
      drm/exynos/decon5433: always do sw-trigger when vblanks enabled
      dt-bindings: exynos5433-decon: fix interrupts bindings
      dt-bindings: exynos5433-decon: add TE interrupt binding
      drm/exynos/decon5433: move TE handling to DECON
      drm/exynos/decon5433: kill BIT_IRQS_ENABLED flag
      drm/exynos/decon5433: kill BIT_CLKS_ENABLED flag
      drm/exynos/decon5433: kill BIT_WIN_UPDATED flag
      drm/exynos/decon5433: kill BIT_SUSPENDED flag
      drm/exynos/decon5433: remove useless check

Daniel Vetter (1):
      drm/exynos: Merge pre/postclose hooks

Hoegeun Kwon (2):
      arm64: dts: exynos: Add the burst and esc clock frequency properties to DSI node
      drm/exynos: dsi: Fix the parse_dt function

Hyungwon Hwang (1):
      arm64: dts: exynos: Add support for S6E3HA2 panel device on TM2 board

Inki Dae (2):
      Merge tag 'samsung-dt64-clock-dsi-property-4.12' of gitolite.kernel.org:/.../krzk/linux into exynos-drm-next
      drm/exynos: clean up description of exynos_drm_crtc

Tobias Jakobi (2):
      drm/exynos: mixer: simplify mixer_cfg_rgb_fmt()
      drm/exynos: mixer: document YCbCr magic numbers

 .../bindings/display/exynos/exynos5433-decon.txt   |  13 +-
 .../boot/dts/exynos/exynos5433-tm2-common.dtsi     |  43 +++-
 arch/arm64/boot/dts/exynos/exynos5433-tm2.dts      |  17 ++
 arch/arm64/boot/dts/exynos/exynos5433-tm2e.dts     |   7 +
 drivers/gpu/drm/exynos/exynos5433_drm_decon.c      | 218 +++++++++------------
 drivers/gpu/drm/exynos/exynos7_drm_decon.c         |  19 +-
 drivers/gpu/drm/exynos/exynos_drm_crtc.c           |  50 +++--
 drivers/gpu/drm/exynos/exynos_drm_crtc.h           |   1 -
 drivers/gpu/drm/exynos/exynos_drm_drv.c            |   8 +-
 drivers/gpu/drm/exynos/exynos_drm_drv.h            |  19 +-
 drivers/gpu/drm/exynos/exynos_drm_dsi.c            |  24 +--
 drivers/gpu/drm/exynos/exynos_drm_fimd.c           |  24 +--
 drivers/gpu/drm/exynos/exynos_drm_plane.c          |   5 +-
 drivers/gpu/drm/exynos/exynos_drm_plane.h          |   1 -
 drivers/gpu/drm/exynos/exynos_drm_vidi.c           |  22 +--
 drivers/gpu/drm/exynos/exynos_hdmi.c               |  13 +-
 drivers/gpu/drm/exynos/exynos_mixer.c              |  76 ++++---
 drivers/gpu/drm/exynos/regs-mixer.h                |   7 +-
 include/video/exynos5433_decon.h                   |   1 +
 19 files changed, 256 insertions(+), 312 deletions(-)
