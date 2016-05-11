From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH 1/4] drm: add generic zpos property
Date: Wed, 11 May 2016 16:02:22 +0300
Message-ID: <1551177.bIWQz9aVr2@avalon>
References: <1462962308-13410-1-git-send-email-benjamin.gaignard@linaro.org> <7326036.oCkcemzpKu@avalon> <CA+M3ks4z0fuoCGJfPfHFMuz5geGrQry9MoA00wJ-hwBdCQTUOA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:49338 "EHLO
	galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751404AbcEKNC0 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 11 May 2016 09:02:26 -0400
In-Reply-To: <CA+M3ks4z0fuoCGJfPfHFMuz5geGrQry9MoA00wJ-hwBdCQTUOA@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Benjamin Gaignard <benjamin.gaignard@linaro.org>
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, linux-samsung-soc@vger.kernel.org, Daniel Vetter <daniel@ffwll.ch>, Marek Szyprowski <m.szyprowski@samsung.com>, Inki Dae <inki.dae@samsung.com>, Ville Syrjala <ville.syrjala@linux.intel.com>, Joonyoung Shim <jy0922.shim@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Andrzej Hajda <a.hajda@samsung.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Tobias Jakobi <tjakobi@math.uni-bielefeld.de>, Gustavo Padovan <gustavo@padovan.org>, Vincent Abriou <vincent.abriou@st.com>, Fabien Dessenne <fabien.dessenne@st.com>

Hi Benjamin,

On Wednesday 11 May 2016 14:05:49 Benjamin Gaignard wrote:
> 2016-05-11 13:24 GMT+02:00 Laurent Pinchart:
> > On Wednesday 11 May 2016 12:25:05 Benjamin Gaignard wrote:
> >> This patch adds support for generic plane's zpos property property with
> >> well-defined semantics:
> >> - added zpos properties to plane and plane state structures
> >> - added helpers for normalizing zpos properties of given set of planes
> >> - well defined semantics: planes are sorted by zpos values and then plane
> >>   id value if zpos equals
> >> 
> >> Normalized zpos values are calculated automatically when generic
> >> muttable zpos property has been initialized. Drivers can simply use
> >> plane_state->normalized_zpos in their atomic_check and/or plane_update
> >> callbacks without any additional calls to DRM core.
> >> 
> >> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> >> 
> >> Compare to Marek's original patch zpos property is now specific to each
> >> plane and no more to the core.
> >> Normalize function take care of the range of per plane defined range
> >> before set normalized_zpos.
> >> 
> >> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@linaro.org>
> >> 
> >> Cc: Inki Dae <inki.dae@samsung.com>
> >> Cc: Daniel Vetter <daniel@ffwll.ch>
> >> Cc: Ville Syrjala <ville.syrjala@linux.intel.com>
> >> Cc: Joonyoung Shim <jy0922.shim@samsung.com>
> >> Cc: Seung-Woo Kim <sw0312.kim@samsung.com>
> >> Cc: Andrzej Hajda <a.hajda@samsung.com>
> >> Cc: Krzysztof Kozlowski <k.kozlowski@samsung.com>
> >> Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
> >> Cc: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
> >> Cc: Gustavo Padovan <gustavo@padovan.org>
> >> Cc: vincent.abriou@st.com
> >> Cc: fabien.dessenne@st.com
> >> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> >> 
> >> ---
> >> 
> >>  Documentation/DocBook/gpu.tmpl      |  10 ++
> >>  drivers/gpu/drm/Makefile            |   2 +-
> >>  drivers/gpu/drm/drm_atomic_helper.c |   6 +
> >>  drivers/gpu/drm/drm_blend.c         | 284 ++++++++++++++++++++++++++++++
> >>  drivers/gpu/drm/drm_crtc_internal.h |   3 +
> >>  include/drm/drm_crtc.h              |  25 ++++
> >>  6 files changed, 329 insertions(+), 1 deletion(-)
> >>  create mode 100644 drivers/gpu/drm/drm_blend.c

