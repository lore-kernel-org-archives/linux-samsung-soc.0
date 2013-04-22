From: Inki Dae <daeinki@gmail.com>
Subject: Re: [PATCH v4] drm/exynos: prepare FIMD clocks
Date: Mon, 22 Apr 2013 14:11:12 +0900
Message-ID: <CAAQKjZPrk6L=RmpywPgmiah+gtBgKOfsFdJLt7cfefyU76A80A@mail.gmail.com>
References: <1365419265-21238-1-git-send-email-vikas.sajjan@linaro.org>
	<56942397.CYxnWkv4Nb@flatron>
	<CAAQKjZOg+H=Dnd3HWEWKjQq6e2UGZvX6s0waBdqsxx=CEAXtQw@mail.gmail.com>
	<3109033.iP2qIPD33v@flatron>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1472809765=="
Return-path: <dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org>
In-Reply-To: <3109033.iP2qIPD33v@flatron>
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
Cc: linux-samsung-soc@vger.kernel.org, "patches@linaro.org" <patches@linaro.org>, Viresh Kumar <viresh.kumar@linaro.org>, DRI mailing list <dri-devel@lists.freedesktop.org>, Kukjin Kim <kgene.kim@samsung.com>, myungjoo.ham@samsung.com, Vikas Sajjan <vikas.sajjan@linaro.org>, linaro-kernel@lists.linaro.org, "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
List-Id: linux-samsung-soc@vger.kernel.org

--===============1472809765==
Content-Type: multipart/alternative; boundary=001a11c33caaf17f5404daec1813

--001a11c33caaf17f5404daec1813
Content-Type: text/plain; charset=ISO-8859-1

Hi Tomasz,

CCing Mr. Ham


2013/4/21 Tomasz Figa <tomasz.figa@gmail.com>

