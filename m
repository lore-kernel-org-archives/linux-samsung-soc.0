From: Inki Dae <inki.dae@samsung.com>
Subject: Re: [PATCH 3/3] drm/exynos: decon: clean up interface type
Date: Tue, 12 Apr 2016 09:40:26 +0900
Message-ID: <570C43FA.6070009@samsung.com>
References: <1459844864-12065-1-git-send-email-inki.dae@samsung.com>
 <1459844864-12065-4-git-send-email-inki.dae@samsung.com>
 <57039C8C.6050505@samsung.com>
 <CAAQKjZN2sfE+QQ1qnxKEfbApK9+bSFjZCr76j1Tv2jekWGOf_g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:50458 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755218AbcDLAk3 convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 11 Apr 2016 20:40:29 -0400
Received: from epcpsbgr5.samsung.com
 (u145.gpu120.samsung.co.kr [203.254.230.145])
 by mailout2.samsung.com (Oracle Communications Messaging Server 7.0.5.31.0
 64bit (built May  5 2014))
 with ESMTP id <0O5H016KZWJECDC0@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 12 Apr 2016 09:40:26 +0900 (KST)
In-reply-to: <CAAQKjZN2sfE+QQ1qnxKEfbApK9+bSFjZCr76j1Tv2jekWGOf_g@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Inki Dae <daeinki@gmail.com>, Andrzej Hajda <a.hajda@samsung.com>
Cc: DRI mailing list <dri-devel@lists.freedesktop.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>

Hi Andrzej,

2016=EB=85=84 04=EC=9B=94 05=EC=9D=BC 21:52=EC=97=90 Inki Dae =EC=9D=B4=
(=EA=B0=80) =EC=93=B4 =EA=B8=80:
>  Hi Andrzej,
>=20
> 2016-04-05 20:07 GMT+09:00 Andrzej Hajda <a.hajda@samsung.com>:
>> Hi Inki,
>>
>> On 04/05/2016 10:27 AM, Inki Dae wrote:
>>> This patch cleans up interface type relevant codes.
>>>
>>> Trigger mode is determinded only by i80 mode, which isn't
>>> related to Display types - HDMI or Display controller.
>>> So this patch makes the trigger mode to be set only in case of
>>> i80 mode.
>>
>> With this patch HDMI path image has serious synchronization problems=
=2E
>> Exynos5433 documentation says that HDMI Timing Generator generates V=
SYNC
>> signal which works as a hardware trigger for DECON-TV, so I guess
>> trigger is required.
>=20
> Right. One I missed. For DECON-TV, seems that HW trigger mode is mand=
atory.

Looks considered already. for DECON-TV, I80_HW_TRG flag is used mandato=
rily,
	.compatible =3D "samsung,exynos5433-decon-tv",
	.data =3D (void *)(I80_HW_TRG | IFTYPE_HDMI)

>>
>> Btw, I think it could be good to remove suffixes I80_RGV from
>> TRIGCON_HWTRIGEN_I80_RGB and TRIGCON_HWTRIGMASK_I80_RGB - they are
>> misleading and differ from documentation.
>=20
> Indeed. Looked strange when I wrote the suffixes.

will send another cleanup patch.

Thanks,
Inki Dae