[snip]

> >> diff --git a/drivers/gpu/drm/drm_atomic_helper.c
> >> b/drivers/gpu/drm/drm_atomic_helper.c index 997fd21..f10652f 100644
> >> --- a/drivers/gpu/drm/drm_atomic_helper.c
> >> +++ b/drivers/gpu/drm/drm_atomic_helper.c
> >> @@ -32,6 +32,8 @@
> >> 
> >>  #include <drm/drm_atomic_helper.h>
> >>  #include <linux/fence.h>
> >> 
> >> +#include "drm_crtc_internal.h"
> > 
> > drm_atomic_helper_normalize_zpos() is declared in <drm/drm_crtc.h>, why do
> > you need to include drm_crtc_internal.h ?
> 
> drm_atomic_helper_normalize_zpos() is declared in drm_crtc_internal.h
> not into <drm/drm_crtc.h>

OK, I'll go back to bed -_-'

[snip]

> >> diff --git a/drivers/gpu/drm/drm_blend.c b/drivers/gpu/drm/drm_blend.c
> >> new file mode 100644
> >> index 0000000..7017715
> >> --- /dev/null
> >> +++ b/drivers/gpu/drm/drm_blend.c
> >> @@ -0,0 +1,284 @@

[snip]

> >> +/**
> >> + * drm_plane_create_zpos_immutable_property - create immuttable zpos
> >> property
> >> + * @plane: drm plane
> >> + * @min: minimal possible value of zpos property
> >> + * @max: maximal possible value of zpos property
> >> + *
> >> + * This function initializes generic immutable zpos property and enables
> >> + * support for it in drm core. Using this property driver lets userspace
> >> + * to get the arrangement of the planes for blending operation and
> >> notifies + * it that the hardware (or driver) doesn't support changing
> >> of the planes'
> >> + * order.
> >> + *
> >> + * Returns:
> >> + * Zero on success, negative errno on failure.
> >> + */
> >> +int drm_plane_create_zpos_immutable_property(struct drm_plane *plane,
> >> +                                          unsigned int min, unsigned int
> >> max) +{
> >> +     struct drm_property *prop;
> >> +
> >> +     prop = drm_property_create_range(plane->dev,
> >> DRM_MODE_PROP_IMMUTABLE,
> >> +                                      "zpos", min, max);
> > 
> > Can two properties exist with the same name but different flags (immutable
> > and mutable) ? Or with different min/max values ? I don't expect min/max
> > to be different for every plane, so maybe a function that creates the
> > zpos property once with min/max values and a second one that attaches the
> > property to planes would be a better API.
> 
> Be able to have a per plane zpos property was a Ville request because
> all the planes may not have the same min/max zpos.

Which driver(s) need that feature ? Is it for the cursor plane only ? In that 
case I wonder if it would really make sense to create an immutable zpos 
property with a fixed high value for the cursor plane, versus not having a 
zpos property at all.

> The consequences of this design are that we can cache the property in
> drm_mode_config
> and we need to have helpers functions
> drm_plane_atomic_{set,get}_zpos_property to be able find
> the property attached to the drm_plane.

Can't you cache it in drm_plane instead then, and remove the loop from those 
two helpers ? You should even remove the helpers completely and handle the 
zpos property in drm_plane_atomic_[gs]et_property().

> >> +     if (!prop)
> >> +             return -ENOMEM;
> >> +
> >> +     drm_object_attach_property(&plane->base, prop, min);
> >> +     return 0;
> >> +}
> >> +EXPORT_SYMBOL(drm_plane_create_zpos_immutable_property);

[snip]