> Hi Inki,
>
> On Sunday 21 of April 2013 22:36:08 Inki Dae wrote:
> > 2013/4/21 Tomasz Figa <tomasz.figa@gmail.com>
> >
> > > Hi,
> > >
> > > On Monday 08 of April 2013 16:41:54 Viresh Kumar wrote:
> > > > On 8 April 2013 16:37, Vikas Sajjan <vikas.sajjan@linaro.org> wrote:
> > > > > While migrating to common clock framework (CCF), I found that the
> > > > > FIMD
> > > > > clocks were pulled down by the CCF.
> > > > > If CCF finds any clock(s) which has NOT been claimed by any of the
> > > > > drivers, then such clock(s) are PULLed low by CCF.
> > > > >
> > > > > Calling clk_prepare() for FIMD clocks fixes the issue.
> > > > >
> > > > > This patch also replaces clk_disable() with clk_unprepare() during
> > > > > exit, since clk_prepare() is called in fimd_probe().
> > > >
> > > > I asked you about fixing your commit log too.. It still looks
> > > > incorrect
> > > > to me.
> > > >
> > > > This patch doesn't have anything to do with CCF pulling clocks down,
> > > > but calling clk_prepare() before clk_enable() is must now.. that's
> > > > it.. nothing more.
> > >
> > > I fully agree.
> > >
> > > The message should be something like:
> > >
> > > Common Clock Framework introduced the need to prepare clocks before
> > > enabling them, otherwise clk_enable() fails. This patch adds
> > > clk_prepare calls to the driver.
> > >
> > > and that's all.
> > >
> > > What you are observing as "CCF pulling clocks down" is the fact that
> > > clk_enable() fails if the clock is not prepared and so the clock is
> > > not
> > > enabled in result.
> > >
> > > Another thing is that CCF is not pulling anything down. GPIO pins can
> > > be pulled down (or up or not pulled), but clocks can be masked, gated
> > > or simply disabled - this does not imply their signal level.
> > >
> > > > > Signed-off-by: Vikas Sajjan <vikas.sajjan@linaro.org>
> > > > > ---
> > > > >
> > > > > Changes since v3:
> > > > >         - added clk_prepare() in fimd_probe() and clk_unprepare()
> > > > >         in
> > > > >         fimd_remove()>
> > > > >
> > > > >          as suggested by Viresh Kumar <viresh.kumar@linaro.org>
> > > > >
> > > > > Changes since v2:
> > > > >         - moved clk_prepare_enable() and clk_disable_unprepare()
> > > > >         from
> > > > >         fimd_probe() to fimd_clock() as suggested by Inki Dae
> > > > >         <inki.dae@samsung.com>>
> > > > >
> > > > > Changes since v1:
> > > > >         - added error checking for clk_prepare_enable() and also
> > > > >         replaced
> > > > >         clk_disable() with clk_disable_unprepare() during exit.
> > > > >
> > > > > ---
> > > > >
> > > > >  drivers/gpu/drm/exynos/exynos_drm_fimd.c |   14 ++++++++++++--
> > > > >  1 file changed, 12 insertions(+), 2 deletions(-)
> > > > >
> > > > > diff --git a/drivers/gpu/drm/exynos/exynos_drm_fimd.c
> > > > > b/drivers/gpu/drm/exynos/exynos_drm_fimd.c index 9537761..aa22370
> > > > > 100644
> > > > > --- a/drivers/gpu/drm/exynos/exynos_drm_fimd.c
> > > > > +++ b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
> > > > > @@ -934,6 +934,16 @@ static int fimd_probe(struct platform_device
> > > > > *pdev)>
> > > > >
> > > > >                 return ret;
> > > > >
> > > > >         }
> > > > >
> > > > > +       ret = clk_prepare(ctx->bus_clk);
> > > > > +       if (ret < 0)
> > > > > +               return ret;
> > > > > +
> > > > > +       ret = clk_prepare(ctx->lcd_clk);
> > > > > +       if  (ret < 0) {
> > > > > +               clk_unprepare(ctx->bus_clk);
> > > > > +               return ret;
> > > > > +       }
> > > > > +
> > >
> > > Why not just simply use clk_prepare_enable() instead of all calls to
> > > clk_enable() in the driver?
> > >
> > > Same goes for s/clk_disable/clk_disable_unprepare/ .
> >
> > I agree with you. Using clk_prepare_enable() is more clear. Actually I
> > had already commented on this. Please see the patch v2. But this way
> > also looks good to me.
>
> Well, both versions are technically correct and will have the same effect
> for Exynos SoC clocks, since only enable/disable ops change hardware
> state.
>
> However if we look at general meaning of those generic ops, the clock will
> remain prepared for all the time the driver is loaded, even if the device
>

Right, so I said previous one is more clear. I gonna revert current one and
then merge previous one(v3)



