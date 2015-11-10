From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH 00/25] Exynos DRM: new life of IPP (Image Post Processing)
 subsystem
Date: Tue, 10 Nov 2015 14:23:16 +0100
Message-ID: <1447161821-1877-1-git-send-email-m.szyprowski@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:55191 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753085AbbKJNYt (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 10 Nov 2015 08:24:49 -0500
Received: from eucpsbgm2.samsung.com (unknown [203.254.199.245])
 by mailout2.w1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0NXL007KEP9ANFA0@mailout2.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 10 Nov 2015 13:24:46 +0000 (GMT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Inki Dae <inki.dae@samsung.com>, Joonyoung Shim <jy0922.shim@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Andrzej Hajda <a.hajda@samsung.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Tobias Jakobi <tjakobi@math.uni-bielefeld.de>, Gustavo Padovan <gustavo@padovan.org>, Javier Martinez Canillas <javier@osg.samsung.com>

Dear All,

This patch series introduces a new life into Exynos IPP (Image Post
Processing) subsystem by integrating it (transparently for userspace
applications) with Exynos DRM core plane management. This means that all
CRTC drivers transparently get support for standard features of IPP
subsystem like rotation and scaling.

Support for features not supported natively by CRTC drivers is
implemented with a help of temporary framebuffers, where image data is
processed by IPP subsystem before performing the scanout by a CRTC driver.

This patchset is a first version of this 'new feature' and I would like
get some comments on the proposed approach. I plan to continue working
on enhancing Exynos DRM drivers and especially do the cleanup the IPP
subsystem.

Most of the new features are added by the last 2 patches. All other
patches are bugfixes in various Exynos DRM subdrivers and significant
core rewrite - introducing a subclass of drm_plane_state was needed and
all drivers have been converted to use it. Some initial cleanups in IPP
subsystem were also needed to let Exynos core to call it internally from
the driver core. This part will be cleaned even more in the future.


My solution has been tested on Exynos4412-based Odroid U3 and
Exynos5420-based Odroid XU3. To check rotation, cropping and scaling
I've developed a simple test application, which use atomic mode
setting/page flipping API. You can download it here:

https://git.linaro.org/?p=people/marek.szyprowski/atomictest.git

The application draws a rectangle with test pattern and then moves it
around the screen. To see how all mentioned features work (plane
rotation, cropping, scaling and off-screen display), please run the
following commands:

scaling + rotation:
# ./atomictest -b400x300 -f60 -t100 -m2x1 -x1x1

cropping + rotation:
# ./atomictest -b400x300 -f60 -t100 -m2x1 -c1x1

cropping + rotation + off-screen display:
# ./atomictest -b400x300 -f60 -t100 -m2x1 -c1x1 -o400x300

scaling + cropping + rotation:
# ./atomictest -b400x300 -f60 -t100 -m2x1 -x1x1 -c1x1 

For more information about parameters, run the application with -h
parameter or check the source code.


My TODO list (please comment the priority of those tasks):

1. add support for color space conversion, support for foreign pixel
formats and fb-modifiers to my plane-IPP integration code (currently
only RGB single plane modes are supported)

2. provide support for IPP features (framebuffer rotation, scaling,
cropping, color space conversion) with userspace atomic API instead of
(or together with) Exynos custom IPP ioctls; the important question is
weather the existing Exynos IPP API (userspace ioctls) should be kept or
can be removed (existing userspace API is misleading in many aspects).

3. simplify IPP subsystem core (the code looks over-engineered a bit,
there are also some known issues with error paths), remove
non-functional write-back and output modes

4. simplify interface to IPP HW-specific mem2mem subdrivers

5. implement output mode for IPP sub-drivers, use it where possible
instead of using temporary framebuffer (image data is then transferred
directly from scaling hw block to display engine via local path, no
temporary framebuffers are needed)

6. implement write-back feature with atomic API as respective CRTC
properties


Patches have been prepared on top of linux-next from 10-11-2015. First
2 patches should be applied to Samsung SoC tree, all other should go
to Exynos DRM tree.

Best regards
Marek Szyprowski
Samsung R&D Institute Poland


Patch summary:

Marek Szyprowski (21):
  ARM: dts: exynos4: add rotator nodes
  ARM: dts: exynos542x: add rotator node
  drm/exynos: gsc: add device tree support and remove usage of static
    mappings
  drm/exynos: rotator: convert to common clock framework
  drm/exynos: exynos7-decon: remove excessive check
  drm/exynos: move dma_addr attribute from exynos plane to exynos fb
  drm/exynos: introduce exynos_drm_plane_state structure
  drm/exynos: mixer: use crtc->state->adjusted_mode instead of
    crtc->mode
  drm/exynos: mixer: enable video overlay plane only when VP is
    available
  drm/exynos: introduce exynos_drm_plane_config structure
  drm/exynos: add generic check for plane state
  drm/exynos: mixer: use ratio precalculated in exynos_state
  drm/exynos: fix clipping when scalling is enabled
  drm/exynos: fimd: fix dma burst size setting for small plane size
  drm/exynos: add fb pointer to exynos_drm_plane_state
  drm/exynos: gem: set default alignment for dumb GEM buffers
  drm/exynos: gem: remove old unused prototypes
  drm/exynos: gem: simplify access to exynos gem object
  drm/exynos: ipp: make framework context global
  drm/exynos: add generic plane rotation property support
  drm/exynos: add support for plane scaling

Seung-Woo Kim (4):
  drm/exynos: gsc: prepare and unprepare gsc clock
  drm/exynos: gsc: fix wrong pm_runtime state
  drm/exynos: fix to calculate offset of each plane for ipp fimc
  drm/exynos: fix to calculate offset of each plane for ipp gsc

 .../devicetree/bindings/media/exynos5-gsc.txt      |   4 +
 arch/arm/boot/dts/exynos4.dtsi                     |  10 +-
 arch/arm/boot/dts/exynos4210.dtsi                  |   8 +
 arch/arm/boot/dts/exynos4x12.dtsi                  |   4 +
 arch/arm/boot/dts/exynos5420.dtsi                  |  19 ++
 drivers/gpu/drm/exynos/Kconfig                     |  10 +-
 drivers/gpu/drm/exynos/Makefile                    |   1 +
 drivers/gpu/drm/exynos/exynos5433_drm_decon.c      |  48 ++--
 drivers/gpu/drm/exynos/exynos7_drm_decon.c         |  68 ++---
 drivers/gpu/drm/exynos/exynos_drm_drv.h            |  97 +++++--
 drivers/gpu/drm/exynos/exynos_drm_fb.c             |  16 +-
 drivers/gpu/drm/exynos/exynos_drm_fb.h             |   3 +-
 drivers/gpu/drm/exynos/exynos_drm_fimc.c           | 106 ++++++++
 drivers/gpu/drm/exynos/exynos_drm_fimd.c           |  88 ++++---
 drivers/gpu/drm/exynos/exynos_drm_g2d.c            |  48 ++--
 drivers/gpu/drm/exynos/exynos_drm_gem.c            |  54 +---
 drivers/gpu/drm/exynos/exynos_drm_gem.h            |  51 +---
 drivers/gpu/drm/exynos/exynos_drm_gsc.c            | 151 ++++++++++-
 drivers/gpu/drm/exynos/exynos_drm_ipp.c            | 237 +++++++++++++----
 drivers/gpu/drm/exynos/exynos_drm_ipp.h            |   8 +-
 drivers/gpu/drm/exynos/exynos_drm_plane.c          | 255 +++++++++++++------
 drivers/gpu/drm/exynos/exynos_drm_plane.h          |   7 +-
 drivers/gpu/drm/exynos/exynos_drm_plane_ipp.c      | 281 +++++++++++++++++++++
 drivers/gpu/drm/exynos/exynos_drm_plane_ipp.h      |  73 ++++++
 drivers/gpu/drm/exynos/exynos_drm_rotator.c        |   4 +-
 drivers/gpu/drm/exynos/exynos_drm_vidi.c           |  30 ++-
 drivers/gpu/drm/exynos/exynos_mixer.c              | 133 +++++-----
 drivers/gpu/drm/exynos/regs-gsc.h                  |   4 +-
 28 files changed, 1348 insertions(+), 470 deletions(-)
 create mode 100644 drivers/gpu/drm/exynos/exynos_drm_plane_ipp.c
 create mode 100644 drivers/gpu/drm/exynos/exynos_drm_plane_ipp.h

-- 
1.9.2
