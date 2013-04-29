From: Rahul Sharma <r.sh.open@gmail.com>
Subject: Re: [PATCH v2] drm/exynos: hdmi: use drm_display_mode to check the
	supported modes
Date: Mon, 29 Apr 2013 11:11:32 +0530
Message-ID: <CAPdUM4OXxFBXXc+jK=a8uvgYtaxFvxCqNCL9RtSfLuHJ1zEAkg@mail.gmail.com>
References: <1366985038-2801-1-git-send-email-rahul.sharma@samsung.com>
	<517DF83F.4020405@samsung.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0908934313=="
Return-path: <dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org>
In-Reply-To: <517DF83F.4020405@samsung.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Sender: dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org
Errors-To: dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org
To: "sw0312.kim" <sw0312.kim@samsung.com>
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, linux-samsung-soc@vger.kernel.org, sunil joshi <joshi@samsung.com>, Sean Paul <seanpaul@google.com>, Rahul Sharma <rahul.sharma@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

--===============0908934313==
Content-Type: multipart/alternative; boundary=047d7bf0cf504dc2ad04db79560b

--047d7bf0cf504dc2ad04db79560b
Content-Type: text/plain; charset=EUC-KR
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 29, 2013 at 10:04 AM, =B1=E8=BD=C2=BF=EC <sw0312.kim@samsung.co=
m> wrote:

> Hello Rahul,
>
> I agree with basic idea of this patch.
>
> However, to avoid confusion, how do you think about fixing all
> check_timing as check_mode and its second parameter as mode including
> struct exynos_drm_display_ops?
>
> Thanks Seung-Woo,

I agree with you. After replacment, it will look like:

int (*check_mode)(struct device *dev, struct drm_display_mode *mode);

Regards,
Rahul Sharma,
email to: rahul.sharma@samsung.com
Samsung Research India, Bangalore.

