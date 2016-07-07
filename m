From: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
Subject: Re: [PATCH v5 0/4] Generic zpos property
Date: Thu, 7 Jul 2016 16:01:03 +0200
Message-ID: <577E609F.3000300@math.uni-bielefeld.de>
References: <1467896484-5132-1-git-send-email-benjamin.gaignard@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from smtp.math.uni-bielefeld.de ([129.70.45.10]:47550 "EHLO
	smtp.math.uni-bielefeld.de" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751508AbcGGOBH (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 7 Jul 2016 10:01:07 -0400
In-Reply-To: <1467896484-5132-1-git-send-email-benjamin.gaignard@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Benjamin Gaignard <benjamin.gaignard@linaro.org>, dri-devel@lists.freedesktop.org, vincent.abriou@st.com, fabien.dessenne@st.com, linux-samsung-soc@vger.kernel.org
Cc: linaro-mm-sig@lists.linaro.org, Inki Dae <inki.dae@samsung.com>, Daniel Vetter <daniel@ffwll.ch>, Ville Syrjala <ville.syrjala@linux.intel.com>, Joonyoung Shim <jy0922.shim@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Andrzej Hajda <a.hajda@samsung.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Tobias Jakobi <tjakobi@math.uni-bielefeld.de>, Gustavo Padovan <gustavo@padovan.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Hello Benjamin,


Benjamin Gaignard wrote:
> version 5:
> rebased on drm-next where Documentation/DocBook/gpu.tmpl doesn't
> exist anymore.
I think the documentation has just moved to Documentation/gpu, so the
zpos property should be documented there then.


With best wishes,
Tobias


> rework sti patch because some plane functions have changed since v4
> 
> version 4:
> make sure that normalized zpos value is stay in the defined property 
> range and warn user if not.
> Fix NULL pointer bug in rcar-du while setting zpos value.
> No changes in the other drivers.
> 
> version 3:
> use kmalloc_array instead of kmalloc.
> Correct normalize_zpos computation (comeback to Mareck original code)
> 
> version 2:
> add a zpos property into drm_plane structure to simplify code.
> This allow to get/set zpos value in core and not in drivers code.
> Fix various remarks.
> 
> version 1:
> refactor Marek's patches to have per plane zpos property instead of only
> one in core.
> 
> Benjamin Gaignard (2):
>   drm: sti: use generic zpos for plane
>   drm: rcar: use generic code for managing zpos plane property
> 
> Marek Szyprowski (2):
>   drm: add generic zpos property
>   drm/exynos: use generic code for managing zpos plane property
> 
>  drivers/gpu/drm/Makefile                  |   2 +-
>  drivers/gpu/drm/drm_atomic.c              |   4 +
>  drivers/gpu/drm/drm_atomic_helper.c       |   6 +
>  drivers/gpu/drm/drm_blend.c               | 227 ++++++++++++++++++++++++++++++
>  drivers/gpu/drm/drm_crtc_internal.h       |   4 +
>  drivers/gpu/drm/exynos/exynos_drm_drv.h   |   2 -
>  drivers/gpu/drm/exynos/exynos_drm_plane.c |  67 ++-------
>  drivers/gpu/drm/exynos/exynos_mixer.c     |   6 +-
>  drivers/gpu/drm/rcar-du/rcar_du_crtc.c    |   2 +-
>  drivers/gpu/drm/rcar-du/rcar_du_drv.h     |   1 -
>  drivers/gpu/drm/rcar-du/rcar_du_kms.c     |   5 -
>  drivers/gpu/drm/rcar-du/rcar_du_plane.c   |   9 +-
>  drivers/gpu/drm/rcar-du/rcar_du_plane.h   |   2 -
>  drivers/gpu/drm/sti/sti_cursor.c          |   4 +-
>  drivers/gpu/drm/sti/sti_gdp.c             |   4 +-
>  drivers/gpu/drm/sti/sti_hqvdp.c           |   4 +-
>  drivers/gpu/drm/sti/sti_mixer.c           |   9 +-
>  drivers/gpu/drm/sti/sti_plane.c           |  76 ++++------
>  drivers/gpu/drm/sti/sti_plane.h           |   7 +-
>  include/drm/drm_crtc.h                    |  30 ++++
>  20 files changed, 324 insertions(+), 147 deletions(-)
>  create mode 100644 drivers/gpu/drm/drm_blend.c
> 
> Cc: Inki Dae <inki.dae@samsung.com>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Ville Syrjala <ville.syrjala@linux.intel.com>
> Cc: Joonyoung Shim <jy0922.shim@samsung.com>
> Cc: Seung-Woo Kim <sw0312.kim@samsung.com>
> Cc: Andrzej Hajda <a.hajda@samsung.com>
> Cc: Krzysztof Kozlowski <k.kozlowski@samsung.com>
> Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
> Cc: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
> Cc: Gustavo Padovan <gustavo@padovan.org>
> Cc: vincent.abriou@st.com
> Cc: fabien.dessenne@st.com
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> 