> is runtime suspended. Again on Exynos SoCs this won't have any effect, but
> I think we should respect general Common Clock Framework semantics anyway.
>
> > > > >         ctx->vidcon0 = pdata->vidcon0;
> > > > >         ctx->vidcon1 = pdata->vidcon1;
> > > > >         ctx->default_win = pdata->default_win;
> > > > >
> > > > > @@ -981,8 +991,8 @@ static int fimd_remove(struct platform_device
> > > > > *pdev)>
> > > > >
> > > > >         if (ctx->suspended)
> > > > >
> > > > >                 goto out;
> > > > >
> > > > > -       clk_disable(ctx->lcd_clk);
> > > > > -       clk_disable(ctx->bus_clk);
> > > > > +       clk_unprepare(ctx->lcd_clk);
> > > > > +       clk_unprepare(ctx->bus_clk);
> > > >
> > > > This looks wrong again.. You still need to call clk_disable() to
> > > > make
> > > > clk enabled
> > > > count zero...
> > >
> > > Viresh is right again here.
> >
> > Ok, you two guys say together this looks wrong so I'd like to take more
> > checking. I thought that clk->clk_enable is 1 at here and it would be 0
> > by pm_runtimg_put_sync(). Is there any my missing point?
>
> You're reasoning is correct, but only assuming that runtime PM is enabled.
> When it is disabled, pm_runtime_put_sync() is a no-op.
>
> Well, after digging into the exynos_drm_fimd driver a bit more, it seems
> like its power management code needs a serious rework, because I was able
> to find more problems:
>
> 1) fimd_activate() does not get called at all if CONFIG_PM_RUNTIME is not
> enabled (except in system-wide suspend callbacks, but this is irrelevant
> to this point) - this means that the hardware is not properly initialized
> without CONFIG_PM_RUNTIME - at least clocks does not get enabled.
>
> 2) pm_runtime_set_suspended() can be used only when runtime PM is disabled
> for the device (i.e. by calling pm_runtime_disable() or not calling
> pm_runtime_enable() at all) - when runtime PM is enabled it is basically a
> no-op returning -EAGAIN error.
>
> So here's my proposed solution:
>
> 1) call fimd_activate() and pm_runtime_set_active() explicitly in
> fimd_probe(), before calling pm_runtime_enable():
>
>         mutex_init(&ctx->lock);
>
>         platform_set_drvdata(pdev, ctx);
> +
> +       fimd_activate(ctx, true);
>
> +       pm_runtime_set_active(dev);
>         pm_runtime_enable(dev);
>         pm_runtime_get_sync(dev);
>
> This would power up the device even if CONFIG_PM_RUNTIME is not enabled.
> Note that pm_runtime_get_sync() after marking the device as active with
> pm_runtime_set_active() won't result in calling fimd_runtime_resume(),
> because the device is considered already resumed.
>
> 2) in fimd_remove():
>
> +       pm_runtime_disable(dev);
> +
>         if (ctx->suspended)
> -               goto out;
> +               return 0;
>
> -       clk_disable(ctx->lcd_clk);
> -       clk_disable(ctx->bus_clk);
> +       fimd_activate(ctx, false);
>
> +       pm_runtime_put_noidle(dev);
>         pm_runtime_set_suspended(dev);
> -       pm_runtime_put_sync(dev);
> -
> -out:
> -       pm_runtime_disable(dev);
>
> First, pm_runtime_disable() will prevent any further runtime PM operations
> that could change ctx->suspended state. Then, if ctx->suspended is true,
> there is no need to suspend anything and we can leave. Otherwise, we power
> down the hardware manually - which will work with both CONFIG_PM_RUNTIME
> enabled and disabled, and then mark the hardware as suspended and free
> remaining reference in runtime PM core. Note that pm_runtime_put_noidle
> just decreases the reference counter and nothing else.
>
> 3) after those two changes, all that remains is to fix compliance with
> Common Clock Framework, in other words:
>
> s/clk_enable/clk_prepare_enable/
>
> and
>
> s/clk_disable/clk_disable_unprepare/
>
>
Also looks good to me. But what if power domain was disabled without pm
runtime? In this case, you must enable the power domain at machine code or
bootloader somewhere. This way would not only need some hard codes to turn
the power domain on but also not manage power management fully. This is
same as only the use of pm runtime interface(needing some hard codes
without pm runtime) so I don't prefer to add clk_enable/disable to fimd
probe(). I quite tend to force only the use of pm runtime as possible. So
please add the hard codes to machine code or bootloader like you did for
power domain if you want to use drm fimd without pm runtime.

Thanks,
Inki Dae


> Best regards,
> Tomasz
>
> --
> To unsubscribe from this list: send the line "unsubscribe
> linux-samsung-soc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>

