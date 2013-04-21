From: Inki Dae <inki.dae@samsung.com>
Subject: Re: [PATCH v4] drm/exynos: prepare FIMD clocks
Date: Sun, 21 Apr 2013 22:36:08 +0900
Message-ID: <CAAQKjZOg+H=Dnd3HWEWKjQq6e2UGZvX6s0waBdqsxx=CEAXtQw@mail.gmail.com>
References: <1365419265-21238-1-git-send-email-vikas.sajjan@linaro.org>
	<CAKohpokPKzHHML1WhhUNYMz1Q-mJmqbp49K4Jp5Na0kjtuivEQ@mail.gmail.com>
	<56942397.CYxnWkv4Nb@flatron>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0774605862=="
Return-path: <dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org>
In-Reply-To: <56942397.CYxnWkv4Nb@flatron>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Sender: dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org
Errors-To: dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org
To: Tomasz Figa <tomasz.figa@gmail.com>
Cc: linux-samsung-soc@vger.kernel.org, "patches@linaro.org" <patches@linaro.org>, Viresh Kumar <viresh.kumar@linaro.org>, DRI mailing list <dri-devel@lists.freedesktop.org>, Kukjin Kim <kgene.kim@samsung.com>, Vikas Sajjan <vikas.sajjan@linaro.org>, linaro-kernel@lists.linaro.org, "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
List-Id: linux-samsung-soc@vger.kernel.org

--===============0774605862==
Content-Type: multipart/alternative; boundary=047d7b3a8436e52d2b04dadf0819

--047d7b3a8436e52d2b04dadf0819
Content-Type: text/plain; charset=ISO-8859-1

2013/4/21 Tomasz Figa <tomasz.figa@gmail.com>

> Hi,
>
> On Monday 08 of April 2013 16:41:54 Viresh Kumar wrote:
> > On 8 April 2013 16:37, Vikas Sajjan <vikas.sajjan@linaro.org> wrote:
> > > While migrating to common clock framework (CCF), I found that the FIMD
> > > clocks were pulled down by the CCF.
> > > If CCF finds any clock(s) which has NOT been claimed by any of the
> > > drivers, then such clock(s) are PULLed low by CCF.
> > >
> > > Calling clk_prepare() for FIMD clocks fixes the issue.
> > >
> > > This patch also replaces clk_disable() with clk_unprepare() during
> > > exit, since clk_prepare() is called in fimd_probe().
> >
> > I asked you about fixing your commit log too.. It still looks incorrect
> > to me.
> >
> > This patch doesn't have anything to do with CCF pulling clocks down, but
> > calling clk_prepare() before clk_enable() is must now.. that's it..
> > nothing more.
> >
>
> I fully agree.
>
> The message should be something like:
>
> Common Clock Framework introduced the need to prepare clocks before
> enabling them, otherwise clk_enable() fails. This patch adds clk_prepare
> calls to the driver.
>
> and that's all.
>
> What you are observing as "CCF pulling clocks down" is the fact that
> clk_enable() fails if the clock is not prepared and so the clock is not
> enabled in result.
>
> Another thing is that CCF is not pulling anything down. GPIO pins can be
> pulled down (or up or not pulled), but clocks can be masked, gated or
> simply disabled - this does not imply their signal level.
>
> > > Signed-off-by: Vikas Sajjan <vikas.sajjan@linaro.org>
> > > ---
> > >
> > > Changes since v3:
> > >         - added clk_prepare() in fimd_probe() and clk_unprepare() in
> > >         fimd_remove()>
> > >          as suggested by Viresh Kumar <viresh.kumar@linaro.org>
> > >
> > > Changes since v2:
> > >         - moved clk_prepare_enable() and clk_disable_unprepare() from
> > >         fimd_probe() to fimd_clock() as suggested by Inki Dae
> > >         <inki.dae@samsung.com>>
> > > Changes since v1:
> > >         - added error checking for clk_prepare_enable() and also
> > >         replaced
> > >         clk_disable() with clk_disable_unprepare() during exit.
> > >
> > > ---
> > >
> > >  drivers/gpu/drm/exynos/exynos_drm_fimd.c |   14 ++++++++++++--
> > >  1 file changed, 12 insertions(+), 2 deletions(-)
> > >
> > > diff --git a/drivers/gpu/drm/exynos/exynos_drm_fimd.c
> > > b/drivers/gpu/drm/exynos/exynos_drm_fimd.c index 9537761..aa22370
> > > 100644
> > > --- a/drivers/gpu/drm/exynos/exynos_drm_fimd.c
> > > +++ b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
> > > @@ -934,6 +934,16 @@ static int fimd_probe(struct platform_device
> > > *pdev)>
> > >                 return ret;
> > >
> > >         }
> > >
> > > +       ret = clk_prepare(ctx->bus_clk);
> > > +       if (ret < 0)
> > > +               return ret;
> > > +
> > > +       ret = clk_prepare(ctx->lcd_clk);
> > > +       if  (ret < 0) {
> > > +               clk_unprepare(ctx->bus_clk);
> > > +               return ret;
> > > +       }
> > > +
>
> Why not just simply use clk_prepare_enable() instead of all calls to
> clk_enable() in the driver?
>
> Same goes for s/clk_disable/clk_disable_unprepare/ .
>
>
I agree with you. Using clk_prepare_enable() is more clear. Actually I had
already commented on this. Please see the patch v2. But this way also looks
good to me.



