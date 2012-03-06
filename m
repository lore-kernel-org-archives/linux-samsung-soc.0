From: Jingoo Han <jg1.han@samsung.com>
Subject: RE: [PATCH 1/3] video: s3c-fb: move video interface timing out of
 window setup data
Date: Tue, 06 Mar 2012 15:22:01 +0900
Message-ID: <002101ccfb61$710d2c70$53278550$%han@samsung.com>
References: <1330789808-8253-1-git-send-email-thomas.abraham@linaro.org>
 <1330789808-8253-2-git-send-email-thomas.abraham@linaro.org>
 <001f01ccfb53$f034ef00$d09ecd00$%han@samsung.com>
 <CAJuYYwToJDXujqjLcY_2cN0M-K0yGzzOcDaFeh+OT_Qx9pPCEQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:30971 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751251Ab2CFGWE convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 6 Mar 2012 01:22:04 -0500
In-reply-to: <CAJuYYwToJDXujqjLcY_2cN0M-K0yGzzOcDaFeh+OT_Qx9pPCEQ@mail.gmail.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Thomas Abraham' <thomas.abraham@linaro.org>
Cc: linux-fbdev@vger.kernel.org, FlorianSchandinat@gmx.de, linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, ben-linux@fluff.org, patches@linaro.org, 'Jingoo Han' <jg1.han@samsung.com>