--001a11c33caaf17f5404daec1813
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi Tomasz,<br><br></div><div>CCing Mr. Ham<br></div><=
div class=3D"gmail_extra"><br><br><div class=3D"gmail_quote">2013/4/21 Toma=
sz Figa <span dir=3D"ltr">&lt;<a href=3D"mailto:tomasz.figa@gmail.com" targ=
et=3D"_blank">tomasz.figa@gmail.com</a>&gt;</span><br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">Hi Inki,<br>
<div><div class=3D"h5"><br>
On Sunday 21 of April 2013 22:36:08 Inki Dae wrote:<br>
&gt; 2013/4/21 Tomasz Figa &lt;<a href=3D"mailto:tomasz.figa@gmail.com">tom=
asz.figa@gmail.com</a>&gt;<br>
&gt;<br>
&gt; &gt; Hi,<br>
&gt; &gt;<br>
&gt; &gt; On Monday 08 of April 2013 16:41:54 Viresh Kumar wrote:<br>
&gt; &gt; &gt; On 8 April 2013 16:37, Vikas Sajjan &lt;<a href=3D"mailto:vi=
kas.sajjan@linaro.org">vikas.sajjan@linaro.org</a>&gt; wrote:<br>
&gt; &gt; &gt; &gt; While migrating to common clock framework (CCF), I foun=
d that the<br>
&gt; &gt; &gt; &gt; FIMD<br>
&gt; &gt; &gt; &gt; clocks were pulled down by the CCF.<br>
&gt; &gt; &gt; &gt; If CCF finds any clock(s) which has NOT been claimed by=
 any of the<br>
&gt; &gt; &gt; &gt; drivers, then such clock(s) are PULLed low by CCF.<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; Calling clk_prepare() for FIMD clocks fixes the issue.<=
br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; This patch also replaces clk_disable() with clk_unprepa=
re() during<br>
&gt; &gt; &gt; &gt; exit, since clk_prepare() is called in fimd_probe().<br=
>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; I asked you about fixing your commit log too.. It still look=
s<br>
&gt; &gt; &gt; incorrect<br>
&gt; &gt; &gt; to me.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; This patch doesn&#39;t have anything to do with CCF pulling =
clocks down,<br>
&gt; &gt; &gt; but calling clk_prepare() before clk_enable() is must now.. =
that&#39;s<br>
&gt; &gt; &gt; it.. nothing more.<br>
&gt; &gt;<br>
&gt; &gt; I fully agree.<br>
&gt; &gt;<br>
&gt; &gt; The message should be something like:<br>
&gt; &gt;<br>
&gt; &gt; Common Clock Framework introduced the need to prepare clocks befo=
re<br>
&gt; &gt; enabling them, otherwise clk_enable() fails. This patch adds<br>
&gt; &gt; clk_prepare calls to the driver.<br>
&gt; &gt;<br>
&gt; &gt; and that&#39;s all.<br>
&gt; &gt;<br>
&gt; &gt; What you are observing as &quot;CCF pulling clocks down&quot; is =
the fact that<br>
&gt; &gt; clk_enable() fails if the clock is not prepared and so the clock =
is<br>
&gt; &gt; not<br>
&gt; &gt; enabled in result.<br>
&gt; &gt;<br>
&gt; &gt; Another thing is that CCF is not pulling anything down. GPIO pins=
 can<br>