> > >
> > >         ctx->vidcon0 = pdata->vidcon0;
> > >         ctx->vidcon1 = pdata->vidcon1;
> > >         ctx->default_win = pdata->default_win;
> > >
> > > @@ -981,8 +991,8 @@ static int fimd_remove(struct platform_device
> > > *pdev)>
> > >         if (ctx->suspended)
> > >
> > >                 goto out;
> > >
> > > -       clk_disable(ctx->lcd_clk);
> > > -       clk_disable(ctx->bus_clk);
> > > +       clk_unprepare(ctx->lcd_clk);
> > > +       clk_unprepare(ctx->bus_clk);
> >
> > This looks wrong again.. You still need to call clk_disable() to make
> > clk enabled
> > count zero...
>
> Viresh is right again here.
>
>
Ok, you two guys say together this looks wrong so I'd like to take more
checking. I thought that clk->clk_enable is 1 at here and it would be 0 by
pm_runtimg_put_sync(). Is there any my missing point?


> Best regards,
> Tomasz
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> http://lists.freedesktop.org/mailman/listinfo/dri-devel
>

--047d7b3a8436e52d2b04dadf0819
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><br><div class=3D"gmail_quo=
te">2013/4/21 Tomasz Figa <span dir=3D"ltr">&lt;<a href=3D"mailto:tomasz.fi=
ga@gmail.com" target=3D"_blank">tomasz.figa@gmail.com</a>&gt;</span><br><bl=
ockquote style=3D"margin:0px 0px 0px 0.8ex;padding-left:1ex;border-left-col=
or:rgb(204,204,204);border-left-width:1px;border-left-style:solid" class=3D=
"gmail_quote">
Hi,<br>
<div class=3D"im"><br>
On Monday 08 of April 2013 16:41:54 Viresh Kumar wrote:<br>
&gt; On 8 April 2013 16:37, Vikas Sajjan &lt;<a href=3D"mailto:vikas.sajjan=
@linaro.org">vikas.sajjan@linaro.org</a>&gt; wrote:<br>
&gt; &gt; While migrating to common clock framework (CCF), I found that the=
 FIMD<br>
