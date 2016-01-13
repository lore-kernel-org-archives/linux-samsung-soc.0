From: Benjamin Gaignard <benjamin.gaignard@linaro.org>
Subject: Re: [PATCH v3 1/3] drm: add generic zpos property
Date: Wed, 13 Jan 2016 10:10:25 +0100
Message-ID: <CA+M3ks5+BoMZDtbcDU6JYxnLKc0_DFAuKyD=jx0+wi+Seg3Ebw@mail.gmail.com>
References: <1452605960-21194-1-git-send-email-m.szyprowski@samsung.com>
 <1452605960-21194-2-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0659255928=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1452605960-21194-2-git-send-email-m.szyprowski@samsung.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Krzysztof Kozlowski <k.kozlowski@samsung.com>, linux-samsung-soc@vger.kernel.org, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, Andrzej Hajda <a.hajda@samsung.com>, Tobias Jakobi <tjakobi@math.uni-bielefeld.de>, Fabien Dessenne <fabien.dessenne@st.com>, Vincent Abriou <vincent.abriou@st.com>
List-Id: linux-samsung-soc@vger.kernel.org

--===============0659255928==
Content-Type: multipart/alternative; boundary=001a114026506ac4d80529338a70

--001a114026506ac4d80529338a70
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

I have been able to test it on sti driver.

Thanks to have done the effort to make zpos generic.

You can add my tested-by on this patch.

Benjamin

2016-01-12 14:39 GMT+01:00 Marek Szyprowski <m.szyprowski@samsung.com>:

> This patch adds support for generic plane's zpos property property with
> well-defined semantics:
> - added zpos properties to drm core and plane state structures
> - added helpers for normalizing zpos properties of given set of planes
> - well defined semantics: planes are sorted by zpos values and then plane
>   id value if zpos equals
>
> Normalized zpos values are calculated automatically when generic
> muttable zpos property has been initialized. Drivers can simply use
> plane_state->normalized_zpos in their atomic_check and/or plane_update
> callbacks without any additional calls to DRM core.
>
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
>  Documentation/DocBook/gpu.tmpl      |  14 ++++-
>  drivers/gpu/drm/drm_atomic.c        |   4 ++
>  drivers/gpu/drm/drm_atomic_helper.c | 116
> ++++++++++++++++++++++++++++++++++++
>  drivers/gpu/drm/drm_crtc.c          |  53 ++++++++++++++++
>  include/drm/drm_crtc.h              |  14 +++++
>  5 files changed, 199 insertions(+), 2 deletions(-)
>
> diff --git a/Documentation/DocBook/gpu.tmpl
> b/Documentation/DocBook/gpu.tmpl
> index 6c6e81a9eaf4..f6b7236141b6 100644
> --- a/Documentation/DocBook/gpu.tmpl
> +++ b/Documentation/DocBook/gpu.tmpl
> @@ -2004,7 +2004,7 @@ void intel_crt_init(struct drm_device *dev)
>         <td valign=3D"top" >Description/Restrictions</td>
>         </tr>
>         <tr>
> -       <td rowspan=3D"37" valign=3D"top" >DRM</td>
> +       <td rowspan=3D"38" valign=3D"top" >DRM</td>
>         <td valign=3D"top" >Generic</td>
>         <td valign=3D"top" >=E2=80=9Crotation=E2=80=9D</td>
>         <td valign=3D"top" >BITMASK</td>
> @@ -2256,7 +2256,7 @@ void intel_crt_init(struct drm_device *dev)
>         <td valign=3D"top" >property to suggest an Y offset for a
> connector</td>
>         </tr>
>         <tr>
> -       <td rowspan=3D"3" valign=3D"top" >Optional</td>
> +       <td rowspan=3D"4" valign=3D"top" >Optional</td>
>         <td valign=3D"top" >=E2=80=9Cscaling mode=E2=80=9D</td>
>         <td valign=3D"top" >ENUM</td>
>         <td valign=3D"top" >{ "None", "Full", "Center", "Full aspect" }</=
td>
> @@ -2280,6 +2280,16 @@ void intel_crt_init(struct drm_device *dev)
>         <td valign=3D"top" >TBD</td>
>         </tr>
>         <tr>
> +       <td valign=3D"top" > "zpos" </td>
> +       <td valign=3D"top" >RANGE</td>
> +       <td valign=3D"top" >Min=3D0, Max=3D255</td>
> +       <td valign=3D"top" >Plane</td>
> +       <td valign=3D"top" >Plane's 'z' position during blending (0 for
> background, 255 for frontmost).
> +               If two planes assigned to same CRTC have equal zpos
> values, the plane with higher plane
> +               id is treated as closer to front. Can be IMMUTABLE if
> driver doesn't support changing
> +               planes' order.</td>
> +       </tr>
> +       <tr>
>         <td rowspan=3D"20" valign=3D"top" >i915</td>
>         <td rowspan=3D"2" valign=3D"top" >Generic</td>
>         <td valign=3D"top" >"Broadcast RGB"</td>
> diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
> index 6a21e5c378c1..97bb069cb6a3 100644
> --- a/drivers/gpu/drm/drm_atomic.c
> +++ b/drivers/gpu/drm/drm_atomic.c
> @@ -614,6 +614,8 @@ int drm_atomic_plane_set_property(struct drm_plane
> *plane,
>                 state->src_h =3D val;
>         } else if (property =3D=3D config->rotation_property) {
>                 state->rotation =3D val;
> +       } else if (property =3D=3D config->zpos_property) {
> +               state->zpos =3D val;
>         } else if (plane->funcs->atomic_set_property) {
>                 return plane->funcs->atomic_set_property(plane, state,
>                                 property, val);
> @@ -670,6 +672,8 @@ drm_atomic_plane_get_property(struct drm_plane *plane=
,
>                 *val =3D state->src_h;
>         } else if (property =3D=3D config->rotation_property) {
>                 *val =3D state->rotation;
> +       } else if (property =3D=3D config->zpos_property) {
> +               *val =3D state->zpos;
>         } else if (plane->funcs->atomic_get_property) {
>                 return plane->funcs->atomic_get_property(plane, state,
> property, val);
>         } else {
> diff --git a/drivers/gpu/drm/drm_atomic_helper.c
> b/drivers/gpu/drm/drm_atomic_helper.c
> index d0d4b2ff7c21..257946fac94b 100644
> --- a/drivers/gpu/drm/drm_atomic_helper.c
> +++ b/drivers/gpu/drm/drm_atomic_helper.c
> @@ -31,6 +31,7 @@
>  #include <drm/drm_crtc_helper.h>
>  #include <drm/drm_atomic_helper.h>
>  #include <linux/fence.h>
> +#include <linux/sort.h>
>
>  /**
>   * DOC: overview
> @@ -507,6 +508,117 @@ drm_atomic_helper_check_modeset(struct drm_device
> *dev,
>  }
>  EXPORT_SYMBOL(drm_atomic_helper_check_modeset);
>
> +static int drm_atomic_state_zpos_cmp(const void *a, const void *b)
> +{
> +       const struct drm_plane_state *sa =3D *(struct drm_plane_state **)=
a;
> +       const struct drm_plane_state *sb =3D *(struct drm_plane_state **)=
b;
> +       int zpos_a =3D (sa->zpos << 16) + sa->plane->base.id;
> +       int zpos_b =3D (sb->zpos << 16) + sb->plane->base.id;
> +
> +       return zpos_a - zpos_b;
> +}
> +
> +/**
> + * drm_atomic_helper_crtc_normalize_zpos - calculate normalized zpos
> values
> + * @crtc: crtc with planes, which have to be considered for normalizatio=
n
> + * @crtc_state: new atomic state to apply
> + *
> + * This function checks new states of all planes assigned to given crtc
> and
> + * calculates normalized zpos value for them. Planes are compared first
> by their
> + * zpos values, then by plane id (if zpos equals). Plane with lowest zpo=
s
> value
> + * is at the bottom. The plane_state->normalized_zpos is then filled wit=
h
> uniqe
> + * values from 0 to number of active planes in crtc minus one.
> + *
> + * RETURNS
> + * Zero for success or -errno
> + */
> +int drm_atomic_helper_crtc_normalize_zpos(struct drm_crtc *crtc,
> +                                             struct drm_crtc_state
> *crtc_state)
> +{
> +       struct drm_atomic_state *state =3D crtc_state->state;
> +       struct drm_device *dev =3D crtc->dev;
> +       int total_planes =3D dev->mode_config.num_total_plane;
> +       struct drm_plane_state **states;
> +       struct drm_plane *plane;
> +       int i, n =3D 0;
> +       int ret =3D 0;
> +
> +       DRM_DEBUG_ATOMIC("[CRTC:%d:%s] calculating normalized zpos
> values\n",
> +                        crtc->base.id, crtc->name);
> +
> +       states =3D kmalloc(total_planes * sizeof(*states), GFP_KERNEL);
> +       if (!states)
> +               return -ENOMEM;
> +
> +       /*
> +        * Normalization process might create new states for planes which
> +        * normalized_zpos has to be recalculated.
> +        */
> +       drm_for_each_plane_mask(plane, dev, crtc_state->plane_mask) {
> +               struct drm_plane_state *plane_state =3D
> +                       drm_atomic_get_plane_state(state, plane);
> +               if (IS_ERR(plane_state)) {
> +                       ret =3D PTR_ERR(plane_state);
> +                       goto fail;
> +               }
> +               states[n++] =3D plane_state;
> +               DRM_DEBUG_ATOMIC("[PLANE:%d:%s] processing zpos value
> %d\n",
> +                                plane->base.id, plane->name,
> plane_state->zpos);
> +       }
> +
> +       sort(states, n, sizeof(*states), drm_atomic_state_zpos_cmp, NULL)=
;
> +
> +       for (i =3D 0; i < n; i++) {
> +               plane =3D states[i]->plane;
> +               states[i]->normalized_zpos =3D i;
> +               DRM_DEBUG_ATOMIC("[PLANE:%d:%s] normalized zpos value
> %d\n",
> +                                plane->base.id, plane->name, i);
> +       }
> +fail:
> +       kfree(states);
> +       return ret;
> +}
> +EXPORT_SYMBOL(drm_atomic_helper_crtc_normalize_zpos);
> +
> +static int drm_atomic_helper_normalize_zpos(struct drm_device *dev,
> +                                           struct drm_atomic_state *stat=
e)
> +{
> +       struct drm_crtc *crtc;
> +       struct drm_crtc_state *crtc_state;
> +       struct drm_plane *plane;
> +       struct drm_plane_state *plane_state;
> +       int i, ret =3D 0;
> +
> +       /*
> +        * If zpos_property is not initialized, then it makes no sense
> +        * to calculate normalized zpos values.
> +        */
> +       if (!dev->mode_config.zpos_property)
> +               return 0;
> +
> +       for_each_plane_in_state(state, plane, plane_state, i) {
> +               crtc =3D plane_state->crtc;
> +               if (!crtc)
> +                       continue;
> +               if (plane->state->zpos !=3D plane_state->zpos) {
> +                       crtc_state =3D
> +                               drm_atomic_get_existing_crtc_state(state,
> crtc);
> +                       crtc_state->zpos_changed =3D true;
> +               }
> +       }
> +
> +       for_each_crtc_in_state(state, crtc, crtc_state, i) {
> +               if (crtc_state->plane_mask !=3D crtc->state->plane_mask |=
|
> +                   crtc_state->zpos_changed) {
> +                       ret =3D drm_atomic_helper_crtc_normalize_zpos(crt=
c,
> +
>  crtc_state);
> +                       if (ret)
> +                               return ret;
> +               }
> +       }
> +       return 0;
> +}
> +
>  /**
>   * drm_atomic_helper_check_planes - validate state object for planes
> changes
>   * @dev: DRM device
> @@ -532,6 +644,10 @@ drm_atomic_helper_check_planes(struct drm_device *de=
v,
>         struct drm_plane_state *plane_state;
>         int i, ret =3D 0;
>
> +       ret =3D drm_atomic_helper_normalize_zpos(dev, state);
> +       if (ret)
> +               return ret;
> +
>         for_each_plane_in_state(state, plane, plane_state, i) {
>                 const struct drm_plane_helper_funcs *funcs;
>
> diff --git a/drivers/gpu/drm/drm_crtc.c b/drivers/gpu/drm/drm_crtc.c
> index 62fa95fa5471..54a21e7c1ca5 100644
> --- a/drivers/gpu/drm/drm_crtc.c
> +++ b/drivers/gpu/drm/drm_crtc.c
> @@ -5880,6 +5880,59 @@ struct drm_property
> *drm_mode_create_rotation_property(struct drm_device *dev,
>  EXPORT_SYMBOL(drm_mode_create_rotation_property);
>
>  /**
> + * drm_mode_create_zpos_property - create muttable zpos property
> + * @dev: DRM device
> + *
> + * This function initializes generic muttable zpos property and enables
> support
> + * for it in drm core. Drivers can then attach this property to planes t=
o
> enable
> + * support for configurable planes arrangement during blending operation=
.
> + * Drivers can also use drm_atomic_helper_normalize_zpos() function to
> calculate
> + * drm_plane_state->normalized_zpos values.
> + *
> + * Returns:
> + * Zero on success, negative errno on failure.
> + */
> +int drm_mode_create_zpos_property(struct drm_device *dev)
> +{
> +       struct drm_property *prop;
> +
> +       prop =3D drm_property_create_range(dev, 0, "zpos", 0, 255);
> +       if (!prop)
> +               return -ENOMEM;
> +
> +       dev->mode_config.zpos_property =3D prop;
> +       return 0;
> +}
> +EXPORT_SYMBOL(drm_mode_create_zpos_property);
> +
> +/**
> + * drm_plane_create_zpos_property - create immuttable zpos property
> + * @dev: DRM device
> + *
> + * This function initializes generic immuttable zpos property and enable=
s
> + * support for it in drm core. Using this property driver lets userspace
> + * to get the arrangement of the planes for blending operation and
> notifies
> + * it that the hardware (or driver) doesn't support changing of the
> planes'
> + * order.
> + *
> + * Returns:
> + * Zero on success, negative errno on failure.
> + */
> +int drm_mode_create_zpos_immutable_property(struct drm_device *dev)
> +{
> +       struct drm_property *prop;
> +
> +       prop =3D drm_property_create_range(dev, DRM_MODE_PROP_IMMUTABLE,
> "zpos",
> +                                        0, 255);
> +       if (!prop)
> +               return -ENOMEM;
> +
> +       dev->mode_config.zpos_immutable_property =3D prop;
> +       return 0;
> +}
> +EXPORT_SYMBOL(drm_mode_create_zpos_immutable_property);
> +
> +/**
>   * DOC: Tile group
>   *
>   * Tile groups are used to represent tiled monitors with a unique
> diff --git a/include/drm/drm_crtc.h b/include/drm/drm_crtc.h
> index 3b040b355472..0607ad2ce918 100644
> --- a/include/drm/drm_crtc.h
> +++ b/include/drm/drm_crtc.h
> @@ -305,6 +305,7 @@ struct drm_plane_helper_funcs;
>   * @mode_changed: crtc_state->mode or crtc_state->enable has been change=
d
>   * @active_changed: crtc_state->active has been toggled.
>   * @connectors_changed: connectors to this crtc have been updated
> + * @zpos_changed: zpos values of planes on this crtc have been updated
>   * @plane_mask: bitmask of (1 << drm_plane_index(plane)) of attached
> planes
>   * @last_vblank_count: for helpers and drivers to capture the vblank of
> the
>   *     update to ensure framebuffer cleanup isn't done too early
> @@ -331,6 +332,7 @@ struct drm_crtc_state {
>         bool mode_changed : 1;
>         bool active_changed : 1;
>         bool connectors_changed : 1;
> +       bool zpos_changed : 1;
>
>         /* attached planes bitmask:
>          * WARNING: transitional helpers do not maintain plane_mask so
> @@ -1243,6 +1245,9 @@ struct drm_connector {
>   *     plane (in 16.16)
>   * @src_w: width of visible portion of plane (in 16.16)
>   * @src_h: height of visible portion of plane (in 16.16)
> + * @zpos: priority of the given plane on crtc (optional)
> + * @normalized_zpos: normalized value of zpos: uniqe, range from 0 to
> + *     (number of planes - 1) for given crtc
>   * @state: backpointer to global drm_atomic_state
>   */
>  struct drm_plane_state {
> @@ -1263,6 +1268,10 @@ struct drm_plane_state {
>         /* Plane rotation */
>         unsigned int rotation;
>
> +       /* Plane zpos */
> +       unsigned int zpos;
> +       unsigned int normalized_zpos;
> +
>         struct drm_atomic_state *state;
>  };
>
> @@ -2083,6 +2092,8 @@ struct drm_mode_config {
>         struct drm_property *tile_property;
>         struct drm_property *plane_type_property;
>         struct drm_property *rotation_property;
> +       struct drm_property *zpos_property;
> +       struct drm_property *zpos_immutable_property;
>         struct drm_property *prop_src_x;
>         struct drm_property *prop_src_y;
>         struct drm_property *prop_src_w;
> @@ -2484,6 +2495,9 @@ extern struct drm_property
> *drm_mode_create_rotation_property(struct drm_device
>  extern unsigned int drm_rotation_simplify(unsigned int rotation,
>                                           unsigned int
> supported_rotations);
>
> +extern int drm_mode_create_zpos_property(struct drm_device *dev);
> +extern int drm_mode_create_zpos_immutable_property(struct drm_device
> *dev);
> +
>  /* Helpers */
>
>  static inline struct drm_plane *drm_plane_find(struct drm_device *dev,
> --
> 1.9.2
>
>


--=20

Benjamin Gaignard

Graphic Working Group

Linaro.org <http://www.linaro.org/> *=E2=94=82 *Open source software for AR=
M SoCs

Follow *Linaro: *Facebook <http://www.facebook.com/pages/Linaro> | Twitter
<http://twitter.com/#!/linaroorg> | Blog
<http://www.linaro.org/linaro-blog/>

--001a114026506ac4d80529338a70
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I have been able to test it on sti driver.<div><br></div><=
div>Thanks to have done the effort to make zpos generic.</div><div><br><div=
>You can add my tested-by on this patch.</div></div><div><br></div><div>Ben=
jamin</div></div><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
2016-01-12 14:39 GMT+01:00 Marek Szyprowski <span dir=3D"ltr">&lt;<a href=
=3D"mailto:m.szyprowski@samsung.com" target=3D"_blank">m.szyprowski@samsung=
.com</a>&gt;</span>:<br><blockquote class=3D"gmail_quote" style=3D"margin:0=
 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">This patch adds supp=
ort for generic plane&#39;s zpos property property with<br>
well-defined semantics:<br>
- added zpos properties to drm core and plane state structures<br>
- added helpers for normalizing zpos properties of given set of planes<br>
- well defined semantics: planes are sorted by zpos values and then plane<b=
r>
=C2=A0 id value if zpos equals<br>
<br>
Normalized zpos values are calculated automatically when generic<br>
muttable zpos property has been initialized. Drivers can simply use<br>
plane_state-&gt;normalized_zpos in their atomic_check and/or plane_update<b=
r>
callbacks without any additional calls to DRM core.<br>
<br>
Signed-off-by: Marek Szyprowski &lt;<a href=3D"mailto:m.szyprowski@samsung.=
com">m.szyprowski@samsung.com</a>&gt;<br>
---<br>
=C2=A0Documentation/DocBook/gpu.tmpl=C2=A0 =C2=A0 =C2=A0 |=C2=A0 14 ++++-<b=
r>
=C2=A0drivers/gpu/drm/drm_atomic.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=
=A04 ++<br>
=C2=A0drivers/gpu/drm/drm_atomic_helper.c | 116 +++++++++++++++++++++++++++=
+++++++++<br>
=C2=A0drivers/gpu/drm/drm_crtc.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =
53 ++++++++++++++++<br>
=C2=A0include/drm/drm_crtc.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 14 +++++<br>
=C2=A05 files changed, 199 insertions(+), 2 deletions(-)<br>
<br>
diff --git a/Documentation/DocBook/gpu.tmpl b/Documentation/DocBook/gpu.tmp=
l<br>
index 6c6e81a9eaf4..f6b7236141b6 100644<br>
--- a/Documentation/DocBook/gpu.tmpl<br>
+++ b/Documentation/DocBook/gpu.tmpl<br>
@@ -2004,7 +2004,7 @@ void intel_crt_init(struct drm_device *dev)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;td valign=3D&quot;top&quot; &gt;Description=
/Restrictions&lt;/td&gt;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;/tr&gt;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;tr&gt;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;td rowspan=3D&quot;37&quot; valign=3D&quot;=
top&quot; &gt;DRM&lt;/td&gt;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;td rowspan=3D&quot;38&quot; valign=3D&quot;=
top&quot; &gt;DRM&lt;/td&gt;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;td valign=3D&quot;top&quot; &gt;Generic&lt;=
/td&gt;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;td valign=3D&quot;top&quot; &gt;=E2=80=9Cro=
tation=E2=80=9D&lt;/td&gt;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;td valign=3D&quot;top&quot; &gt;BITMASK&lt;=
/td&gt;<br>
@@ -2256,7 +2256,7 @@ void intel_crt_init(struct drm_device *dev)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;td valign=3D&quot;top&quot; &gt;property to=
 suggest an Y offset for a connector&lt;/td&gt;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;/tr&gt;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;tr&gt;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;td rowspan=3D&quot;3&quot; valign=3D&quot;t=
op&quot; &gt;Optional&lt;/td&gt;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;td rowspan=3D&quot;4&quot; valign=3D&quot;t=
op&quot; &gt;Optional&lt;/td&gt;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;td valign=3D&quot;top&quot; &gt;=E2=80=9Csc=
aling mode=E2=80=9D&lt;/td&gt;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;td valign=3D&quot;top&quot; &gt;ENUM&lt;/td=
&gt;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;td valign=3D&quot;top&quot; &gt;{ &quot;Non=
e&quot;, &quot;Full&quot;, &quot;Center&quot;, &quot;Full aspect&quot; }&lt=
;/td&gt;<br>
@@ -2280,6 +2280,16 @@ void intel_crt_init(struct drm_device *dev)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;td valign=3D&quot;top&quot; &gt;TBD&lt;/td&=
gt;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;/tr&gt;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;tr&gt;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;td valign=3D&quot;top&quot; &gt; &quot;zpos=
&quot; &lt;/td&gt;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;td valign=3D&quot;top&quot; &gt;RANGE&lt;/t=
d&gt;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;td valign=3D&quot;top&quot; &gt;Min=3D0, Ma=
x=3D255&lt;/td&gt;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;td valign=3D&quot;top&quot; &gt;Plane&lt;/t=
d&gt;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;td valign=3D&quot;top&quot; &gt;Plane&#39;s=
 &#39;z&#39; position during blending (0 for background, 255 for frontmost)=
.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0If two planes assig=
ned to same CRTC have equal zpos values, the plane with higher plane<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0id is treated as cl=
oser to front. Can be IMMUTABLE if driver doesn&#39;t support changing<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0planes&#39; order.&=
lt;/td&gt;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;/tr&gt;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;tr&gt;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;td rowspan=3D&quot;20&quot; valign=3D&quot;=
top&quot; &gt;i915&lt;/td&gt;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;td rowspan=3D&quot;2&quot; valign=3D&quot;t=
op&quot; &gt;Generic&lt;/td&gt;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;td valign=3D&quot;top&quot; &gt;&quot;Broad=
cast RGB&quot;&lt;/td&gt;<br>
diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c<br=
>
index 6a21e5c378c1..97bb069cb6a3 100644<br>
--- a/drivers/gpu/drm/drm_atomic.c<br>
+++ b/drivers/gpu/drm/drm_atomic.c<br>
@@ -614,6 +614,8 @@ int drm_atomic_plane_set_property(struct drm_plane *pla=
ne,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 state-&gt;src_h =3D=
 val;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 } else if (property =3D=3D config-&gt;rotation_=
property) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 state-&gt;rotation =
=3D val;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0} else if (property =3D=3D config-&gt;zpos_prop=
erty) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0state-&gt;zpos =3D =
val;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 } else if (plane-&gt;funcs-&gt;atomic_set_prope=
rty) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return plane-&gt;fu=
ncs-&gt;atomic_set_property(plane, state,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 property, val);<br>
@@ -670,6 +672,8 @@ drm_atomic_plane_get_property(struct drm_plane *plane,<=
br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *val =3D state-&gt;=
src_h;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 } else if (property =3D=3D config-&gt;rotation_=
property) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *val =3D state-&gt;=
rotation;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0} else if (property =3D=3D config-&gt;zpos_prop=
erty) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*val =3D state-&gt;=
zpos;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 } else if (plane-&gt;funcs-&gt;atomic_get_prope=
rty) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return plane-&gt;fu=
ncs-&gt;atomic_get_property(plane, state, property, val);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 } else {<br>
diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atom=
ic_helper.c<br>
index d0d4b2ff7c21..257946fac94b 100644<br>
--- a/drivers/gpu/drm/drm_atomic_helper.c<br>
+++ b/drivers/gpu/drm/drm_atomic_helper.c<br>
@@ -31,6 +31,7 @@<br>
=C2=A0#include &lt;drm/drm_crtc_helper.h&gt;<br>
=C2=A0#include &lt;drm/drm_atomic_helper.h&gt;<br>
=C2=A0#include &lt;linux/fence.h&gt;<br>
+#include &lt;linux/sort.h&gt;<br>
<br>
=C2=A0/**<br>
=C2=A0 * DOC: overview<br>
@@ -507,6 +508,117 @@ drm_atomic_helper_check_modeset(struct drm_device *de=
v,<br>
=C2=A0}<br>
=C2=A0EXPORT_SYMBOL(drm_atomic_helper_check_modeset);<br>
<br>
+static int drm_atomic_state_zpos_cmp(const void *a, const void *b)<br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0const struct drm_plane_state *sa =3D *(struct d=
rm_plane_state **)a;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0const struct drm_plane_state *sb =3D *(struct d=
rm_plane_state **)b;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0int zpos_a =3D (sa-&gt;zpos &lt;&lt; 16) + sa-&=
gt;plane-&gt;<a href=3D"http://base.id" rel=3D"noreferrer" target=3D"_blank=
">base.id</a>;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0int zpos_b =3D (sb-&gt;zpos &lt;&lt; 16) + sb-&=
gt;plane-&gt;<a href=3D"http://base.id" rel=3D"noreferrer" target=3D"_blank=
">base.id</a>;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return zpos_a - zpos_b;<br>
+}<br>
+<br>
+/**<br>
+ * drm_atomic_helper_crtc_normalize_zpos - calculate normalized zpos value=
s<br>
+ * @crtc: crtc with planes, which have to be considered for normalization<=
br>
+ * @crtc_state: new atomic state to apply<br>
+ *<br>
+ * This function checks new states of all planes assigned to given crtc an=
d<br>
+ * calculates normalized zpos value for them. Planes are compared first by=
 their<br>
+ * zpos values, then by plane id (if zpos equals). Plane with lowest zpos =
value<br>
+ * is at the bottom. The plane_state-&gt;normalized_zpos is then filled wi=
th uniqe<br>
+ * values from 0 to number of active planes in crtc minus one.<br>
+ *<br>
+ * RETURNS<br>
+ * Zero for success or -errno<br>
+ */<br>
+int drm_atomic_helper_crtc_normalize_zpos(struct drm_crtc *crtc,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0struct drm_crtc_state *crtc_state)<br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct drm_atomic_state *state =3D crtc_state-&=
gt;state;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct drm_device *dev =3D crtc-&gt;dev;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0int total_planes =3D dev-&gt;mode_config.num_to=
tal_plane;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct drm_plane_state **states;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct drm_plane *plane;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0int i, n =3D 0;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0int ret =3D 0;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0DRM_DEBUG_ATOMIC(&quot;[CRTC:%d:%s] calculating=
 normalized zpos values\n&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 crtc-&gt;<a href=3D"http://base.id" rel=3D"noreferrer" target=3D=
"_blank">base.id</a>, crtc-&gt;name);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0states =3D kmalloc(total_planes * sizeof(*state=
s), GFP_KERNEL);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!states)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -ENOMEM;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/*<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * Normalization process might create new state=
s for planes which<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * normalized_zpos has to be recalculated.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0drm_for_each_plane_mask(plane, dev, crtc_state-=
&gt;plane_mask) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct drm_plane_st=
ate *plane_state =3D<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0drm_atomic_get_plane_state(state, plane);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (IS_ERR(plane_st=
ate)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0ret =3D PTR_ERR(plane_state);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0goto fail;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0states[n++] =3D pla=
ne_state;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0DRM_DEBUG_ATOMIC(&q=
uot;[PLANE:%d:%s] processing zpos value %d\n&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 plane-&gt;<a href=3D"http://base.id"=
 rel=3D"noreferrer" target=3D"_blank">base.id</a>, plane-&gt;name, plane_st=
ate-&gt;zpos);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0sort(states, n, sizeof(*states), drm_atomic_sta=
te_zpos_cmp, NULL);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0for (i =3D 0; i &lt; n; i++) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0plane =3D states[i]=
-&gt;plane;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0states[i]-&gt;norma=
lized_zpos =3D i;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0DRM_DEBUG_ATOMIC(&q=
uot;[PLANE:%d:%s] normalized zpos value %d\n&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 plane-&gt;<a href=3D"http://base.id"=
 rel=3D"noreferrer" target=3D"_blank">base.id</a>, plane-&gt;name, i);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+fail:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0kfree(states);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return ret;<br>
+}<br>
+EXPORT_SYMBOL(drm_atomic_helper_crtc_normalize_zpos);<br>
+<br>
+static int drm_atomic_helper_normalize_zpos(struct drm_device *dev,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0struct drm_atomic_state *state)<br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct drm_crtc *crtc;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct drm_crtc_state *crtc_state;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct drm_plane *plane;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct drm_plane_state *plane_state;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0int i, ret =3D 0;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/*<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * If zpos_property is not initialized, then it=
 makes no sense<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * to calculate normalized zpos values.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!dev-&gt;mode_config.zpos_property)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0for_each_plane_in_state(state, plane, plane_sta=
te, i) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0crtc =3D plane_stat=
e-&gt;crtc;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!crtc)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0continue;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (plane-&gt;state=
-&gt;zpos !=3D plane_state-&gt;zpos) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0crtc_state =3D<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0drm_atomic_get_existing_crtc_state(st=
ate, crtc);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0crtc_state-&gt;zpos_changed =3D true;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0for_each_crtc_in_state(state, crtc, crtc_state,=
 i) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (crtc_state-&gt;=
plane_mask !=3D crtc-&gt;state-&gt;plane_mask ||<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0crtc_=
state-&gt;zpos_changed) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0ret =3D drm_atomic_helper_crtc_normalize_zpos(crtc,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0crtc_state);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0if (ret)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return ret;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
+}<br>
+<br>
=C2=A0/**<br>
=C2=A0 * drm_atomic_helper_check_planes - validate state object for planes =
changes<br>
=C2=A0 * @dev: DRM device<br>
@@ -532,6 +644,10 @@ drm_atomic_helper_check_planes(struct drm_device *dev,=
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 struct drm_plane_state *plane_state;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 int i, ret =3D 0;<br>
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D drm_atomic_helper_normalize_zpos(dev, s=
tate);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (ret)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return ret;<br>
+<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 for_each_plane_in_state(state, plane, plane_sta=
te, i) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 const struct drm_pl=
ane_helper_funcs *funcs;<br>
<br>
diff --git a/drivers/gpu/drm/drm_crtc.c b/drivers/gpu/drm/drm_crtc.c<br>
index 62fa95fa5471..54a21e7c1ca5 100644<br>
--- a/drivers/gpu/drm/drm_crtc.c<br>
+++ b/drivers/gpu/drm/drm_crtc.c<br>
@@ -5880,6 +5880,59 @@ struct drm_property *drm_mode_create_rotation_proper=
ty(struct drm_device *dev,<br>
=C2=A0EXPORT_SYMBOL(drm_mode_create_rotation_property);<br>
<br>
=C2=A0/**<br>
+ * drm_mode_create_zpos_property - create muttable zpos property<br>
+ * @dev: DRM device<br>
+ *<br>
+ * This function initializes generic muttable zpos property and enables su=
pport<br>
+ * for it in drm core. Drivers can then attach this property to planes to =
enable<br>
+ * support for configurable planes arrangement during blending operation.<=
br>
+ * Drivers can also use drm_atomic_helper_normalize_zpos() function to cal=
culate<br>
+ * drm_plane_state-&gt;normalized_zpos values.<br>
+ *<br>
+ * Returns:<br>
+ * Zero on success, negative errno on failure.<br>
+ */<br>
+int drm_mode_create_zpos_property(struct drm_device *dev)<br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct drm_property *prop;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0prop =3D drm_property_create_range(dev, 0, &quo=
t;zpos&quot;, 0, 255);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!prop)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -ENOMEM;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0dev-&gt;mode_config.zpos_property =3D prop;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
+}<br>
+EXPORT_SYMBOL(drm_mode_create_zpos_property);<br>
+<br>
+/**<br>
+ * drm_plane_create_zpos_property - create immuttable zpos property<br>
+ * @dev: DRM device<br>
+ *<br>
+ * This function initializes generic immuttable zpos property and enables<=
br>
+ * support for it in drm core. Using this property driver lets userspace<b=
r>
+ * to get the arrangement of the planes for blending operation and notifie=
s<br>
+ * it that the hardware (or driver) doesn&#39;t support changing of the pl=
anes&#39;<br>
+ * order.<br>
+ *<br>
+ * Returns:<br>
+ * Zero on success, negative errno on failure.<br>
+ */<br>
+int drm_mode_create_zpos_immutable_property(struct drm_device *dev)<br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct drm_property *prop;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0prop =3D drm_property_create_range(dev, DRM_MOD=
E_PROP_IMMUTABLE, &quot;zpos&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0, 255);=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!prop)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -ENOMEM;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0dev-&gt;mode_config.zpos_immutable_property =3D=
 prop;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
