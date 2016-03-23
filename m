From: Benjamin Gaignard <benjamin.gaignard@linaro.org>
Subject: Re: [PATCH v5 1/5] drm: add generic zpos property
Date: Wed, 23 Mar 2016 09:46:54 +0100
Message-ID: <CA+M3ks7=wOJqL9wm_j-393vnx1vXPjv4RvBUJ+SiPVO8axvk8w@mail.gmail.com>
References: <1453905883-6807-1-git-send-email-m.szyprowski@samsung.com>
	<1453905883-6807-2-git-send-email-m.szyprowski@samsung.com>
	<20160229151219.GW15993@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-lf0-f41.google.com ([209.85.215.41]:36340 "EHLO
	mail-lf0-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754119AbcCWIq4 convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 23 Mar 2016 04:46:56 -0400
Received: by mail-lf0-f41.google.com with SMTP id d82so5837597lfe.3
        for <linux-samsung-soc@vger.kernel.org>; Wed, 23 Mar 2016 01:46:55 -0700 (PDT)
In-Reply-To: <20160229151219.GW15993@intel.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, linux-samsung-soc@vger.kernel.org, Inki Dae <inki.dae@samsung.com>, Daniel Vetter <daniel@ffwll.ch>, Joonyoung Shim <jy0922.shim@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Andrzej Hajda <a.hajda@samsung.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Tobias Jakobi <tjakobi@math.uni-bielefeld.de>, Gustavo Padovan <gustavo@padovan.org>, Vincent Abriou <vincent.abriou@st.com>, Fabien Dessenne <fabien.dessenne@st.com>

Hello Marek, Ville,

How can we progress in this ? and how can I help you to get this
generic zpos property merge into drm ?

Regards,
Benjamin

2016-02-29 16:12 GMT+01:00 Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux=
=2Eintel.com>:
> On Wed, Jan 27, 2016 at 03:44:39PM +0100, Marek Szyprowski wrote:
>> This patch adds support for generic plane's zpos property property w=
ith
>> well-defined semantics:
>> - added zpos properties to drm core and plane state structures
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
>> Tested-by: Benjamin Gaignard <benjamin.gaignard@linaro.org>
>> ---
>>  Documentation/DocBook/gpu.tmpl      |  14 ++-
>>  drivers/gpu/drm/Makefile            |   2 +-
>>  drivers/gpu/drm/drm_atomic.c        |   4 +
>>  drivers/gpu/drm/drm_atomic_helper.c |   6 +
>>  drivers/gpu/drm/drm_blend.c         | 227 +++++++++++++++++++++++++=
+++++++++++
>>  drivers/gpu/drm/drm_crtc_internal.h |   3 +
>>  include/drm/drm_crtc.h              |  17 +++
>>  7 files changed, 270 insertions(+), 3 deletions(-)
>>  create mode 100644 drivers/gpu/drm/drm_blend.c
>>
>> diff --git a/Documentation/DocBook/gpu.tmpl b/Documentation/DocBook/=
gpu.tmpl
>> index a8669330b456..ae7d913adf60 100644
>> --- a/Documentation/DocBook/gpu.tmpl
>> +++ b/Documentation/DocBook/gpu.tmpl
>> @@ -1816,7 +1816,7 @@ void intel_crt_init(struct drm_device *dev)
>>       <td valign=3D"top" >Description/Restrictions</td>
>>       </tr>
>>       <tr>
>> -     <td rowspan=3D"37" valign=3D"top" >DRM</td>
>> +     <td rowspan=3D"38" valign=3D"top" >DRM</td>
>>       <td valign=3D"top" >Generic</td>
>>       <td valign=3D"top" >=E2=80=9Crotation=E2=80=9D</td>
>>       <td valign=3D"top" >BITMASK</td>
>> @@ -2068,7 +2068,7 @@ void intel_crt_init(struct drm_device *dev)
>>       <td valign=3D"top" >property to suggest an Y offset for a conn=
ector</td>
>>       </tr>
>>       <tr>
>> -     <td rowspan=3D"3" valign=3D"top" >Optional</td>
>> +     <td rowspan=3D"4" valign=3D"top" >Optional</td>
>>       <td valign=3D"top" >=E2=80=9Cscaling mode=E2=80=9D</td>
>>       <td valign=3D"top" >ENUM</td>
>>       <td valign=3D"top" >{ "None", "Full", "Center", "Full aspect" =
}</td>
>> @@ -2092,6 +2092,16 @@ void intel_crt_init(struct drm_device *dev)
>>       <td valign=3D"top" >TBD</td>
>>       </tr>
>>       <tr>
>> +     <td valign=3D"top" > "zpos" </td>
>> +     <td valign=3D"top" >RANGE</td>
>> +     <td valign=3D"top" >Min=3D0, Max=3D driver dependent</td>
>> +     <td valign=3D"top" >Plane</td>
>> +     <td valign=3D"top" >Plane's 'z' position during blending opera=
tion (0 for background, highest for frontmost).
>> +             If two planes assigned to same CRTC have equal zpos va=
lues, the plane with higher plane
>> +             id is treated as closer to front. Can be IMMUTABLE if =
driver doesn't support changing
>> +             planes' order. Exact value range is driver dependent.<=
/td>
>> +     </tr>
>> +     <tr>
>>       <td rowspan=3D"20" valign=3D"top" >i915</td>
>>       <td rowspan=3D"2" valign=3D"top" >Generic</td>
>>       <td valign=3D"top" >"Broadcast RGB"</td>
>> diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
>> index 61766dec6a8d..eeefaba1c092 100644
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
>> index 3f74193885f1..a19201efb7d1 100644
>> --- a/drivers/gpu/drm/drm_atomic.c
>> +++ b/drivers/gpu/drm/drm_atomic.c
>> @@ -630,6 +630,8 @@ int drm_atomic_plane_set_property(struct drm_pla=
ne *plane,
>>               state->src_h =3D val;
>>       } else if (property =3D=3D config->rotation_property) {
>>               state->rotation =3D val;
>> +     } else if (property =3D=3D config->zpos_property) {
>> +             state->zpos =3D val;
>>       } else if (plane->funcs->atomic_set_property) {
>>               return plane->funcs->atomic_set_property(plane, state,
>>                               property, val);
>> @@ -686,6 +688,8 @@ drm_atomic_plane_get_property(struct drm_plane *=
plane,
>>               *val =3D state->src_h;
>>       } else if (property =3D=3D config->rotation_property) {
>>               *val =3D state->rotation;
>> +     } else if (property =3D=3D config->zpos_property) {
>> +             *val =3D state->zpos;
>>       } else if (plane->funcs->atomic_get_property) {
>>               return plane->funcs->atomic_get_property(plane, state,=
 property, val);
>>       } else {
>> diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/d=
rm_atomic_helper.c
>> index 53db2d9120be..9fbfb672b317 100644
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
>> @@ -530,6 +532,10 @@ drm_atomic_helper_check_planes(struct drm_devic=
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
>> index 000000000000..cdcb647c8ed9
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
>> +#include <linux/slab.h>
>> +#include <linux/sort.h>
>> +#include <linux/export.h>
>> +#include <drm/drmP.h>
>> +#include <drm/drm_crtc.h>
>> +#include <drm/drm_atomic.h>
>> +
>> +#include "drm_internal.h"
>> +
>> +/**
>> + * drm_mode_create_zpos_property - create muttable zpos property
>> + * @dev: DRM device
>> + * @min: minimal possible value of zpos property
>> + * @max: maximal possible value of zpos property
>> + *
>> + * This function initializes generic muttable zpos property and ena=
bles support
>> + * for it in drm core. Drivers can then attach this property to pla=
nes to enable
>> + * support for configurable planes arrangement during blending oper=
ation.
>> + * Once muttable zpos property has been enabled, the DRM core will =
automatically
>> + * calculate drm_plane_state->normalized_zpos values. Usually min s=
hould be set
>> + * to 0 and max to maximal number of planes for given crtc - 1.
>> + *
>> + * If zpos of some planes cannot be changed (like fixed backgroud o=
r
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
>> +int drm_mode_create_zpos_property(struct drm_device *dev, unsigned =
int min,
>> +                               unsigned int max)
>> +{
>> +     struct drm_property *prop;
>> +
>> +     prop =3D drm_property_create_range(dev, 0, "zpos", min, max);
>> +     if (!prop)
>> +             return -ENOMEM;
>> +
>> +     dev->mode_config.zpos_property =3D prop;
>> +     return 0;
>> +}
>> +EXPORT_SYMBOL(drm_mode_create_zpos_property);
>> +
>> +/**
>> + * drm_mode_create_zpos_immutable_property - create immuttable zpos=
 property
>> + * @dev: DRM device
>> + * @min: minimal possible value of zpos property
>> + * @max: maximal possible value of zpos property
>> + *
>> + * This function initializes generic immuttable zpos property and e=
nables
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
>> +int drm_mode_create_zpos_immutable_property(struct drm_device *dev,
>> +                                         unsigned int min, unsigned=
 int max)
>> +{
>> +     struct drm_property *prop;
>> +
>> +     prop =3D drm_property_create_range(dev, DRM_MODE_PROP_IMMUTABL=
E, "zpos",
>> +                                      min, max);
>> +     if (!prop)
>> +             return -ENOMEM;
>> +
>> +     dev->mode_config.zpos_immutable_property =3D prop;
>
> I want per-plane min/max ranges, so putting this here is no good.
>
>
> --
> Ville Syrj=C3=A4l=C3=A4
> Intel OTC



--=20
Benjamin Gaignard

Graphic Working Group

Linaro.org =E2=94=82 Open source software for ARM SoCs

=46ollow Linaro: Facebook | Twitter | Blog
