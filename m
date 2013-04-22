From: Vikas Sajjan <vikas.sajjan@linaro.org>
Subject: Re: [PATCH v3] drm/exynos: enable FIMD clocks
Date: Mon, 22 Apr 2013 11:42:25 +0530
Message-ID: <CAD025yRyZTL4rOJJkpWgS-pUhG8bKYmfNS6_Zor8VizCbiy+Vg@mail.gmail.com>
References: <1364805830-6129-1-git-send-email-vikas.sajjan@linaro.org>
	<CAKohpo=az=FS6-jfjN0WR=eKSAZ=MSo90Qc91kK-PEWOH3tzsQ@mail.gmail.com>
	<07b501ce3f1d$359f5900$a0de0b00$%dae@samsung.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0945669283=="
Return-path: <dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org>
In-Reply-To: <07b501ce3f1d$359f5900$a0de0b00$%dae@samsung.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Sender: dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org
Errors-To: dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org
To: Inki Dae <inki.dae@samsung.com>
Cc: "kgene.kim" <kgene.kim@samsung.com>, Viresh Kumar <viresh.kumar@linaro.org>, DRI mailing list <dri-devel@lists.freedesktop.org>, linux-samsung-soc@vger.kernel.org, linaro-kernel@lists.linaro.org, linux-media@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

--===============0945669283==
Content-Type: multipart/alternative; boundary=001a11c34dce20f14b04daecf5aa

--001a11c34dce20f14b04daecf5aa
Content-Type: text/plain; charset=ISO-8859-1

Hi Mr Dae,

On 22 April 2013 11:19, Inki Dae <inki.dae@samsung.com> wrote:

> Hi, Mr. Vikas
>
> Please fix the below typos Viresh pointed out and my comments.
>
> > -----Original Message-----
> > From: Viresh Kumar [mailto:viresh.kumar@linaro.org]
> > Sent: Monday, April 01, 2013 5:51 PM
> > To: Vikas Sajjan
> > Cc: dri-devel@lists.freedesktop.org; linux-samsung-soc@vger.kernel.org;
> > jy0922.shim@samsung.com; inki.dae@samsung.com; kgene.kim@samsung.com;
> > linaro-kernel@lists.linaro.org; linux-media@vger.kernel.org
> > Subject: Re: [PATCH v3] drm/exynos: enable FIMD clocks
> >
> > On 1 April 2013 14:13, Vikas Sajjan <vikas.sajjan@linaro.org> wrote:
> > > While migrating to common clock framework (CCF), found that the FIMD
> > clocks
> >
> > s/found/we found/
> >
> > > were pulled down by the CCF.
> > > If CCF finds any clock(s) which has NOT been claimed by any of the
> > > drivers, then such clock(s) are PULLed low by CCF.
> > >
> > > By calling clk_prepare_enable() for FIMD clocks fixes the issue.
> >
> > s/By calling/Calling/
> >
> > and
> >
> > s/the/this
> >
> > > this patch also replaces clk_disable() with clk_disable_unprepare()
> >
> > s/this/This
> >
> > > during exit.
> >
> > Sorry but your log doesn't say what you are doing. You are just adding
> > relevant calls to clk_prepare/unprepare() before calling
> > clk_enable/disable.
> >
>

  I shall modify the commit message as below as suggested by tomaz figa,

  " Common Clock Framework introduced the need to prepare clocks before
enabling them, otherwise clk_enable() fails. This patch adds clk_prepare
calls to the driver. This patch also removes clk_disable() from
fimd_remove() as it will be done by pm_runtime_put_sync".


