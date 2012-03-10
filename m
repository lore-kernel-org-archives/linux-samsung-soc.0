From: Chenglie He <chengjie.he-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 2/3] ARM: EXYNOS: Add clkdev lookup entry for lcd clock
Date: Sat, 10 Mar 2012 22:22:36 +0800
Message-ID: <CACNz9cV39Nbb0vMGc7xhb7tcFkcMWt_hCaR327oBUKZiGnSQPQ@mail.gmail.com>
References: <1322718611-20934-1-git-send-email-tushar.behera@linaro.org>
	<1322718611-20934-3-git-send-email-tushar.behera@linaro.org>
	<4F4DBB68.6000108@linaro.org>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============7353821007034506836=="
Return-path: <linaro-dev-bounces-cunTk1MwBs8s++Sfvej+rw@public.gmane.org>
In-Reply-To: <4F4DBB68.6000108-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Unsubscribe: <http://lists.linaro.org/mailman/options/linaro-dev>,
	<mailto:linaro-dev-request-cunTk1MwBs8s++Sfvej+rw@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.linaro.org/pipermail/linaro-dev>
List-Post: <mailto:linaro-dev-cunTk1MwBs8s++Sfvej+rw@public.gmane.org>
List-Help: <mailto:linaro-dev-request-cunTk1MwBs8s++Sfvej+rw@public.gmane.org?subject=help>
List-Subscribe: <http://lists.linaro.org/mailman/listinfo/linaro-dev>,
	<mailto:linaro-dev-request-cunTk1MwBs8s++Sfvej+rw@public.gmane.org?subject=subscribe>
Sender: linaro-dev-bounces-cunTk1MwBs8s++Sfvej+rw@public.gmane.org
Errors-To: linaro-dev-bounces-cunTk1MwBs8s++Sfvej+rw@public.gmane.org
To: Tushar Behera <tushar.behera-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, linaro-dev-cunTk1MwBs8s++Sfvej+rw@public.gmane.org, patches-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org

--===============7353821007034506836==
Content-Type: multipart/alternative; boundary=14dae9399b97a296e104bae43dfc

--14dae9399b97a296e104bae43dfc
Content-Type: text/plain; charset=ISO-8859-1

I am doing the suspend and resume of s3cfb on exynos. the clk_on and
clk_off just failed. I think this is a related issue.

On 29 February 2012 13:45, Tushar Behera <tushar.behera-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:

> Hi Kukjin,
>
> On 12/01/2011 11:20 AM, Tushar Behera wrote:
> > The framebuffer driver needs the clock named 'lcd' as its bus
> > clock but the equivalent clock on Exynos4 is named as 'fimd'.
> > Hence, create a clkdev lookup entry with the name 'lcd' that
> > references the 'fimd' clock.
> >
> > Signed-off-by: Tushar Behera <tushar.behera-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> > ---
> >  arch/arm/mach-exynos/clock.c |   14 +++++++++-----
> >  1 files changed, 9 insertions(+), 5 deletions(-)
> >
> > diff --git a/arch/arm/mach-exynos/clock.c b/arch/arm/mach-exynos/clock.c
> > index 5d8d483..607ec28 100644
> > --- a/arch/arm/mach-exynos/clock.c
> > +++ b/arch/arm/mach-exynos/clock.c
> > @@ -489,11 +489,6 @@ static struct clk init_clocks_off[] = {
> >               .enable         = exynos4_clk_ip_cam_ctrl,
> >               .ctrlbit        = (1 << 3),
> >       }, {
> > -             .name           = "fimd",
> > -             .devname        = "exynos4-fb.0",
> > -             .enable         = exynos4_clk_ip_lcd0_ctrl,
> > -             .ctrlbit        = (1 << 0),
> > -     }, {
> >               .name           = "hsmmc",
> >               .devname        = "s3c-sdhci.0",
> >               .parent         = &clk_aclk_133.clk,
> > @@ -782,6 +777,13 @@ static struct clk clk_pdma1 = {
> >       .ctrlbit        = (1 << 1),
> >  };
> >
> > +static struct clk clk_fimd0 = {
> > +     .name           = "fimd",
> > +     .devname        = "exynos4-fb.0",
> > +     .enable         = exynos4_clk_ip_lcd0_ctrl,
> > +     .ctrlbit        = (1 << 0),
> > +};
> > +
> >  struct clk *clkset_group_list[] = {
> >       [0] = &clk_ext_xtal_mux,
> >       [1] = &clk_xusbxti,
> > @@ -1294,6 +1296,7 @@ static struct clksrc_clk *sysclks[] = {
> >  static struct clk *clk_cdev[] = {
> >       &clk_pdma0,
> >       &clk_pdma1,
> > +     &clk_fimd0,
> >  };
> >
> >  static struct clksrc_clk *clksrc_cdev[] = {
> > @@ -1318,6 +1321,7 @@ static struct clk_lookup exynos4_clk_lookup[] = {
> >       CLKDEV_INIT("s3c-sdhci.3", "mmc_busclk.2", &clk_sclk_mmc3.clk),
> >       CLKDEV_INIT("dma-pl330.0", "apb_pclk", &clk_pdma0),
> >       CLKDEV_INIT("dma-pl330.1", "apb_pclk", &clk_pdma1),
> > +     CLKDEV_INIT("exynos4-fb.0", "lcd", &clk_fimd0),
> >  };
> >
> >  static int xtal_rate;
>
> Would you please review this patch and let me know your opinion? Without
> this patch, frame-buffer support on EXYNOS4 is broken.
>
> --
> Tushar Behera
>
> _______________________________________________
> linaro-dev mailing list
> linaro-dev-cunTk1MwBs8s++Sfvej+rw@public.gmane.org
> http://lists.linaro.org/mailman/listinfo/linaro-dev
>

--14dae9399b97a296e104bae43dfc
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

I am doing the suspend and resume of s3cfb on exynos. the clk_on and clk_of=
f just failed. I think this is a related issue.<br><br><div class=3D"gmail_=
quote">On 29 February 2012 13:45, Tushar Behera <span dir=3D"ltr">&lt;<a hr=
ef=3D"mailto:tushar.behera-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org">tushar.behera-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org</a>&gt;</sp=
an> wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">Hi Kukjin,<br>
<br>
On 12/01/2011 11:20 AM, Tushar Behera wrote:<br>
&gt; The framebuffer driver needs the clock named &#39;lcd&#39; as its bus<=
br>
&gt; clock but the equivalent clock on Exynos4 is named as &#39;fimd&#39;.<=
br>
&gt; Hence, create a clkdev lookup entry with the name &#39;lcd&#39; that<b=
r>
&gt; references the &#39;fimd&#39; clock.<br>
&gt;<br>
&gt; Signed-off-by: Tushar Behera &lt;<a href=3D"mailto:tushar.behera@linar=
o.org">tushar.behera-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org</a>&gt;<br>
&gt; ---<br>
&gt; =A0arch/arm/mach-exynos/clock.c | =A0 14 +++++++++-----<br>
&gt; =A01 files changed, 9 insertions(+), 5 deletions(-)<br>
&gt;<br>
&gt; diff --git a/arch/arm/mach-exynos/clock.c b/arch/arm/mach-exynos/clock=
.c<br>
&gt; index 5d8d483..607ec28 100644<br>
&gt; --- a/arch/arm/mach-exynos/clock.c<br>
&gt; +++ b/arch/arm/mach-exynos/clock.c<br>
&gt; @@ -489,11 +489,6 @@ static struct clk init_clocks_off[] =3D {<br>
&gt; =A0 =A0 =A0 =A0 =A0 =A0 =A0 .enable =A0 =A0 =A0 =A0 =3D exynos4_clk_ip=
_cam_ctrl,<br>
&gt; =A0 =A0 =A0 =A0 =A0 =A0 =A0 .ctrlbit =A0 =A0 =A0 =A0=3D (1 &lt;&lt; 3)=
,<br>
&gt; =A0 =A0 =A0 }, {<br>
&gt; - =A0 =A0 =A0 =A0 =A0 =A0 .name =A0 =A0 =A0 =A0 =A0 =3D &quot;fimd&quo=
t;,<br>
&gt; - =A0 =A0 =A0 =A0 =A0 =A0 .devname =A0 =A0 =A0 =A0=3D &quot;exynos4-fb=
.0&quot;,<br>
&gt; - =A0 =A0 =A0 =A0 =A0 =A0 .enable =A0 =A0 =A0 =A0 =3D exynos4_clk_ip_l=
cd0_ctrl,<br>
&gt; - =A0 =A0 =A0 =A0 =A0 =A0 .ctrlbit =A0 =A0 =A0 =A0=3D (1 &lt;&lt; 0),<=
br>
&gt; - =A0 =A0 }, {<br>
&gt; =A0 =A0 =A0 =A0 =A0 =A0 =A0 .name =A0 =A0 =A0 =A0 =A0 =3D &quot;hsmmc&=
quot;,<br>
&gt; =A0 =A0 =A0 =A0 =A0 =A0 =A0 .devname =A0 =A0 =A0 =A0=3D &quot;s3c-sdhc=
i.0&quot;,<br>
&gt; =A0 =A0 =A0 =A0 =A0 =A0 =A0 .parent =A0 =A0 =A0 =A0 =3D &amp;clk_aclk_=
133.clk,<br>
&gt; @@ -782,6 +777,13 @@ static struct clk clk_pdma1 =3D {<br>
&gt; =A0 =A0 =A0 .ctrlbit =A0 =A0 =A0 =A0=3D (1 &lt;&lt; 1),<br>
&gt; =A0};<br>
&gt;<br>
&gt; +static struct clk clk_fimd0 =3D {<br>
&gt; + =A0 =A0 .name =A0 =A0 =A0 =A0 =A0 =3D &quot;fimd&quot;,<br>
&gt; + =A0 =A0 .devname =A0 =A0 =A0 =A0=3D &quot;exynos4-fb.0&quot;,<br>
&gt; + =A0 =A0 .enable =A0 =A0 =A0 =A0 =3D exynos4_clk_ip_lcd0_ctrl,<br>
&gt; + =A0 =A0 .ctrlbit =A0 =A0 =A0 =A0=3D (1 &lt;&lt; 0),<br>
&gt; +};<br>
&gt; +<br>
&gt; =A0struct clk *clkset_group_list[] =3D {<br>
&gt; =A0 =A0 =A0 [0] =3D &amp;clk_ext_xtal_mux,<br>
&gt; =A0 =A0 =A0 [1] =3D &amp;clk_xusbxti,<br>
&gt; @@ -1294,6 +1296,7 @@ static struct clksrc_clk *sysclks[] =3D {<br>
&gt; =A0static struct clk *clk_cdev[] =3D {<br>
&gt; =A0 =A0 =A0 &amp;clk_pdma0,<br>
&gt; =A0 =A0 =A0 &amp;clk_pdma1,<br>
&gt; + =A0 =A0 &amp;clk_fimd0,<br>
&gt; =A0};<br>
&gt;<br>
&gt; =A0static struct clksrc_clk *clksrc_cdev[] =3D {<br>
&gt; @@ -1318,6 +1321,7 @@ static struct clk_lookup exynos4_clk_lookup[] =
=3D {<br>
&gt; =A0 =A0 =A0 CLKDEV_INIT(&quot;s3c-sdhci.3&quot;, &quot;mmc_busclk.2&qu=
ot;, &amp;clk_sclk_mmc3.clk),<br>
&gt; =A0 =A0 =A0 CLKDEV_INIT(&quot;dma-pl330.0&quot;, &quot;apb_pclk&quot;,=
 &amp;clk_pdma0),<br>
&gt; =A0 =A0 =A0 CLKDEV_INIT(&quot;dma-pl330.1&quot;, &quot;apb_pclk&quot;,=
 &amp;clk_pdma1),<br>
&gt; + =A0 =A0 CLKDEV_INIT(&quot;exynos4-fb.0&quot;, &quot;lcd&quot;, &amp;=
clk_fimd0),<br>
&gt; =A0};<br>
&gt;<br>
&gt; =A0static int xtal_rate;<br>
<br>
Would you please review this patch and let me know your opinion? Without<br=
>
this patch, frame-buffer support on EXYNOS4 is broken.<br>
<span class=3D"HOEnZb"><font color=3D"#888888"><br>
--<br>
Tushar Behera<br>
<br>
_______________________________________________<br>
linaro-dev mailing list<br>
<a href=3D"mailto:linaro-dev-cunTk1MwBs8s++Sfvej+rw@public.gmane.org">linaro-dev-cunTk1MwBs8s++Sfvej+rw@public.gmane.org<=
/a><br>
<a href=3D"http://lists.linaro.org/mailman/listinfo/linaro-dev" target=3D"_=
blank">http://lists.linaro.org/mailman/listinfo/linaro-dev</a><br>
</font></span></blockquote></div><br>

--14dae9399b97a296e104bae43dfc--


--===============7353821007034506836==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linaro-dev mailing list
linaro-dev-cunTk1MwBs8s++Sfvej+rw@public.gmane.org
http://lists.linaro.org/mailman/listinfo/linaro-dev

--===============7353821007034506836==--