&gt; &gt; be pulled down (or up or not pulled), but clocks can be masked, g=
ated<br>
&gt; &gt; or simply disabled - this does not imply their signal level.<br>
&gt; &gt;<br>
&gt; &gt; &gt; &gt; Signed-off-by: Vikas Sajjan &lt;<a href=3D"mailto:vikas=
.sajjan@linaro.org">vikas.sajjan@linaro.org</a>&gt;<br>
&gt; &gt; &gt; &gt; ---<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; Changes since v3:<br>
&gt; &gt; &gt; &gt; =A0 =A0 =A0 =A0 - added clk_prepare() in fimd_probe() a=
nd clk_unprepare()<br>
&gt; &gt; &gt; &gt; =A0 =A0 =A0 =A0 in<br>
&gt; &gt; &gt; &gt; =A0 =A0 =A0 =A0 fimd_remove()&gt;<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; =A0 =A0 =A0 =A0 =A0as suggested by Viresh Kumar &lt;<a =
href=3D"mailto:viresh.kumar@linaro.org">viresh.kumar@linaro.org</a>&gt;<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; Changes since v2:<br>
&gt; &gt; &gt; &gt; =A0 =A0 =A0 =A0 - moved clk_prepare_enable() and clk_di=
sable_unprepare()<br>
&gt; &gt; &gt; &gt; =A0 =A0 =A0 =A0 from<br>
&gt; &gt; &gt; &gt; =A0 =A0 =A0 =A0 fimd_probe() to fimd_clock() as suggest=
ed by Inki Dae<br>
&gt; &gt; &gt; &gt; =A0 =A0 =A0 =A0 &lt;<a href=3D"mailto:inki.dae@samsung.=
com">inki.dae@samsung.com</a>&gt;&gt;<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; Changes since v1:<br>
&gt; &gt; &gt; &gt; =A0 =A0 =A0 =A0 - added error checking for clk_prepare_=
enable() and also<br>
&gt; &gt; &gt; &gt; =A0 =A0 =A0 =A0 replaced<br>
&gt; &gt; &gt; &gt; =A0 =A0 =A0 =A0 clk_disable() with clk_disable_unprepar=
e() during exit.<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; ---<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; =A0drivers/gpu/drm/exynos/exynos_drm_fimd.c | =A0 14 ++=
++++++++++--<br>
&gt; &gt; &gt; &gt; =A01 file changed, 12 insertions(+), 2 deletions(-)<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; diff --git a/drivers/gpu/drm/exynos/exynos_drm_fimd.c<b=
r>
&gt; &gt; &gt; &gt; b/drivers/gpu/drm/exynos/exynos_drm_fimd.c index 953776=
1..aa22370<br>
&gt; &gt; &gt; &gt; 100644<br>
&gt; &gt; &gt; &gt; --- a/drivers/gpu/drm/exynos/exynos_drm_fimd.c<br>
&gt; &gt; &gt; &gt; +++ b/drivers/gpu/drm/exynos/exynos_drm_fimd.c<br>
&gt; &gt; &gt; &gt; @@ -934,6 +934,16 @@ static int fimd_probe(struct platf=
orm_device<br>
&gt; &gt; &gt; &gt; *pdev)&gt;<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 return ret;<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; =A0 =A0 =A0 =A0 }<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; + =A0 =A0 =A0 ret =3D clk_prepare(ctx-&gt;bus_clk);<br>
&gt; &gt; &gt; &gt; + =A0 =A0 =A0 if (ret &lt; 0)<br>
&gt; &gt; &gt; &gt; + =A0 =A0 =A0 =A0 =A0 =A0 =A0 return ret;<br>
&gt; &gt; &gt; &gt; +<br>
&gt; &gt; &gt; &gt; + =A0 =A0 =A0 ret =3D clk_prepare(ctx-&gt;lcd_clk);<br>
&gt; &gt; &gt; &gt; + =A0 =A0 =A0 if =A0(ret &lt; 0) {<br>
&gt; &gt; &gt; &gt; + =A0 =A0 =A0 =A0 =A0 =A0 =A0 clk_unprepare(ctx-&gt;bus=
_clk);<br>
&gt; &gt; &gt; &gt; + =A0 =A0 =A0 =A0 =A0 =A0 =A0 return ret;<br>
&gt; &gt; &gt; &gt; + =A0 =A0 =A0 }<br>
&gt; &gt; &gt; &gt; +<br>
&gt; &gt;<br>
&gt; &gt; Why not just simply use clk_prepare_enable() instead of all calls=
 to<br>