&gt; &gt; clocks were pulled down by the CCF.<br>
&gt; &gt; If CCF finds any clock(s) which has NOT been claimed by any of th=
e<br>
&gt; &gt; drivers, then such clock(s) are PULLed low by CCF.<br>
&gt; &gt;<br>
&gt; &gt; Calling clk_prepare() for FIMD clocks fixes the issue.<br>
&gt; &gt;<br>
&gt; &gt; This patch also replaces clk_disable() with clk_unprepare() durin=
g<br>
&gt; &gt; exit, since clk_prepare() is called in fimd_probe().<br>
&gt;<br>
&gt; I asked you about fixing your commit log too.. It still looks incorrec=
t<br>
&gt; to me.<br>
&gt;<br>
&gt; This patch doesn&#39;t have anything to do with CCF pulling clocks dow=
n, but<br>
&gt; calling clk_prepare() before clk_enable() is must now.. that&#39;s it.=
.<br>
&gt; nothing more.<br>
&gt;<br>
<br>
</div>I fully agree.<br>
<br>
The message should be something like:<br>
<br>
Common Clock Framework introduced the need to prepare clocks before<br>
enabling them, otherwise clk_enable() fails. This patch adds clk_prepare<br=
>
calls to the driver.<br>
<br>
and that&#39;s all.<br>
<br>
What you are observing as &quot;CCF pulling clocks down&quot; is the fact t=
hat<br>
clk_enable() fails if the clock is not prepared and so the clock is not<br>
enabled in result.<br>
<br>
Another thing is that CCF is not pulling anything down. GPIO pins can be<br=
>
pulled down (or up or not pulled), but clocks can be masked, gated or<br>
simply disabled - this does not imply their signal level.<br>
<div><div class=3D"h5"><br>
&gt; &gt; Signed-off-by: Vikas Sajjan &lt;<a href=3D"mailto:vikas.sajjan@li=
naro.org">vikas.sajjan@linaro.org</a>&gt;<br>
&gt; &gt; ---<br>
&gt; &gt;<br>
&gt; &gt; Changes since v3:<br>
&gt; &gt; =A0 =A0 =A0 =A0 - added clk_prepare() in fimd_probe() and clk_unp=
repare() in<br>
&gt; &gt; =A0 =A0 =A0 =A0 fimd_remove()&gt;<br>
&gt; &gt; =A0 =A0 =A0 =A0 =A0as suggested by Viresh Kumar &lt;<a href=3D"ma=
ilto:viresh.kumar@linaro.org">viresh.kumar@linaro.org</a>&gt;<br>
&gt; &gt;<br>
&gt; &gt; Changes since v2:<br>
&gt; &gt; =A0 =A0 =A0 =A0 - moved clk_prepare_enable() and clk_disable_unpr=
epare() from<br>
&gt; &gt; =A0 =A0 =A0 =A0 fimd_probe() to fimd_clock() as suggested by Inki=
 Dae<br>
&gt; &gt; =A0 =A0 =A0 =A0 &lt;<a href=3D"mailto:inki.dae@samsung.com">inki.=
dae@samsung.com</a>&gt;&gt;<br>
&gt; &gt; Changes since v1:<br>
&gt; &gt; =A0 =A0 =A0 =A0 - added error checking for clk_prepare_enable() a=
nd also<br>
&gt; &gt; =A0 =A0 =A0 =A0 replaced<br>
&gt; &gt; =A0 =A0 =A0 =A0 clk_disable() with clk_disable_unprepare() during=
 exit.<br>