>  > > Signed-off-by: Vikas Sajjan <vikas.sajjan@linaro.org>
> > > ---
> > > Changes since v2:
> > >         - moved clk_prepare_enable() and clk_disable_unprepare() from
> > >         fimd_probe() to fimd_clock() as suggested by Inki Dae
> > <inki.dae@samsung.com>
> > > Changes since v1:
> > >         - added error checking for clk_prepare_enable() and also
> replaced
> > >         clk_disable() with clk_disable_unprepare() during exit.
> > > ---
> > >  drivers/gpu/drm/exynos/exynos_drm_fimd.c |   14 +++++++-------
> > >  1 file changed, 7 insertions(+), 7 deletions(-)
> > >
> > > diff --git a/drivers/gpu/drm/exynos/exynos_drm_fimd.c
> > b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
> > > index 9537761..f2400c8 100644
> > > --- a/drivers/gpu/drm/exynos/exynos_drm_fimd.c
> > > +++ b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
> > > @@ -799,18 +799,18 @@ static int fimd_clock(struct fimd_context *ctx,
> > bool enable)
> > >         if (enable) {
> > >                 int ret;
> > >
> > > -               ret = clk_enable(ctx->bus_clk);
> > > +               ret = clk_prepare_enable(ctx->bus_clk);
> > >                 if (ret < 0)
> > >                         return ret;
> > >
> > > -               ret = clk_enable(ctx->lcd_clk);
> > > +               ret = clk_prepare_enable(ctx->lcd_clk);
> > >                 if  (ret < 0) {
> > > -                       clk_disable(ctx->bus_clk);
> > > +                       clk_disable_unprepare(ctx->bus_clk);
> > >                         return ret;
> > >                 }
> > >         } else {
> > > -               clk_disable(ctx->lcd_clk);
> > > -               clk_disable(ctx->bus_clk);
> > > +               clk_disable_unprepare(ctx->lcd_clk);
> > > +               clk_disable_unprepare(ctx->bus_clk);
> > >         }
> > >
> > >         return 0;
> > > @@ -981,8 +981,8 @@ static int fimd_remove(struct platform_device
> *pdev)
> > >         if (ctx->suspended)
> > >                 goto out;
> > >
> > > -       clk_disable(ctx->lcd_clk);
> > > -       clk_disable(ctx->bus_clk);
> > > +       clk_disable_unprepare(ctx->lcd_clk);
> > > +       clk_disable_unprepare(ctx->bus_clk);
>
> Just remove the above codes. It seems that clk_disable(also
> clk_disable_unprepare) isn't needed because it will be done by
> pm_runtime_put_sync and please re-post it(probably patch v5??)
>
>    So you mean I should work on v3 version, and keep  the
clk_prepare_enable() code as is in fimd_clock() and just remove the
clk_disable_unprepare() and also clk_disable() from fimd_remove(), right?

Viresh and Tomaz Figa, let me know if these changes are fine with you guys.

Thanks,
> Inki Dae
>
> >
> > You are doing things at the right place but i have a suggestion. Are you
> > doing
> > anything in your clk_prepare() atleast for this device? Probably not.
> >
> > If not, then its better to call clk_prepare/unprepare only once at
> > probe/remove
> > and keep clk_enable/disable calls as is.
> >
> > --
> > viresh
>
>


-- 
Thanks and Regards
 Vikas Sajjan

--001a11c34dce20f14b04daecf5aa
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra">Hi Mr Dae,<br></div><div cl=
ass=3D"gmail_extra"><br><div class=3D"gmail_quote">On 22 April 2013 11:19, =
Inki Dae <span dir=3D"ltr">&lt;<a href=3D"mailto:inki.dae@samsung.com" targ=
et=3D"_blank">inki.dae@samsung.com</a>&gt;</span> wrote:<br>