&gt; &gt; clk_enable() in the driver?<br>
&gt; &gt;<br>
&gt; &gt; Same goes for s/clk_disable/clk_disable_unprepare/ .<br>
&gt;<br>
&gt; I agree with you. Using clk_prepare_enable() is more clear. Actually I=
<br>
&gt; had already commented on this. Please see the patch v2. But this way<b=
r>
&gt; also looks good to me.<br>
<br>
</div></div>Well, both versions are technically correct and will have the s=
ame effect<br>
for Exynos SoC clocks, since only enable/disable ops change hardware<br>
state.<br>
<br>
However if we look at general meaning of those generic ops, the clock will<=
br>
remain prepared for all the time the driver is loaded, even if the device<b=
r></blockquote><div><br></div><div>Right, so I said previous one is more cl=
ear. I gonna revert current one and then merge previous one(v3)<br></div>
<div><br>=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .=
8ex;border-left:1px #ccc solid;padding-left:1ex">
is runtime suspended. Again on Exynos SoCs this won&#39;t have any effect, =
but<br>
I think we should respect general Common Clock Framework semantics anyway.<=
br>
<div class=3D"im"><br>
&gt; &gt; &gt; &gt; =A0 =A0 =A0 =A0 ctx-&gt;vidcon0 =3D pdata-&gt;vidcon0;<=
br>
&gt; &gt; &gt; &gt; =A0 =A0 =A0 =A0 ctx-&gt;vidcon1 =3D pdata-&gt;vidcon1;<=
br>
&gt; &gt; &gt; &gt; =A0 =A0 =A0 =A0 ctx-&gt;default_win =3D pdata-&gt;defau=
lt_win;<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; @@ -981,8 +991,8 @@ static int fimd_remove(struct platf=
orm_device<br>
&gt; &gt; &gt; &gt; *pdev)&gt;<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; =A0 =A0 =A0 =A0 if (ctx-&gt;suspended)<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 goto out;<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; - =A0 =A0 =A0 clk_disable(ctx-&gt;lcd_clk);<br>
&gt; &gt; &gt; &gt; - =A0 =A0 =A0 clk_disable(ctx-&gt;bus_clk);<br>
&gt; &gt; &gt; &gt; + =A0 =A0 =A0 clk_unprepare(ctx-&gt;lcd_clk);<br>
&gt; &gt; &gt; &gt; + =A0 =A0 =A0 clk_unprepare(ctx-&gt;bus_clk);<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; This looks wrong again.. You still need to call clk_disable(=
) to<br>
&gt; &gt; &gt; make<br>
&gt; &gt; &gt; clk enabled<br>
&gt; &gt; &gt; count zero...<br>
&gt; &gt;<br>
&gt; &gt; Viresh is right again here.<br>
&gt;<br>
&gt; Ok, you two guys say together this looks wrong so I&#39;d like to take=
 more<br>
&gt; checking. I thought that clk-&gt;clk_enable is 1 at here and it would =
be 0<br>
&gt; by pm_runtimg_put_sync(). Is there any my missing point?<br>
<br>
</div>You&#39;re reasoning is correct, but only assuming that runtime PM is=
 enabled.<br>