&gt; &gt;<br>
&gt; &gt; ---<br>
&gt; &gt;<br>
&gt; &gt; =A0drivers/gpu/drm/exynos/exynos_drm_fimd.c | =A0 14 ++++++++++++=
--<br>
&gt; &gt; =A01 file changed, 12 insertions(+), 2 deletions(-)<br>
&gt; &gt;<br>
&gt; &gt; diff --git a/drivers/gpu/drm/exynos/exynos_drm_fimd.c<br>
&gt; &gt; b/drivers/gpu/drm/exynos/exynos_drm_fimd.c index 9537761..aa22370=
<br>
&gt; &gt; 100644<br>
&gt; &gt; --- a/drivers/gpu/drm/exynos/exynos_drm_fimd.c<br>
&gt; &gt; +++ b/drivers/gpu/drm/exynos/exynos_drm_fimd.c<br>
&gt; &gt; @@ -934,6 +934,16 @@ static int fimd_probe(struct platform_device=
<br>
&gt; &gt; *pdev)&gt;<br>
&gt; &gt; =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 return ret;<br>
&gt; &gt;<br>
&gt; &gt; =A0 =A0 =A0 =A0 }<br>
&gt; &gt;<br>
&gt; &gt; + =A0 =A0 =A0 ret =3D clk_prepare(ctx-&gt;bus_clk);<br>
&gt; &gt; + =A0 =A0 =A0 if (ret &lt; 0)<br>
&gt; &gt; + =A0 =A0 =A0 =A0 =A0 =A0 =A0 return ret;<br>
&gt; &gt; +<br>
&gt; &gt; + =A0 =A0 =A0 ret =3D clk_prepare(ctx-&gt;lcd_clk);<br>
&gt; &gt; + =A0 =A0 =A0 if =A0(ret &lt; 0) {<br>
&gt; &gt; + =A0 =A0 =A0 =A0 =A0 =A0 =A0 clk_unprepare(ctx-&gt;bus_clk);<br>
&gt; &gt; + =A0 =A0 =A0 =A0 =A0 =A0 =A0 return ret;<br>
&gt; &gt; + =A0 =A0 =A0 }<br>
&gt; &gt; +<br>
<br>
</div></div>Why not just simply use clk_prepare_enable() instead of all cal=
ls to<br>
clk_enable() in the driver?<br>
<br>
Same goes for s/clk_disable/clk_disable_unprepare/ .<br>
<div class=3D"im"><br></div></blockquote><div>=A0</div><div>I agree with yo=
u. Using clk_prepare_enable() is more clear. Actually I had already comment=
ed on this. Please see the patch v2. But this way also looks good to me.</d=
iv>
<div>=A0</div><div>=A0</div><blockquote style=3D"margin:0px 0px 0px 0.8ex;p=
adding-left:1ex;border-left-color:rgb(204,204,204);border-left-width:1px;bo=
rder-left-style:solid" class=3D"gmail_quote"><div class=3D"im">
&gt; &gt;<br>
&gt; &gt; =A0 =A0 =A0 =A0 ctx-&gt;vidcon0 =3D pdata-&gt;vidcon0;<br>
&gt; &gt; =A0 =A0 =A0 =A0 ctx-&gt;vidcon1 =3D pdata-&gt;vidcon1;<br>
&gt; &gt; =A0 =A0 =A0 =A0 ctx-&gt;default_win =3D pdata-&gt;default_win;<br=
>
&gt; &gt;<br>
&gt; &gt; @@ -981,8 +991,8 @@ static int fimd_remove(struct platform_device=
<br>
&gt; &gt; *pdev)&gt;<br>
&gt; &gt; =A0 =A0 =A0 =A0 if (ctx-&gt;suspended)<br>
&gt; &gt;<br>
&gt; &gt; =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 goto out;<br>
&gt; &gt;<br>
&gt; &gt; - =A0 =A0 =A0 clk_disable(ctx-&gt;lcd_clk);<br>
&gt; &gt; - =A0 =A0 =A0 clk_disable(ctx-&gt;bus_clk);<br>
&gt; &gt; + =A0 =A0 =A0 clk_unprepare(ctx-&gt;lcd_clk);<br>
&gt; &gt; + =A0 =A0 =A0 clk_unprepare(ctx-&gt;bus_clk);<br>
&gt;<br>
&gt; This looks wrong again.. You still need to call clk_disable() to make<=
br>
&gt; clk enabled<br>
&gt; count zero...<br>
<br>
</div>Viresh is right again here.<br>
<br></blockquote><div>=A0</div><div>Ok, you two guys say together this look=
s wrong=A0so I&#39;d like to take more checking. I thought that=A0clk-&gt;c=
lk_enable is 1 at here and=A0it=A0would be 0 by pm_runtimg_put_sync(). Is t=
here any my missing point?</div>
<div>=A0</div><blockquote style=3D"margin:0px 0px 0px 0.8ex;padding-left:1e=
x;border-left-color:rgb(204,204,204);border-left-width:1px;border-left-styl=
e:solid" class=3D"gmail_quote">
Best regards,<br>
Tomasz<br>
<div class=3D"HOEnZb"><div class=3D"h5"><br>
_______________________________________________<br>
dri-devel mailing list<br>
<a href=3D"mailto:dri-devel@lists.freedesktop.org">dri-devel@lists.freedesk=
top.org</a><br>
<a href=3D"http://lists.freedesktop.org/mailman/listinfo/dri-devel" target=
=3D"_blank">http://lists.freedesktop.org/mailman/listinfo/dri-devel</a><br>
</div></div></blockquote></div><br></div></div>

--047d7b3a8436e52d2b04dadf0819--

--===============0774605862==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
http://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0774605862==--