Regards,
> - Seung-Woo Kim
>
> On 2013=B3=E2 04=BF=F9 26=C0=CF 23:03, Rahul Sharma wrote:
> > Exynos hdmi driver is using drm_display_mode for setting timing values
> > for a supported resolution. Conversion to fb_videomode and then compari=
ng
> > with the mixer/hdmi/phy limits is not required. Instead, drm_display_mo=
de
> > fields cane be directly compared.
> >
> > v2:
> > 1) Removed convert_to_video_timing().
> > 2) Corrected DRM_DEBUG_KMS to print the resolution properly.
> >
> > Signed-off-by: Rahul Sharma <rahul.sharma@samsung.com>
> > ---
> >  drivers/gpu/drm/exynos/exynos_drm_connector.c |   36
> +------------------------
> >  drivers/gpu/drm/exynos/exynos_drm_hdmi.h      |    6 ++---
> >  drivers/gpu/drm/exynos/exynos_hdmi.c          |   15 +++++------
> >  drivers/gpu/drm/exynos/exynos_mixer.c         |   13 ++++-----
> >  4 files changed, 18 insertions(+), 52 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/exynos/exynos_drm_connector.c
> b/drivers/gpu/drm/exynos/exynos_drm_connector.c
> > index 8bcc13a..7259fff 100644
> > --- a/drivers/gpu/drm/exynos/exynos_drm_connector.c
> > +++ b/drivers/gpu/drm/exynos/exynos_drm_connector.c
> > @@ -58,37 +58,6 @@ convert_to_display_mode(struct drm_display_mode *mod=
e,
> >               mode->flags |=3D DRM_MODE_FLAG_DBLSCAN;
> >  }
> >
> > -/* convert drm_display_mode to exynos_video_timings */
> > -static inline void
> > -convert_to_video_timing(struct fb_videomode *timing,
> > -                     struct drm_display_mode *mode)
> > -{
> > -     DRM_DEBUG_KMS("%s\n", __FILE__);
> > -
> > -     memset(timing, 0, sizeof(*timing));
> > -
> > -     timing->pixclock =3D mode->clock * 1000;
> > -     timing->refresh =3D drm_mode_vrefresh(mode);
> > -
> > -     timing->xres =3D mode->hdisplay;
> > -     timing->right_margin =3D mode->hsync_start - mode->hdisplay;
> > -     timing->hsync_len =3D mode->hsync_end - mode->hsync_start;
> > -     timing->left_margin =3D mode->htotal - mode->hsync_end;
> > -
> > -     timing->yres =3D mode->vdisplay;
> > -     timing->lower_margin =3D mode->vsync_start - mode->vdisplay;
> > -     timing->vsync_len =3D mode->vsync_end - mode->vsync_start;
> > -     timing->upper_margin =3D mode->vtotal - mode->vsync_end;
> > -
> > -     if (mode->flags & DRM_MODE_FLAG_INTERLACE)
> > -             timing->vmode =3D FB_VMODE_INTERLACED;
> > -     else
> > -             timing->vmode =3D FB_VMODE_NONINTERLACED;
> > -
> > -     if (mode->flags & DRM_MODE_FLAG_DBLSCAN)
> > -             timing->vmode |=3D FB_VMODE_DOUBLE;
> > -}
> > -
> >  static int exynos_drm_connector_get_modes(struct drm_connector
> *connector)
> >  {
> >       struct exynos_drm_connector *exynos_connector =3D
> > @@ -168,15 +137,12 @@ static int exynos_drm_connector_mode_valid(struct
> drm_connector *connector,
> >                                       to_exynos_connector(connector);
> >       struct exynos_drm_manager *manager =3D exynos_connector->manager;
> >       struct exynos_drm_display_ops *display_ops =3D manager->display_o=
ps;
> > -     struct fb_videomode timing;
> >       int ret =3D MODE_BAD;
> >
> >       DRM_DEBUG_KMS("%s\n", __FILE__);
> >
> > -     convert_to_video_timing(&timing, mode);
> > -
> >       if (display_ops && display_ops->check_timing)
> > -             if (!display_ops->check_timing(manager->dev, (void
> *)&timing))
> > +             if (!display_ops->check_timing(manager->dev, (void *)mode=
))
> >                       ret =3D MODE_OK;
> >
> >       return ret;
> > diff --git a/drivers/gpu/drm/exynos/exynos_drm_hdmi.h
> b/drivers/gpu/drm/exynos/exynos_drm_hdmi.h
> > index 6b70944..fd2ff9f 100644
> > --- a/drivers/gpu/drm/exynos/exynos_drm_hdmi.h
> > +++ b/drivers/gpu/drm/exynos/exynos_drm_hdmi.h
> > @@ -32,11 +32,11 @@ struct exynos_hdmi_ops {
> >       bool (*is_connected)(void *ctx);
> >       struct edid *(*get_edid)(void *ctx,
> >                       struct drm_connector *connector);
> > -     int (*check_timing)(void *ctx, struct fb_videomode *timing);
> > +     int (*check_timing)(void *ctx, struct drm_display_mode *mode);
> >       int (*power_on)(void *ctx, int mode);
> >
> >       /* manager */
> > -     void (*mode_set)(void *ctx, void *mode);
> > +     void (*mode_set)(void *ctx, struct drm_display_mode *mode);
> >       void (*get_max_resol)(void *ctx, unsigned int *width,
> >                               unsigned int *height);
> >       void (*commit)(void *ctx);
> > @@ -57,7 +57,7 @@ struct exynos_mixer_ops {
> >       void (*win_disable)(void *ctx, int zpos);
> >
> >       /* display */
> > -     int (*check_timing)(void *ctx, struct fb_videomode *timing);
> > +     int (*check_timing)(void *ctx, struct drm_display_mode *mode);
> >  };
> >
> >  void exynos_hdmi_drv_attach(struct exynos_drm_hdmi_context *ctx);
> > diff --git a/drivers/gpu/drm/exynos/exynos_hdmi.c
> b/drivers/gpu/drm/exynos/exynos_hdmi.c
> > index 93b70e9..aeca603 100644
> > --- a/drivers/gpu/drm/exynos/exynos_hdmi.c
> > +++ b/drivers/gpu/drm/exynos/exynos_hdmi.c
> > @@ -796,18 +796,17 @@ static int hdmi_find_phy_conf(struct hdmi_context
> *hdata, u32 pixel_clock)
> >       return -EINVAL;
> >  }
> >
> > -static int hdmi_check_timing(void *ctx, struct fb_videomode *timing)
> > +static int hdmi_check_timing(void *ctx, struct drm_display_mode *mode)
> >  {
> >       struct hdmi_context *hdata =3D ctx;
> >       int ret;
> >
> > -     DRM_DEBUG_KMS("[%d] %s\n", __LINE__, __func__);
> > -
> > -     DRM_DEBUG_KMS("[%d]x[%d] [%d]Hz [%x]\n", timing->xres,
> > -                     timing->yres, timing->refresh,
> > -                     timing->vmode);
> > +     DRM_DEBUG_KMS("[WxH@HzI/P at Pixel Clk]: %dx%d@%d%s at %d\n",
> > +             mode->hdisplay, mode->vdisplay, mode->vrefresh,
> > +             (mode->flags & DRM_MODE_FLAG_INTERLACE) ? "I" : "P",
> > +             mode->clock * 1000);
> >
> > -     ret =3D hdmi_find_phy_conf(hdata, timing->pixclock);
> > +     ret =3D hdmi_find_phy_conf(hdata, mode->clock * 1000);
> >       if (ret < 0)
> >               return ret;
> >       return 0;
> > @@ -1643,7 +1642,7 @@ static void hdmi_v14_mode_set(struct hdmi_context
> *hdata,
> >       hdmi_set_reg(tg->tg_3d, 1, 0x0);
> >  }
> >
> > -static void hdmi_mode_set(void *ctx, void *mode)
> > +static void hdmi_mode_set(void *ctx, struct drm_display_mode *mode)
> >  {
> >       struct hdmi_context *hdata =3D ctx;
> >       struct drm_display_mode *m =3D mode;
> > diff --git a/drivers/gpu/drm/exynos/exynos_mixer.c
> b/drivers/gpu/drm/exynos/exynos_mixer.c
> > index f08e251..67c4fd8 100644
> > --- a/drivers/gpu/drm/exynos/exynos_mixer.c
> > +++ b/drivers/gpu/drm/exynos/exynos_mixer.c
> > @@ -818,17 +818,17 @@ static void mixer_win_disable(void *ctx, int win)
> >       mixer_ctx->win_data[win].enabled =3D false;
> >  }
> >
> > -static int mixer_check_timing(void *ctx, struct fb_videomode *timing)
> > +static int mixer_check_timing(void *ctx, struct drm_display_mode *mode=
)
> >  {
> >       u32 w, h;
> >
> > -     w =3D timing->xres;
> > -     h =3D timing->yres;
> > +     w =3D mode->hdisplay;
> > +     h =3D mode->vdisplay;
> >
> >       DRM_DEBUG_KMS("%s : xres=3D%d, yres=3D%d, refresh=3D%d, intl=3D%d=
\n",
> > -             __func__, timing->xres, timing->yres,
> > -             timing->refresh, (timing->vmode &
> > -             FB_VMODE_INTERLACED) ? true : false);
> > +             __func__, mode->hdisplay, mode->vdisplay,
> > +             mode->vrefresh, (mode->flags &
> > +             DRM_MODE_FLAG_INTERLACE) ? true : false);
> >
> >       if ((w >=3D 464 && w <=3D 720 && h >=3D 261 && h <=3D 576) ||
> >               (w >=3D 1024 && w <=3D 1280 && h >=3D 576 && h <=3D 720) =
||
> > @@ -837,6 +837,7 @@ static int mixer_check_timing(void *ctx, struct
> fb_videomode *timing)
> >
> >       return -EINVAL;
> >  }
> > +
> >  static void mixer_wait_for_vblank(void *ctx)
> >  {
> >       struct mixer_context *mixer_ctx =3D ctx;
> >
>
> --
> Seung-Woo Kim
> Samsung Software R&D Center
> --
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> http://lists.freedesktop.org/mailman/listinfo/dri-devel
>



--

--047d7bf0cf504dc2ad04db79560b
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><br><div class=3D"gmail=
_quote">On Mon, Apr 29, 2013 at 10:04 AM, =EA=B9=80=EC=8A=B9=EC=9A=B0 <span=
 dir=3D"ltr">&lt;<a href=3D"mailto:sw0312.kim@samsung.com" target=3D"_blank=
">sw0312.kim@samsung.com</a>&gt;</span> wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left-width:1px;border-left-color:rgb(204,204,204);border-left-style:solid;p=
adding-left:1ex">Hello Rahul,<br>
<br>
I agree with basic idea of this patch.<br>
<br>
However, to avoid confusion, how do you think about fixing all<br>
check_timing as check_mode and its second parameter as mode including<br>
struct exynos_drm_display_ops?<br>
<br></blockquote><div>Thanks Seung-Woo,<div><br></div><div>I agree with you=
. After replacment, it will look like:</div></div><div><br></div><div><div>=
<span class=3D"" style=3D"white-space:pre">	</span>int (*check_mode)(struct=
 device *dev,=C2=A0<span style=3D"color:rgb(80,0,80)">struct drm_display_mo=
de *mode</span>);</div>
</div><div><br></div><div>Regards,<br>Rahul Sharma,<br>email to:=C2=A0<a hr=
ef=3D"mailto:rahul.sharma@samsung.com" target=3D"_blank">rahul.sharma@samsu=
ng.com</a><br>Samsung Research India, Bangalore.<br></div><div><br></div><b=
lockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-le=
ft-width:1px;border-left-color:rgb(204,204,204);border-left-style:solid;pad=
ding-left:1ex">

Regards,<br>
- Seung-Woo Kim<br>
<div><div class=3D"h5"><br>
On 2013=EB=85=84 04=EC=9B=94 26=EC=9D=BC 23:03, Rahul Sharma wrote:<br>
&gt; Exynos hdmi driver is using drm_display_mode for setting timing values=
<br>
&gt; for a supported resolution. Conversion to fb_videomode and then compar=
ing<br>
&gt; with the mixer/hdmi/phy limits is not required. Instead, drm_display_m=
ode<br>
&gt; fields cane be directly compared.<br>
&gt;<br>
&gt; v2:<br>
&gt; 1) Removed convert_to_video_timing().<br>
&gt; 2) Corrected DRM_DEBUG_KMS to print the resolution properly.<br>
&gt;<br>
&gt; Signed-off-by: Rahul Sharma &lt;<a href=3D"mailto:rahul.sharma@samsung=
.com">rahul.sharma@samsung.com</a>&gt;<br>
&gt; ---<br>
&gt; =C2=A0drivers/gpu/drm/exynos/exynos_drm_connector.c | =C2=A0 36 +-----=
-------------------<br>
&gt; =C2=A0drivers/gpu/drm/exynos/exynos_drm_hdmi.h =C2=A0 =C2=A0 =C2=A0| =
=C2=A0 =C2=A06 ++---<br>
&gt; =C2=A0drivers/gpu/drm/exynos/exynos_hdmi.c =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0| =C2=A0 15 +++++------<br>
&gt; =C2=A0drivers/gpu/drm/exynos/exynos_mixer.c =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 | =C2=A0 13 ++++-----<br>
&gt; =C2=A04 files changed, 18 insertions(+), 52 deletions(-)<br>
&gt;<br>
&gt; diff --git a/drivers/gpu/drm/exynos/exynos_drm_connector.c b/drivers/g=
pu/drm/exynos/exynos_drm_connector.c<br>
&gt; index 8bcc13a..7259fff 100644<br>
&gt; --- a/drivers/gpu/drm/exynos/exynos_drm_connector.c<br>
&gt; +++ b/drivers/gpu/drm/exynos/exynos_drm_connector.c<br>
&gt; @@ -58,37 +58,6 @@ convert_to_display_mode(struct drm_display_mode *mo=
de,<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 mode-&gt;flags |=3D D=
RM_MODE_FLAG_DBLSCAN;<br>
&gt; =C2=A0}<br>
&gt;<br>
&gt; -/* convert drm_display_mode to exynos_video_timings */<br>
&gt; -static inline void<br>
&gt; -convert_to_video_timing(struct fb_videomode *timing,<br>
&gt; - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 struct drm_display_mode *mode)<br>
&gt; -{<br>
&gt; - =C2=A0 =C2=A0 DRM_DEBUG_KMS(&quot;%s\n&quot;, __FILE__);<br>
&gt; -<br>
&gt; - =C2=A0 =C2=A0 memset(timing, 0, sizeof(*timing));<br>
&gt; -<br>
&gt; - =C2=A0 =C2=A0 timing-&gt;pixclock =3D mode-&gt;clock * 1000;<br>
&gt; - =C2=A0 =C2=A0 timing-&gt;refresh =3D drm_mode_vrefresh(mode);<br>
&gt; -<br>
&gt; - =C2=A0 =C2=A0 timing-&gt;xres =3D mode-&gt;hdisplay;<br>
&gt; - =C2=A0 =C2=A0 timing-&gt;right_margin =3D mode-&gt;hsync_start - mod=
e-&gt;hdisplay;<br>
&gt; - =C2=A0 =C2=A0 timing-&gt;hsync_len =3D mode-&gt;hsync_end - mode-&gt=
;hsync_start;<br>
&gt; - =C2=A0 =C2=A0 timing-&gt;left_margin =3D mode-&gt;htotal - mode-&gt;=
hsync_end;<br>
&gt; -<br>
&gt; - =C2=A0 =C2=A0 timing-&gt;yres =3D mode-&gt;vdisplay;<br>
&gt; - =C2=A0 =C2=A0 timing-&gt;lower_margin =3D mode-&gt;vsync_start - mod=
e-&gt;vdisplay;<br>
&gt; - =C2=A0 =C2=A0 timing-&gt;vsync_len =3D mode-&gt;vsync_end - mode-&gt=
;vsync_start;<br>
&gt; - =C2=A0 =C2=A0 timing-&gt;upper_margin =3D mode-&gt;vtotal - mode-&gt=
;vsync_end;<br>
&gt; -<br>
&gt; - =C2=A0 =C2=A0 if (mode-&gt;flags &amp; DRM_MODE_FLAG_INTERLACE)<br>
&gt; - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 timing-&gt;vmode =3D FB_VM=
ODE_INTERLACED;<br>
&gt; - =C2=A0 =C2=A0 else<br>
&gt; - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 timing-&gt;vmode =3D FB_VM=
ODE_NONINTERLACED;<br>
&gt; -<br>
&gt; - =C2=A0 =C2=A0 if (mode-&gt;flags &amp; DRM_MODE_FLAG_DBLSCAN)<br>
&gt; - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 timing-&gt;vmode |=3D FB_V=
MODE_DOUBLE;<br>
&gt; -}<br>
&gt; -<br>
&gt; =C2=A0static int exynos_drm_connector_get_modes(struct drm_connector *=
connector)<br>
&gt; =C2=A0{<br>
&gt; =C2=A0 =C2=A0 =C2=A0 struct exynos_drm_connector *exynos_connector =3D=
<br>
&gt; @@ -168,15 +137,12 @@ static int exynos_drm_connector_mode_valid(struc=
t drm_connector *connector,<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 to_exynos_co=
nnector(connector);<br>
&gt; =C2=A0 =C2=A0 =C2=A0 struct exynos_drm_manager *manager =3D exynos_con=
nector-&gt;manager;<br>
&gt; =C2=A0 =C2=A0 =C2=A0 struct exynos_drm_display_ops *display_ops =3D ma=
nager-&gt;display_ops;<br>
&gt; - =C2=A0 =C2=A0 struct fb_videomode timing;<br>
&gt; =C2=A0 =C2=A0 =C2=A0 int ret =3D MODE_BAD;<br>
&gt;<br>
&gt; =C2=A0 =C2=A0 =C2=A0 DRM_DEBUG_KMS(&quot;%s\n&quot;, __FILE__);<br>
&gt;<br>
&gt; - =C2=A0 =C2=A0 convert_to_video_timing(&amp;timing, mode);<br>
&gt; -<br>
&gt; =C2=A0 =C2=A0 =C2=A0 if (display_ops &amp;&amp; display_ops-&gt;check_=
timing)<br>
&gt; - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!display_ops-&gt;check=
_timing(manager-&gt;dev, (void *)&amp;timing))<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!display_ops-&gt;check=
_timing(manager-&gt;dev, (void *)mode))<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 ret =3D MODE_OK;<br>
&gt;<br>
&gt; =C2=A0 =C2=A0 =C2=A0 return ret;<br>
&gt; diff --git a/drivers/gpu/drm/exynos/exynos_drm_hdmi.h b/drivers/gpu/dr=
m/exynos/exynos_drm_hdmi.h<br>
&gt; index 6b70944..fd2ff9f 100644<br>
&gt; --- a/drivers/gpu/drm/exynos/exynos_drm_hdmi.h<br>
&gt; +++ b/drivers/gpu/drm/exynos/exynos_drm_hdmi.h<br>
&gt; @@ -32,11 +32,11 @@ struct exynos_hdmi_ops {<br>
&gt; =C2=A0 =C2=A0 =C2=A0 bool (*is_connected)(void *ctx);<br>
&gt; =C2=A0 =C2=A0 =C2=A0 struct edid *(*get_edid)(void *ctx,<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 struct drm_connector *connector);<br>
&gt; - =C2=A0 =C2=A0 int (*check_timing)(void *ctx, struct fb_videomode *ti=
ming);<br>
&gt; + =C2=A0 =C2=A0 int (*check_timing)(void *ctx, struct drm_display_mode=
 *mode);<br>
&gt; =C2=A0 =C2=A0 =C2=A0 int (*power_on)(void *ctx, int mode);<br>
&gt;<br>
&gt; =C2=A0 =C2=A0 =C2=A0 /* manager */<br>
&gt; - =C2=A0 =C2=A0 void (*mode_set)(void *ctx, void *mode);<br>
&gt; + =C2=A0 =C2=A0 void (*mode_set)(void *ctx, struct drm_display_mode *m=
ode);<br>
&gt; =C2=A0 =C2=A0 =C2=A0 void (*get_max_resol)(void *ctx, unsigned int *wi=
dth,<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 unsigned int *height);<br>
&gt; =C2=A0 =C2=A0 =C2=A0 void (*commit)(void *ctx);<br>
&gt; @@ -57,7 +57,7 @@ struct exynos_mixer_ops {<br>
&gt; =C2=A0 =C2=A0 =C2=A0 void (*win_disable)(void *ctx, int zpos);<br>
&gt;<br>
&gt; =C2=A0 =C2=A0 =C2=A0 /* display */<br>
&gt; - =C2=A0 =C2=A0 int (*check_timing)(void *ctx, struct fb_videomode *ti=
ming);<br>
&gt; + =C2=A0 =C2=A0 int (*check_timing)(void *ctx, struct drm_display_mode=
 *mode);<br>
&gt; =C2=A0};<br>
&gt;<br>
&gt; =C2=A0void exynos_hdmi_drv_attach(struct exynos_drm_hdmi_context *ctx)=
;<br>
&gt; diff --git a/drivers/gpu/drm/exynos/exynos_hdmi.c b/drivers/gpu/drm/ex=
ynos/exynos_hdmi.c<br>
&gt; index 93b70e9..aeca603 100644<br>
&gt; --- a/drivers/gpu/drm/exynos/exynos_hdmi.c<br>
&gt; +++ b/drivers/gpu/drm/exynos/exynos_hdmi.c<br>
&gt; @@ -796,18 +796,17 @@ static int hdmi_find_phy_conf(struct hdmi_contex=
t *hdata, u32 pixel_clock)<br>
&gt; =C2=A0 =C2=A0 =C2=A0 return -EINVAL;<br>
&gt; =C2=A0}<br>
&gt;<br>
&gt; -static int hdmi_check_timing(void *ctx, struct fb_videomode *timing)<=
br>
&gt; +static int hdmi_check_timing(void *ctx, struct drm_display_mode *mode=
)<br>
&gt; =C2=A0{<br>
&gt; =C2=A0 =C2=A0 =C2=A0 struct hdmi_context *hdata =3D ctx;<br>
&gt; =C2=A0 =C2=A0 =C2=A0 int ret;<br>
&gt;<br>
&gt; - =C2=A0 =C2=A0 DRM_DEBUG_KMS(&quot;[%d] %s\n&quot;, __LINE__, __func_=
_);<br>
&gt; -<br>
&gt; - =C2=A0 =C2=A0 DRM_DEBUG_KMS(&quot;[%d]x[%d] [%d]Hz [%x]\n&quot;, tim=
ing-&gt;xres,<br>
&gt; - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 timing-&gt;yres, timing-&gt;refresh,<br>
&gt; - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 timing-&gt;vmode);<br>
&gt; + =C2=A0 =C2=A0 DRM_DEBUG_KMS(&quot;[WxH@HzI/P at Pixel Clk]: %dx%d@%d=
%s at %d\n&quot;,<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 mode-&gt;hdisplay, mode-&g=
t;vdisplay, mode-&gt;vrefresh,<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (mode-&gt;flags &amp; DRM_=
MODE_FLAG_INTERLACE) ? &quot;I&quot; : &quot;P&quot;,<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 mode-&gt;clock * 1000);<br=
>
&gt;<br>
&gt; - =C2=A0 =C2=A0 ret =3D hdmi_find_phy_conf(hdata, timing-&gt;pixclock)=
;<br>
&gt; + =C2=A0 =C2=A0 ret =3D hdmi_find_phy_conf(hdata, mode-&gt;clock * 100=
0);<br>
&gt; =C2=A0 =C2=A0 =C2=A0 if (ret &lt; 0)<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return ret;<br>
&gt; =C2=A0 =C2=A0 =C2=A0 return 0;<br>
&gt; @@ -1643,7 +1642,7 @@ static void hdmi_v14_mode_set(struct hdmi_contex=
t *hdata,<br>
&gt; =C2=A0 =C2=A0 =C2=A0 hdmi_set_reg(tg-&gt;tg_3d, 1, 0x0);<br>
&gt; =C2=A0}<br>
&gt;<br>
&gt; -static void hdmi_mode_set(void *ctx, void *mode)<br>
&gt; +static void hdmi_mode_set(void *ctx, struct drm_display_mode *mode)<b=
r>
&gt; =C2=A0{<br>
&gt; =C2=A0 =C2=A0 =C2=A0 struct hdmi_context *hdata =3D ctx;<br>
&gt; =C2=A0 =C2=A0 =C2=A0 struct drm_display_mode *m =3D mode;<br>
&gt; diff --git a/drivers/gpu/drm/exynos/exynos_mixer.c b/drivers/gpu/drm/e=
xynos/exynos_mixer.c<br>
&gt; index f08e251..67c4fd8 100644<br>
&gt; --- a/drivers/gpu/drm/exynos/exynos_mixer.c<br>
&gt; +++ b/drivers/gpu/drm/exynos/exynos_mixer.c<br>
&gt; @@ -818,17 +818,17 @@ static void mixer_win_disable(void *ctx, int win=
)<br>
&gt; =C2=A0 =C2=A0 =C2=A0 mixer_ctx-&gt;win_data[win].enabled =3D false;<br=
>
&gt; =C2=A0}<br>
&gt;<br>
&gt; -static int mixer_check_timing(void *ctx, struct fb_videomode *timing)=
<br>
&gt; +static int mixer_check_timing(void *ctx, struct drm_display_mode *mod=
e)<br>
&gt; =C2=A0{<br>
&gt; =C2=A0 =C2=A0 =C2=A0 u32 w, h;<br>
&gt;<br>
&gt; - =C2=A0 =C2=A0 w =3D timing-&gt;xres;<br>
&gt; - =C2=A0 =C2=A0 h =3D timing-&gt;yres;<br>
&gt; + =C2=A0 =C2=A0 w =3D mode-&gt;hdisplay;<br>
&gt; + =C2=A0 =C2=A0 h =3D mode-&gt;vdisplay;<br>
&gt;<br>
&gt; =C2=A0 =C2=A0 =C2=A0 DRM_DEBUG_KMS(&quot;%s : xres=3D%d, yres=3D%d, re=
fresh=3D%d, intl=3D%d\n&quot;,<br>
&gt; - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 __func__, timing-&gt;xres,=
 timing-&gt;yres,<br>
&gt; - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 timing-&gt;refresh, (timin=
g-&gt;vmode &amp;<br>
&gt; - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 FB_VMODE_INTERLACED) ? tru=
e : false);<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 __func__, mode-&gt;hdispla=
y, mode-&gt;vdisplay,<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 mode-&gt;vrefresh, (mode-&=
gt;flags &amp;<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 DRM_MODE_FLAG_INTERLACE) ?=
 true : false);<br>
&gt;<br>
&gt; =C2=A0 =C2=A0 =C2=A0 if ((w &gt;=3D 464 &amp;&amp; w &lt;=3D 720 &amp;=
&amp; h &gt;=3D 261 &amp;&amp; h &lt;=3D 576) ||<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (w &gt;=3D 1024 &amp;=
&amp; w &lt;=3D 1280 &amp;&amp; h &gt;=3D 576 &amp;&amp; h &lt;=3D 720) ||<=
br>
&gt; @@ -837,6 +837,7 @@ static int mixer_check_timing(void *ctx, struct fb=
_videomode *timing)<br>
&gt;<br>
&gt; =C2=A0 =C2=A0 =C2=A0 return -EINVAL;<br>
&gt; =C2=A0}<br>
&gt; +<br>
&gt; =C2=A0static void mixer_wait_for_vblank(void *ctx)<br>
&gt; =C2=A0{<br>
&gt; =C2=A0 =C2=A0 =C2=A0 struct mixer_context *mixer_ctx =3D ctx;<br>
&gt;<br>
<br>
--<br>
</div></div>Seung-Woo Kim<br>
Samsung Software R&amp;D Center<br>
--<br>
<br>
_______________________________________________<br>
dri-devel mailing list<br>
<a href=3D"mailto:dri-devel@lists.freedesktop.org">dri-devel@lists.freedesk=
top.org</a><br>
<a href=3D"http://lists.freedesktop.org/mailman/listinfo/dri-devel" target=
=3D"_blank">http://lists.freedesktop.org/mailman/listinfo/dri-devel</a><br>
</blockquote></div><br><br clear=3D"all"><div><br></div>-- <br></div></div>

--047d7bf0cf504dc2ad04db79560b--

--===============0908934313==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
http://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0908934313==--
