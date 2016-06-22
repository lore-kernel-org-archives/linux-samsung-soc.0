From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH 1/2] [media] v4l: vsp1: Split pad operations between rpf and wpf
Date: Wed, 22 Jun 2016 20:15:18 +0300
Message-ID: <2990331.pv9We224T0@avalon>
References: <20160622001925.30077-1-niklas.soderlund+renesas@ragnatech.se> <20160622001925.30077-2-niklas.soderlund+renesas@ragnatech.se>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <20160622001925.30077-2-niklas.soderlund+renesas@ragnatech.se>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Niklas =?ISO-8859-1?Q?S=F6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org, mchehab@kernel.org, hans.verkuil@cisco.com, linux-samsung-soc@vger.kernel.org, mjpeg-users@lists.sourceforge.net, devel@driverdev.osuosl.org, lars@metafoo.de
List-Id: linux-samsung-soc@vger.kernel.org

Hi Niklas,

Thank you for the patch.

On Wednesday 22 Jun 2016 02:19:24 Niklas S=F6derlund wrote:
> This is done in preparation to move s_stream from v4l2_subdev_video_o=
ps
> to v4l2_subdev_pad_ops. Only wpf implements s_stream so it will no
> longer be possible to share the v4l2_subdev_pad_ops once s_stream is
> moved.
>=20
> Suggested-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Signed-off-by: Niklas S=F6derlund <niklas.soderlund+renesas@ragnatech=
=2Ese>
> ---
>  drivers/media/platform/vsp1/vsp1_rpf.c  | 12 +++++++++-
>  drivers/media/platform/vsp1/vsp1_rwpf.c | 40 +++++++++++------------=
------
>  drivers/media/platform/vsp1/vsp1_rwpf.h | 20 +++++++++++++++++
>  drivers/media/platform/vsp1/vsp1_wpf.c  | 12 +++++++++-
>  4 files changed, 57 insertions(+), 27 deletions(-)
>=20
> diff --git a/drivers/media/platform/vsp1/vsp1_rpf.c
> b/drivers/media/platform/vsp1/vsp1_rpf.c index 49168db..fabe8b2 10064=
4
> --- a/drivers/media/platform/vsp1/vsp1_rpf.c
> +++ b/drivers/media/platform/vsp1/vsp1_rpf.c
> @@ -38,8 +38,18 @@ static inline void vsp1_rpf_write(struct vsp1_rwpf=
 *rpf,
>   * V4L2 Subdevice Operations
>   */
>=20
> +const struct v4l2_subdev_pad_ops vsp1_rpf_pad_ops =3D {

This should be static const.

> +	.init_cfg =3D vsp1_entity_init_cfg,
> +	.enum_mbus_code =3D vsp1_rwpf_enum_mbus_code,
> +	.enum_frame_size =3D vsp1_rwpf_enum_frame_size,
> +	.get_fmt =3D vsp1_subdev_get_pad_format,
> +	.set_fmt =3D vsp1_rwpf_set_format,
> +	.get_selection =3D vsp1_rwpf_get_selection,
> +	.set_selection =3D vsp1_rwpf_set_selection,
> +};
> +
>  static struct v4l2_subdev_ops rpf_ops =3D {
> -	.pad    =3D &vsp1_rwpf_pad_ops,
> +	.pad    =3D &vsp1_rpf_pad_ops,
>  };
>=20
>  /*
> ---------------------------------------------------------------------=
------
> -- diff --git a/drivers/media/platform/vsp1/vsp1_rwpf.c
> b/drivers/media/platform/vsp1/vsp1_rwpf.c index 3b6e032..ff03b9c 1006=
44
> --- a/drivers/media/platform/vsp1/vsp1_rwpf.c
> +++ b/drivers/media/platform/vsp1/vsp1_rwpf.c
> @@ -31,9 +31,9 @@ struct v4l2_rect *vsp1_rwpf_get_crop(struct vsp1_rw=
pf
> *rwpf, * V4L2 Subdevice Pad Operations
>   */
>=20
> -static int vsp1_rwpf_enum_mbus_code(struct v4l2_subdev *subdev,
> -				    struct v4l2_subdev_pad_config *cfg,
> -				    struct v4l2_subdev_mbus_code_enum *code)
> +int vsp1_rwpf_enum_mbus_code(struct v4l2_subdev *subdev,
> +			     struct v4l2_subdev_pad_config *cfg,
> +			     struct v4l2_subdev_mbus_code_enum *code)
>  {
>  	static const unsigned int codes[] =3D {
>  		MEDIA_BUS_FMT_ARGB8888_1X32,
> @@ -48,9 +48,9 @@ static int vsp1_rwpf_enum_mbus_code(struct v4l2_sub=
dev
> *subdev, return 0;
>  }
>=20
> -static int vsp1_rwpf_enum_frame_size(struct v4l2_subdev *subdev,
> -				     struct v4l2_subdev_pad_config *cfg,
> -				     struct v4l2_subdev_frame_size_enum *fse)
> +int vsp1_rwpf_enum_frame_size(struct v4l2_subdev *subdev,
> +			      struct v4l2_subdev_pad_config *cfg,
> +			      struct v4l2_subdev_frame_size_enum *fse)
>  {
>  	struct vsp1_rwpf *rwpf =3D to_rwpf(subdev);
>=20
> @@ -59,9 +59,9 @@ static int vsp1_rwpf_enum_frame_size(struct v4l2_su=
bdev
> *subdev, rwpf->max_height);
>  }
>=20
> -static int vsp1_rwpf_set_format(struct v4l2_subdev *subdev,
> -				struct v4l2_subdev_pad_config *cfg,
> -				struct v4l2_subdev_format *fmt)
> +int vsp1_rwpf_set_format(struct v4l2_subdev *subdev,
> +			 struct v4l2_subdev_pad_config *cfg,
> +			 struct v4l2_subdev_format *fmt)
>  {
>  	struct vsp1_rwpf *rwpf =3D to_rwpf(subdev);
>  	struct v4l2_subdev_pad_config *config;
> @@ -113,9 +113,9 @@ static int vsp1_rwpf_set_format(struct v4l2_subde=
v
> *subdev, return 0;
>  }
>=20
> -static int vsp1_rwpf_get_selection(struct v4l2_subdev *subdev,
> -				   struct v4l2_subdev_pad_config *cfg,
> -				   struct v4l2_subdev_selection *sel)
> +int vsp1_rwpf_get_selection(struct v4l2_subdev *subdev,
> +			    struct v4l2_subdev_pad_config *cfg,
> +			    struct v4l2_subdev_selection *sel)
>  {
>  	struct vsp1_rwpf *rwpf =3D to_rwpf(subdev);
>  	struct v4l2_subdev_pad_config *config;
> @@ -150,9 +150,9 @@ static int vsp1_rwpf_get_selection(struct v4l2_su=
bdev
> *subdev, return 0;
>  }
>=20
> -static int vsp1_rwpf_set_selection(struct v4l2_subdev *subdev,
> -				   struct v4l2_subdev_pad_config *cfg,
> -				   struct v4l2_subdev_selection *sel)
> +int vsp1_rwpf_set_selection(struct v4l2_subdev *subdev,
> +			    struct v4l2_subdev_pad_config *cfg,
> +			    struct v4l2_subdev_selection *sel)
>  {
>  	struct vsp1_rwpf *rwpf =3D to_rwpf(subdev);
>  	struct v4l2_subdev_pad_config *config;
> @@ -209,16 +209,6 @@ static int vsp1_rwpf_set_selection(struct v4l2_s=
ubdev
> *subdev, return 0;
>  }
>=20
> -const struct v4l2_subdev_pad_ops vsp1_rwpf_pad_ops =3D {

You can also remove the declaration of the structure from vsp1_rwpf.h.

> -	.init_cfg =3D vsp1_entity_init_cfg,
> -	.enum_mbus_code =3D vsp1_rwpf_enum_mbus_code,
> -	.enum_frame_size =3D vsp1_rwpf_enum_frame_size,
> -	.get_fmt =3D vsp1_subdev_get_pad_format,
> -	.set_fmt =3D vsp1_rwpf_set_format,
> -	.get_selection =3D vsp1_rwpf_get_selection,
> -	.set_selection =3D vsp1_rwpf_set_selection,
> -};
> -
>  /*
> ---------------------------------------------------------------------=
------
> -- * Controls
>   */
> diff --git a/drivers/media/platform/vsp1/vsp1_rwpf.h
> b/drivers/media/platform/vsp1/vsp1_rwpf.h index 9ff7c78..5ed4be5 1006=
44
> --- a/drivers/media/platform/vsp1/vsp1_rwpf.h
> +++ b/drivers/media/platform/vsp1/vsp1_rwpf.h
> @@ -74,6 +74,26 @@ extern const struct v4l2_subdev_pad_ops
> vsp1_rwpf_pad_ops;
>=20
>  struct v4l2_rect *vsp1_rwpf_get_crop(struct vsp1_rwpf *rwpf,
>  				     struct v4l2_subdev_pad_config *config);
> +
> +int vsp1_rwpf_enum_mbus_code(struct v4l2_subdev *subdev,
> +			     struct v4l2_subdev_pad_config *cfg,
> +			     struct v4l2_subdev_mbus_code_enum *code);
> +
> +int vsp1_rwpf_enum_frame_size(struct v4l2_subdev *subdev,
> +			      struct v4l2_subdev_pad_config *cfg,
> +			      struct v4l2_subdev_frame_size_enum *fse);
> +
> +int vsp1_rwpf_set_format(struct v4l2_subdev *subdev,
> +			 struct v4l2_subdev_pad_config *cfg,
> +			 struct v4l2_subdev_format *fmt);
> +
> +int vsp1_rwpf_get_selection(struct v4l2_subdev *subdev,
> +			    struct v4l2_subdev_pad_config *cfg,
> +			    struct v4l2_subdev_selection *sel);
> +
> +int vsp1_rwpf_set_selection(struct v4l2_subdev *subdev,
> +			    struct v4l2_subdev_pad_config *cfg,
> +			    struct v4l2_subdev_selection *sel);

You can remove the white lines between the functions as an indication t=
hey=20
belong to the same group, and I'd add a white line here.

>  /**
>   * vsp1_rwpf_set_memory - Configure DMA addresses for a [RW]PF
>   * @rwpf: the [RW]PF instance
> diff --git a/drivers/media/platform/vsp1/vsp1_wpf.c
> b/drivers/media/platform/vsp1/vsp1_wpf.c index 6c91eaa..75fe7de 10064=
4
> --- a/drivers/media/platform/vsp1/vsp1_wpf.c
> +++ b/drivers/media/platform/vsp1/vsp1_wpf.c
> @@ -62,13 +62,23 @@ static int wpf_s_stream(struct v4l2_subdev *subde=
v, int
> enable) * V4L2 Subdevice Operations
>   */
>=20
> +const struct v4l2_subdev_pad_ops vsp1_wpf_pad_ops =3D {

This should be static const.

> +	.init_cfg =3D vsp1_entity_init_cfg,
> +	.enum_mbus_code =3D vsp1_rwpf_enum_mbus_code,
> +	.enum_frame_size =3D vsp1_rwpf_enum_frame_size,
> +	.get_fmt =3D vsp1_subdev_get_pad_format,
> +	.set_fmt =3D vsp1_rwpf_set_format,
> +	.get_selection =3D vsp1_rwpf_get_selection,
> +	.set_selection =3D vsp1_rwpf_set_selection,
> +};
> +
>  static struct v4l2_subdev_video_ops wpf_video_ops =3D {
>  	.s_stream =3D wpf_s_stream,
>  };
>=20
>  static struct v4l2_subdev_ops wpf_ops =3D {
>  	.video	=3D &wpf_video_ops,
> -	.pad    =3D &vsp1_rwpf_pad_ops,
> +	.pad    =3D &vsp1_wpf_pad_ops,
>  };
>=20
>  /*
> ---------------------------------------------------------------------=
------
> --

--=20
Regards,

Laurent Pinchart