>=20
>>
>> As far as I have tested I80 mode works OK on Decon5433.
>=20
> Thanks for testing.
> Inki Dae
>=20
>>
>> Regards
>> Andrzej
>>
>>>
>>> Signed-off-by: Inki Dae <inki.dae@samsung.com>
>>> ---
>>>  drivers/gpu/drm/exynos/exynos5433_drm_decon.c | 53 ++++++++++++++-=
------------
>>>  1 file changed, 27 insertions(+), 26 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/exynos/exynos5433_drm_decon.c b/driver=
s/gpu/drm/exynos/exynos5433_drm_decon.c
>>> index 5245bc5..5922e99 100644
>>> --- a/drivers/gpu/drm/exynos/exynos5433_drm_decon.c
>>> +++ b/drivers/gpu/drm/exynos/exynos5433_drm_decon.c
>>> @@ -28,6 +28,10 @@
>>>  #define WINDOWS_NR   3
>>>  #define MIN_FB_WIDTH_FOR_16WORD_BURST        128
>>>
>>> +#define IFTYPE_I80   (1 << 0)
>>> +#define I80_HW_TRG   (1 << 1)
>>> +#define IFTYPE_HDMI  (1 << 2)
>>> +
>>>  static const char * const decon_clks_name[] =3D {
>>>       "pclk",
>>>       "aclk_decon",
>>> @@ -38,12 +42,6 @@ static const char * const decon_clks_name[] =3D =
{
>>>       "sclk_decon_eclk",
>>>  };
>>>
>>> -enum decon_iftype {
>>> -     IFTYPE_RGB,
>>> -     IFTYPE_I80,
>>> -     IFTYPE_HDMI
>>> -};
>>> -
>>>  enum decon_flag_bits {
>>>       BIT_CLKS_ENABLED,
>>>       BIT_IRQS_ENABLED,
>>> @@ -61,7 +59,7 @@ struct decon_context {
>>>       struct clk                      *clks[ARRAY_SIZE(decon_clks_n=
ame)];
>>>       int                             pipe;
>>>       unsigned long                   flags;
>>> -     enum decon_iftype               out_type;
>>> +     unsigned int                    out_type;
>>>       int                             first_win;
>>>  };
>>>
>>> @@ -95,7 +93,7 @@ static int decon_enable_vblank(struct exynos_drm_=
crtc *crtc)
>>>
>>>       if (!test_and_set_bit(BIT_IRQS_ENABLED, &ctx->flags)) {
>>>               val =3D VIDINTCON0_INTEN;
>>> -             if (ctx->out_type =3D=3D IFTYPE_I80)
>>> +             if (ctx->out_type & IFTYPE_I80)
>>>                       val |=3D VIDINTCON0_FRAMEDONE;
>>>               else
>>>                       val |=3D VIDINTCON0_INTFRMEN;
>>> @@ -119,7 +117,7 @@ static void decon_disable_vblank(struct exynos_=
drm_crtc *crtc)
>>>
>>>  static void decon_setup_trigger(struct decon_context *ctx)
>>>  {
>>> -     u32 val =3D (ctx->out_type !=3D IFTYPE_HDMI)
>>> +     u32 val =3D !(ctx->out_type & I80_HW_TRG)
>>>               ? TRIGCON_TRIGEN_PER_F | TRIGCON_TRIGEN_F |
>>>                 TRIGCON_TE_AUTO_MASK | TRIGCON_SWTRIGEN
>>>               : TRIGCON_TRIGEN_PER_F | TRIGCON_TRIGEN_F |
>>> @@ -136,7 +134,7 @@ static void decon_commit(struct exynos_drm_crtc=
 *crtc)
>>>       if (test_bit(BIT_SUSPENDED, &ctx->flags))
>>>               return;
>>>
>>> -     if (ctx->out_type =3D=3D IFTYPE_HDMI) {
>>> +     if (ctx->out_type & IFTYPE_HDMI) {
>>>               m->crtc_hsync_start =3D m->crtc_hdisplay + 10;
>>>               m->crtc_hsync_end =3D m->crtc_htotal - 92;
>>>               m->crtc_vsync_start =3D m->crtc_vdisplay + 1;
>>> @@ -151,17 +149,20 @@ static void decon_commit(struct exynos_drm_cr=
tc *crtc)
>>>
>>>       /* lcd on and use command if */
>>>       val =3D VIDOUT_LCD_ON;
>>> -     if (ctx->out_type =3D=3D IFTYPE_I80)
>>> +     if (ctx->out_type & IFTYPE_I80) {
>>>               val |=3D VIDOUT_COMMAND_IF;
>>> -     else
>>> +             decon_setup_trigger(ctx);
>>> +     } else {
>>>               val |=3D VIDOUT_RGB_IF;
>>> +     }
>>> +
>>>       writel(val, ctx->addr + DECON_VIDOUTCON0);
>>>
>>>       val =3D VIDTCON2_LINEVAL(m->vdisplay - 1) |
>>>               VIDTCON2_HOZVAL(m->hdisplay - 1);
>>>       writel(val, ctx->addr + DECON_VIDTCON2);
>>>
>>> -     if (ctx->out_type !=3D IFTYPE_I80) {
>>> +     if (!(ctx->out_type & IFTYPE_I80)) {
>>>               val =3D VIDTCON00_VBPD_F(
>>>                               m->crtc_vtotal - m->crtc_vsync_end - =
1) |
>>>                       VIDTCON00_VFPD_F(
>>> @@ -183,8 +184,6 @@ static void decon_commit(struct exynos_drm_crtc=
 *crtc)
>>>               writel(val, ctx->addr + DECON_VIDTCON11);
>>>       }
>>>
>>> -     decon_setup_trigger(ctx);
>>> -
>>>       /* enable output and display signal */
>>>       decon_set_bits(ctx, DECON_VIDCON0, VIDCON0_ENVID | VIDCON0_EN=
VID_F, ~0);
>>>  }
>>> @@ -300,7 +299,7 @@ static void decon_update_plane(struct exynos_dr=
m_crtc *crtc,
>>>       val =3D dma_addr + pitch * state->src.h;
>>>       writel(val, ctx->addr + DECON_VIDW0xADD1B0(win));
>>>
>>> -     if (ctx->out_type !=3D IFTYPE_HDMI)
>>> +     if (!(ctx->out_type & IFTYPE_HDMI))
>>>               val =3D BIT_VAL(pitch - state->crtc.w * bpp, 27, 14)
>>>                       | BIT_VAL(state->crtc.w * bpp, 13, 0);
>>>       else
>>> @@ -348,7 +347,7 @@ static void decon_atomic_flush(struct exynos_dr=
m_crtc *crtc)
>>>       for (i =3D ctx->first_win; i < WINDOWS_NR; i++)
>>>               decon_shadow_protect_win(ctx, i, false);
>>>
>>> -     if (ctx->out_type =3D=3D IFTYPE_I80)
>>> +     if (ctx->out_type & IFTYPE_I80)
>>>               set_bit(BIT_WIN_UPDATED, &ctx->flags);
>>>  }
>>>
>>> @@ -374,7 +373,7 @@ static void decon_swreset(struct decon_context =
*ctx)
>>>
>>>       WARN(tries =3D=3D 0, "failed to software reset DECON\n");
>>>
>>> -     if (ctx->out_type !=3D IFTYPE_HDMI)
>>> +     if (!(ctx->out_type & IFTYPE_HDMI))
>>>               return;
>>>
>>>       writel(VIDCON0_CLKVALUP | VIDCON0_VLCKFREE, ctx->addr + DECON=
_VIDCON0);
>>> @@ -383,7 +382,9 @@ static void decon_swreset(struct decon_context =
*ctx)
>>>       writel(VIDCON1_VCLK_RUN_VDEN_DISABLE, ctx->addr + DECON_VIDCO=
N1);
>>>       writel(CRCCTRL_CRCEN | CRCCTRL_CRCSTART_F | CRCCTRL_CRCCLKEN,
>>>              ctx->addr + DECON_CRCCTRL);
>>> -     decon_setup_trigger(ctx);
>>> +
>>> +     if (ctx->out_type & IFTYPE_I80)
>>> +             decon_setup_trigger(ctx);
>>>  }
>>>
>>>  static void decon_enable(struct exynos_drm_crtc *crtc)
>>> @@ -509,7 +510,7 @@ static int decon_bind(struct device *dev, struc=
t device *master, void *data)
>>>       }
>>>
>>>       exynos_plane =3D &ctx->planes[ctx->first_win];
>>> -     out_type =3D (ctx->out_type =3D=3D IFTYPE_HDMI) ? EXYNOS_DISP=
LAY_TYPE_HDMI
>>> +     out_type =3D (ctx->out_type & IFTYPE_HDMI) ? EXYNOS_DISPLAY_T=
YPE_HDMI
>>>                                                 : EXYNOS_DISPLAY_TY=
PE_LCD;
>>>       ctx->crtc =3D exynos_drm_crtc_create(drm_dev, &exynos_plane->=
base,
>>>                                       ctx->pipe, out_type,
>>> @@ -617,11 +618,11 @@ static const struct dev_pm_ops exynos5433_dec=
on_pm_ops =3D {
>>>  static const struct of_device_id exynos5433_decon_driver_dt_match[=
] =3D {
>>>       {
>>>               .compatible =3D "samsung,exynos5433-decon",
>>> -             .data =3D (void *)IFTYPE_RGB
>>> +             .data =3D (void *)I80_HW_TRG
>>>       },
>>>       {
>>>               .compatible =3D "samsung,exynos5433-decon-tv",
>>> -             .data =3D (void *)IFTYPE_HDMI
>>> +             .data =3D (void *)(I80_HW_TRG | IFTYPE_HDMI)
>>>       },
>>>       {},
>>>  };
>>> @@ -644,12 +645,12 @@ static int exynos5433_decon_probe(struct plat=
form_device *pdev)
>>>       ctx->dev =3D dev;
>>>
>>>       of_id =3D of_match_device(exynos5433_decon_driver_dt_match, &=
pdev->dev);
>>> -     ctx->out_type =3D (enum decon_iftype)of_id->data;
>>> +     ctx->out_type =3D (unsigned int)of_id->data;
>>>
>>> -     if (ctx->out_type =3D=3D IFTYPE_HDMI)
>>> +     if (ctx->out_type & IFTYPE_HDMI)
>>>               ctx->first_win =3D 1;
>>>       else if (of_get_child_by_name(dev->of_node, "i80-if-timings")=
)
>>> -             ctx->out_type =3D IFTYPE_I80;
>>> +             ctx->out_type |=3D IFTYPE_I80;
>>>
>>>       for (i =3D 0; i < ARRAY_SIZE(decon_clks_name); i++) {
>>>               struct clk *clk;
>>> @@ -674,7 +675,7 @@ static int exynos5433_decon_probe(struct platfo=
rm_device *pdev)
>>>       }
>>>
>>>       res =3D platform_get_resource_byname(pdev, IORESOURCE_IRQ,
>>> -                     (ctx->out_type =3D=3D IFTYPE_I80) ? "lcd_sys"=
 : "vsync");
>>> +                     (ctx->out_type & IFTYPE_I80) ? "lcd_sys" : "v=
sync");
>>>       if (!res) {
>>>               dev_err(dev, "cannot find IRQ resource\n");
>>>               return -ENXIO;
>>>
>>
>> _______________________________________________
>> dri-devel mailing list
>> dri-devel@lists.freedesktop.org
>> https://lists.freedesktop.org/mailman/listinfo/dri-devel
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsu=
ng-soc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>=20
>=20
