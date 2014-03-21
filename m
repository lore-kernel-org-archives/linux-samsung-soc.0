From: Ajay kumar <ajaynumb@gmail.com>
Subject: Re: [RFC 3/4] drm: exynos: add IELCD post processor
Date: Fri, 21 Mar 2014 21:14:30 +0530
Message-ID: <CAEC9eQO_te71WE8oA6v+jpWKkeSdUjVqLSkeGfAXbsb16MbJwg@mail.gmail.com>
References: <1395238975-24600-1-git-send-email-ajaykumar.rs@samsung.com>
 <1395238975-24600-4-git-send-email-ajaykumar.rs@samsung.com>
 <CAK9yfHxQR_O2MdvHuKHHRsEg0k7CxVKD1wmLDRq0S3BrdAOMbw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0304139311=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <CAK9yfHxQR_O2MdvHuKHHRsEg0k7CxVKD1wmLDRq0S3BrdAOMbw@mail.gmail.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Sachin Kamat <sachin.kamat@linaro.org>
Cc: linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Shirish S <s.shirish@samsung.com>, Sean Paul <seanpaul@google.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, sunil joshi <joshi@samsung.com>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, marcheu@chromium.org, Prashanth G <prashanth.g@samsung.com>, Ajay Kumar <ajaykumar.rs@samsung.com>, Rahul Sharma <rahul.sharma@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

--===============0304139311==
Content-Type: multipart/alternative; boundary=047d7b86e832fb1c7c04f51fc2d6

--047d7b86e832fb1c7c04f51fc2d6
Content-Type: text/plain; charset=ISO-8859-1

Hi Sachin,


On Fri, Mar 21, 2014 at 2:12 PM, Sachin Kamat <sachin.kamat@linaro.org>wrote:

> On 19 March 2014 19:52, Ajay Kumar <ajaykumar.rs@samsung.com> wrote:
> > Add post processor ops for IELCD and their support functions.
> > Expose an interface for the FIMD to register IELCD PP.
> [snip]
> > +
> > +#define exynos_ielcd_readl(addr)       readl(ielcd->exynos_ielcd_base +
> addr)
> > +#define exynos_ielcd_writel(addr, val) \
>
> nit: The order of arguments could be retained same as writel (i.e.,
> val, addr) for ease of
> reading.
>
> Right. I will change it.

> > +                               writel(val, ielcd->exynos_ielcd_base +
> addr)
>
> > +#define IELCD_TIMEOUT_CNT      1000
> > +
> > +struct ielcd_context {
> > +       void __iomem                    *exynos_ielcd_base;
> > +       unsigned                vdisplay;
> > +       unsigned                vsync_len;
> > +       unsigned                vbpd;
> > +       unsigned                vfpd;
> > +       unsigned                hdisplay;
> > +       unsigned                hsync_len;
> > +       unsigned                hbpd;
> > +       unsigned                hfpd;
> > +       unsigned                vidcon0;
> > +       unsigned                vidcon1;
> > +};
> > +
> > +static int ielcd_logic_start(struct ielcd_context *ielcd)
> > +{
> > +       exynos_ielcd_writel(IELCD_AUXCON, IELCD_MAGIC_KEY);
> > +
> > +       return 0;
> > +}
>
> The return type could be made void.
>
> Ok.

