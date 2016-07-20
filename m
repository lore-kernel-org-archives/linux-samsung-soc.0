From: Benjamin Gaignard <benjamin.gaignard@linaro.org>
Subject: Re: [PATCH v5 1/4] drm: add generic zpos property
Date: Wed, 20 Jul 2016 13:20:17 +0200
Message-ID: <CA+M3ks7dvJ9p7sZ-fSpyrbJ0sWuERzVcXNHned+pzdS_jcuOnw@mail.gmail.com>
References: <1467896484-5132-1-git-send-email-benjamin.gaignard@linaro.org>
 <1467896484-5132-2-git-send-email-benjamin.gaignard@linaro.org> <20160720101126.GP4329@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-oi0-f50.google.com ([209.85.218.50]:33856 "EHLO
	mail-oi0-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752356AbcGTLUT convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 20 Jul 2016 07:20:19 -0400
Received: by mail-oi0-f50.google.com with SMTP id l65so66403329oib.1
        for <linux-samsung-soc@vger.kernel.org>; Wed, 20 Jul 2016 04:20:18 -0700 (PDT)
In-Reply-To: <20160720101126.GP4329@intel.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, Vincent Abriou <vincent.abriou@st.com>, Fabien Dessenne <fabien.dessenne@st.com>, linux-samsung-soc@vger.kernel.org, Linaro MM SIG Mailman List <linaro-mm-sig@lists.linaro.org>, Marek Szyprowski <m.szyprowski@samsung.com>, Inki Dae <inki.dae@samsung.com>, Daniel Vetter <daniel@ffwll.ch>, Joonyoung Shim <jy0922.shim@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Andrzej Hajda <a.hajda@samsung.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Tobias Jakobi <tjakobi@math.uni-bielefeld.de>, Gustavo Padovan <gustavo@padovan.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>

I will merge your changes for the next version, thanks

zpos property is not a new property sti, exynos and r-car already used =
it.
I know some not upstreamed code use it to manage zordering.
=46or example I have wrote an Android hwcomposer using this property:
https://git.linaro.org/people/benjamin.gaignard/hwcomposer.git/blob/HEA=
D:/hwcomposer.cpp#l591

I hope those patches could help to standardize zordering in userland.



2016-07-20 12:11 GMT+02:00 Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux=
=2Eintel.com>:
> On Thu, Jul 07, 2016 at 03:01:21PM +0200, Benjamin Gaignard wrote:
>> From: Marek Szyprowski <m.szyprowski@samsung.com>
>>
>> version 5:
>> - remove zpos range check and comeback to 0 to N-1
>>   normalization algorithm
>>
>> version 4:
>> - make sure that normalized zpos value is stay
>>   in the defined property range and warn user if not
>>
>> This patch adds support for generic plane's zpos property property w=
ith
>> well-defined semantics:
>> - added zpos properties to plane and plane state structures
>> - added helpers for normalizing zpos properties of given set of plan=
es
>> - well defined semantics: planes are sorted by zpos values and then =
plane
>>   id value if zpos equals
>>
>> Normalized zpos values are calculated automatically when generic
>> muttable zpos property has been initialized. Drivers can simply use
>> plane_state->normalized_zpos in their atomic_check and/or plane_upda=
te
>> callbacks without any additional calls to DRM core.
>>
>> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
>>
>> Compare to Marek's original patch zpos property is now specific to e=
ach
>> plane and no more to the core.
>> Normalize function take care of the range of per plane defined range
>> before set normalized_zpos.
>>
>> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@linaro.org>
>>
>> Cc: Inki Dae <inki.dae@samsung.com>
>> Cc: Daniel Vetter <daniel@ffwll.ch>
>> Cc: Ville Syrjala <ville.syrjala@linux.intel.com>
>> Cc: Joonyoung Shim <jy0922.shim@samsung.com>
>> Cc: Seung-Woo Kim <sw0312.kim@samsung.com>
>> Cc: Andrzej Hajda <a.hajda@samsung.com>
>> Cc: Krzysztof Kozlowski <k.kozlowski@samsung.com>
>> Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
>> Cc: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
>> Cc: Gustavo Padovan <gustavo@padovan.org>
>> Cc: vincent.abriou@st.com
>> Cc: fabien.dessenne@st.com
>> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>> ---
>>  drivers/gpu/drm/Makefile            |   2 +-
>>  drivers/gpu/drm/drm_atomic.c        |   4 +
>>  drivers/gpu/drm/drm_atomic_helper.c |   6 +
>>  drivers/gpu/drm/drm_blend.c         | 227 +++++++++++++++++++++++++=
+++++++++++
>>  drivers/gpu/drm/drm_crtc_internal.h |   4 +
>>  include/drm/drm_crtc.h              |  30 +++++
>>  6 files changed, 272 insertions(+), 1 deletion(-)
>>  create mode 100644 drivers/gpu/drm/drm_blend.c
>>
>> diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
>> index e3dba6f..7fbcf3f 100644
>> --- a/drivers/gpu/drm/Makefile
>> +++ b/drivers/gpu/drm/Makefile
>> @@ -2,7 +2,7 @@
>>  # Makefile for the drm device driver.  This driver provides support=
 for the
>>  # Direct Rendering Infrastructure (DRI) in XFree86 4.1.0 and higher=
=2E
>>
>> -drm-y       :=3D       drm_auth.o drm_bufs.o drm_cache.o \
>> +drm-y       :=3D       drm_auth.o drm_bufs.o drm_blend.o drm_cache.=
o \
>>               drm_context.o drm_dma.o \
>>               drm_fops.o drm_gem.o drm_ioctl.o drm_irq.o \
>>               drm_lock.o drm_memory.o drm_drv.o drm_vm.o \
>> diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atom=
ic.c
>> index 3cee084..e503b8f 100644
>> --- a/drivers/gpu/drm/drm_atomic.c
>> +++ b/drivers/gpu/drm/drm_atomic.c
>> @@ -712,6 +712,8 @@ int drm_atomic_plane_set_property(struct drm_pla=
ne *plane,
>>               state->src_h =3D val;
>>       } else if (property =3D=3D config->rotation_property) {
>>               state->rotation =3D val;
>> +     } else if (property =3D=3D plane->zpos_property) {
>> +             state->zpos =3D val;
>>       } else if (plane->funcs->atomic_set_property) {
>>               return plane->funcs->atomic_set_property(plane, state,
>>                               property, val);
>> @@ -768,6 +770,8 @@ drm_atomic_plane_get_property(struct drm_plane *=
plane,
>>               *val =3D state->src_h;
>>       } else if (property =3D=3D config->rotation_property) {
>>               *val =3D state->rotation;
>> +     } else if (property =3D=3D plane->zpos_property) {
>> +             *val =3D state->zpos;
>>       } else if (plane->funcs->atomic_get_property) {
>>               return plane->funcs->atomic_get_property(plane, state,=
 property, val);
>>       } else {
>> diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/d=
rm_atomic_helper.c
>> index de7fddc..0694ae1 100644
>> --- a/drivers/gpu/drm/drm_atomic_helper.c
>> +++ b/drivers/gpu/drm/drm_atomic_helper.c
>> @@ -32,6 +32,8 @@
>>  #include <drm/drm_atomic_helper.h>
>>  #include <linux/fence.h>
>>
>> +#include "drm_crtc_internal.h"
>> +
>>  /**
>>   * DOC: overview
>>   *
>> @@ -592,6 +594,10 @@ drm_atomic_helper_check_planes(struct drm_devic=
e *dev,
>>       struct drm_plane_state *plane_state;
>>       int i, ret =3D 0;
>>
>> +     ret =3D drm_atomic_helper_normalize_zpos(dev, state);
>> +     if (ret)
>> +             return ret;
>> +
>>       for_each_plane_in_state(state, plane, plane_state, i) {
>>               const struct drm_plane_helper_funcs *funcs;
>>
>> diff --git a/drivers/gpu/drm/drm_blend.c b/drivers/gpu/drm/drm_blend=
=2Ec
>> new file mode 100644
>> index 0000000..5ae6e0e
>> --- /dev/null
>> +++ b/drivers/gpu/drm/drm_blend.c
>> @@ -0,0 +1,227 @@
>> +/*
>> + * Copyright (C) 2016 Samsung Electronics Co.Ltd
>> + * Authors:
>> + *   Marek Szyprowski <m.szyprowski@samsung.com>
>> + *
>> + * DRM core plane blending related functions
>> + *
>> + * Permission to use, copy, modify, distribute, and sell this softw=
are and its
>> + * documentation for any purpose is hereby granted without fee, pro=
vided that
>> + * the above copyright notice appear in all copies and that both th=
at copyright
>> + * notice and this permission notice appear in supporting documenta=
tion, and
>> + * that the name of the copyright holders not be used in advertisin=
g or
>> + * publicity pertaining to distribution of the software without spe=
cific,
>> + * written prior permission.  The copyright holders make no represe=
ntations
>> + * about the suitability of this software for any purpose.  It is p=
rovided "as
>> + * is" without express or implied warranty.
>> + *
>> + * THE COPYRIGHT HOLDERS DISCLAIM ALL WARRANTIES WITH REGARD TO THI=
S SOFTWARE,
>> + * INCLUDING ALL IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS,=
 IN NO
>> + * EVENT SHALL THE COPYRIGHT HOLDERS BE LIABLE FOR ANY SPECIAL, IND=
IRECT OR
>> + * CONSEQUENTIAL DAMAGES OR ANY DAMAGES WHATSOEVER RESULTING FROM L=
OSS OF USE,
>> + * DATA OR PROFITS, WHETHER IN AN ACTION OF CONTRACT, NEGLIGENCE OR=
 OTHER
>> + * TORTIOUS ACTION, ARISING OUT OF OR IN CONNECTION WITH THE USE OR=
 PERFORMANCE
>> + * OF THIS SOFTWARE.
>> + */
>> +#include <drm/drmP.h>
>> +#include <drm/drm_atomic.h>
>> +#include <drm/drm_crtc.h>
>> +#include <linux/export.h>
>> +#include <linux/slab.h>
>> +#include <linux/sort.h>
>> +
>> +#include "drm_internal.h"
>> +
>> +/**
>> + * drm_plane_create_zpos_property - create mutable zpos property
>> + * @plane: drm plane
>> + * @min: minimal possible value of zpos property
>> + * @max: maximal possible value of zpos property
>> + *
>> + * This function initializes generic mutable zpos property and enab=
les support
>> + * for it in drm core. Drivers can then attach this property to pla=
nes to enable
>> + * support for configurable planes arrangement during blending oper=
ation.
>> + * Once mutable zpos property has been enabled, the DRM core will a=
utomatically
>> + * calculate drm_plane_state->normalized_zpos values. Usually min s=
hould be set
>> + * to 0 and max to maximal number of planes for given crtc - 1.
>> + *
>> + * If zpos of some planes cannot be changed (like fixed background =
or
>> + * cursor/topmost planes), driver should adjust min/max values and =
assign those
>> + * planes immutable zpos property with lower or higher values (for =
more
>> + * information, see drm_mode_create_zpos_immutable_property() funct=
ion). In such
>> + * case driver should also assign proper initial zpos values for al=
l planes in
>> + * its plane_reset() callback, so the planes will be always sorted =
properly.
>> + *
>> + * Returns:
>> + * Zero on success, negative errno on failure.
>> + */
>> +int drm_plane_create_zpos_property(struct drm_plane *plane,
>> +                                unsigned int min, unsigned int max)
>
> I think we also want to pass the initial value here, and set the plan=
e
> state accordingly.
>
>> +{
>> +     struct drm_property *prop;
>> +
>> +     prop =3D drm_property_create_range(plane->dev, 0, "zpos", min,=
 max);
>> +     if (!prop)
>> +             return -ENOMEM;
>> +
>> +     drm_object_attach_property(&plane->base, prop, min);
>> +
>> +     plane->zpos_property =3D prop;
>> +     return 0;
>> +}
>> +EXPORT_SYMBOL(drm_plane_create_zpos_property);
>> +
>> +/**
>> + * drm_plane_create_zpos_immutable_property - create immuttable zpo=
s property
>> + * @plane: drm plane
>> + * @min: minimal possible value of zpos property
>> + * @max: maximal possible value of zpos property
>> + *
>> + * This function initializes generic immutable zpos property and en=
ables
>> + * support for it in drm core. Using this property driver lets user=
space
>> + * to get the arrangement of the planes for blending operation and =
notifies
>> + * it that the hardware (or driver) doesn't support changing of the=
 planes'
>> + * order.
>> + *
>> + * Returns:
>> + * Zero on success, negative errno on failure.
>> + */
>> +int drm_plane_create_zpos_immutable_property(struct drm_plane *plan=
e,
>> +                                          unsigned int min, unsigne=
d int max)
>
> What's the point of passing min/max here? I would think we'd just wan=
t
> the one value. And the earlier comment about the plane state holds he=
re
> as well.
>
>> +{
>> +     struct drm_property *prop;
>> +
>> +     prop =3D drm_property_create_range(plane->dev, DRM_MODE_PROP_I=
MMUTABLE,
>> +                                      "zpos", min, max);
>> +     if (!prop)
>> +             return -ENOMEM;
>> +
>> +     drm_object_attach_property(&plane->base, prop, min);
>> +
>> +     plane->zpos_property =3D prop;
>> +     return 0;
>> +}
>> +EXPORT_SYMBOL(drm_plane_create_zpos_immutable_property);
>> +
>> +static int drm_atomic_state_zpos_cmp(const void *a, const void *b)
>> +{
>> +     const struct drm_plane_state *sa =3D *(struct drm_plane_state =
**)a;
>> +     const struct drm_plane_state *sb =3D *(struct drm_plane_state =
**)b;
>> +
>> +     if (sa->zpos !=3D sb->zpos)
>> +             return sa->zpos - sb->zpos;
>> +     else
>> +             return sa->plane->base.id - sb->plane->base.id;
>> +}
>> +
>> +/**
>> + * drm_atomic_helper_crtc_normalize_zpos - calculate normalized zpo=
s values
>> + * @crtc: crtc with planes, which have to be considered for normali=
zation
>> + * @crtc_state: new atomic state to apply
>> + *
>> + * This function checks new states of all planes assigned to given =
crtc and
>> + * calculates normalized zpos value for them. Planes are compared f=
irst by their
>> + * zpos values, then by plane id (if zpos equals). Plane with lowes=
t zpos value
>> + * is at the bottom. The plane_state->normalized_zpos is then fille=
d with unique
>> + * values from 0 to number of active planes in crtc minus one.
>> + *
>> + * RETURNS
>> + * Zero for success or -errno
>> + */
>> +int drm_atomic_helper_crtc_normalize_zpos(struct drm_crtc *crtc,
>> +                                       struct drm_crtc_state *crtc_=
state)
>> +{
>> +     struct drm_atomic_state *state =3D crtc_state->state;
>> +     struct drm_device *dev =3D crtc->dev;
>> +     int total_planes =3D dev->mode_config.num_total_plane;
>> +     struct drm_plane_state **states;
>> +     struct drm_plane *plane;
>> +     int i, n =3D 0;
>> +     int ret =3D 0;
>> +
>> +     DRM_DEBUG_ATOMIC("[CRTC:%d:%s] calculating normalized zpos val=
ues\n",
>> +                      crtc->base.id, crtc->name);
>> +
>> +     states =3D kmalloc_array(total_planes, sizeof(*states), GFP_TE=
MPORARY);
>> +     if (!states)
>> +             return -ENOMEM;
>> +
>> +     /*
>> +      * Normalization process might create new states for planes wh=
ich
>> +      * normalized_zpos has to be recalculated.
>> +      */
>> +     drm_for_each_plane_mask(plane, dev, crtc_state->plane_mask) {
>> +             struct drm_plane_state *plane_state =3D
>> +                     drm_atomic_get_plane_state(state, plane);
>> +             if (IS_ERR(plane_state)) {
>> +                     ret =3D PTR_ERR(plane_state);
>> +                     goto done;
>> +             }
>> +             states[n++] =3D plane_state;
>> +             DRM_DEBUG_ATOMIC("[PLANE:%d:%s] processing zpos value =
%d\n",
>> +                              plane->base.id, plane->name,
>> +                              plane_state->zpos);
>> +     }
>> +
>> +     sort(states, n, sizeof(*states), drm_atomic_state_zpos_cmp, NU=
LL);
>> +
>> +     for (i =3D 0; i < n; i++) {
>> +             plane =3D states[i]->plane;
>> +
>> +             states[i]->normalized_zpos =3D i;
>> +             DRM_DEBUG_ATOMIC("[PLANE:%d:%s] normalized zpos value =
%d\n",
>> +                              plane->base.id, plane->name, i);
>> +     }
>> +     crtc_state->zpos_changed =3D true;
>
> This needs to be reset back in duplicate_state.
>
> I did those changes locally, and then I went ahead and implemented zp=
os
> support for some Intel platforms, mainly to make sure this thing is g=
ood
> enough for us. It doesn't result in the prettiest thing, but it does
> appear to work at least:
> git://github.com/vsyrjala/linux.git vlv_chv_zpos
>
> I still need to write some actual igt test for this stuff I think. An=
d
> then we have the "do we have actual userspace for this?" problem. Was
> there an atomic weston branch somewhere that can use zpos?
>
>> +
>> +done:
>> +     kfree(states);
>> +     return ret;
>> +}
>> +EXPORT_SYMBOL(drm_atomic_helper_crtc_normalize_zpos);
>> +
>> +/**
>> + * drm_atomic_helper_normalize_zpos - calculate normalized zpos val=
ues for all
>> + *                                 crtcs
>> + * @dev: DRM device
>> + * @state: atomic state of DRM device
>> + *
>> + * This function calculates normalized zpos value for all modified =
planes in
>> + * the provided atomic state of DRM device. For more information, s=
ee
>> + * drm_atomic_helper_crtc_normalize_zpos() function.
>> + *
>> + * RETURNS
>> + * Zero for success or -errno
>> + */
>> +int drm_atomic_helper_normalize_zpos(struct drm_device *dev,
>> +                                  struct drm_atomic_state *state)
>> +{
>> +     struct drm_crtc *crtc;
>> +     struct drm_crtc_state *crtc_state;
>> +     struct drm_plane *plane;
>> +     struct drm_plane_state *plane_state;
>> +     int i, ret =3D 0;
>> +
>> +     for_each_plane_in_state(state, plane, plane_state, i) {
>> +             crtc =3D plane_state->crtc;
>> +             if (!crtc)
>> +                     continue;
>> +             if (plane->state->zpos !=3D plane_state->zpos) {
>> +                     crtc_state =3D
>> +                             drm_atomic_get_existing_crtc_state(sta=
te, crtc);
>> +                     crtc_state->zpos_changed =3D true;
>> +             }
>> +     }
>> +
>> +     for_each_crtc_in_state(state, crtc, crtc_state, i) {
>> +             if (crtc_state->plane_mask !=3D crtc->state->plane_mas=
k ||
>> +                 crtc_state->zpos_changed) {
>> +                     ret =3D drm_atomic_helper_crtc_normalize_zpos(=
crtc,
>> +                                                                 cr=
tc_state);
>> +                     if (ret)
>> +                             return ret;
>> +             }
>> +     }
>> +     return 0;
>> +}
>> +EXPORT_SYMBOL(drm_atomic_helper_normalize_zpos);
>> diff --git a/drivers/gpu/drm/drm_crtc_internal.h b/drivers/gpu/drm/d=
rm_crtc_internal.h
>> index 47a500b..0c34e6d 100644
>> --- a/drivers/gpu/drm/drm_crtc_internal.h
>> +++ b/drivers/gpu/drm/drm_crtc_internal.h
>> @@ -128,3 +128,7 @@ int drm_mode_atomic_ioctl(struct drm_device *dev=
,
>>
>>  int drm_modeset_register_all(struct drm_device *dev);
>>  void drm_modeset_unregister_all(struct drm_device *dev);
>> +
>> +/* drm_blend.c */
>> +int drm_atomic_helper_normalize_zpos(struct drm_device *dev,
>> +                                  struct drm_atomic_state *state);
>> diff --git a/include/drm/drm_crtc.h b/include/drm/drm_crtc.h
>> index f5469d3..3936ddf 100644
>> --- a/include/drm/drm_crtc.h
>> +++ b/include/drm/drm_crtc.h
>> @@ -308,6 +308,7 @@ struct drm_plane_helper_funcs;
>>   * @mode_changed: crtc_state->mode or crtc_state->enable has been c=
hanged
>>   * @active_changed: crtc_state->active has been toggled.
>>   * @connectors_changed: connectors to this crtc have been updated
>> + * @zpos_changed: zpos values of planes on this crtc have been upda=
ted
>>   * @color_mgmt_changed: color management properties have changed (d=
egamma or
>>   *   gamma LUT or CSC matrix)
>>   * @plane_mask: bitmask of (1 << drm_plane_index(plane)) of attache=
d planes
>> @@ -344,6 +345,7 @@ struct drm_crtc_state {
>>       bool mode_changed : 1;
>>       bool active_changed : 1;
>>       bool connectors_changed : 1;
>> +     bool zpos_changed : 1;
>>       bool color_mgmt_changed : 1;
>>
>>       /* attached planes bitmask:
>> @@ -1396,6 +1398,9 @@ struct drm_connector {
>>   * @src_w: width of visible portion of plane (in 16.16)
>>   * @src_h: height of visible portion of plane (in 16.16)
>>   * @rotation: rotation of the plane
>> + * @zpos: priority of the given plane on crtc (optional)
>> + * @normalized_zpos: normalized value of zpos: unique, range from 0=
 to N-1
>> + *    for given crtc
>>   * @state: backpointer to global drm_atomic_state
>>   */
>>  struct drm_plane_state {
>> @@ -1416,6 +1421,10 @@ struct drm_plane_state {
>>       /* Plane rotation */
>>       unsigned int rotation;
>>
>> +     /* Plane zpos */
>> +     unsigned int zpos;
>> +     unsigned int normalized_zpos;
>> +
>>       struct drm_atomic_state *state;
>>  };
>>
>> @@ -1675,6 +1684,7 @@ enum drm_plane_type {
>>   * @properties: property tracking for this plane
>>   * @type: type of plane (overlay, primary, cursor)
>>   * @state: current atomic state for this plane
>> + * @zpos_property: zpos property for this plane
>>   * @helper_private: mid-layer private data
>>   */
>>  struct drm_plane {
>> @@ -1716,6 +1726,8 @@ struct drm_plane {
>>       const struct drm_plane_helper_funcs *helper_private;
>>
>>       struct drm_plane_state *state;
>> +
>> +     struct drm_property *zpos_property;
>>  };
>>
>>  /**
>> @@ -2773,6 +2785,24 @@ extern void drm_crtc_enable_color_mgmt(struct=
 drm_crtc *crtc,
>>                                      uint degamma_lut_size,
>>                                      bool has_ctm,
>>                                      uint gamma_lut_size);
>> +
>> +int drm_plane_atomic_set_zpos_property(struct drm_plane *plane,
>> +                                    struct drm_plane_state *state,
>> +                                    struct drm_property *property,
>> +                                    uint64_t val);
>> +
>> +int drm_plane_atomic_get_zpos_property(struct drm_plane *plane,
>> +                                    const struct drm_plane_state *s=
tate,
>> +                                    struct drm_property *property,
>> +                                    uint64_t *val);
>> +
>> +int drm_plane_create_zpos_property(struct drm_plane *plane,
>> +                                unsigned int min, unsigned int max)=
;
>> +
>> +int drm_plane_create_zpos_immutable_property(struct drm_plane *plan=
e,
>> +                                          unsigned int min,
>> +                                          unsigned int max);
>> +
>>  /* Helpers */
>>  struct drm_mode_object *drm_mode_object_find(struct drm_device *dev=
,
>>                                            uint32_t id, uint32_t typ=
e);
>> --
>> 1.9.1
>
> --
> Ville Syrj=C3=A4l=C3=A4
> Intel OTC



--=20
Benjamin Gaignard

Graphic Study Group

Linaro.org =E2=94=82 Open source software for ARM SoCs

=46ollow Linaro: Facebook | Twitter | Blog