+}<br>
+EXPORT_SYMBOL(drm_mode_create_zpos_immutable_property);<br>
+<br>
+/**<br>
=C2=A0 * DOC: Tile group<br>
=C2=A0 *<br>
=C2=A0 * Tile groups are used to represent tiled monitors with a unique<br>
diff --git a/include/drm/drm_crtc.h b/include/drm/drm_crtc.h<br>
index 3b040b355472..0607ad2ce918 100644<br>
--- a/include/drm/drm_crtc.h<br>
+++ b/include/drm/drm_crtc.h<br>
@@ -305,6 +305,7 @@ struct drm_plane_helper_funcs;<br>
=C2=A0 * @mode_changed: crtc_state-&gt;mode or crtc_state-&gt;enable has be=
en changed<br>
=C2=A0 * @active_changed: crtc_state-&gt;active has been toggled.<br>
=C2=A0 * @connectors_changed: connectors to this crtc have been updated<br>
+ * @zpos_changed: zpos values of planes on this crtc have been updated<br>
=C2=A0 * @plane_mask: bitmask of (1 &lt;&lt; drm_plane_index(plane)) of att=
ached planes<br>
=C2=A0 * @last_vblank_count: for helpers and drivers to capture the vblank =
of the<br>
=C2=A0 *=C2=A0 =C2=A0 =C2=A0update to ensure framebuffer cleanup isn&#39;t =
done too early<br>
@@ -331,6 +332,7 @@ struct drm_crtc_state {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 bool mode_changed : 1;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 bool active_changed : 1;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 bool connectors_changed : 1;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0bool zpos_changed : 1;<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* attached planes bitmask:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* WARNING: transitional helpers do not ma=
intain plane_mask so<br>
@@ -1243,6 +1245,9 @@ struct drm_connector {<br>
=C2=A0 *=C2=A0 =C2=A0 =C2=A0plane (in 16.16)<br>
=C2=A0 * @src_w: width of visible portion of plane (in 16.16)<br>
=C2=A0 * @src_h: height of visible portion of plane (in 16.16)<br>
+ * @zpos: priority of the given plane on crtc (optional)<br>
+ * @normalized_zpos: normalized value of zpos: uniqe, range from 0 to<br>
+ *=C2=A0 =C2=A0 =C2=A0(number of planes - 1) for given crtc<br>
=C2=A0 * @state: backpointer to global drm_atomic_state<br>
=C2=A0 */<br>
=C2=A0struct drm_plane_state {<br>
@@ -1263,6 +1268,10 @@ struct drm_plane_state {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Plane rotation */<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 unsigned int rotation;<br>
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Plane zpos */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned int zpos;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned int normalized_zpos;<br>
+<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 struct drm_atomic_state *state;<br>
=C2=A0};<br>
<br>
@@ -2083,6 +2092,8 @@ struct drm_mode_config {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 struct drm_property *tile_property;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 struct drm_property *plane_type_property;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 struct drm_property *rotation_property;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct drm_property *zpos_property;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct drm_property *zpos_immutable_property;<b=
r>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 struct drm_property *prop_src_x;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 struct drm_property *prop_src_y;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 struct drm_property *prop_src_w;<br>
@@ -2484,6 +2495,9 @@ extern struct drm_property *drm_mode_create_rotation_=
property(struct drm_device<br>
=C2=A0extern unsigned int drm_rotation_simplify(unsigned int rotation,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 u=
nsigned int supported_rotations);<br>
<br>
+extern int drm_mode_create_zpos_property(struct drm_device *dev);<br>
+extern int drm_mode_create_zpos_immutable_property(struct drm_device *dev)=
;<br>
+<br>
=C2=A0/* Helpers */<br>
<br>
=C2=A0static inline struct drm_plane *drm_plane_find(struct drm_device *dev=
,<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
1.9.2<br>
<br>
</font></span></blockquote></div><br><br clear=3D"all"><div><br></div>-- <b=
r><div class=3D"gmail_signature"><span style=3D"border-collapse:collapse;fo=
nt-family:arial,sans-serif;font-size:13px"><p style=3D"margin-top:0px;margi=
n-right:0px;margin-bottom:0px;margin-left:0px">Benjamin Gaignard=C2=A0</p><=
p style=3D"margin-top:0px;margin-right:0px;margin-bottom:0px;margin-left:0p=
x">Graphic Working Group</p><p style=3D"margin-top:0px;margin-right:0px;mar=
gin-bottom:0px;margin-left:0px"><span lang=3D"EN-US" style=3D"font-size:10p=
t;color:rgb(0,176,80)"><span style=3D"color:rgb(0,68,252)"><a href=3D"http:=
//www.linaro.org/" style=3D"color:rgb(0,0,204)" target=3D"_blank">Linaro.or=
g</a></span><b>=C2=A0</b></span><b><span lang=3D"EN-US" style=3D"font-size:=
10pt">=E2=94=82=C2=A0</span></b><span lang=3D"EN-US" style=3D"font-size:10p=
t">Open source software for ARM SoCs</span></p><p style=3D"margin-top:0px;m=
argin-right:0px;margin-bottom:0px;margin-left:0px"><u></u></p><p style=3D"m=
argin-top:0px;margin-right:0px;margin-bottom:0px;margin-left:0px"><span lan=
g=3D"EN-US" style=3D"font-size:10pt">Follow=C2=A0<b>Linaro:=C2=A0</b></span=
><span style=3D"font-size:10pt;color:rgb(0,68,252)"><a href=3D"http://www.f=
acebook.com/pages/Linaro" style=3D"color:rgb(0,0,204)" target=3D"_blank"><s=
pan style=3D"color:blue">Facebook</span></a></span><span style=3D"font-size=
:10pt">=C2=A0|=C2=A0<span style=3D"color:rgb(0,68,252)"><a href=3D"http://t=
witter.com/#!/linaroorg" style=3D"color:rgb(0,0,204)" target=3D"_blank"><sp=
an style=3D"color:blue">Twitter</span></a></span>=C2=A0|=C2=A0<span style=
=3D"color:rgb(0,68,252)"><a href=3D"http://www.linaro.org/linaro-blog/" sty=
le=3D"color:rgb(0,0,204)" target=3D"_blank"><span style=3D"color:blue">Blog=
</span></a></span></span></p></span></div>
</div>

--001a114026506ac4d80529338a70--

--===============0659255928==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHA6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK

--===============0659255928==--