> -----Original Message-----
> From: Thomas Abraham [mailto:thomas.abraham@linaro.org]
> Sent: Tuesday, March 06, 2012 2:26 PM
> To: Jingoo Han
> Cc: linux-fbdev@vger.kernel.org; FlorianSchandinat@gmx.de; linux-sams=
ung-soc@vger.kernel.org;
> kgene.kim@samsung.com; ben-linux@fluff.org; patches@linaro.org
> Subject: Re: [PATCH 1/3] video: s3c-fb: move video interface timing o=
ut of window setup data
>=20
> On 6 March 2012 10:15, Jingoo Han <jg1.han@samsung.com> wrote:
>=20
> >> -----Original Message-----
> >> From: Thomas Abraham [mailto:thomas.abraham@linaro.org]
> >> Sent: Sunday, March 04, 2012 12:50 AM
> >> To: linux-fbdev@vger.kernel.org
> >> Cc: FlorianSchandinat@gmx.de; linux-samsung-soc@vger.kernel.org; k=
gene.kim@samsung.com;
> >> jg1.han@samsung.com; ben-linux@fluff.org; patches@linaro.org
> >> Subject: [PATCH 1/3] video: s3c-fb: move video interface timing ou=
t of window setup data
> >>
> >> The video interface timing is independent of the window setup data=
=2E
> >> The resolution of the window can be smaller than that of the lcd
> >> panel to which the video data is output.
> >>
> >> So move the video timing data from the per-window setup data to th=
e
> >> platform specific section in the platform data. This also removes
> >> the restriction that atleast one window should have the same
> >> resolution as that of the panel attached.
> >>
> >> Cc: Ben Dooks <ben-linux@fluff.org>
> >> Cc: Jingoo Han <jg1.han@samsung.com>
> >> Signed-off-by: Thomas Abraham <thomas.abraham@linaro.org>
> >> ---
> >> =A0arch/arm/plat-samsung/include/plat/fb.h | =A0 =A09 ++-
> >> =A0drivers/video/s3c-fb.c =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0| =A0=
106 +++++++++++++++++--------------
> >> =A02 files changed, 63 insertions(+), 52 deletions(-)
> >>
> >> diff --git a/arch/arm/plat-samsung/include/plat/fb.h b/arch/arm/pl=
at-samsung/include/plat/fb.h
> >> index 0fedf47..39d6bd7 100644
> >> --- a/arch/arm/plat-samsung/include/plat/fb.h
> >> +++ b/arch/arm/plat-samsung/include/plat/fb.h
> >> @@ -24,15 +24,16 @@
> >>
> >> =A0/**
> >> =A0 * struct s3c_fb_pd_win - per window setup data
> >> - * @win_mode: The display parameters to initialise (not for windo=
w 0)
> >> + * @xres =A0 =A0 : The window X size.
> >> + * @yres =A0 =A0 : The window Y size.
> >> =A0 * @virtual_x: The virtual X size.
> >> =A0 * @virtual_y: The virtual Y size.
> >> =A0 */
> >> =A0struct s3c_fb_pd_win {
> >> - =A0 =A0 struct fb_videomode =A0 =A0 win_mode;
> >> -
> >> =A0 =A0 =A0 unsigned short =A0 =A0 =A0 =A0 =A0default_bpp;
> >> =A0 =A0 =A0 unsigned short =A0 =A0 =A0 =A0 =A0max_bpp;
> >> + =A0 =A0 unsigned short =A0 =A0 =A0 =A0 =A0xres;
> >> + =A0 =A0 unsigned short =A0 =A0 =A0 =A0 =A0yres;
> >> =A0 =A0 =A0 unsigned short =A0 =A0 =A0 =A0 =A0virtual_x;
> >> =A0 =A0 =A0 unsigned short =A0 =A0 =A0 =A0 =A0virtual_y;
> >> =A0};
> >> @@ -45,6 +46,7 @@ struct s3c_fb_pd_win {
> >> =A0 * @default_win: default window layer number to be used for UI =
layer.
> >> =A0 * @vidcon0: The base vidcon0 values to control the panel data =
format.
> >> =A0 * @vidcon1: The base vidcon1 values to control the panel data =
output.
> >> + * @vtiming: Video timing when connected to a RGB type panel.
> >
> > fb_videomode can be set, even if it is not RGB type panel.
> > In my opinion, it would be better.
> > + * @vtiming: The video timing values to set the interface timing o=
f the panel.
>=20
> The other interface that is supported is the i80 interface. Can these
> timing values be used for i80 interface as well ?

No, you're right. The i80 is not supported.
Please ignore my comment.

>=20
> >
> >> =A0 * @win: The setup data for each hardware window, or NULL for u=
nused.
> >> =A0 * @display_mode: The LCD output display mode.
> >> =A0 *
> >> @@ -58,6 +60,7 @@ struct s3c_fb_platdata {
> >> =A0 =A0 =A0 void =A0 =A0(*setup_gpio)(void);
> >>
> >> =A0 =A0 =A0 struct s3c_fb_pd_win =A0 =A0*win[S3C_FB_MAX_WIN];
> >> + =A0 =A0 struct fb_videomode =A0 =A0 *vtiming;
> >>
> >> =A0 =A0 =A0 u32 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0default=
_win;
> >>
> >> diff --git a/drivers/video/s3c-fb.c b/drivers/video/s3c-fb.c
> >> index 1fb7ddf..8e05d4d 100644
> >> --- a/drivers/video/s3c-fb.c
> >> +++ b/drivers/video/s3c-fb.c
> >> @@ -495,7 +495,6 @@ static int s3c_fb_set_par(struct fb_info *info=
)
> >> =A0 =A0 =A0 u32 alpha =3D 0;
> >> =A0 =A0 =A0 u32 data;
> >> =A0 =A0 =A0 u32 pagewidth;
> >> - =A0 =A0 int clkdiv;
> >>
> >> =A0 =A0 =A0 dev_dbg(sfb->dev, "setting framebuffer parameters\n");
> >>
> >> @@ -532,46 +531,9 @@ static int s3c_fb_set_par(struct fb_info *inf=
o)
> >> =A0 =A0 =A0 /* disable the window whilst we update it */
> >> =A0 =A0 =A0 writel(0, regs + WINCON(win_no));
> >>
> >> - =A0 =A0 /* use platform specified window as the basis for the lc=
d timings */
> >> -
> >> - =A0 =A0 if (win_no =3D=3D sfb->pdata->default_win) {
> >> - =A0 =A0 =A0 =A0 =A0 =A0 clkdiv =3D s3c_fb_calc_pixclk(sfb, var->=
pixclock);
> >> -
> >> - =A0 =A0 =A0 =A0 =A0 =A0 data =3D sfb->pdata->vidcon0;
> >> - =A0 =A0 =A0 =A0 =A0 =A0 data &=3D ~(VIDCON0_CLKVAL_F_MASK | VIDC=
ON0_CLKDIR);
> >> -
> >> - =A0 =A0 =A0 =A0 =A0 =A0 if (clkdiv > 1)
> >> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 data |=3D VIDCON0_CLKVAL=
_F(clkdiv-1) | VIDCON0_CLKDIR;
> >> - =A0 =A0 =A0 =A0 =A0 =A0 else
> >> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 data &=3D ~VIDCON0_CLKDI=
R; =A0 =A0 =A0 =A0/* 1:1 clock */
> >> -
> >> - =A0 =A0 =A0 =A0 =A0 =A0 /* write the timing data to the panel */
> >> -
> >> - =A0 =A0 =A0 =A0 =A0 =A0 if (sfb->variant.is_2443)
> >> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 data |=3D (1 << 5);
> >> -
> >> - =A0 =A0 =A0 =A0 =A0 =A0 writel(data, regs + VIDCON0);
> >> -
> >> + =A0 =A0 if (win_no =3D=3D sfb->pdata->default_win)
> >> =A0 =A0 =A0 =A0 =A0 =A0 =A0 s3c_fb_enable(sfb, 1);
> >>
> >> - =A0 =A0 =A0 =A0 =A0 =A0 data =3D VIDTCON0_VBPD(var->upper_margin=
 - 1) |
> >> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0VIDTCON0_VFPD(var->lower_=
margin - 1) |
> >> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0VIDTCON0_VSPW(var->vsync_=
len - 1);
> >> -
> >> - =A0 =A0 =A0 =A0 =A0 =A0 writel(data, regs + sfb->variant.vidtcon=
);
> >> -
> >> - =A0 =A0 =A0 =A0 =A0 =A0 data =3D VIDTCON1_HBPD(var->left_margin =
- 1) |
> >> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0VIDTCON1_HFPD(var->right_=
margin - 1) |
> >> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0VIDTCON1_HSPW(var->hsync_=
len - 1);
> >> -
> >> - =A0 =A0 =A0 =A0 =A0 =A0 /* VIDTCON1 */
> >> - =A0 =A0 =A0 =A0 =A0 =A0 writel(data, regs + sfb->variant.vidtcon=
 + 4);
> >> -
> >> - =A0 =A0 =A0 =A0 =A0 =A0 data =3D VIDTCON2_LINEVAL(var->yres - 1)=
 |
> >> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0VIDTCON2_HOZVAL(var->xres=
 - 1);
> >> - =A0 =A0 =A0 =A0 =A0 =A0 writel(data, regs + sfb->variant.vidtcon=
 + 8);
> >> - =A0 =A0 }
> >> -
> >
> > It looks good.
> > VIDTCON registers don't need to be written whenever s3c_fb_set_par =
is called.
> >
> >> =A0 =A0 =A0 /* write the buffer address */
> >>
> >> =A0 =A0 =A0 /* start and end registers stride is 8 */
> >> @@ -1136,11 +1098,11 @@ static int __devinit s3c_fb_alloc_memory(s=
truct s3c_fb *sfb,
> >>
> >> =A0 =A0 =A0 dev_dbg(sfb->dev, "allocating memory for display\n");
> >>
> >> - =A0 =A0 real_size =3D windata->win_mode.xres * windata->win_mode=
=2Eyres;
> >> + =A0 =A0 real_size =3D windata->xres * windata->yres;
> >> =A0 =A0 =A0 virt_size =3D windata->virtual_x * windata->virtual_y;
> >>
> >> =A0 =A0 =A0 dev_dbg(sfb->dev, "real_size=3D%u (%u.%u), virt_size=3D=
%u (%u.%u)\n",
> >> - =A0 =A0 =A0 =A0 =A0 =A0 real_size, windata->win_mode.xres, winda=
ta->win_mode.yres,
> >> + =A0 =A0 =A0 =A0 =A0 =A0 real_size, windata->xres, windata->yres,
> >> =A0 =A0 =A0 =A0 =A0 =A0 =A0 virt_size, windata->virtual_x, windata=
->virtual_y);
> >>
> >> =A0 =A0 =A0 size =3D (real_size > virt_size) ? real_size : virt_si=
ze;
> >> @@ -1222,7 +1184,7 @@ static int __devinit s3c_fb_probe_win(struct=
 s3c_fb *sfb, unsigned int win_no,
> >> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 struct s3c_fb_win **res)
> >> =A0{
> >> =A0 =A0 =A0 struct fb_var_screeninfo *var;
> >> - =A0 =A0 struct fb_videomode *initmode;
> >> + =A0 =A0 struct fb_videomode initmode;
> >
> > *initmode cannot be used???
> > Can you tell me why pointer type should be changed?
> >
>=20
> The initmode is used to pass video timing to the fb_videomode_to_var(=
)
> function. Each window setup data in platform data included video
> timing information. Since, the video timing data is now moved out of
> per-window data, the xres and yres values have to be setup based on
> the window for which the fb_videomode_to_var() is called. Hence, the
> common timing values is first copied into initmode and then the windo=
w
> specific xres and yres are set. If initmode is a maintained as a
> pointer (to the video timing data in platform data), then any xres an=
d
> yres update to initmode would overwrite the 'constant' video timing.

My point is that variable type 'initmode' can be not changed by using p=
ointer type as follows:

@@ -1243,11 +1243,11 @@ static int __devinit s3c_fb_probe_win(struct s3=
c_fb *sfb, unsigned int win_no,
        }

        windata =3D sfb->pdata->win[win_no];
-       initmode =3D &windata->win_mode;
+       initmode =3D sfb->pdata->vtiming;

        WARN_ON(windata->max_bpp =3D=3D 0);
-       WARN_ON(windata->win_mode.xres =3D=3D 0);
-       WARN_ON(windata->win_mode.yres =3D=3D 0);
+       WARN_ON(windata->xres =3D=3D 0);
+       WARN_ON(windata->yres =3D=3D 0);

        win =3D fbinfo->par;
        *res =3D win;
@@ -1286,6 +1286,8 @@ static int __devinit s3c_fb_probe_win(struct s3c_=
fb *sfb, unsigned int win_no,
        }

        /* setup the initial video mode from the window */
+       initmode->xres =3D windata->xres;
+       initmode->yres =3D windata->yres;
        fb_videomode_to_var(&fbinfo->var, initmode);

        fbinfo->fix.type        =3D FB_TYPE_PACKED_PIXELS;

In this case, you don't need additional change such as following.
-	struct fb_videomode *initmode;
+	struct fb_videomode initmode;
=2E..
-	fb_videomode_to_var(&fbinfo->var, initmode);
+	fb_videomode_to_var(&fbinfo->var, &initmode);

>=20
>=20
> >> =A0 =A0 =A0 struct s3c_fb_pd_win *windata;
> >> =A0 =A0 =A0 struct s3c_fb_win *win;
> >> =A0 =A0 =A0 struct fb_info *fbinfo;
> >> @@ -1243,11 +1205,11 @@ static int __devinit s3c_fb_probe_win(stru=
ct s3c_fb *sfb, unsigned int win_no,
> >> =A0 =A0 =A0 }
> >>
> >> =A0 =A0 =A0 windata =3D sfb->pdata->win[win_no];
> >> - =A0 =A0 initmode =3D &windata->win_mode;
> >> + =A0 =A0 initmode =3D *sfb->pdata->vtiming;
> >>
> >> =A0 =A0 =A0 WARN_ON(windata->max_bpp =3D=3D 0);
> >> - =A0 =A0 WARN_ON(windata->win_mode.xres =3D=3D 0);
> >> - =A0 =A0 WARN_ON(windata->win_mode.yres =3D=3D 0);
> >> + =A0 =A0 WARN_ON(windata->xres =3D=3D 0);
> >> + =A0 =A0 WARN_ON(windata->yres =3D=3D 0);
> >>
> >> =A0 =A0 =A0 win =3D fbinfo->par;
> >> =A0 =A0 =A0 *res =3D win;
> >> @@ -1286,7 +1248,9 @@ static int __devinit s3c_fb_probe_win(struct=
 s3c_fb *sfb, unsigned int win_no,
> >> =A0 =A0 =A0 }
> >>
> >> =A0 =A0 =A0 /* setup the initial video mode from the window */
> >> - =A0 =A0 fb_videomode_to_var(&fbinfo->var, initmode);
> >> + =A0 =A0 initmode.xres =3D windata->xres;
> >> + =A0 =A0 initmode.yres =3D windata->yres;
>=20
> Here, the xres and yres values are copied to initmode and described a=
bove.
>=20
> >> + =A0 =A0 fb_videomode_to_var(&fbinfo->var, &initmode);
> >>
> >> =A0 =A0 =A0 fbinfo->fix.type =A0 =A0 =A0 =A0=3D FB_TYPE_PACKED_PIX=
ELS;
> >> =A0 =A0 =A0 fbinfo->fix.accel =A0 =A0 =A0 =3D FB_ACCEL_NONE;
> >> @@ -1331,6 +1295,51 @@ static int __devinit s3c_fb_probe_win(struc=
t s3c_fb *sfb, unsigned int win_no,
> >> =A0}
> >>
> >> =A0/**
> >> + * s3c_fb_set_rgb_timing() - set video timing for rgb interface.
> >> + * @sfb: The base resources for the hardware.
> >> + *
> >> + * Set horizontal and vertical lcd rgb interface timing.
> >> + */
> >> +static void s3c_fb_set_rgb_timing(struct s3c_fb *sfb)
> >> +{
> >> + =A0 =A0 struct fb_videomode *vmode =3D sfb->pdata->vtiming;
> >> + =A0 =A0 void __iomem *regs =3D sfb->regs;
> >> + =A0 =A0 int clkdiv;
> >> + =A0 =A0 u32 data;
> >> +
> >> + =A0 =A0 if (!vmode->pixclock)
> >> + =A0 =A0 =A0 =A0 =A0 =A0 s3c_fb_missing_pixclock(vmode);
> >> +
> >> + =A0 =A0 clkdiv =3D s3c_fb_calc_pixclk(sfb, vmode->pixclock);
> >> +
> >> + =A0 =A0 data =3D sfb->pdata->vidcon0;
> >> + =A0 =A0 data &=3D ~(VIDCON0_CLKVAL_F_MASK | VIDCON0_CLKDIR);
> >> +
> >> + =A0 =A0 if (clkdiv > 1)
> >> + =A0 =A0 =A0 =A0 =A0 =A0 data |=3D VIDCON0_CLKVAL_F(clkdiv-1) | V=
IDCON0_CLKDIR;
> >> + =A0 =A0 else
> >> + =A0 =A0 =A0 =A0 =A0 =A0 data &=3D ~VIDCON0_CLKDIR; =A0 =A0 =A0 =A0=
/* 1:1 clock */
> >> +
> >> + =A0 =A0 if (sfb->variant.is_2443)
> >> + =A0 =A0 =A0 =A0 =A0 =A0 data |=3D (1 << 5);
> >> + =A0 =A0 writel(data, regs + VIDCON0);
> >> +
> >> + =A0 =A0 data =3D VIDTCON0_VBPD(vmode->upper_margin - 1) |
> >> + =A0 =A0 =A0 =A0 =A0 =A0VIDTCON0_VFPD(vmode->lower_margin - 1) |
> >> + =A0 =A0 =A0 =A0 =A0 =A0VIDTCON0_VSPW(vmode->vsync_len - 1);
> >> + =A0 =A0 writel(data, regs + sfb->variant.vidtcon);
> >> +
> >> + =A0 =A0 data =3D VIDTCON1_HBPD(vmode->left_margin - 1) |
> >> + =A0 =A0 =A0 =A0 =A0 =A0VIDTCON1_HFPD(vmode->right_margin - 1) |
> >> + =A0 =A0 =A0 =A0 =A0 =A0VIDTCON1_HSPW(vmode->hsync_len - 1);
> >> + =A0 =A0 writel(data, regs + sfb->variant.vidtcon + 4);
> >> +
> >> + =A0 =A0 data =3D VIDTCON2_LINEVAL(vmode->yres - 1) |
> >> + =A0 =A0 =A0 =A0 =A0 =A0VIDTCON2_HOZVAL(vmode->xres - 1);
> >> + =A0 =A0 writel(data, regs + sfb->variant.vidtcon + 8);
> >> +}
> >> +
> >> +/**
> >> =A0 * s3c_fb_clear_win() - clear hardware window registers.
> >> =A0 * @sfb: The base resources for the hardware.
> >> =A0 * @win: The window to process.
> >> @@ -1473,15 +1482,14 @@ static int __devinit s3c_fb_probe(struct p=
latform_device *pdev)
> >> =A0 =A0 =A0 =A0 =A0 =A0 =A0 writel(0xffffff, regs + WKEYCON1);
> >> =A0 =A0 =A0 }
> >>
> >> + =A0 =A0 s3c_fb_set_rgb_timing(sfb);
> >> +
> >
> > This s3c_fb_set_rgb_timing(sfb) should be added to s3c_fb_resume().
> > The timing registers should be set when s3c_fb_resume() is called.
> > If not, after resuming, timing registers such as VIDTCONx will not =
bet set.
>=20
> Yes, I missed that. I will add it in the resume path.
>=20
> Thanks for you comments. If you could let me know if i80 video timing
> values can be passed with 'struct fb_videomode', I will do the change=
s
> as you have suggested and quickly repost this patchset.
>=20
> Thanks,
> Thomas.
