From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH v2 0/3] drm/exynos: introduce generic zpos property
Date: Mon, 11 Jan 2016 12:03:02 +0100
Message-ID: <1452510185-22801-1-git-send-email-m.szyprowski@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:42417 "EHLO
	mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932180AbcAKLDo (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 11 Jan 2016 06:03:44 -0500
Received: from eucpsbgm2.samsung.com (unknown [203.254.199.245])
 by mailout4.w1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0O0S00IL3C25W2A0@mailout4.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 11 Jan 2016 11:03:41 +0000 (GMT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Inki Dae <inki.dae@samsung.com>, Daniel Vetter <daniel@ffwll.ch>, =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>, Joonyoung Shim <jy0922.shim@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Andrzej Hajda <a.hajda@samsung.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Tobias Jakobi <tjakobi@math.uni-bielefeld.de>, Gustavo Padovan <gustavo@padovan.org>, Benjamin Gaignard <benjamin.gaignard@linaro.org>, vincent.abriou@st.com, fabien.dessenne@st.com

Hello all,

This patch series is a continuation of rework of blending support in
Exynos DRM driver. Some background can be found here:
http://www.spinics.net/lists/dri-devel/msg96969.html

Daniel Vetter suggested that zpos property should be made generic, with
well-defined semantics. This patchset is my proposal for such generic
zpos property:
- added zpos properties to drm core and plane state structures,
- added helpers for normalizing zpos properties of given set of planes,
- well defined semantics: planes are sorted by zpos values and then plane
  id value if zpos equals.

Patches are based on top of latest exynos-drm-next branch.

Best regards
Marek Szyprowski
Samsung R&D Institute Poland

Changelog:

v2:
- dropped 2 fixes for Exynos DRM, which got merged in meantime
- added more comments and kernel docs for core functions as suggested
  by Daniel Vetter
- reworked initialization of zpos properties (moved assiging property
  class to common code), now the code in the driver is even simpler
- while reworking of intialization of zpos property code, did the same
  change to generic rotation property

v1: http://www.spinics.net/lists/dri-devel/msg97709.html
- initial version

Patch summary:

Marek Szyprowski (3):
  drm: add generic zpos property
  drm/exynos: use generic code for managing zpos plane property
  drm: simplify initialization of rotation property

 Documentation/DocBook/gpu.tmpl                  | 14 ++++-
 drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_plane.c | 10 ++--
 drivers/gpu/drm/drm_atomic.c                    |  4 ++
 drivers/gpu/drm/drm_atomic_helper.c             | 45 +++++++++++++++
 drivers/gpu/drm/drm_crtc.c                      | 73 +++++++++++++++++++++++--
 drivers/gpu/drm/exynos/exynos_drm_drv.h         |  1 -
 drivers/gpu/drm/exynos/exynos_drm_plane.c       | 66 +++++-----------------
 drivers/gpu/drm/exynos/exynos_mixer.c           | 19 ++++++-
 drivers/gpu/drm/i915/intel_display.c            |  6 +-
 drivers/gpu/drm/msm/mdp/mdp5/mdp5_plane.c       |  3 +-
 drivers/gpu/drm/omapdrm/omap_drv.c              |  3 +-
 include/drm/drm_atomic_helper.h                 |  2 +
 include/drm/drm_crtc.h                          | 16 +++++-
 13 files changed, 182 insertions(+), 80 deletions(-)

-- 
1.9.2