> >> +/**
> >> + * drm_atomic_helper_crtc_normalize_zpos - calculate normalized zpos
> >> values
> >> + * @crtc: crtc with planes, which have to be considered for
> >> normalization
> >> + * @crtc_state: new atomic state to apply
> >> + *
> >> + * This function checks new states of all planes assigned to given crtc
> >> and
> >> + * calculates normalized zpos value for them. Planes are compared first
> >> by their
> >> + * zpos values, then by plane id (if zpos equals). Plane with lowest
> >> zpos value
> >> + * is at the bottom. The plane_state->normalized_zpos is then filled
> >> with unique
> >> + * values from 0 to number of active planes in crtc minus one.
> >> + *
> >> + * RETURNS
> >> + * Zero for success or -errno
> >> + */
> >> +int drm_atomic_helper_crtc_normalize_zpos(struct drm_crtc *crtc,
> >> +                                       struct drm_crtc_state
> >> *crtc_state)
> >> +{
> >> +     struct drm_atomic_state *state = crtc_state->state;
> >> +     struct drm_device *dev = crtc->dev;
> >> +     int total_planes = dev->mode_config.num_total_plane;
> >> +     struct drm_plane_state **states;
> >> +     struct drm_plane *plane;
> >> +     int i, zpos, n = 0;
> >> +     int ret = 0;
> >> +
> >> +     DRM_DEBUG_ATOMIC("[CRTC:%d:%s] calculating normalized zpos
> >> values\n",
> >> +                      crtc->base.id, crtc->name);
> >> +
> >> +     states = kmalloc(total_planes * sizeof(*states), GFP_KERNEL);
> >> +     if (!states)
> >> +             return -ENOMEM;
> >> +
> >> +     /*
> >> +      * Normalization process might create new states for planes which
> >> +      * normalized_zpos has to be recalculated.
> >> +      */
> >> +     drm_for_each_plane_mask(plane, dev, crtc_state->plane_mask) {
> >> +             struct drm_plane_state *plane_state =
> >> +                     drm_atomic_get_plane_state(state, plane);
> >> +             if (IS_ERR(plane_state)) {
> >> +                     ret = PTR_ERR(plane_state);
> >> +                     goto fail;
> >> +             }
> >> +             states[n++] = plane_state;
> >> +             DRM_DEBUG_ATOMIC("[PLANE:%d:%s] processing zpos value
> >> %d\n",
> >> +                              plane->base.id, plane->name,
> >> +                              plane_state->zpos);
> >> +     }
> >> +
> >> +     sort(states, n, sizeof(*states), drm_atomic_state_zpos_cmp, NULL);
> >> +
> >> +     for (i = 0, zpos = 0; i < n; i++, zpos++) {
> >> +             plane = states[i]->plane;
> >> +
> >> +             zpos = MAX(zpos, states[i]->zpos);
> >> +
> >> +             states[i]->normalized_zpos = zpos;
> > 
> > Can't you just use i instead of MAX(zpos, states[i]->zpos) ?
> 
> No because since each plane could have different min/max you could
> have gaps between two plane.
> For example if planeX range is [0,2] and planeY range is [4,6] we need
> to be sure the min value of planeY is 4

And that's exactly what I'd rather avoid. I think the core code should take 
care of sorting planes, taking driver-specific constraints into account when 
possible (too exotic constraints can always be implemented directly by 
drivers), and then leave to the drivers the responsibility of taking the 
sorted planes array and computing whatever hardware-specific configuration is 
needed. Sorting planes from 0 to N-1 seems to be like a better API than having 
semi-random values for the normalized zpos.

Do we even have a real use case for the "feature" you described ?

> >> +             DRM_DEBUG_ATOMIC("[PLANE:%d:%s] normalized zpos value
> >> %d\n",
> >> +                              plane->base.id, plane->name, zpos);
> >> +     }
> >> +     crtc_state->zpos_changed = true;
> >> +
> > 
> >> +fail:
> > We reach the label in the normal code path too, I would thus call it done
> > or exit instead of fail.
> 
> I will change it to done
> 
> >> +     kfree(states);
> >> +     return ret;
> >> +}
> >> +EXPORT_SYMBOL(drm_atomic_helper_crtc_normalize_zpos);

[snip]

-- 
Regards,

Laurent Pinchart
