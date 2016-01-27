From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH v5 0/5] drm/exynos: introduce generic zpos and blending
 properties
Date: Wed, 27 Jan 2016 15:44:38 +0100
Message-ID: <1453905883-6807-1-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:58526 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932497AbcA0Oo5 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 27 Jan 2016 09:44:57 -0500
Received: from eucpsbgm2.samsung.com (unknown [203.254.199.245])
 by mailout2.w1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0O1M0077Z8YUQU10@mailout2.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 27 Jan 2016 14:44:54 +0000 (GMT)
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
- well defined semantics: planes are sorted by zpos values and then pla=
ne
  id value if zpos equals.

The next part is a result of my survey on introducing generic plane
blending related properties:
http://www.spinics.net/lists/dri-devel/msg98106.html=20

Ville Syrj=C3=A4l=C3=A4 suggested that blending mode should be defined =
by a pair
of 2 factors, which define generic blending equation. I've implemented
this approach. I hope that this code can be a base for further discussi=
on
on generic blending support. For more information, see patch 4/5.

Patches are based on top of v4.5-rc1 release.

Best regards
Marek Szyprowski
Samsung R&D Institute Poland

Changelog:

v5:
- added patch with new generic blending and alpha properties
- changed patchseries topic to "drm/exynos: introduce generic zpos and
  blending properties"
- moved all generic code to separate drm_blend.c file

v4: http://www.spinics.net/lists/dri-devel/msg98654.html
- made min/max values of zpos property driver dependent (request of
  Ville Syrj=C3=A4l=C3=A4)
- adjusted some comments

v3: http://www.spinics.net/lists/dri-devel/msg98207.html
- on request of Daniel Vetter, moved all normalization process to DRM
  core, drivers can simply use plane_state->normalized_zpos in their
  atomic_check/update callbacks with no additional changes needed
- updated documentation

v2: http://www.spinics.net/lists/dri-devel/msg98093.html
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

Marek Szyprowski (5):
  drm: add generic zpos property
  drm/exynos: use generic code for managing zpos plane property
  drm: simplify initialization of rotation property
  drm: add generic blending related properties
  drm/exynos: add support for blending properties

 Documentation/DocBook/gpu.tmpl                  |  57 +++-
 drivers/gpu/drm/Makefile                        |   2 +-
 drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_plane.c |  10 +-
 drivers/gpu/drm/drm_atomic.c                    |  16 ++
 drivers/gpu/drm/drm_atomic_helper.c             |   6 +
 drivers/gpu/drm/drm_blend.c                     | 337 ++++++++++++++++=
++++++++
 drivers/gpu/drm/drm_crtc.c                      |  29 +-
 drivers/gpu/drm/drm_crtc_internal.h             |   3 +
 drivers/gpu/drm/exynos/exynos_drm_drv.h         |   7 +-
 drivers/gpu/drm/exynos/exynos_drm_plane.c       | 128 +++++----
 drivers/gpu/drm/exynos/exynos_mixer.c           |   6 +-
 drivers/gpu/drm/i915/intel_display.c            |   6 +-
 drivers/gpu/drm/msm/mdp/mdp5/mdp5_plane.c       |   3 +-
 drivers/gpu/drm/omapdrm/omap_drv.c              |   3 +-
 include/drm/drm_crtc.h                          |  36 ++-
 include/uapi/drm/drm_mode.h                     | 101 +++++++
 16 files changed, 669 insertions(+), 81 deletions(-)
 create mode 100644 drivers/gpu/drm/drm_blend.c

--=20
1.9.2