<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left:1px solid rgb(204,204,204);padding-left:1ex">Hi, Mr. Vikas<br>
<br>
Please fix the below typos Viresh pointed out and my comments.<br>
<div><div class=3D"h5"><br>
&gt; -----Original Message-----<br>
&gt; From: Viresh Kumar [mailto:<a href=3D"mailto:viresh.kumar@linaro.org">=
viresh.kumar@linaro.org</a>]<br>
&gt; Sent: Monday, April 01, 2013 5:51 PM<br>
&gt; To: Vikas Sajjan<br>
&gt; Cc: <a href=3D"mailto:dri-devel@lists.freedesktop.org">dri-devel@lists=
.freedesktop.org</a>; <a href=3D"mailto:linux-samsung-soc@vger.kernel.org">=
linux-samsung-soc@vger.kernel.org</a>;<br>
&gt; <a href=3D"mailto:jy0922.shim@samsung.com">jy0922.shim@samsung.com</a>=
; <a href=3D"mailto:inki.dae@samsung.com">inki.dae@samsung.com</a>; <a href=
=3D"mailto:kgene.kim@samsung.com">kgene.kim@samsung.com</a>;<br>
&gt; <a href=3D"mailto:linaro-kernel@lists.linaro.org">linaro-kernel@lists.=
linaro.org</a>; <a href=3D"mailto:linux-media@vger.kernel.org">linux-media@=
vger.kernel.org</a><br>
&gt; Subject: Re: [PATCH v3] drm/exynos: enable FIMD clocks<br>
&gt;<br>
&gt; On 1 April 2013 14:13, Vikas Sajjan &lt;<a href=3D"mailto:vikas.sajjan=
@linaro.org">vikas.sajjan@linaro.org</a>&gt; wrote:<br>
&gt; &gt; While migrating to common clock framework (CCF), found that the F=
IMD<br>
&gt; clocks<br>
&gt;<br>
&gt; s/found/we found/<br>
&gt;<br>
&gt; &gt; were pulled down by the CCF.<br>
&gt; &gt; If CCF finds any clock(s) which has NOT been claimed by any of th=
e<br>
&gt; &gt; drivers, then such clock(s) are PULLed low by CCF.<br>
&gt; &gt;<br>
&gt; &gt; By calling clk_prepare_enable() for FIMD clocks fixes the issue.<=
br>
&gt;<br>
&gt; s/By calling/Calling/<br>
&gt;<br>
&gt; and<br>
&gt;<br>
&gt; s/the/this<br>
&gt;<br>
&gt; &gt; this patch also replaces clk_disable() with clk_disable_unprepare=
()<br>
&gt;<br>
&gt; s/this/This<br>
&gt;<br>
&gt; &gt; during exit.<br>
&gt;<br>
&gt; Sorry but your log doesn&#39;t say what you are doing. You are just ad=
ding<br>
&gt; relevant calls to clk_prepare/unprepare() before calling<br>
&gt; clk_enable/disable.<br>
&gt;<br></div></div></blockquote><div><br></div><div>=A0 I shall modify the=
 commit message as below as suggested by tomaz figa,<br><br>=A0 &quot; Comm=
on Clock Framework introduced the need to prepare clocks before<br>
enabling them, otherwise clk_enable() fails. This patch adds clk_prepare<br=
>
calls to the driver. This patch also removes clk_disable() from fimd_remove=
() as it will be done by pm_runtime_put_sync&quot;.<br>=A0 <br></div><block=
quote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1=
px solid rgb(204,204,204);padding-left:1ex">

<div><div class=3D"h5">
&gt; &gt; Signed-off-by: Vikas Sajjan &lt;<a href=3D"mailto:vikas.sajjan@li=
naro.org">vikas.sajjan@linaro.org</a>&gt;<br>
&gt; &gt; ---<br>
&gt; &gt; Changes since v2:<br>
&gt; &gt; =A0 =A0 =A0 =A0 - moved clk_prepare_enable() and clk_disable_unpr=
epare() from<br>
&gt; &gt; =A0 =A0 =A0 =A0 fimd_probe() to fimd_clock() as suggested by Inki=
 Dae<br>
&gt; &lt;<a href=3D"mailto:inki.dae@samsung.com">inki.dae@samsung.com</a>&g=
t;<br>
&gt; &gt; Changes since v1:<br>
&gt; &gt; =A0 =A0 =A0 =A0 - added error checking for clk_prepare_enable() a=
nd also<br>
replaced<br>
&gt; &gt; =A0 =A0 =A0 =A0 clk_disable() with clk_disable_unprepare() during=
 exit.<br>
