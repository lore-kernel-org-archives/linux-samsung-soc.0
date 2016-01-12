From: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH v3 0/3] drm/exynos: introduce generic zpos property
Date: Tue, 12 Jan 2016 16:28:25 +0100
Message-ID: <20160112152825.GB19130@phenom.ffwll.local>
References: <1452605960-21194-1-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wm0-f66.google.com ([74.125.82.66]:34268 "EHLO
	mail-wm0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1762699AbcALP2Z (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 12 Jan 2016 10:28:25 -0500
Received: by mail-wm0-f66.google.com with SMTP id b14so31994518wmb.1
        for <linux-samsung-soc@vger.kernel.org>; Tue, 12 Jan 2016 07:28:24 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <1452605960-21194-1-git-send-email-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org, Inki Dae <inki.dae@samsung.com>, Daniel Vetter <daniel@ffwll.ch>, Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>, Joonyoung Shim <jy0922.shim@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Andrzej Hajda <a.hajda@samsung.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Tobias Jakobi <tjakobi@math.uni-bielefeld.de>, Gustavo Padovan <gustavo@padovan.org>, Benjamin Gaignard <benjamin.gaignard@linaro.org>, vincent.abriou@st.com, fabien.dessenne@st.com

On Tue, Jan 12, 2016 at 02:39:17PM +0100, Marek Szyprowski wrote:
> Hello all,
> 
> This patch series is a continuation of rework of blending support in
> Exynos DRM driver. Some background can be found here:
> http://www.spinics.net/lists/dri-devel/msg96969.html
> 
> Daniel Vetter suggested that zpos property should be made generic, with
> well-defined semantics. This patchset is my proposal for such generic
> zpos property:
> - added zpos properties to drm core and plane state structures,
> - added helpers for normalizing zpos properties of given set of planes,
> - well defined semantics: planes are sorted by zpos values and then plane
>   id value if zpos equals.
> 
> Patches are based on top of latest exynos-drm-next branch.
> 
> Best regards
> Marek Szyprowski
> Samsung R&D Institute Poland
> 
> Changelog:
> 
> v3:
> - on request of Daniel Vetter, moved all normalization process to DRM
>   core, drivers can simply use plane_state->normalized_zpos in their
>   atomic_check/update callbacks with no additional changes needed
> - updated documentation
> 
> v2: http://www.spinics.net/lists/dri-devel/msg98093.html
> - dropped 2 fixes for Exynos DRM, which got merged in meantime
> - added more comments and kernel docs for core functions as suggested
>   by Daniel Vetter
> - reworked initialization of zpos properties (moved assiging property
>   class to common code), now the code in the driver is even simpler
> - while reworking of intialization of zpos property code, did the same
>   change to generic rotation property
> 
> v1: http://www.spinics.net/lists/dri-devel/msg97709.html
> - initial version

Yeah I think that looks overall rather neat now. Probably best if someone
from the exynos team reviews it all in detail, and then we could pull it
in through drm-misc.

Cheers, Daniel

> 
> Patch summary:
> 
> Marek Szyprowski (3):
>   drm: add generic zpos property
>   drm/exynos: use generic code for managing zpos plane property
>   drm: simplify initialization of rotation property
> 
>  Documentation/DocBook/gpu.tmpl                  |  14 ++-
>  drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_plane.c |  10 +-
>  drivers/gpu/drm/drm_atomic.c                    |   4 +
>  drivers/gpu/drm/drm_atomic_helper.c             | 116 ++++++++++++++++++++++++
>  drivers/gpu/drm/drm_crtc.c                      |  82 +++++++++++++++--
>  drivers/gpu/drm/exynos/exynos_drm_drv.h         |   2 -
>  drivers/gpu/drm/exynos/exynos_drm_plane.c       |  66 +++-----------
>  drivers/gpu/drm/exynos/exynos_mixer.c           |   6 +-
>  drivers/gpu/drm/i915/intel_display.c            |   6 +-
>  drivers/gpu/drm/msm/mdp/mdp5/mdp5_plane.c       |   3 +-
>  drivers/gpu/drm/omapdrm/omap_drv.c              |   3 +-
>  include/drm/drm_crtc.h                          |  18 +++-
>  12 files changed, 250 insertions(+), 80 deletions(-)
> 
> -- 
> 1.9.2
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