When it is disabled, pm_runtime_put_sync() is a no-op.<br>
<br>
Well, after digging into the exynos_drm_fimd driver a bit more, it seems<br=
>
like its power management code needs a serious rework, because I was able<b=
r>
to find more problems:<br>
<br>
1) fimd_activate() does not get called at all if CONFIG_PM_RUNTIME is not<b=
r>
enabled (except in system-wide suspend callbacks, but this is irrelevant<br=
>
to this point) - this means that the hardware is not properly initialized<b=
r>
without CONFIG_PM_RUNTIME - at least clocks does not get enabled.<br>
<br>
2) pm_runtime_set_suspended() can be used only when runtime PM is disabled<=
br>
for the device (i.e. by calling pm_runtime_disable() or not calling<br>
pm_runtime_enable() at all) - when runtime PM is enabled it is basically a<=
br>
no-op returning -EAGAIN error.<br>
<br>
So here&#39;s my proposed solution:<br>
<br>
1) call fimd_activate() and pm_runtime_set_active() explicitly in<br>
fimd_probe(), before calling pm_runtime_enable():<br>
<br>
=A0 =A0 =A0 =A0 mutex_init(&amp;ctx-&gt;lock);<br>
<br>
=A0 =A0 =A0 =A0 platform_set_drvdata(pdev, ctx);<br>
+<br>
+ =A0 =A0 =A0 fimd_activate(ctx, true);<br>
<br>
+ =A0 =A0 =A0 pm_runtime_set_active(dev);<br>
=A0 =A0 =A0 =A0 pm_runtime_enable(dev);<br>
=A0 =A0 =A0 =A0 pm_runtime_get_sync(dev);<br>
<br>
This would power up the device even if CONFIG_PM_RUNTIME is not enabled.<br=
>
Note that pm_runtime_get_sync() after marking the device as active with<br>
pm_runtime_set_active() won&#39;t result in calling fimd_runtime_resume(),<=
br>
because the device is considered already resumed.<br>
<br>
2) in fimd_remove():<br>
<br>
+ =A0 =A0 =A0 pm_runtime_disable(dev);<br>
+<br>
=A0 =A0 =A0 =A0 if (ctx-&gt;suspended)<br>
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 goto out;<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 return 0;<br>
<div class=3D"im"><br>
- =A0 =A0 =A0 clk_disable(ctx-&gt;lcd_clk);<br>
- =A0 =A0 =A0 clk_disable(ctx-&gt;bus_clk);<br>
</div>+ =A0 =A0 =A0 fimd_activate(ctx, false);<br>
<br>
+ =A0 =A0 =A0 pm_runtime_put_noidle(dev);<br>
=A0 =A0 =A0 =A0 pm_runtime_set_suspended(dev);<br>
- =A0 =A0 =A0 pm_runtime_put_sync(dev);<br>
-<br>
-out:<br>
- =A0 =A0 =A0 pm_runtime_disable(dev);<br>
<br>
First, pm_runtime_disable() will prevent any further runtime PM operations<=
br>
that could change ctx-&gt;suspended state. Then, if ctx-&gt;suspended is tr=
ue,<br>
there is no need to suspend anything and we can leave. Otherwise, we power<=
br>
down the hardware manually - which will work with both CONFIG_PM_RUNTIME<br=
>
enabled and disabled, and then mark the hardware as suspended and free<br>
remaining reference in runtime PM core. Note that pm_runtime_put_noidle<br>
just decreases the reference counter and nothing else.<br>
<br>
3) after those two changes, all that remains is to fix compliance with<br>
Common Clock Framework, in other words:<br>
<br>
s/clk_enable/clk_prepare_enable/<br>
<br>
and<br>
<br>
s/clk_disable/clk_disable_unprepare/<br>
<br></blockquote><div><br></div><div>Also looks good to me. But what if pow=
er domain was disabled without pm runtime? In this case, you must enable th=
e power domain at machine code or bootloader somewhere. This way would not =
only need some hard codes to turn the power domain on but also not manage p=
ower management fully. This is same as only the use of pm runtime interface=
(needing some hard codes without pm runtime) so I don&#39;t prefer to add c=
lk_enable/disable to fimd probe(). I quite tend to force only the use of pm=
 runtime as possible. So please add the hard codes to machine code or bootl=
oader like you did for power domain if you want to use drm fimd without pm =
runtime.<br>
</div><div><br></div><div>Thanks,<br>Inki Dae<br></div><div>=A0</div><block=
quote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc=
 solid;padding-left:1ex">
Best regards,<br>
Tomasz<br>
<br>
--<br>
To unsubscribe from this list: send the line &quot;unsubscribe linux-samsun=
g-soc&quot; in<br>
the body of a message to <a href=3D"mailto:majordomo@vger.kernel.org">major=
domo@vger.kernel.org</a><br>
More majordomo info at =A0<a href=3D"http://vger.kernel.org/majordomo-info.=
html" target=3D"_blank">http://vger.kernel.org/majordomo-info.html</a><br>
</blockquote></div><br></div></div>

--001a11c33caaf17f5404daec1813--

--===============1472809765==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
http://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1472809765==--
