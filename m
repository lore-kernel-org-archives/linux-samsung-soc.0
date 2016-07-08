From: Benjamin Gaignard <benjamin.gaignard@linaro.org>
Subject: Re: [PATCH v5 4/4] drm: rcar: use generic code for managing zpos
 plane property
Date: Fri, 8 Jul 2016 09:44:09 +0200
Message-ID: <CA+M3ks6Hr629P4GOWp9zVX7eJaijkwE_GNscUs+tusK0t0zJ_Q@mail.gmail.com>
References: <1467896484-5132-1-git-send-email-benjamin.gaignard@linaro.org>
 <1467896484-5132-5-git-send-email-benjamin.gaignard@linaro.org> <5986168.pJCDFu2kxL@avalon>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-oi0-f52.google.com ([209.85.218.52]:35646 "EHLO
	mail-oi0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751016AbcGHHoK convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 8 Jul 2016 03:44:10 -0400
Received: by mail-oi0-f52.google.com with SMTP id r2so53865717oih.2
        for <linux-samsung-soc@vger.kernel.org>; Fri, 08 Jul 2016 00:44:10 -0700 (PDT)
In-Reply-To: <5986168.pJCDFu2kxL@avalon>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, Vincent Abriou <vincent.abriou@st.com>, Fabien Dessenne <fabien.dessenne@st.com>, linux-samsung-soc@vger.kernel.org, Linaro MM SIG Mailman List <linaro-mm-sig@lists.linaro.org>, Daniel Vetter <daniel@ffwll.ch>, Ville Syrjala <ville.syrjala@linux.intel.com>, Marek Szyprowski <m.szyprowski@samsung.com>

Hi Laurent,

May I suggest to merge only zpos core files (i.e the first patch of
this series) and sti patches ?
Like that we can progress and we can resend your patch for rcar when
media_tree vsp1 branch
will be merged into drm-next?

Dave, Daniel: is it possible to do like this ?

Regards,
Benjamin


2016-07-07 17:53 GMT+02:00 Laurent Pinchart <laurent.pinchart@ideasonbo=
ard.com>:
> Hi Benjamin,
>
> Thank you for the patch.
>
> The git://linuxtv.org/media_tree.git vsp1 branch will be merged in v4=
=2E8 and
> will conflict with this series. If you target v4.8 you should rebase =
the
> patches on top of that branch.
>
> For your convenience I've pushed a branch in which I've resolved the =
conflicts
> for v4 of your patches series to
>
> git://linuxtv.org/pinchartl/media.git drm/du/zorder
>
> On Thursday 07 Jul 2016 15:01:24 Benjamin Gaignard wrote:
>> version 4:
>> fix null pointer issue while setting zpos in plane reset function
>>
>> This patch replaces zpos property handling custom code in rcar DRM
>> driver with calls to generic DRM code.
>>
>> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@linaro.org>
>>
>> Cc: Daniel Vetter <daniel@ffwll.ch>
>> Cc: Ville Syrjala <ville.syrjala@linux.intel.com>
>> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>> Cc: Marek Szyprowski <m.szyprowski@samsung.com>
>> ---
>>  drivers/gpu/drm/rcar-du/rcar_du_crtc.c  | 2 +-
>>  drivers/gpu/drm/rcar-du/rcar_du_drv.h   | 1 -
>>  drivers/gpu/drm/rcar-du/rcar_du_kms.c   | 5 -----
>>  drivers/gpu/drm/rcar-du/rcar_du_plane.c | 9 ++-------
>>  drivers/gpu/drm/rcar-du/rcar_du_plane.h | 2 --
>>  5 files changed, 3 insertions(+), 16 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
>> b/drivers/gpu/drm/rcar-du/rcar_du_crtc.c index 0d8bdda..28d2cb6 1006=
44
>> --- a/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
>> +++ b/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
>> @@ -196,7 +196,7 @@ void rcar_du_crtc_route_output(struct drm_crtc *=
crtc,
>>
>>  static unsigned int plane_zpos(struct rcar_du_plane *plane)
>>  {
>> -     return to_rcar_plane_state(plane->plane.state)->zpos;
>> +     return plane->plane.state->normalized_zpos;
>>  }
>>
>>  static const struct rcar_du_format_info *
>> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_drv.h
>> b/drivers/gpu/drm/rcar-du/rcar_du_drv.h index ed35467..c843c31 10064=
4
>> --- a/drivers/gpu/drm/rcar-du/rcar_du_drv.h
>> +++ b/drivers/gpu/drm/rcar-du/rcar_du_drv.h
>> @@ -92,7 +92,6 @@ struct rcar_du_device {
>>       struct {
>>               struct drm_property *alpha;
>>               struct drm_property *colorkey;
>> -             struct drm_property *zpos;
>>       } props;
>>
>>       unsigned int dpad0_source;
>> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_kms.c
>> b/drivers/gpu/drm/rcar-du/rcar_du_kms.c index 6bb032d..f03eb55 10064=
4
>> --- a/drivers/gpu/drm/rcar-du/rcar_du_kms.c
>> +++ b/drivers/gpu/drm/rcar-du/rcar_du_kms.c
>> @@ -527,11 +527,6 @@ static int rcar_du_properties_init(struct
>> rcar_du_device *rcdu) if (rcdu->props.colorkey =3D=3D NULL)
>>               return -ENOMEM;
>>
>> -     rcdu->props.zpos =3D
>> -             drm_property_create_range(rcdu->ddev, 0, "zpos", 1, 7)=
;
>> -     if (rcdu->props.zpos =3D=3D NULL)
>> -             return -ENOMEM;
>> -
>>       return 0;
>>  }
>>
>> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_plane.c
>> b/drivers/gpu/drm/rcar-du/rcar_du_plane.c index bfe31ca..dc9bb96 100=
644
>> --- a/drivers/gpu/drm/rcar-du/rcar_du_plane.c
>> +++ b/drivers/gpu/drm/rcar-du/rcar_du_plane.c
>> @@ -652,7 +652,7 @@ static void rcar_du_plane_reset(struct drm_plane=
 *plane)
>> state->source =3D RCAR_DU_PLANE_MEMORY;
>>       state->alpha =3D 255;
>>       state->colorkey =3D RCAR_DU_COLORKEY_NONE;
>> -     state->zpos =3D plane->type =3D=3D DRM_PLANE_TYPE_PRIMARY ? 0 =
: 1;
>> +     state->state.zpos =3D plane->type =3D=3D DRM_PLANE_TYPE_PRIMAR=
Y ? 0 : 1;
>>
>>       plane->state =3D &state->state;
>>       plane->state->plane =3D plane;
>> @@ -670,8 +670,6 @@ static int rcar_du_plane_atomic_set_property(str=
uct
>> drm_plane *plane, rstate->alpha =3D val;
>>       else if (property =3D=3D rcdu->props.colorkey)
>>               rstate->colorkey =3D val;
>> -     else if (property =3D=3D rcdu->props.zpos)
>> -             rstate->zpos =3D val;
>>       else
>>               return -EINVAL;
>>
>> @@ -690,8 +688,6 @@ static int rcar_du_plane_atomic_get_property(str=
uct
>> drm_plane *plane, *val =3D rstate->alpha;
>>       else if (property =3D=3D rcdu->props.colorkey)
>>               *val =3D rstate->colorkey;
>> -     else if (property =3D=3D rcdu->props.zpos)
>> -             *val =3D rstate->zpos;
>>       else
>>               return -EINVAL;
>>
>> @@ -763,8 +759,7 @@ int rcar_du_planes_init(struct rcar_du_group *rg=
rp)
>>               drm_object_attach_property(&plane->plane.base,
>>                                          rcdu->props.colorkey,
>>                                          RCAR_DU_COLORKEY_NONE);
>> -             drm_object_attach_property(&plane->plane.base,
>> -                                        rcdu->props.zpos, 1);
>> +             drm_plane_create_zpos_property(&plane->plane, 1, 7);
>>       }
>>
>>       return 0;
>> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_plane.h
>> b/drivers/gpu/drm/rcar-du/rcar_du_plane.h index b18b7b2..8b91dd3 100=
644
>> --- a/drivers/gpu/drm/rcar-du/rcar_du_plane.h
>> +++ b/drivers/gpu/drm/rcar-du/rcar_du_plane.h
>> @@ -51,7 +51,6 @@ static inline struct rcar_du_plane *to_rcar_plane(=
struct
>> drm_plane *plane) * @hwindex: 0-based hardware plane index, -1 means=
 unused
>>   * @alpha: value of the plane alpha property
>>   * @colorkey: value of the plane colorkey property
>> - * @zpos: value of the plane zpos property
>>   */
>>  struct rcar_du_plane_state {
>>       struct drm_plane_state state;
>> @@ -62,7 +61,6 @@ struct rcar_du_plane_state {
>>
>>       unsigned int alpha;
>>       unsigned int colorkey;
>> -     unsigned int zpos;
>>  };
>>
>>  static inline struct rcar_du_plane_state *
>
> --
> Regards,
>
> Laurent Pinchart
>



--=20
Benjamin Gaignard

Graphic Working Group

Linaro.org =E2=94=82 Open source software for ARM SoCs

=46ollow Linaro: Facebook | Twitter | Blog