&gt; &gt; ---<br>
&gt; &gt; =A0drivers/gpu/drm/exynos/exynos_drm_fimd.c | =A0 14 +++++++-----=
--<br>
&gt; &gt; =A01 file changed, 7 insertions(+), 7 deletions(-)<br>
&gt; &gt;<br>
&gt; &gt; diff --git a/drivers/gpu/drm/exynos/exynos_drm_fimd.c<br>
&gt; b/drivers/gpu/drm/exynos/exynos_drm_fimd.c<br>
&gt; &gt; index 9537761..f2400c8 100644<br>
&gt; &gt; --- a/drivers/gpu/drm/exynos/exynos_drm_fimd.c<br>
&gt; &gt; +++ b/drivers/gpu/drm/exynos/exynos_drm_fimd.c<br>
&gt; &gt; @@ -799,18 +799,18 @@ static int fimd_clock(struct fimd_context *=
ctx,<br>
&gt; bool enable)<br>
&gt; &gt; =A0 =A0 =A0 =A0 if (enable) {<br>
&gt; &gt; =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 int ret;<br>
&gt; &gt;<br>
&gt; &gt; - =A0 =A0 =A0 =A0 =A0 =A0 =A0 ret =3D clk_enable(ctx-&gt;bus_clk)=
;<br>
&gt; &gt; + =A0 =A0 =A0 =A0 =A0 =A0 =A0 ret =3D clk_prepare_enable(ctx-&gt;=
bus_clk);<br>
&gt; &gt; =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (ret &lt; 0)<br>
&gt; &gt; =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 return ret;<br>
&gt; &gt;<br>
&gt; &gt; - =A0 =A0 =A0 =A0 =A0 =A0 =A0 ret =3D clk_enable(ctx-&gt;lcd_clk)=
;<br>
&gt; &gt; + =A0 =A0 =A0 =A0 =A0 =A0 =A0 ret =3D clk_prepare_enable(ctx-&gt;=
lcd_clk);<br>
&gt; &gt; =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 if =A0(ret &lt; 0) {<br>
&gt; &gt; - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 clk_disable(ctx-&gt=
;bus_clk);<br>
&gt; &gt; + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 clk_disable_unprepa=
re(ctx-&gt;bus_clk);<br>
&gt; &gt; =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 return ret;<br>
&gt; &gt; =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 }<br>
&gt; &gt; =A0 =A0 =A0 =A0 } else {<br>
&gt; &gt; - =A0 =A0 =A0 =A0 =A0 =A0 =A0 clk_disable(ctx-&gt;lcd_clk);<br>
&gt; &gt; - =A0 =A0 =A0 =A0 =A0 =A0 =A0 clk_disable(ctx-&gt;bus_clk);<br>
&gt; &gt; + =A0 =A0 =A0 =A0 =A0 =A0 =A0 clk_disable_unprepare(ctx-&gt;lcd_c=
lk);<br>
&gt; &gt; + =A0 =A0 =A0 =A0 =A0 =A0 =A0 clk_disable_unprepare(ctx-&gt;bus_c=
lk);<br>
&gt; &gt; =A0 =A0 =A0 =A0 }<br>
&gt; &gt;<br>
&gt; &gt; =A0 =A0 =A0 =A0 return 0;<br>
&gt; &gt; @@ -981,8 +981,8 @@ static int fimd_remove(struct platform_device=
 *pdev)<br>
&gt; &gt; =A0 =A0 =A0 =A0 if (ctx-&gt;suspended)<br>
&gt; &gt; =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 goto out;<br>
&gt; &gt;<br>
&gt; &gt; - =A0 =A0 =A0 clk_disable(ctx-&gt;lcd_clk);<br>
&gt; &gt; - =A0 =A0 =A0 clk_disable(ctx-&gt;bus_clk);<br>
&gt; &gt; + =A0 =A0 =A0 clk_disable_unprepare(ctx-&gt;lcd_clk);<br>
&gt; &gt; + =A0 =A0 =A0 clk_disable_unprepare(ctx-&gt;bus_clk);<br>
<br>
</div></div>Just remove the above codes. It seems that clk_disable(also<br>
clk_disable_unprepare) isn&#39;t needed because it will be done by<br>
pm_runtime_put_sync and please re-post it(probably patch v5??)<br>
<br></blockquote><div>=A0=A0 So you mean I should work on v3 version, and k=
eep=A0 the clk_prepare_enable() code as is in fimd_clock() and just remove =
the clk_disable_unprepare() and also clk_disable() from fimd_remove(), righ=
t? <br>

</div><div><br>Viresh and Tomaz Figa, let me know if these changes are fine=
 with you guys.<br></div><div><br></div><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pad=
ding-left:1ex">


Thanks,<br>
Inki Dae<br>
<div class=3D""><div class=3D"h5"><br>
&gt;<br>
&gt; You are doing things at the right place but i have a suggestion. Are y=
ou<br>
&gt; doing<br>
&gt; anything in your clk_prepare() atleast for this device? Probably not.<=
br>
&gt;<br>
&gt; If not, then its better to call clk_prepare/unprepare only once at<br>
&gt; probe/remove<br>
&gt; and keep clk_enable/disable calls as is.<br>
&gt;<br>
&gt; --<br>
&gt; viresh<br>
<br>
</div></div></blockquote></div><br><br clear=3D"all"><br>-- <br>Thanks and =
Regards<div>=A0Vikas Sajjan</div>
</div></div>

--001a11c34dce20f14b04daecf5aa--

--===============0945669283==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
http://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0945669283==--
