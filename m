From: Kyungmin Park <kmpark@infradead.org>
Subject: Re: [PATCH] [media] s5p-fimc: fix main scaler SFRs depends on FIMC version
Date: Fri, 17 Dec 2010 21:46:18 +0900
Message-ID: <AANLkTinFVP56z4dcwuQimi1hPG+vmThhDn95X7kGpcVy@mail.gmail.com>
References: <1292571836-10684-1-git-send-email-khw0178.kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ww0-f44.google.com ([74.125.82.44]:61422 "EHLO
	mail-ww0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754268Ab0LQMqU convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 17 Dec 2010 07:46:20 -0500
In-Reply-To: <1292571836-10684-1-git-send-email-khw0178.kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Hyunwoong Kim <khw0178.kim@samsung.com>
Cc: linux-media@vger.kernel.org, linux-samsung-soc@vger.kernel.org, s.nawrocki@samsung.com

On Fri, Dec 17, 2010 at 4:43 PM, Hyunwoong Kim <khw0178.kim@samsung.com=
> wrote:
> The main scaler has four SFRs for main scaler ratio depends on FIMC v=
ersion.
> FIMC 4.x has only two SFRs and FIMC 5.x has four SFRs for main scaler=
=2E
> Those are MainHorRatio, MainHorRatio_ext, MainVerRatio and MainverRat=
io_ext.
>
> The FIMC 5.x has 15 bit resolution for scaling ratio as below.
> {MainHorRatio,MainHorRatio_ext} =3D {[14:6],[5:0]}.
> {MainVerRatio,MainVerRatio_ext} =3D {[14:6],[5:0]}.
> MainHorRatio =3D CISCCTRL[24:16], MainHorRatio_ext =3D CIEXTEN[15:10]
> MainVerRatio =3D CISCCTRL[8:0], =A0 MainVerRatio_ext =3D CIEXTEN[5:0]
>
> This patch supports FIMC 4.x and FIMC 5.x using platform_device_id::d=
river_data.
>
> Signed-off-by: Hyunwoong Kim <khw0178.kim@samsung.com>
> Reviewed-by: Jonghun Han <jonghun.han@samsung.com>
> ---
> =A0drivers/media/video/s5p-fimc/fimc-capture.c | =A0 =A07 +++-
> =A0drivers/media/video/s5p-fimc/fimc-core.c =A0 =A0| =A0 21 +++++++++=
+--
> =A0drivers/media/video/s5p-fimc/fimc-core.h =A0 =A0| =A0 =A05 ++-
> =A0drivers/media/video/s5p-fimc/fimc-reg.c =A0 =A0 | =A0 48 +++++++++=
+++++++++++++++--
> =A0drivers/media/video/s5p-fimc/regs-fimc.h =A0 =A0| =A0 10 +++++-
> =A05 files changed, 81 insertions(+), 10 deletions(-)
>
> diff --git a/drivers/media/video/s5p-fimc/fimc-capture.c b/drivers/me=
dia/video/s5p-fimc/fimc-capture.c
> index b216530..ca48e02 100644
> --- a/drivers/media/video/s5p-fimc/fimc-capture.c
> +++ b/drivers/media/video/s5p-fimc/fimc-capture.c
> @@ -208,6 +208,7 @@ static int start_streaming(struct vb2_queue *q)
> =A0 =A0 =A0 =A0struct fimc_ctx *ctx =3D q->drv_priv;
> =A0 =A0 =A0 =A0struct fimc_dev *fimc =3D ctx->fimc_dev;
> =A0 =A0 =A0 =A0struct s3c_fimc_isp_info *isp_info;
> + =A0 =A0 =A0 struct samsung_fimc_variant *variant =3D ctx->fimc_dev-=
>variant;
> =A0 =A0 =A0 =A0int ret;
>
> =A0 =A0 =A0 =A0ret =3D v4l2_subdev_call(fimc->vid_cap.sd, video, s_st=
ream, 1);
> @@ -230,7 +231,11 @@ static int start_streaming(struct vb2_queue *q)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0return ret;
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0}
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0fimc_hw_set_input_path(ctx);
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 fimc_hw_set_scaler(ctx);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 fimc_hw_set_prescaler(ctx);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (!variant->has_mainscaler_ext)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 fimc_hw_set_mainscaler(=
ctx);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 else
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 fimc_hw_set_mainscaler_=
ext(ctx);
It's just personal preference, I don't like the negative variable check=
,
how about this?

                    if (variant->has_mainscaler_ext)
                           fimc_hw_set_mainscaler_ext(ctx);
                    else
                           fimc_hw_set_mainscaler(ctx);


> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0fimc_hw_set_target_format(ctx);
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0fimc_hw_set_rotation(ctx);
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0fimc_hw_set_effect(ctx);
> diff --git a/drivers/media/video/s5p-fimc/fimc-core.c b/drivers/media=
/video/s5p-fimc/fimc-core.c
> index 7f56987..3cfa4b6 100644
> --- a/drivers/media/video/s5p-fimc/fimc-core.c
> +++ b/drivers/media/video/s5p-fimc/fimc-core.c
> @@ -246,6 +246,7 @@ int fimc_set_scaler_info(struct fimc_ctx *ctx)
> =A0 =A0 =A0 =A0struct fimc_scaler *sc =3D &ctx->scaler;
> =A0 =A0 =A0 =A0struct fimc_frame *s_frame =3D &ctx->s_frame;
> =A0 =A0 =A0 =A0struct fimc_frame *d_frame =3D &ctx->d_frame;
> + =A0 =A0 =A0 struct samsung_fimc_variant *variant =3D ctx->fimc_dev-=
>variant;
> =A0 =A0 =A0 =A0int tx, ty, sx, sy;
> =A0 =A0 =A0 =A0int ret;
>
> @@ -284,8 +285,13 @@ int fimc_set_scaler_info(struct fimc_ctx *ctx)
> =A0 =A0 =A0 =A0sc->pre_dst_width =3D sx / sc->pre_hratio;
> =A0 =A0 =A0 =A0sc->pre_dst_height =3D sy / sc->pre_vratio;
>
> - =A0 =A0 =A0 sc->main_hratio =3D (sx << 8) / (tx << sc->hfactor);
> - =A0 =A0 =A0 sc->main_vratio =3D (sy << 8) / (ty << sc->vfactor);
> + =A0 =A0 =A0 if (!variant->has_mainscaler_ext) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 sc->main_hratio =3D (sx << 8) / (tx << =
sc->hfactor);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 sc->main_vratio =3D (sy << 8) / (ty << =
sc->vfactor);
> + =A0 =A0 =A0 } else {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 sc->main_hratio =3D (sx << 14) / (tx <<=
 sc->hfactor);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 sc->main_vratio =3D (sy << 14) / (ty <<=
 sc->vfactor);
> + =A0 =A0 =A0 }
Ditto
>
> =A0 =A0 =A0 =A0sc->scaleup_h =3D (tx >=3D sx) ? 1 : 0;
> =A0 =A0 =A0 =A0sc->scaleup_v =3D (ty >=3D sy) ? 1 : 0;
> @@ -569,6 +575,7 @@ static void fimc_dma_run(void *priv)
> =A0{
> =A0 =A0 =A0 =A0struct fimc_ctx *ctx =3D priv;
> =A0 =A0 =A0 =A0struct fimc_dev *fimc;
> + =A0 =A0 =A0 struct samsung_fimc_variant *variant =3D ctx->fimc_dev-=
>variant;
> =A0 =A0 =A0 =A0unsigned long flags;
> =A0 =A0 =A0 =A0u32 ret;
>
> @@ -601,7 +608,12 @@ static void fimc_dma_run(void *priv)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0err("Scaler setup erro=
r");
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0goto dma_unlock;
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0}
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 fimc_hw_set_scaler(ctx);
> +
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 fimc_hw_set_prescaler(ctx);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (!variant->has_mainscaler_ext)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 fimc_hw_set_mainscaler(=
ctx);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 else
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 fimc_hw_set_mainscaler_=
ext(ctx);
ditto
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0fimc_hw_set_target_format(ctx);
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0fimc_hw_set_rotation(ctx);
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0fimc_hw_set_effect(ctx);
> @@ -1722,6 +1734,7 @@ static struct samsung_fimc_variant fimc1_varian=
t_s5pv210 =3D {
> =A0 =A0 =A0 =A0.pix_hoff =A0 =A0 =A0 =A0=3D 1,
> =A0 =A0 =A0 =A0.has_inp_rot =A0 =A0 =3D 1,
> =A0 =A0 =A0 =A0.has_out_rot =A0 =A0 =3D 1,
> + =A0 =A0 =A0 .has_mainscaler_ext =3D 1,
> =A0 =A0 =A0 =A0.min_inp_pixsize =3D 16,
> =A0 =A0 =A0 =A0.min_out_pixsize =3D 16,
> =A0 =A0 =A0 =A0.hor_offs_align =A0=3D 1,
> @@ -1743,6 +1756,7 @@ static struct samsung_fimc_variant fimc0_varian=
t_s5pv310 =3D {
> =A0 =A0 =A0 =A0.has_inp_rot =A0 =A0 =3D 1,
> =A0 =A0 =A0 =A0.has_out_rot =A0 =A0 =3D 1,
> =A0 =A0 =A0 =A0.has_cistatus2 =A0 =3D 1,
> + =A0 =A0 =A0 .has_mainscaler_ext =3D 1,
> =A0 =A0 =A0 =A0.min_inp_pixsize =3D 16,
> =A0 =A0 =A0 =A0.min_out_pixsize =3D 16,
> =A0 =A0 =A0 =A0.hor_offs_align =A0=3D 1,
> @@ -1753,6 +1767,7 @@ static struct samsung_fimc_variant fimc0_varian=
t_s5pv310 =3D {
> =A0static struct samsung_fimc_variant fimc2_variant_s5pv310 =3D {
> =A0 =A0 =A0 =A0.pix_hoff =A0 =A0 =A0 =A0=3D 1,
> =A0 =A0 =A0 =A0.has_cistatus2 =A0 =3D 1,
> + =A0 =A0 =A0 .has_mainscaler_ext =3D 1,
> =A0 =A0 =A0 =A0.min_inp_pixsize =3D 16,
> =A0 =A0 =A0 =A0.min_out_pixsize =3D 16,
> =A0 =A0 =A0 =A0.hor_offs_align =A0=3D 1,
> diff --git a/drivers/media/video/s5p-fimc/fimc-core.h b/drivers/media=
/video/s5p-fimc/fimc-core.h
> index 4efc1a1..dd5b949 100644
> --- a/drivers/media/video/s5p-fimc/fimc-core.h
> +++ b/drivers/media/video/s5p-fimc/fimc-core.h
> @@ -380,6 +380,7 @@ struct samsung_fimc_variant {
> =A0 =A0 =A0 =A0unsigned int =A0 =A0has_inp_rot:1;
> =A0 =A0 =A0 =A0unsigned int =A0 =A0has_out_rot:1;
> =A0 =A0 =A0 =A0unsigned int =A0 =A0has_cistatus2:1;
> + =A0 =A0 =A0 unsigned int =A0 =A0has_mainscaler_ext:1;
> =A0 =A0 =A0 =A0struct fimc_pix_limit *pix_limit;
> =A0 =A0 =A0 =A0u16 =A0 =A0 =A0 =A0 =A0 =A0 min_inp_pixsize;
> =A0 =A0 =A0 =A0u16 =A0 =A0 =A0 =A0 =A0 =A0 min_out_pixsize;
> @@ -575,7 +576,9 @@ void fimc_hw_set_target_format(struct fimc_ctx *c=
tx);
> =A0void fimc_hw_set_out_dma(struct fimc_ctx *ctx);
> =A0void fimc_hw_en_lastirq(struct fimc_dev *fimc, int enable);
> =A0void fimc_hw_en_irq(struct fimc_dev *fimc, int enable);
> -void fimc_hw_set_scaler(struct fimc_ctx *ctx);
> +void fimc_hw_set_prescaler(struct fimc_ctx *ctx);
> +void fimc_hw_set_mainscaler(struct fimc_ctx *ctx);
> +void fimc_hw_set_mainscaler_ext(struct fimc_ctx *ctx);
> =A0void fimc_hw_en_capture(struct fimc_ctx *ctx);
> =A0void fimc_hw_set_effect(struct fimc_ctx *ctx);
> =A0void fimc_hw_set_in_dma(struct fimc_ctx *ctx);
> diff --git a/drivers/media/video/s5p-fimc/fimc-reg.c b/drivers/media/=
video/s5p-fimc/fimc-reg.c
> index 5ed8f06..bc75298 100644
> --- a/drivers/media/video/s5p-fimc/fimc-reg.c
> +++ b/drivers/media/video/s5p-fimc/fimc-reg.c
> @@ -249,7 +249,7 @@ void fimc_hw_en_lastirq(struct fimc_dev *dev, int=
 enable)
> =A0 =A0 =A0 =A0writel(cfg, dev->regs + S5P_CIOCTRL);
> =A0}
>
> -static void fimc_hw_set_prescaler(struct fimc_ctx *ctx)
> +void fimc_hw_set_prescaler(struct fimc_ctx *ctx)
> =A0{
> =A0 =A0 =A0 =A0struct fimc_dev *dev =3D =A0ctx->fimc_dev;
> =A0 =A0 =A0 =A0struct fimc_scaler *sc =3D &ctx->scaler;
> @@ -267,7 +267,7 @@ static void fimc_hw_set_prescaler(struct fimc_ctx=
 *ctx)
> =A0 =A0 =A0 =A0writel(cfg, dev->regs + S5P_CISCPREDST);
> =A0}
>
> -void fimc_hw_set_scaler(struct fimc_ctx *ctx)
> +static void fimc_hw_set_scaler(struct fimc_ctx *ctx)
> =A0{
> =A0 =A0 =A0 =A0struct fimc_dev *dev =3D ctx->fimc_dev;
> =A0 =A0 =A0 =A0struct fimc_scaler *sc =3D &ctx->scaler;
> @@ -275,8 +275,6 @@ void fimc_hw_set_scaler(struct fimc_ctx *ctx)
> =A0 =A0 =A0 =A0struct fimc_frame *dst_frame =3D &ctx->d_frame;
> =A0 =A0 =A0 =A0u32 cfg =3D 0;
>
> - =A0 =A0 =A0 fimc_hw_set_prescaler(ctx);
> -
> =A0 =A0 =A0 =A0if (!(ctx->flags & FIMC_COLOR_RANGE_NARROW))
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0cfg |=3D (S5P_CISCCTRL_CSCR2Y_WIDE | S=
5P_CISCCTRL_CSCY2R_WIDE);
>
> @@ -316,15 +314,57 @@ void fimc_hw_set_scaler(struct fimc_ctx *ctx)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0cfg |=3D S5P_CISCCTRL_=
INTERLACE;
> =A0 =A0 =A0 =A0}
>
> + =A0 =A0 =A0 writel(cfg, dev->regs + S5P_CISCCTRL);
> +}
> +
> +void fimc_hw_set_mainscaler(struct fimc_ctx *ctx)
> +{
> + =A0 =A0 =A0 struct fimc_dev *dev =3D ctx->fimc_dev;
> + =A0 =A0 =A0 struct fimc_scaler *sc =3D &ctx->scaler;
> + =A0 =A0 =A0 u32 cfg;
> +
> =A0 =A0 =A0 =A0dbg("main_hratio=3D 0x%X =A0main_vratio=3D 0x%X",
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0sc->main_hratio, sc->main_vratio);
>
> + =A0 =A0 =A0 fimc_hw_set_scaler(ctx);
> +
> + =A0 =A0 =A0 cfg =3D readl(dev->regs + S5P_CISCCTRL);
> + =A0 =A0 =A0 cfg &=3D ~S5P_CISCCTRL_SC_HORRATIO_MASK;
> + =A0 =A0 =A0 cfg &=3D ~S5P_CISCCTRL_SC_VERRATIO_MASK;
> =A0 =A0 =A0 =A0cfg |=3D S5P_CISCCTRL_SC_HORRATIO(sc->main_hratio);
> =A0 =A0 =A0 =A0cfg |=3D S5P_CISCCTRL_SC_VERRATIO(sc->main_vratio);
>
> =A0 =A0 =A0 =A0writel(cfg, dev->regs + S5P_CISCCTRL);
> =A0}
>
> +void fimc_hw_set_mainscaler_ext(struct fimc_ctx *ctx)
> +{
> + =A0 =A0 =A0 struct fimc_dev *dev =3D ctx->fimc_dev;
> + =A0 =A0 =A0 struct fimc_scaler *sc =3D &ctx->scaler;
> + =A0 =A0 =A0 u32 cfg, cfg_ext;
> +
> + =A0 =A0 =A0 dbg("main_hratio=3D 0x%X =A0main_vratio=3D 0x%X",
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 sc->main_hratio, sc->main_vratio);
> +
> + =A0 =A0 =A0 fimc_hw_set_scaler(ctx);
> +
> + =A0 =A0 =A0 cfg =3D readl(dev->regs + S5P_CISCCTRL);
> + =A0 =A0 =A0 cfg &=3D ~S5P_CISCCTRL_SC_HORRATIO_MASK;
> + =A0 =A0 =A0 cfg &=3D ~S5P_CISCCTRL_SC_VERRATIO_MASK;
> + =A0 =A0 =A0 cfg |=3D S5P_CISCCTRL_SC_HORRATIO_EXT(sc->main_hratio);
> + =A0 =A0 =A0 cfg |=3D S5P_CISCCTRL_SC_VERRATIO_EXT(sc->main_vratio);
> +
> + =A0 =A0 =A0 writel(cfg, dev->regs + S5P_CISCCTRL);
> +
> + =A0 =A0 =A0 cfg_ext =3D readl(dev->regs + S5P_CIEXTEN);
> + =A0 =A0 =A0 cfg_ext &=3D ~S5P_CIEXTEN_MAINHORRATIO_EXT_MASK;
> + =A0 =A0 =A0 cfg_ext &=3D ~S5P_CIEXTEN_MAINVERRATIO_EXT_MASK;
> + =A0 =A0 =A0 cfg_ext |=3D S5P_CIEXTEN_MAINHORRATIO_EXT(sc->main_hrat=
io);
> + =A0 =A0 =A0 cfg_ext |=3D S5P_CIEXTEN_MAINVERRATIO_EXT(sc->main_vrat=
io);
> +
> + =A0 =A0 =A0 writel(cfg_ext, dev->regs + S5P_CIEXTEN);
> +}
> +
> =A0void fimc_hw_en_capture(struct fimc_ctx *ctx)
> =A0{
> =A0 =A0 =A0 =A0struct fimc_dev *dev =3D ctx->fimc_dev;
> diff --git a/drivers/media/video/s5p-fimc/regs-fimc.h b/drivers/media=
/video/s5p-fimc/regs-fimc.h
> index 57e33f8..4d1abd1 100644
> --- a/drivers/media/video/s5p-fimc/regs-fimc.h
> +++ b/drivers/media/video/s5p-fimc/regs-fimc.h
> @@ -141,6 +141,10 @@
> =A0#define S5P_CISCCTRL_ONE2ONE =A0 =A0 =A0 =A0 =A0 (1 << 9)
> =A0#define S5P_CISCCTRL_SC_HORRATIO(x) =A0 =A0((x) << 16)
> =A0#define S5P_CISCCTRL_SC_VERRATIO(x) =A0 =A0((x) << 0)
> +#define S5P_CISCCTRL_SC_HORRATIO_MASK =A0(0x1ff << 16)
> +#define S5P_CISCCTRL_SC_VERRATIO_MASK =A0(0x1ff << 0)
> +#define S5P_CISCCTRL_SC_HORRATIO_EXT(x) ((x >> 6) << 16)
> +#define S5P_CISCCTRL_SC_VERRATIO_EXT(x) =A0 =A0 =A0 =A0((x >> 6) << =
0)
>
> =A0/* Target area */
> =A0#define S5P_CITAREA =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A00x5c
> @@ -262,7 +266,11 @@
> =A0#define S5P_ORIG_SIZE_HOR(x) =A0 =A0 =A0 =A0 =A0 ((x) << 0)
>
> =A0/* Real output DMA image size (extension register) */
> -#define S5P_CIEXTEN =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A00x188
> +#define S5P_CIEXTEN =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A00x188
> +#define S5P_CIEXTEN_MAINHORRATIO_EXT(x) =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0(((x) & 0x3f) << 10)
> +#define S5P_CIEXTEN_MAINVERRATIO_EXT(x) =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0((x) & 0x3f)
> +#define S5P_CIEXTEN_MAINHORRATIO_EXT_MASK =A0 =A0 =A0(0x3f << 10)
> +#define S5P_CIEXTEN_MAINVERRATIO_EXT_MASK =A0 =A0 =A0(0x3f)
>
> =A0#define S5P_CIDMAPARAM =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 0x18c
> =A0#define S5P_CIDMAPARAM_R_LINEAR =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0(0 =
<< 29)
> --
> 1.6.2.5

Thank you,
Kyungmin Park