> > +
> > +static int exynos_ielcd_hw_trigger_check(struct ielcd_context *ielcd)
> > +{
> > +       unsigned int cfg;
> > +       unsigned int count = 0;
> > +
> > +       cfg = exynos_ielcd_readl(IELCD_TRIGCON);
> > +       cfg &= ~(SWTRGCMD_W0BUF | TRGMODE_W0BUF);
> > +       cfg |= (SWTRGCMD_W0BUF | TRGMODE_W0BUF);
> > +       exynos_ielcd_writel(IELCD_TRIGCON, cfg);
> > +
> > +       do {
> > +               cfg = exynos_ielcd_readl(IELCD_SHADOWCON);
> > +               cfg |= IELCD_W0_SW_SHADOW_UPTRIG;
> > +               exynos_ielcd_writel(IELCD_SHADOWCON, cfg);
> > +
> > +               cfg = exynos_ielcd_readl(IELCD_VIDCON0);
> > +               cfg |= IELCD_SW_SHADOW_UPTRIG;
> > +               exynos_ielcd_writel(IELCD_VIDCON0, cfg);
> > +
> > +               count++;
> > +               if (count > IELCD_TIMEOUT_CNT) {
>
> The 2 lines could be combined as:
>                     if (++count > IELCD_TIMEOUT_CNT) {
>
> > +                       DRM_ERROR("ielcd start fail\n");
> > +                       return -EBUSY;
> > +               }
> > +               udelay(10);
> > +       } while (exynos_ielcd_readl(IELCD_WINCON0) & IELCD_TRGSTATUS);
>
> Also this check could be moved inside the loop and break if 0 whereas this
> could
> while (1) here.
>
> Ok. I will change the above loop.

> > +
> > +       return 0;
> > +}
> > +
> > +static int exynos_ielcd_display_on(struct ielcd_context *ielcd)
> > +{
> > +       unsigned int cfg;
> > +
> > +       cfg = exynos_ielcd_readl(IELCD_VIDCON0);
> > +       cfg |= (VIDCON0_ENVID | VIDCON0_ENVID_F);
> > +       exynos_ielcd_writel(IELCD_VIDCON0, cfg);
> > +
> > +       return exynos_ielcd_hw_trigger_check(ielcd);
> > +}
> > +
> > +int exynos_ielcd_display_off(void *pp_ctx)
> > +{
> > +       struct ielcd_context *ielcd = pp_ctx;
> > +       unsigned int cfg, ielcd_count = 0;
> > +       int ret = 0;
>
> initialization not needed.

Ok.

> > +
> > +       cfg = exynos_ielcd_readl(IELCD_VIDCON0);
> > +       cfg &= ~(VIDCON0_ENVID | VIDCON0_ENVID_F);
> > +
> > +       exynos_ielcd_writel(IELCD_VIDCON0, cfg);
> > +
> > +       do {
> > +               if (++ielcd_count > IELCD_TIMEOUT_CNT) {
> > +                       DRM_ERROR("ielcd off TIMEDOUT\n");
> > +                       ret = -ETIMEDOUT;
> > +                       break;
> > +               }
> > +
> > +               if (!(exynos_ielcd_readl(IELCD_VIDCON1) &
> > +                                               VIDCON1_LINECNT_MASK)) {
> > +                       ret = 0;
> > +                       break;
> > +               }
> > +               udelay(200);
> > +       } while (1);
> > +
> > +       return ret;
> > +}
> > +
> > +static void exynos_ielcd_config_rgb(struct ielcd_context *ielcd)
> > +{
> > +       unsigned int cfg;
> > +
> > +       cfg = exynos_ielcd_readl(IELCD_VIDCON0);
> > +       cfg &= ~(VIDCON0_VIDOUT_MASK | VIDCON0_VCLK_MASK);
> > +       cfg |= VIDCON0_VIDOUT_RGB;
> > +       cfg |= VIDCON0_VCLK_NORMAL;
> > +
> > +       exynos_ielcd_writel(IELCD_VIDCON0, cfg);
> > +}
> > +
> > +int exynos_ielcd_power_on(void *pp_ctx)
> > +{
> > +       struct ielcd_context *ielcd = pp_ctx;
> > +       unsigned int cfg;
> > +       int ret = 0;
> > +
> > +       ielcd_logic_start(ielcd);
> > +       ielcd_set_polarity(ielcd);
> > +
> > +       ielcd_set_lcd_size(ielcd);
> > +       ielcd_set_timing(ielcd);
> > +
> > +       /* window0 setting , fixed */
> > +       cfg = WINCONx_ENLOCAL | WINCON0_BPPMODE_24BPP_888 |
> WINCONx_ENWIN;
> > +       exynos_ielcd_writel(IELCD_WINCON0, cfg);
> > +
> > +       exynos_ielcd_config_rgb(ielcd);
> > +
> > +       ret = exynos_ielcd_display_on(ielcd);
> > +       if (ret) {
> > +               DRM_ERROR("IELCD failed to start\n");
> > +               return ret;
> > +       }
> > +
> > +       return 0;
>
> The above block could be simplified as:
>                ret = exynos_ielcd_display_on(ielcd);
>                if (ret)
>                       DRM_ERROR(...);
>
>                return ret;
>
Ok. I will change it.

> > +}
> > +
> > +static void exynos_ielcd_mode_set(void *pp_ctx,
> > +                               const struct drm_display_mode *in_mode)
> > +{
> > +       struct ielcd_context *ielcd = pp_ctx;
> > +
> > +       ielcd->vdisplay = in_mode->crtc_vdisplay;
> > +       ielcd->vsync_len = in_mode->crtc_vsync_end -
> in_mode->crtc_vsync_start;
> > +       ielcd->vbpd = in_mode->crtc_vtotal - in_mode->crtc_vsync_end;
> > +       ielcd->vfpd = in_mode->crtc_vsync_start - in_mode->crtc_vdisplay;
> > +
> > +       ielcd->hdisplay = in_mode->crtc_hdisplay;
> > +       ielcd->hsync_len = in_mode->crtc_hsync_end -
> in_mode->crtc_hsync_start;
> > +       ielcd->hbpd = in_mode->crtc_htotal - in_mode->crtc_hsync_end;
> > +       ielcd->hfpd = in_mode->crtc_hsync_start - in_mode->crtc_hdisplay;
> > +}
> > +
> > +static struct exynos_fimd_pp_ops ielcd_ops = {
> > +       .power_on =     exynos_ielcd_power_on,
> > +       .power_off =    exynos_ielcd_display_off,
> > +       .mode_set =     exynos_ielcd_mode_set,
> > +};
> > +
> > +static struct exynos_fimd_pp ielcd_pp = {
> > +       .ops =          &ielcd_ops,
> > +};
> > +
> > +int exynos_ielcd_init(struct device *dev, struct exynos_fimd_pp **pp)
> > +{
> > +       struct device_node *ielcd_np;
> > +       struct ielcd_context *ielcd;
> > +       u32 addr[2];
> > +       int ret = 0;
> > +
> > +       ielcd = kzalloc(sizeof(struct ielcd_context), GFP_KERNEL);
> > +       if (!ielcd) {
> > +               DRM_ERROR("failed to allocate ielcd\n");
> > +               ret = -ENOMEM;
> > +               goto error0;
>
> return directly from here and delete the label.
>
> Ok.

> --
> With warm regards,
> Sachin
>

Will address all your comments in next patchset.

Thanks and regards,
Ajay kumar

--047d7b86e832fb1c7c04f51fc2d6
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Sachin,<br><div class=3D"gmail_extra"><br><br><div clas=
s=3D"gmail_quote">On Fri, Mar 21, 2014 at 2:12 PM, Sachin Kamat <span dir=
=3D"ltr">&lt;<a href=3D"mailto:sachin.kamat@linaro.org" target=3D"_blank">s=
achin.kamat@linaro.org</a>&gt;</span> wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div class=3D"">On 19 March 2014 19:52, Ajay=
 Kumar &lt;<a href=3D"mailto:ajaykumar.rs@samsung.com">ajaykumar.rs@samsung=
.com</a>&gt; wrote:<br>

&gt; Add post processor ops for IELCD and their support functions.<br>
&gt; Expose an interface for the FIMD to register IELCD PP.<br>
</div>[snip]<br>
<div class=3D"">&gt; +<br>
&gt; +#define exynos_ielcd_readl(addr) =A0 =A0 =A0 readl(ielcd-&gt;exynos_i=
elcd_base + addr)<br>
&gt; +#define exynos_ielcd_writel(addr, val) \<br>
<br>
</div>nit: The order of arguments could be retained same as writel (i.e.,<b=
r>
val, addr) for ease of<br>
reading.<br>
<div class=3D""><br></div></blockquote><div>Right. I will change it.=A0</di=
v><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:=
1px #ccc solid;padding-left:1ex"><div class=3D"">
&gt; + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 writel(v=
al, ielcd-&gt;exynos_ielcd_base + addr)<br>
<br>
&gt; +#define IELCD_TIMEOUT_CNT =A0 =A0 =A01000<br>
&gt; +<br>
&gt; +struct ielcd_context {<br>
&gt; + =A0 =A0 =A0 void __iomem =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0*exy=
nos_ielcd_base;<br>
&gt; + =A0 =A0 =A0 unsigned =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0vdisplay;<br>
&gt; + =A0 =A0 =A0 unsigned =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0vsync_len;<br>
&gt; + =A0 =A0 =A0 unsigned =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0vbpd;<br>
&gt; + =A0 =A0 =A0 unsigned =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0vfpd;<br>
&gt; + =A0 =A0 =A0 unsigned =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0hdisplay;<br>
&gt; + =A0 =A0 =A0 unsigned =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0hsync_len;<br>
&gt; + =A0 =A0 =A0 unsigned =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0hbpd;<br>
&gt; + =A0 =A0 =A0 unsigned =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0hfpd;<br>
&gt; + =A0 =A0 =A0 unsigned =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0vidcon0;<br>
&gt; + =A0 =A0 =A0 unsigned =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0vidcon1;<br>
&gt; +};<br>
&gt; +<br>
&gt; +static int ielcd_logic_start(struct ielcd_context *ielcd)<br>
&gt; +{<br>
&gt; + =A0 =A0 =A0 exynos_ielcd_writel(IELCD_AUXCON, IELCD_MAGIC_KEY);<br>
&gt; +<br>
&gt; + =A0 =A0 =A0 return 0;<br>
&gt; +}<br>
<br>
</div>The return type could be made void.<br>
<div class=3D""><br></div></blockquote><div>Ok.=A0</div><blockquote class=
=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padd=
ing-left:1ex"><div class=3D"">
&gt; +<br>
&gt; +static int exynos_ielcd_hw_trigger_check(struct ielcd_context *ielcd)=
<br>
&gt; +{<br>
&gt; + =A0 =A0 =A0 unsigned int cfg;<br>
&gt; + =A0 =A0 =A0 unsigned int count =3D 0;<br>
&gt; +<br>
&gt; + =A0 =A0 =A0 cfg =3D exynos_ielcd_readl(IELCD_TRIGCON);<br>
&gt; + =A0 =A0 =A0 cfg &amp;=3D ~(SWTRGCMD_W0BUF | TRGMODE_W0BUF);<br>
&gt; + =A0 =A0 =A0 cfg |=3D (SWTRGCMD_W0BUF | TRGMODE_W0BUF);<br>
&gt; + =A0 =A0 =A0 exynos_ielcd_writel(IELCD_TRIGCON, cfg);<br>
&gt; +<br>
&gt; + =A0 =A0 =A0 do {<br>
&gt; + =A0 =A0 =A0 =A0 =A0 =A0 =A0 cfg =3D exynos_ielcd_readl(IELCD_SHADOWC=
ON);<br>
&gt; + =A0 =A0 =A0 =A0 =A0 =A0 =A0 cfg |=3D IELCD_W0_SW_SHADOW_UPTRIG;<br>
&gt; + =A0 =A0 =A0 =A0 =A0 =A0 =A0 exynos_ielcd_writel(IELCD_SHADOWCON, cfg=
);<br>
&gt; +<br>
&gt; + =A0 =A0 =A0 =A0 =A0 =A0 =A0 cfg =3D exynos_ielcd_readl(IELCD_VIDCON0=
);<br>
&gt; + =A0 =A0 =A0 =A0 =A0 =A0 =A0 cfg |=3D IELCD_SW_SHADOW_UPTRIG;<br>
&gt; + =A0 =A0 =A0 =A0 =A0 =A0 =A0 exynos_ielcd_writel(IELCD_VIDCON0, cfg);=
<br>
&gt; +<br>
&gt; + =A0 =A0 =A0 =A0 =A0 =A0 =A0 count++;<br>
&gt; + =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (count &gt; IELCD_TIMEOUT_CNT) {<br>
<br>
</div>The 2 lines could be combined as:<br>
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (++count &gt; IELCD_TIMEOUT_CNT)=
 {<br>
<div class=3D""><br>
&gt; + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 DRM_ERROR(&quot;ielcd st=
art fail\n&quot;);<br>
&gt; + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 return -EBUSY;<br>
&gt; + =A0 =A0 =A0 =A0 =A0 =A0 =A0 }<br>
&gt; + =A0 =A0 =A0 =A0 =A0 =A0 =A0 udelay(10);<br>
&gt; + =A0 =A0 =A0 } while (exynos_ielcd_readl(IELCD_WINCON0) &amp; IELCD_T=
RGSTATUS);<br>
<br>
</div>Also this check could be moved inside the loop and break if 0 whereas=
 this could<br>
while (1) here.<br>
<div class=3D""><br></div></blockquote><div>Ok. I will change the above loo=
p.=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bor=
der-left:1px #ccc solid;padding-left:1ex"><div class=3D"">
&gt; +<br>
&gt; + =A0 =A0 =A0 return 0;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static int exynos_ielcd_display_on(struct ielcd_context *ielcd)<br>
&gt; +{<br>
&gt; + =A0 =A0 =A0 unsigned int cfg;<br>
&gt; +<br>
&gt; + =A0 =A0 =A0 cfg =3D exynos_ielcd_readl(IELCD_VIDCON0);<br>
&gt; + =A0 =A0 =A0 cfg |=3D (VIDCON0_ENVID | VIDCON0_ENVID_F);<br>
&gt; + =A0 =A0 =A0 exynos_ielcd_writel(IELCD_VIDCON0, cfg);<br>
&gt; +<br>
&gt; + =A0 =A0 =A0 return exynos_ielcd_hw_trigger_check(ielcd);<br>
&gt; +}<br>
&gt; +<br>
&gt; +int exynos_ielcd_display_off(void *pp_ctx)<br>
&gt; +{<br>
&gt; + =A0 =A0 =A0 struct ielcd_context *ielcd =3D pp_ctx;<br>
&gt; + =A0 =A0 =A0 unsigned int cfg, ielcd_count =3D 0;<br>
&gt; + =A0 =A0 =A0 int ret =3D 0;<br>
<br>
</div>initialization not needed.</blockquote><div>Ok.=A0</div><blockquote c=
lass=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;=
padding-left:1ex"><div><div class=3D"h5">
&gt; +<br>
&gt; + =A0 =A0 =A0 cfg =3D exynos_ielcd_readl(IELCD_VIDCON0);<br>
&gt; + =A0 =A0 =A0 cfg &amp;=3D ~(VIDCON0_ENVID | VIDCON0_ENVID_F);<br>
&gt; +<br>
&gt; + =A0 =A0 =A0 exynos_ielcd_writel(IELCD_VIDCON0, cfg);<br>
&gt; +<br>
&gt; + =A0 =A0 =A0 do {<br>
&gt; + =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (++ielcd_count &gt; IELCD_TIMEOUT_CNT=
) {<br>
&gt; + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 DRM_ERROR(&quot;ielcd of=
f TIMEDOUT\n&quot;);<br>
&gt; + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 ret =3D -ETIMEDOUT;<br>
&gt; + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 break;<br>
&gt; + =A0 =A0 =A0 =A0 =A0 =A0 =A0 }<br>
&gt; +<br>
&gt; + =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (!(exynos_ielcd_readl(IELCD_VIDCON1) =
&amp;<br>
&gt; + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 VIDCON1_LINECNT_MASK)) {<br>
&gt; + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 ret =3D 0;<br>
&gt; + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 break;<br>
&gt; + =A0 =A0 =A0 =A0 =A0 =A0 =A0 }<br>
&gt; + =A0 =A0 =A0 =A0 =A0 =A0 =A0 udelay(200);<br>
&gt; + =A0 =A0 =A0 } while (1);<br>
&gt; +<br>
&gt; + =A0 =A0 =A0 return ret;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static void exynos_ielcd_config_rgb(struct ielcd_context *ielcd)<br>
&gt; +{<br>
&gt; + =A0 =A0 =A0 unsigned int cfg;<br>
&gt; +<br>
&gt; + =A0 =A0 =A0 cfg =3D exynos_ielcd_readl(IELCD_VIDCON0);<br>
&gt; + =A0 =A0 =A0 cfg &amp;=3D ~(VIDCON0_VIDOUT_MASK | VIDCON0_VCLK_MASK);=
<br>
&gt; + =A0 =A0 =A0 cfg |=3D VIDCON0_VIDOUT_RGB;<br>
&gt; + =A0 =A0 =A0 cfg |=3D VIDCON0_VCLK_NORMAL;<br>
&gt; +<br>
&gt; + =A0 =A0 =A0 exynos_ielcd_writel(IELCD_VIDCON0, cfg);<br>
&gt; +}<br>
&gt; +<br>
&gt; +int exynos_ielcd_power_on(void *pp_ctx)<br>
&gt; +{<br>
&gt; + =A0 =A0 =A0 struct ielcd_context *ielcd =3D pp_ctx;<br>
&gt; + =A0 =A0 =A0 unsigned int cfg;<br>
&gt; + =A0 =A0 =A0 int ret =3D 0;<br>
&gt; +<br>
&gt; + =A0 =A0 =A0 ielcd_logic_start(ielcd);<br>
&gt; + =A0 =A0 =A0 ielcd_set_polarity(ielcd);<br>
&gt; +<br>
&gt; + =A0 =A0 =A0 ielcd_set_lcd_size(ielcd);<br>
&gt; + =A0 =A0 =A0 ielcd_set_timing(ielcd);<br>
&gt; +<br>
&gt; + =A0 =A0 =A0 /* window0 setting , fixed */<br>
&gt; + =A0 =A0 =A0 cfg =3D WINCONx_ENLOCAL | WINCON0_BPPMODE_24BPP_888 | WI=
NCONx_ENWIN;<br>
&gt; + =A0 =A0 =A0 exynos_ielcd_writel(IELCD_WINCON0, cfg);<br>
&gt; +<br>
&gt; + =A0 =A0 =A0 exynos_ielcd_config_rgb(ielcd);<br>
&gt; +<br>
&gt; + =A0 =A0 =A0 ret =3D exynos_ielcd_display_on(ielcd);<br>
&gt; + =A0 =A0 =A0 if (ret) {<br>
&gt; + =A0 =A0 =A0 =A0 =A0 =A0 =A0 DRM_ERROR(&quot;IELCD failed to start\n&=
quot;);<br>
&gt; + =A0 =A0 =A0 =A0 =A0 =A0 =A0 return ret;<br>
&gt; + =A0 =A0 =A0 }<br>
&gt; +<br>
&gt; + =A0 =A0 =A0 return 0;<br>
<br>
</div></div>The above block could be simplified as:<br>
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0ret =3D exynos_ielcd_display_on(ielcd);<br>
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0if (ret)<br>
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 DRM_ERROR(...);<br>
<br>
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0return ret;<br></blockquote><div>Ok. I will =
change it.=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 =
.8ex;border-left:1px #ccc solid;padding-left:1ex">
&gt; +}<br>
&gt; +<br>
<div><div class=3D"h5">&gt; +static void exynos_ielcd_mode_set(void *pp_ctx=
,<br>
&gt; + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 const st=
ruct drm_display_mode *in_mode)<br>
&gt; +{<br>
&gt; + =A0 =A0 =A0 struct ielcd_context *ielcd =3D pp_ctx;<br>
&gt; +<br>
&gt; + =A0 =A0 =A0 ielcd-&gt;vdisplay =3D in_mode-&gt;crtc_vdisplay;<br>
&gt; + =A0 =A0 =A0 ielcd-&gt;vsync_len =3D in_mode-&gt;crtc_vsync_end - in_=
mode-&gt;crtc_vsync_start;<br>
&gt; + =A0 =A0 =A0 ielcd-&gt;vbpd =3D in_mode-&gt;crtc_vtotal - in_mode-&gt=
;crtc_vsync_end;<br>
&gt; + =A0 =A0 =A0 ielcd-&gt;vfpd =3D in_mode-&gt;crtc_vsync_start - in_mod=
e-&gt;crtc_vdisplay;<br>
&gt; +<br>
&gt; + =A0 =A0 =A0 ielcd-&gt;hdisplay =3D in_mode-&gt;crtc_hdisplay;<br>
&gt; + =A0 =A0 =A0 ielcd-&gt;hsync_len =3D in_mode-&gt;crtc_hsync_end - in_=
mode-&gt;crtc_hsync_start;<br>
&gt; + =A0 =A0 =A0 ielcd-&gt;hbpd =3D in_mode-&gt;crtc_htotal - in_mode-&gt=
;crtc_hsync_end;<br>
&gt; + =A0 =A0 =A0 ielcd-&gt;hfpd =3D in_mode-&gt;crtc_hsync_start - in_mod=
e-&gt;crtc_hdisplay;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static struct exynos_fimd_pp_ops ielcd_ops =3D {<br>
&gt; + =A0 =A0 =A0 .power_on =3D =A0 =A0 exynos_ielcd_power_on,<br>
&gt; + =A0 =A0 =A0 .power_off =3D =A0 =A0exynos_ielcd_display_off,<br>
&gt; + =A0 =A0 =A0 .mode_set =3D =A0 =A0 exynos_ielcd_mode_set,<br>
&gt; +};<br>
&gt; +<br>
&gt; +static struct exynos_fimd_pp ielcd_pp =3D {<br>
&gt; + =A0 =A0 =A0 .ops =3D =A0 =A0 =A0 =A0 =A0&amp;ielcd_ops,<br>
&gt; +};<br>
&gt; +<br>
&gt; +int exynos_ielcd_init(struct device *dev, struct exynos_fimd_pp **pp)=
<br>
&gt; +{<br>
&gt; + =A0 =A0 =A0 struct device_node *ielcd_np;<br>
&gt; + =A0 =A0 =A0 struct ielcd_context *ielcd;<br>
&gt; + =A0 =A0 =A0 u32 addr[2];<br>
&gt; + =A0 =A0 =A0 int ret =3D 0;<br>
&gt; +<br>
&gt; + =A0 =A0 =A0 ielcd =3D kzalloc(sizeof(struct ielcd_context), GFP_KERN=
EL);<br>
&gt; + =A0 =A0 =A0 if (!ielcd) {<br>
&gt; + =A0 =A0 =A0 =A0 =A0 =A0 =A0 DRM_ERROR(&quot;failed to allocate ielcd=
\n&quot;);<br>
&gt; + =A0 =A0 =A0 =A0 =A0 =A0 =A0 ret =3D -ENOMEM;<br>
&gt; + =A0 =A0 =A0 =A0 =A0 =A0 =A0 goto error0;<br>
<br>
</div></div>return directly from here and delete the label.<br>
<span class=3D"HOEnZb"><font color=3D"#888888"><br></font></span></blockquo=
te><div>Ok.=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0=
 .8ex;border-left:1px #ccc solid;padding-left:1ex"><span class=3D"HOEnZb"><=
font color=3D"#888888">
--<br>
With warm regards,<br>
Sachin<br>
</font></span></blockquote></div><br></div><div class=3D"gmail_extra">Will =
address all your comments in next patchset.</div><div class=3D"gmail_extra"=
><br></div><div class=3D"gmail_extra">Thanks and regards,</div><div class=
=3D"gmail_extra">
Ajay kumar</div></div>

--047d7b86e832fb1c7c04f51fc2d6--

--===============0304139311==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
http://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0304139311==--
