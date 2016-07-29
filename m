From: Benjamin Gaignard <benjamin.gaignard@linaro.org>
Subject: [PATCH v8 0/4] Generic zpos property
Date: Fri, 29 Jul 2016 10:55:35 +0200
Message-ID: <1469782539-9698-1-git-send-email-benjamin.gaignard@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wm0-f46.google.com ([74.125.82.46]:34900 "EHLO
	mail-wm0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751147AbcG2I4k (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 29 Jul 2016 04:56:40 -0400
Received: by mail-wm0-f46.google.com with SMTP id f65so281532964wmi.0
        for <linux-samsung-soc@vger.kernel.org>; Fri, 29 Jul 2016 01:56:39 -0700 (PDT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: dri-devel@lists.freedesktop.org, vincent.abriou@st.com, fabien.dessenne@st.com, linux-samsung-soc@vger.kernel.org, emil.l.velikov@gmail.com
Cc: linaro-mm-sig@lists.linaro.org, Benjamin Gaignard <benjamin.gaignard@linaro.org>

version 8:
move drm_blend.o from drm-y to drm_kms_helper-y to avoid EXPORT_SYMBOL(drm_atomic_helper_normalize_zpos)
remove dead function declarations in drm_crtc.h
rebased code on drm-next + merge of git://linuxtv.org/media_tree.git vsp1 branch.

version 7:
remove useless EXPORT_SYMBOL()
better z-order wording in Documentation
rebased code on drm-next + merge of git://linuxtv.org/media_tree.git vsp1 branch.
vsp1 branch might be merged into 4.8-rc1 so conflits between rcar-du and zpos
patches should be avoid in this version 7.

version 6:
add zpos in Documentation/gpu/kms-properties.csv
merge Ville's patch (splitted between all the commits)
it simplify the API and fix bug. Thanks

version 5:
rebased on drm-next where Documentation/DocBook/gpu.tmpl doesn't
exist anymore.
rework sti patch because some plane functions have changed since v4

version 4:
make sure that normalized zpos value is stay in the defined property
range and warn user if not.
Fix NULL pointer bug in rcar-du while setting zpos value.
No changes in the other drivers.

version 3:
use kmalloc_array instead of kmalloc.
Correct normalize_zpos computation (comeback to Mareck original code)

version 2:
add a zpos property into drm_plane structure to simplify code.
This allow to get/set zpos value in core and not in drivers code.
Fix various remarks.

version 1:
refactor Marek's patches to have per plane zpos property instead of only
one in core.

Benjamin Gaignard (2):
  drm: sti: use generic zpos for plane
  drm: rcar: use generic code for managing zpos plane property

Marek Szyprowski (2):
  drm: add generic zpos property
  drm/exynos: use generic code for managing zpos plane property

 Documentation/gpu/kms-properties.csv      |   1 +
 drivers/gpu/drm/Makefile                  |   2 +-
 drivers/gpu/drm/drm_atomic.c              |   4 +
 drivers/gpu/drm/drm_atomic_helper.c       |   7 +
 drivers/gpu/drm/drm_blend.c               | 238 ++++++++++++++++++++++++++++++
 drivers/gpu/drm/drm_crtc_internal.h       |   4 +
 drivers/gpu/drm/exynos/exynos_drm_drv.h   |   2 -
 drivers/gpu/drm/exynos/exynos_drm_plane.c |  67 ++-------
 drivers/gpu/drm/exynos/exynos_mixer.c     |   6 +-
 drivers/gpu/drm/rcar-du/rcar_du_crtc.c    |   2 +-
 drivers/gpu/drm/rcar-du/rcar_du_drv.h     |   1 -
 drivers/gpu/drm/rcar-du/rcar_du_kms.c     |   5 -
 drivers/gpu/drm/rcar-du/rcar_du_plane.c   |   9 +-
 drivers/gpu/drm/rcar-du/rcar_du_plane.h   |   2 -
 drivers/gpu/drm/rcar-du/rcar_du_vsp.c     |  14 +-
 drivers/gpu/drm/sti/sti_cursor.c          |   4 +-
 drivers/gpu/drm/sti/sti_gdp.c             |   4 +-
 drivers/gpu/drm/sti/sti_hqvdp.c           |   4 +-
 drivers/gpu/drm/sti/sti_mixer.c           |   9 +-
 drivers/gpu/drm/sti/sti_plane.c           |  78 ++++------
 drivers/gpu/drm/sti/sti_plane.h           |   7 +-
 include/drm/drm_crtc.h                    |  20 +++
 22 files changed, 334 insertions(+), 156 deletions(-)
 create mode 100644 drivers/gpu/drm/drm_blend.c

-- 
1.9.1
