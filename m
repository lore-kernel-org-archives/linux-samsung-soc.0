From: Benjamin Gaignard <benjamin.gaignard@linaro.org>
Subject: Re: [PATCH v6 1/4] drm: add generic zpos property
Date: Wed, 27 Jul 2016 16:25:24 +0200
Message-ID: <CA+M3ks4FzRzFUEA6a9Nr+hmxOhVF+DZ95FN807d6wUBSu5MAeg@mail.gmail.com>
References: <1469091123-4909-1-git-send-email-benjamin.gaignard@linaro.org>
 <1469091123-4909-2-git-send-email-benjamin.gaignard@linaro.org> <10004351.cfZGefdFDe@avalon>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-oi0-f44.google.com ([209.85.218.44]:34683 "EHLO
	mail-oi0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755978AbcG0OZ0 convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 27 Jul 2016 10:25:26 -0400
Received: by mail-oi0-f44.google.com with SMTP id l65so19709421oib.1
        for <linux-samsung-soc@vger.kernel.org>; Wed, 27 Jul 2016 07:25:25 -0700 (PDT)
In-Reply-To: <10004351.cfZGefdFDe@avalon>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, Vincent Abriou <vincent.abriou@st.com>, Fabien Dessenne <fabien.dessenne@st.com>, linux-samsung-soc@vger.kernel.org, Linaro MM SIG Mailman List <linaro-mm-sig@lists.linaro.org>, Marek Szyprowski <m.szyprowski@samsung.com>, Inki Dae <inki.dae@samsung.com>, Daniel Vetter <daniel@ffwll.ch>, Ville Syrjala <ville.syrjala@linux.intel.com>, Joonyoung Shim <jy0922.shim@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Andrzej Hajda <a.hajda@samsung.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Tobias Jakobi <tjakobi@math.uni-bielefeld.de>, Gustavo Padovan <gustavo@padovan.org>

Thanks, I will a version 7 to fix those last details and send a pull re=
quest.

2016-07-27 15:58 GMT+02:00 Laurent Pinchart <laurent.pinchart@ideasonbo=
ard.com>:
> Hi Benjamin,
>
> Thank you for the patch.
>
> On Thursday 21 Jul 2016 10:52:00 Benjamin Gaignard wrote:
>> From: Marek Szyprowski <m.szyprowski@samsung.com>
>>
>> version 6:
>> - add zpos in gpu documentation file
>> - merge Ville patch about zpos initial value and API improvement.
>>   I have split Ville patch between zpos core and drivers
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
>>  Documentation/gpu/kms-properties.csv |   1 +
>>  drivers/gpu/drm/Makefile             |   2 +-
>>  drivers/gpu/drm/drm_atomic.c         |   4 +
>>  drivers/gpu/drm/drm_atomic_helper.c  |   7 +
>>  drivers/gpu/drm/drm_blend.c          | 240 ++++++++++++++++++++++++=
++++++++
>>  drivers/gpu/drm/drm_crtc_internal.h  |   4 +
>>  include/drm/drm_crtc.h               |  30 +++++
>>  7 files changed, 287 insertions(+), 1 deletion(-)
>>  create mode 100644 drivers/gpu/drm/drm_blend.c
>>
>> diff --git a/Documentation/gpu/kms-properties.csv
>> b/Documentation/gpu/kms-properties.csv index b6fcaf6..3587ea2 100644
>> --- a/Documentation/gpu/kms-properties.csv
>> +++ b/Documentation/gpu/kms-properties.csv
>> @@ -17,6 +17,7 @@ DRM,Generic,=E2=80=9Crotation=E2=80=9D,BITMASK,"{ =
0, ""rotate-0"" }, { 1,
>> ""rotate-90"" }, { ,,=E2=80=9CCRTC_H=E2=80=9D,RANGE,"Min=3D0, Max=3D=
UINT_MAX",Plane,Scanout
>> CRTC (destination) height (atomic)
>> ,,=E2=80=9CFB_ID=E2=80=9D,OBJECT,DRM_MODE_OBJECT_FB,Plane,Scanout fr=
amebuffer (atomic)
>> ,,=E2=80=9CCRTC_ID=E2=80=9D,OBJECT,DRM_MODE_OBJECT_CRTC,Plane,CRTC t=
hat plane is attached
>> to (atomic)
>> +,,=E2=80=9Czpos=E2=80=9D,RANGE,"Min=3D0, Max=3DUINT_MAX",Plane,Zord=
er of the plane
>
> How about a real description ? :-) Maybe something like "Z-order of t=
he plane.
> Planes with higher Z-order values are displayed on top, planes with i=
dentical
> Z-order values are display in an undefined order" ?
>
>>  ,DVI-I,=E2=80=9Csubconnector=E2=80=9D,ENUM,"{ =E2=80=9CUnknown=E2=80=
=9D, =E2=80=9CDVI-D=E2=80=9D, =E2=80=9CDVI-A=E2=80=9D }",Connector,TBD
>>  ,,=E2=80=9Cselect subconnector=E2=80=9D,ENUM,"{ =E2=80=9CAutomatic=E2=
=80=9D, =E2=80=9CDVI-D=E2=80=9D, =E2=80=9CDVI-A=E2=80=9D
>> }",Connector,TBD ,TV,=E2=80=9Csubconnector=E2=80=9D,ENUM,"{ ""Unknow=
n"", ""Composite"",
>> ""SVIDEO"", ""Component"", ""SCART"" }",Connector,TBD
>
> [snip]
>
>> diff --git a/drivers/gpu/drm/drm_blend.c b/drivers/gpu/drm/drm_blend=
=2Ec
>> new file mode 100644
>> index 0000000..9567233
>> --- /dev/null
>> +++ b/drivers/gpu/drm/drm_blend.c
>> @@ -0,0 +1,240 @@
>> +/*
>> + * Copyright (C) 2016 Samsung Electronics Co.Ltd
>> + * Authors:
>> + *   Marek Szyprowski <m.szyprowski@samsung.com>
>> + *
>> + * DRM core plane blending related functions
>> + *
>> + * Permission to use, copy, modify, distribute, and sell this softw=
are and
>> its + * documentation for any purpose is hereby granted without fee,
>> provided that + * the above copyright notice appear in all copies an=
d that
>> both that copyright + * notice and this permission notice appear in
>> supporting documentation, and + * that the name of the copyright hol=
ders
>> not be used in advertising or + * publicity pertaining to distributi=
on of
>> the software without specific, + * written prior permission.  The co=
pyright
>> holders make no representations + * about the suitability of this so=
ftware
>> for any purpose.  It is provided "as + * is" without express or impl=
ied
>> warranty.
>> + *
>> + * THE COPYRIGHT HOLDERS DISCLAIM ALL WARRANTIES WITH REGARD TO THI=
S
>> SOFTWARE, + * INCLUDING ALL IMPLIED WARRANTIES OF MERCHANTABILITY AN=
D
>> FITNESS, IN NO + * EVENT SHALL THE COPYRIGHT HOLDERS BE LIABLE FOR A=
NY
>> SPECIAL, INDIRECT OR + * CONSEQUENTIAL DAMAGES OR ANY DAMAGES WHATSO=
EVER
>> RESULTING FROM LOSS OF USE, + * DATA OR PROFITS, WHETHER IN AN ACTIO=
N OF
>> CONTRACT, NEGLIGENCE OR OTHER + * TORTIOUS ACTION, ARISING OUT OF OR=
 IN
>> CONNECTION WITH THE USE OR PERFORMANCE + * OF THIS SOFTWARE.
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
>> + * @zpos: initial value of zpos property
>> + * @min: minimal possible value of zpos property
>> + * @max: maximal possible value of zpos property
>> + *
>> + * This function initializes generic mutable zpos property and enab=
les
>> support + * for it in drm core. Drivers can then attach this propert=
y to
>> planes to enable + * support for configurable planes arrangement dur=
ing
>> blending operation. + * Once mutable zpos property has been enabled,=
 the
>> DRM core will automatically + * calculate drm_plane_state->normalize=
d_zpos
>> values. Usually min should be set + * to 0 and max to maximal number=
 of
>> planes for given crtc - 1.
>> + *
>> + * If zpos of some planes cannot be changed (like fixed background =
or
>> + * cursor/topmost planes), driver should adjust min/max values and =
assign
>> those + * planes immutable zpos property with lower or higher values=
 (for
>> more + * information, see drm_mode_create_zpos_immutable_property()
>> function). In such + * case driver should also assign proper initial=
 zpos
>> values for all planes in + * its plane_reset() callback, so the plan=
es will
>> be always sorted properly. + *
>> + * Returns:
>> + * Zero on success, negative errno on failure.
>> + */
>> +int drm_plane_create_zpos_property(struct drm_plane *plane,
>> +                                unsigned int zpos,
>> +                                unsigned int min, unsigned int max)
>> +{
>> +     struct drm_property *prop;
>> +
>> +     prop =3D drm_property_create_range(plane->dev, 0, "zpos", min,=
 max);
>> +     if (!prop)
>> +             return -ENOMEM;
>> +
>> +     drm_object_attach_property(&plane->base, prop, zpos);
>> +
>> +     plane->zpos_property =3D prop;
>> +
>> +     if (plane->state) {
>> +             plane->state->zpos =3D zpos;
>> +             plane->state->normalized_zpos =3D zpos;
>> +     }
>> +
>> +     return 0;
>> +}
>> +EXPORT_SYMBOL(drm_plane_create_zpos_property);
>> +
>> +/**
>> + * drm_plane_create_zpos_immutable_property - create immuttable zpo=
s
>> property + * @plane: drm plane
>> + * @zpos: value of zpos property
>> + *
>> + * This function initializes generic immutable zpos property and en=
ables
>> + * support for it in drm core. Using this property driver lets user=
space
>> + * to get the arrangement of the planes for blending operation and =
notifies
>> + * it that the hardware (or driver) doesn't support changing of the
>> planes' + * order.
>> + *
>> + * Returns:
>> + * Zero on success, negative errno on failure.
>> + */
>> +int drm_plane_create_zpos_immutable_property(struct drm_plane *plan=
e,
>> +                                          unsigned int zpos)
>> +{
>> +     struct drm_property *prop;
>> +
>> +     prop =3D drm_property_create_range(plane->dev, DRM_MODE_PROP_I=
MMUTABLE,
>> +                                      "zpos", zpos, zpos);
>> +     if (!prop)
>> +             return -ENOMEM;
>> +
>> +     drm_object_attach_property(&plane->base, prop, zpos);
>> +
>> +     plane->zpos_property =3D prop;
>> +
>> +     if (plane->state) {
>> +             plane->state->zpos =3D zpos;
>> +             plane->state->normalized_zpos =3D zpos;
>> +     }
>> +
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
irst by
>> their + * zpos values, then by plane id (if zpos equals). Plane with=
 lowest
>> zpos value + * is at the bottom. The plane_state->normalized_zpos is=
 then
>> filled with unique + * values from 0 to number of active planes in c=
rtc
>> minus one.
>> + *
>> + * RETURNS
>> + * Zero for success or -errno
>> + */
>> +int drm_atomic_helper_crtc_normalize_zpos(struct drm_crtc *crtc,
>> +                                       struct drm_crtc_state *crtc_=
state)
>
> As Ville mentioned I think you can make this function static.
>
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
>> +
>> +done:
>> +     kfree(states);
>> +     return ret;
>> +}
>> +EXPORT_SYMBOL(drm_atomic_helper_crtc_normalize_zpos);
>> +
>> +/**
>> + * drm_atomic_helper_normalize_zpos - calculate normalized zpos val=
ues for
>> all + *                                     crtcs
>> + * @dev: DRM device
>> + * @state: atomic state of DRM device
>> + *
>> + * This function calculates normalized zpos value for all modified =
planes
>> in + * the provided atomic state of DRM device. For more information=
, see +
>> * drm_atomic_helper_crtc_normalize_zpos() function.
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
te,
> crtc);
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
>> +
> crtc_state);
>> +                     if (ret)
>> +                             return ret;
>> +             }
>> +     }
>> +     return 0;
>> +}
>> +EXPORT_SYMBOL(drm_atomic_helper_normalize_zpos);
>
> And this one doesn't need to be exported as it's called by the DRM co=
re only.
>
> [snip]
>
>> diff --git a/include/drm/drm_crtc.h b/include/drm/drm_crtc.h
>> index 9e6ab4a..69c2092 100644
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
egamma
>> or *  gamma LUT or CSC matrix)
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
>
> You might want to define N.
>
> Apart from that,
>
> Acked-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Tested-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>
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
>
> [snip]
>
> --
> Regards,
>
> Laurent Pinchart
>



--=20
Benjamin Gaignard

Graphic Study Group

Linaro.org =E2=94=82 Open source software for ARM SoCs

=46ollow Linaro: Facebook | Twitter | Blog
