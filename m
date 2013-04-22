From: Inki Dae <inki.dae@samsung.com>
Subject: Re: [PATCH v4] drm/exynos: prepare FIMD clocks
Date: Mon, 22 Apr 2013 19:03:45 +0900
Message-ID: <CAAQKjZPT8pMQtY4ud=mMwgw7MYGf-JdqXePCt=yvcNcM1XgxoA@mail.gmail.com>
References: <1365419265-21238-1-git-send-email-vikas.sajjan@linaro.org>
	<3109033.iP2qIPD33v@flatron>
	<CAAQKjZPrk6L=RmpywPgmiah+gtBgKOfsFdJLt7cfefyU76A80A@mail.gmail.com>
	<1830339.IiQ8P4gtV3@amdc1227>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0735816078=="
Return-path: <dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org>
In-Reply-To: <1830339.IiQ8P4gtV3@amdc1227>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Sender: dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org
Errors-To: dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org
To: Tomasz Figa <t.figa@samsung.com>
Cc: Kukjin Kim <kgene.kim@samsung.com>, "patches@linaro.org" <patches@linaro.org>, Viresh Kumar <viresh.kumar@linaro.org>, Tomasz Figa <tomasz.figa@gmail.com>, DRI mailing list <dri-devel@lists.freedesktop.org>, linux-samsung-soc@vger.kernel.org, myungjoo.ham@samsung.com, Vikas Sajjan <vikas.sajjan@linaro.org>, linaro-kernel@lists.linaro.org, "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
List-Id: linux-samsung-soc@vger.kernel.org

--===============0735816078==
Content-Type: multipart/alternative; boundary=047d7b3a84362c294804daf02f58

--047d7b3a84362c294804daf02f58
Content-Type: text/plain; charset=ISO-8859-1

2013/4/22 Tomasz Figa <t.figa@samsung.com>

> On Sunday 21 of April 2013 22:36:08 Inki Dae wrote:
> > > > 2013/4/21 Tomasz Figa <tomasz.figa@gmail.com>
> > > >
> > > > > Hi,
> > > > >
> > > > > On Monday 08 of April 2013 16:41:54 Viresh Kumar wrote:
> > > > > > On 8 April 2013 16:37, Vikas Sajjan <vikas.sajjan@linaro.org>
> wrote:
> > > > > > > While migrating to common clock framework (CCF), I found that
> the
> > > > > > > FIMD
> > > > > > > clocks were pulled down by the CCF.
> > > > > > > If CCF finds any clock(s) which has NOT been claimed by any of
> the
> > > > > > > drivers, then such clock(s) are PULLed low by CCF.
> > > > > > >
> > > > > > > Calling clk_prepare() for FIMD clocks fixes the issue.
> > > > > > >
> > > > > > > This patch also replaces clk_disable() with clk_unprepare()
> during
> > > > > > > exit, since clk_prepare() is called in fimd_probe().
> > > > > >
> > > > > > I asked you about fixing your commit log too.. It still looks
> > > > > > incorrect
> > > > > > to me.
> > > > > >
> > > > > > This patch doesn't have anything to do with CCF pulling clocks
> down,
> > > > > > but calling clk_prepare() before clk_enable() is must now..
> that's
> > > > > > it.. nothing more.
> > > > >
> > > > > I fully agree.
> > > > >
> > > > > The message should be something like:
> > > > >
> > > > > Common Clock Framework introduced the need to prepare clocks before
> > > > > enabling them, otherwise clk_enable() fails. This patch adds
> > > > > clk_prepare calls to the driver.
> > > > >
> > > > > and that's all.
> > > > >
> > > > > What you are observing as "CCF pulling clocks down" is the fact
> that
> > > > > clk_enable() fails if the clock is not prepared and so the clock is
> > > > > not
> > > > > enabled in result.
> > > > >
> > > > > Another thing is that CCF is not pulling anything down. GPIO pins
> can
> > > > > be pulled down (or up or not pulled), but clocks can be masked,
> gated
> > > > > or simply disabled - this does not imply their signal level.
> > > > >
> > > > > > > Signed-off-by: Vikas Sajjan <vikas.sajjan@linaro.org>
> > > > > > > ---
> > > > > > >
> > > > > > > Changes since v3:
> > > > > > >         - added clk_prepare() in fimd_probe() and
> clk_unprepare()
> > > > > > >         in
> > > > > > >         fimd_remove()>
> > > > > > >
> > > > > > >          as suggested by Viresh Kumar <viresh.kumar@linaro.org
> >
> > > > > > >
> > > > > > > Changes since v2:
> > > > > > >         - moved clk_prepare_enable() and
> clk_disable_unprepare()
> > > > > > >         from
> > > > > > >         fimd_probe() to fimd_clock() as suggested by Inki Dae
> > > > > > >         <inki.dae@samsung.com>>
> > > > > > >
> > > > > > > Changes since v1:
> > > > > > >         - added error checking for clk_prepare_enable() and
> also
> > > > > > >         replaced
> > > > > > >         clk_disable() with clk_disable_unprepare() during exit.
> > > > > > >
> > > > > > > ---
> > > > > > >
> > > > > > >  drivers/gpu/drm/exynos/exynos_drm_fimd.c |   14 ++++++++++++--
> > > > > > >  1 file changed, 12 insertions(+), 2 deletions(-)
> > > > > > >
> > > > > > > diff --git a/drivers/gpu/drm/exynos/exynos_drm_fimd.c
> > > > > > > b/drivers/gpu/drm/exynos/exynos_drm_fimd.c index
> 9537761..aa22370
> > > > > > > 100644
> > > > > > > --- a/drivers/gpu/drm/exynos/exynos_drm_fimd.c
> > > > > > > +++ b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
> > > > > > > @@ -934,6 +934,16 @@ static int fimd_probe(struct
> platform_device
> > > > > > > *pdev)>
> > > > > > >
> > > > > > >                 return ret;
> > > > > > >
> > > > > > >         }
> > > > > > >
> > > > > > > +       ret = clk_prepare(ctx->bus_clk);
> > > > > > > +       if (ret < 0)
> > > > > > > +               return ret;
> > > > > > > +
> > > > > > > +       ret = clk_prepare(ctx->lcd_clk);
> > > > > > > +       if  (ret < 0) {
> > > > > > > +               clk_unprepare(ctx->bus_clk);
> > > > > > > +               return ret;
> > > > > > > +       }
> > > > > > > +
> > > > >
> > > > > Why not just simply use clk_prepare_enable() instead of all calls
> to
> > > > > clk_enable() in the driver?
> > > > >
> > > > > Same goes for s/clk_disable/clk_disable_unprepare/ .
> > > >
> > > > I agree with you. Using clk_prepare_enable() is more clear. Actually
> I
> > > > had already commented on this. Please see the patch v2. But this way
> > > > also looks good to me.
> > >
> > >
> > > Well, both versions are technically correct and will have the same
> effect
> > > for Exynos SoC clocks, since only enable/disable ops change hardware
> > > state.
> > >
> > > However if we look at general meaning of those generic ops, the clock
> will
> > > remain prepared for all the time the driver is loaded, even if the
> device
> > >
> > >
> > >
> > > Right, so I said previous one is more clear. I gonna revert current one
> and then merge previous one(v3)
> > >
> > >
> > >
> > > is runtime suspended. Again on Exynos SoCs this won't have any effect,
> but
> > > I think we should respect general Common Clock Framework semantics
> anyway.
> > >
> > >
> > > > > > >         ctx->vidcon0 = pdata->vidcon0;
> > > > > > >         ctx->vidcon1 = pdata->vidcon1;
> > > > > > >         ctx->default_win = pdata->default_win;
> > > > > > >
> > > > > > > @@ -981,8 +991,8 @@ static int fimd_remove(struct
> platform_device
> > > > > > > *pdev)>
> > > > > > >
> > > > > > >         if (ctx->suspended)
> > > > > > >
> > > > > > >                 goto out;
> > > > > > >
> > > > > > > -       clk_disable(ctx->lcd_clk);
> > > > > > > -       clk_disable(ctx->bus_clk);
> > > > > > > +       clk_unprepare(ctx->lcd_clk);
> > > > > > > +       clk_unprepare(ctx->bus_clk);
> > > > > >
> > > > > > This looks wrong again.. You still need to call clk_disable() to
> > > > > > make
> > > > > > clk enabled
> > > > > > count zero...
> > > > >
> > > > > Viresh is right again here.
> > > >
> > > > Ok, you two guys say together this looks wrong so I'd like to take
> more
> > > > checking. I thought that clk->clk_enable is 1 at here and it would
> be 0
> > > > by pm_runtimg_put_sync(). Is there any my missing point?
> > >
> > >
> > > You're reasoning is correct, but only assuming that runtime PM is
> enabled.
> > > When it is disabled, pm_runtime_put_sync() is a no-op.
> > >
> > > Well, after digging into the exynos_drm_fimd driver a bit more, it
> seems
> > > like its power management code needs a serious rework, because I was
> able
> > > to find more problems:
> > >
> > > 1) fimd_activate() does not get called at all if CONFIG_PM_RUNTIME is
> not
> > > enabled (except in system-wide suspend callbacks, but this is
> irrelevant
> > > to this point) - this means that the hardware is not properly
> initialized
> > > without CONFIG_PM_RUNTIME - at least clocks does not get enabled.
> > >
> > > 2) pm_runtime_set_suspended() can be used only when runtime PM is
> disabled
> > > for the device (i.e. by calling pm_runtime_disable() or not calling
> > > pm_runtime_enable() at all) - when runtime PM is enabled it is
> basically a
> > > no-op returning -EAGAIN error.
> > >
> > > So here's my proposed solution:
> > >
> > > 1) call fimd_activate() and pm_runtime_set_active() explicitly in
> > > fimd_probe(), before calling pm_runtime_enable():
> > >
> > >         mutex_init(&ctx->lock);
> > >
> > >         platform_set_drvdata(pdev, ctx);
> > > +
> > > +       fimd_activate(ctx, true);
> > >
> > > +       pm_runtime_set_active(dev);
> > >         pm_runtime_enable(dev);
> > >         pm_runtime_get_sync(dev);
> > >
> > > This would power up the device even if CONFIG_PM_RUNTIME is not
> enabled.
> > > Note that pm_runtime_get_sync() after marking the device as active with
> > > pm_runtime_set_active() won't result in calling fimd_runtime_resume(),
> > > because the device is considered already resumed.
> > >
> > > 2) in fimd_remove():
> > >
> > > +       pm_runtime_disable(dev);
> > > +
> > >         if (ctx->suspended)
> > > -               goto out;
> > > +               return 0;
> > >
> > >
> > > -       clk_disable(ctx->lcd_clk);
> > > -       clk_disable(ctx->bus_clk);
> > >
> > > +       fimd_activate(ctx, false);
> > >
> > > +       pm_runtime_put_noidle(dev);
> > >         pm_runtime_set_suspended(dev);
> > > -       pm_runtime_put_sync(dev);
> > > -
> > > -out:
> > > -       pm_runtime_disable(dev);
> > >
> > > First, pm_runtime_disable() will prevent any further runtime PM
> operations
> > > that could change ctx->suspended state. Then, if ctx->suspended is
> true,
> > > there is no need to suspend anything and we can leave. Otherwise, we
> power
> > > down the hardware manually - which will work with both
> CONFIG_PM_RUNTIME
> > > enabled and disabled, and then mark the hardware as suspended and free
> > > remaining reference in runtime PM core. Note that pm_runtime_put_noidle
> > > just decreases the reference counter and nothing else.
> > >
> > > 3) after those two changes, all that remains is to fix compliance with
> > > Common Clock Framework, in other words:
> > >
> > > s/clk_enable/clk_prepare_enable/
> > >
> > > and
> > >
> > > s/clk_disable/clk_disable_unprepare/
> >
> >
> > Also looks good to me. But what if power domain was disabled without pm
> > runtime? In this case, you must enable the power domain at machine code
> or
> > bootloader somewhere. This way would not only need some hard codes to
> turn
> > the power domain on but also not manage power management fully. This is
> same
> > as only the use of pm runtime interface(needing some hard codes without
> pm
> > runtime) so I don't prefer to add clk_enable/disable to fimd probe(). I
> quite
> > tend to force only the use of pm runtime as possible. So please add the
> hard
> > codes to machine code or bootloader like you did for power domain if you
> > want to use drm fimd without pm runtime.
>
> That's not how the runtime PM, clock subsystems work:
>
> 1) When CONFIG_PM_RUNTIME is disabled, all the used hardware must be kept
> powered on all the time.
>
> 2) Common Clock Framework will always gate all clocks that have zero
> enable_count. Note that CCF support for Exynos is already merged for 3.10
> and
> it will be the only available clock support method for Exynos.
>
> AFAIK, drivers must work correctly in both cases, with CONFIG_PM_RUNTIME
> enabled and disabled.
>
>
Then is the driver worked correctly if the power domain to this device was
disabled at bootloader without CONFIG_PM_RUNTIME and with clk_enable()?  I
think, in this case, the device wouldn't be worked correctly because the
power of the device remains off. So you must enable the power domain
somewhere. What is the difference between these two cases?



> Best regards,
> Tomasz
>
>

--047d7b3a84362c294804daf02f58
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><br><div class=3D"gmail=
_quote">2013/4/22 Tomasz Figa <span dir=3D"ltr">&lt;<a href=3D"mailto:t.fig=
a@samsung.com" target=3D"_blank">t.figa@samsung.com</a>&gt;</span><br><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #cc=
c solid;padding-left:1ex">
<div class=3D"HOEnZb"><div class=3D"h5">On Sunday 21 of April 2013 22:36:08=
 Inki Dae wrote:<br>
&gt; &gt; &gt; 2013/4/21 Tomasz Figa &lt;<a href=3D"mailto:tomasz.figa@gmai=
l.com">tomasz.figa@gmail.com</a>&gt;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; Hi,<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; On Monday 08 of April 2013 16:41:54 Viresh Kumar wrote:=
<br>
&gt; &gt; &gt; &gt; &gt; On 8 April 2013 16:37, Vikas Sajjan &lt;<a href=3D=
"mailto:vikas.sajjan@linaro.org">vikas.sajjan@linaro.org</a>&gt; wrote:<br>
&gt; &gt; &gt; &gt; &gt; &gt; While migrating to common clock framework (CC=
F), I found that the<br>
&gt; &gt; &gt; &gt; &gt; &gt; FIMD<br>
&gt; &gt; &gt; &gt; &gt; &gt; clocks were pulled down by the CCF.<br>
&gt; &gt; &gt; &gt; &gt; &gt; If CCF finds any clock(s) which has NOT been =
claimed by any of the<br>
&gt; &gt; &gt; &gt; &gt; &gt; drivers, then such clock(s) are PULLed low by=
 CCF.<br>
&gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; Calling clk_prepare() for FIMD clocks fixes t=
he issue.<br>
&gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; This patch also replaces clk_disable() with c=
lk_unprepare() during<br>
&gt; &gt; &gt; &gt; &gt; &gt; exit, since clk_prepare() is called in fimd_p=
robe().<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; I asked you about fixing your commit log too.. It =
still looks<br>
&gt; &gt; &gt; &gt; &gt; incorrect<br>
&gt; &gt; &gt; &gt; &gt; to me.<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; This patch doesn&#39;t have anything to do with CC=
F pulling clocks down,<br>
&gt; &gt; &gt; &gt; &gt; but calling clk_prepare() before clk_enable() is m=
ust now.. that&#39;s<br>
&gt; &gt; &gt; &gt; &gt; it.. nothing more.<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; I fully agree.<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; The message should be something like:<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; Common Clock Framework introduced the need to prepare c=
locks before<br>
&gt; &gt; &gt; &gt; enabling them, otherwise clk_enable() fails. This patch=
 adds<br>
&gt; &gt; &gt; &gt; clk_prepare calls to the driver.<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; and that&#39;s all.<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; What you are observing as &quot;CCF pulling clocks down=
&quot; is the fact that<br>
&gt; &gt; &gt; &gt; clk_enable() fails if the clock is not prepared and so =
the clock is<br>
&gt; &gt; &gt; &gt; not<br>
&gt; &gt; &gt; &gt; enabled in result.<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; Another thing is that CCF is not pulling anything down.=
 GPIO pins can<br>
&gt; &gt; &gt; &gt; be pulled down (or up or not pulled), but clocks can be=
 masked, gated<br>
&gt; &gt; &gt; &gt; or simply disabled - this does not imply their signal l=
evel.<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; Signed-off-by: Vikas Sajjan &lt;<a href=3D"ma=
ilto:vikas.sajjan@linaro.org">vikas.sajjan@linaro.org</a>&gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; ---<br>
&gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; Changes since v3:<br>
&gt; &gt; &gt; &gt; &gt; &gt; =A0 =A0 =A0 =A0 - added clk_prepare() in fimd=
_probe() and clk_unprepare()<br>
&gt; &gt; &gt; &gt; &gt; &gt; =A0 =A0 =A0 =A0 in<br>
&gt; &gt; &gt; &gt; &gt; &gt; =A0 =A0 =A0 =A0 fimd_remove()&gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; =A0 =A0 =A0 =A0 =A0as suggested by Viresh Kum=
ar &lt;<a href=3D"mailto:viresh.kumar@linaro.org">viresh.kumar@linaro.org</=
a>&gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; Changes since v2:<br>
&gt; &gt; &gt; &gt; &gt; &gt; =A0 =A0 =A0 =A0 - moved clk_prepare_enable() =
and clk_disable_unprepare()<br>
&gt; &gt; &gt; &gt; &gt; &gt; =A0 =A0 =A0 =A0 from<br>
&gt; &gt; &gt; &gt; &gt; &gt; =A0 =A0 =A0 =A0 fimd_probe() to fimd_clock() =
as suggested by Inki Dae<br>
&gt; &gt; &gt; &gt; &gt; &gt; =A0 =A0 =A0 =A0 &lt;<a href=3D"mailto:inki.da=
e@samsung.com">inki.dae@samsung.com</a>&gt;&gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; Changes since v1:<br>
&gt; &gt; &gt; &gt; &gt; &gt; =A0 =A0 =A0 =A0 - added error checking for cl=
k_prepare_enable() and also<br>
&gt; &gt; &gt; &gt; &gt; &gt; =A0 =A0 =A0 =A0 replaced<br>
&gt; &gt; &gt; &gt; &gt; &gt; =A0 =A0 =A0 =A0 clk_disable() with clk_disabl=
e_unprepare() during exit.<br>
&gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; ---<br>
&gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; =A0drivers/gpu/drm/exynos/exynos_drm_fimd.c |=
 =A0 14 ++++++++++++--<br>
&gt; &gt; &gt; &gt; &gt; &gt; =A01 file changed, 12 insertions(+), 2 deleti=
ons(-)<br>
&gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; diff --git a/drivers/gpu/drm/exynos/exynos_dr=
m_fimd.c<br>
&gt; &gt; &gt; &gt; &gt; &gt; b/drivers/gpu/drm/exynos/exynos_drm_fimd.c in=
dex 9537761..aa22370<br>
&gt; &gt; &gt; &gt; &gt; &gt; 100644<br>
&gt; &gt; &gt; &gt; &gt; &gt; --- a/drivers/gpu/drm/exynos/exynos_drm_fimd.=
c<br>
&gt; &gt; &gt; &gt; &gt; &gt; +++ b/drivers/gpu/drm/exynos/exynos_drm_fimd.=
c<br>
&gt; &gt; &gt; &gt; &gt; &gt; @@ -934,6 +934,16 @@ static int fimd_probe(st=
ruct platform_device<br>
&gt; &gt; &gt; &gt; &gt; &gt; *pdev)&gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 return ret;<b=
r>
&gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; =A0 =A0 =A0 =A0 }<br>
&gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; + =A0 =A0 =A0 ret =3D clk_prepare(ctx-&gt;bus=
_clk);<br>
&gt; &gt; &gt; &gt; &gt; &gt; + =A0 =A0 =A0 if (ret &lt; 0)<br>
&gt; &gt; &gt; &gt; &gt; &gt; + =A0 =A0 =A0 =A0 =A0 =A0 =A0 return ret;<br>
&gt; &gt; &gt; &gt; &gt; &gt; +<br>
&gt; &gt; &gt; &gt; &gt; &gt; + =A0 =A0 =A0 ret =3D clk_prepare(ctx-&gt;lcd=
_clk);<br>
&gt; &gt; &gt; &gt; &gt; &gt; + =A0 =A0 =A0 if =A0(ret &lt; 0) {<br>
&gt; &gt; &gt; &gt; &gt; &gt; + =A0 =A0 =A0 =A0 =A0 =A0 =A0 clk_unprepare(c=
tx-&gt;bus_clk);<br>
&gt; &gt; &gt; &gt; &gt; &gt; + =A0 =A0 =A0 =A0 =A0 =A0 =A0 return ret;<br>
&gt; &gt; &gt; &gt; &gt; &gt; + =A0 =A0 =A0 }<br>
&gt; &gt; &gt; &gt; &gt; &gt; +<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; Why not just simply use clk_prepare_enable() instead of=
 all calls to<br>
&gt; &gt; &gt; &gt; clk_enable() in the driver?<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; Same goes for s/clk_disable/clk_disable_unprepare/ .<br=
>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; I agree with you. Using clk_prepare_enable() is more clear. =
Actually I<br>
&gt; &gt; &gt; had already commented on this. Please see the patch v2. But =
this way<br>
&gt; &gt; &gt; also looks good to me.<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt; Well, both versions are technically correct and will have the sam=
e effect<br>
&gt; &gt; for Exynos SoC clocks, since only enable/disable ops change hardw=
are<br>
&gt; &gt; state.<br>
&gt; &gt;<br>
&gt; &gt; However if we look at general meaning of those generic ops, the c=
lock will<br>
&gt; &gt; remain prepared for all the time the driver is loaded, even if th=
e device<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt; Right, so I said previous one is more clear. I gonna revert curre=
nt one<br>
and then merge previous one(v3)<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt; is runtime suspended. Again on Exynos SoCs this won&#39;t have an=
y effect, but<br>
&gt; &gt; I think we should respect general Common Clock Framework semantic=
s anyway.<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; =A0 =A0 =A0 =A0 ctx-&gt;vidcon0 =3D pdata-&gt=
;vidcon0;<br>
&gt; &gt; &gt; &gt; &gt; &gt; =A0 =A0 =A0 =A0 ctx-&gt;vidcon1 =3D pdata-&gt=
;vidcon1;<br>
&gt; &gt; &gt; &gt; &gt; &gt; =A0 =A0 =A0 =A0 ctx-&gt;default_win =3D pdata=
-&gt;default_win;<br>
&gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; @@ -981,8 +991,8 @@ static int fimd_remove(st=
ruct platform_device<br>
&gt; &gt; &gt; &gt; &gt; &gt; *pdev)&gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; =A0 =A0 =A0 =A0 if (ctx-&gt;suspended)<br>
&gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 goto out;<br>
&gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; - =A0 =A0 =A0 clk_disable(ctx-&gt;lcd_clk);<b=
r>
&gt; &gt; &gt; &gt; &gt; &gt; - =A0 =A0 =A0 clk_disable(ctx-&gt;bus_clk);<b=
r>
&gt; &gt; &gt; &gt; &gt; &gt; + =A0 =A0 =A0 clk_unprepare(ctx-&gt;lcd_clk);=
<br>
&gt; &gt; &gt; &gt; &gt; &gt; + =A0 =A0 =A0 clk_unprepare(ctx-&gt;bus_clk);=
<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; This looks wrong again.. You still need to call cl=
k_disable() to<br>
&gt; &gt; &gt; &gt; &gt; make<br>
&gt; &gt; &gt; &gt; &gt; clk enabled<br>
&gt; &gt; &gt; &gt; &gt; count zero...<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; Viresh is right again here.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Ok, you two guys say together this looks wrong so I&#39;d li=
ke to take more<br>
&gt; &gt; &gt; checking. I thought that clk-&gt;clk_enable is 1 at here and=
 it would be 0<br>
&gt; &gt; &gt; by pm_runtimg_put_sync(). Is there any my missing point?<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt; You&#39;re reasoning is correct, but only assuming that runtime P=
M is enabled.<br>
&gt; &gt; When it is disabled, pm_runtime_put_sync() is a no-op.<br>
&gt; &gt;<br>
&gt; &gt; Well, after digging into the exynos_drm_fimd driver a bit more, i=
t seems<br>
&gt; &gt; like its power management code needs a serious rework, because I =
was able<br>
&gt; &gt; to find more problems:<br>
&gt; &gt;<br>
&gt; &gt; 1) fimd_activate() does not get called at all if CONFIG_PM_RUNTIM=
E is not<br>
&gt; &gt; enabled (except in system-wide suspend callbacks, but this is irr=
elevant<br>
&gt; &gt; to this point) - this means that the hardware is not properly ini=
tialized<br>
&gt; &gt; without CONFIG_PM_RUNTIME - at least clocks does not get enabled.=
<br>
&gt; &gt;<br>
&gt; &gt; 2) pm_runtime_set_suspended() can be used only when runtime PM is=
 disabled<br>
&gt; &gt; for the device (i.e. by calling pm_runtime_disable() or not calli=
ng<br>
&gt; &gt; pm_runtime_enable() at all) - when runtime PM is enabled it is ba=
sically a<br>
&gt; &gt; no-op returning -EAGAIN error.<br>
&gt; &gt;<br>
&gt; &gt; So here&#39;s my proposed solution:<br>
&gt; &gt;<br>
&gt; &gt; 1) call fimd_activate() and pm_runtime_set_active() explicitly in=
<br>
&gt; &gt; fimd_probe(), before calling pm_runtime_enable():<br>
&gt; &gt;<br>
&gt; &gt; =A0 =A0 =A0 =A0 mutex_init(&amp;ctx-&gt;lock);<br>
&gt; &gt;<br>
&gt; &gt; =A0 =A0 =A0 =A0 platform_set_drvdata(pdev, ctx);<br>
&gt; &gt; +<br>
&gt; &gt; + =A0 =A0 =A0 fimd_activate(ctx, true);<br>
&gt; &gt;<br>
&gt; &gt; + =A0 =A0 =A0 pm_runtime_set_active(dev);<br>
&gt; &gt; =A0 =A0 =A0 =A0 pm_runtime_enable(dev);<br>
&gt; &gt; =A0 =A0 =A0 =A0 pm_runtime_get_sync(dev);<br>
&gt; &gt;<br>
&gt; &gt; This would power up the device even if CONFIG_PM_RUNTIME is not e=
nabled.<br>
&gt; &gt; Note that pm_runtime_get_sync() after marking the device as activ=
e with<br>
&gt; &gt; pm_runtime_set_active() won&#39;t result in calling fimd_runtime_=
resume(),<br>
&gt; &gt; because the device is considered already resumed.<br>
&gt; &gt;<br>
&gt; &gt; 2) in fimd_remove():<br>
&gt; &gt;<br>
&gt; &gt; + =A0 =A0 =A0 pm_runtime_disable(dev);<br>
&gt; &gt; +<br>
&gt; &gt; =A0 =A0 =A0 =A0 if (ctx-&gt;suspended)<br>
&gt; &gt; - =A0 =A0 =A0 =A0 =A0 =A0 =A0 goto out;<br>
&gt; &gt; + =A0 =A0 =A0 =A0 =A0 =A0 =A0 return 0;<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt; - =A0 =A0 =A0 clk_disable(ctx-&gt;lcd_clk);<br>
&gt; &gt; - =A0 =A0 =A0 clk_disable(ctx-&gt;bus_clk);<br>
&gt; &gt;<br>
&gt; &gt; + =A0 =A0 =A0 fimd_activate(ctx, false);<br>
&gt; &gt;<br>
&gt; &gt; + =A0 =A0 =A0 pm_runtime_put_noidle(dev);<br>
&gt; &gt; =A0 =A0 =A0 =A0 pm_runtime_set_suspended(dev);<br>
&gt; &gt; - =A0 =A0 =A0 pm_runtime_put_sync(dev);<br>
&gt; &gt; -<br>
&gt; &gt; -out:<br>
&gt; &gt; - =A0 =A0 =A0 pm_runtime_disable(dev);<br>
&gt; &gt;<br>
&gt; &gt; First, pm_runtime_disable() will prevent any further runtime PM o=
perations<br>
&gt; &gt; that could change ctx-&gt;suspended state. Then, if ctx-&gt;suspe=
nded is true,<br>
&gt; &gt; there is no need to suspend anything and we can leave. Otherwise,=
 we power<br>
&gt; &gt; down the hardware manually - which will work with both CONFIG_PM_=
RUNTIME<br>
&gt; &gt; enabled and disabled, and then mark the hardware as suspended and=
 free<br>
&gt; &gt; remaining reference in runtime PM core. Note that pm_runtime_put_=
noidle<br>
&gt; &gt; just decreases the reference counter and nothing else.<br>
&gt; &gt;<br>
&gt; &gt; 3) after those two changes, all that remains is to fix compliance=
 with<br>
&gt; &gt; Common Clock Framework, in other words:<br>
&gt; &gt;<br>
&gt; &gt; s/clk_enable/clk_prepare_enable/<br>
&gt; &gt;<br>
&gt; &gt; and<br>
&gt; &gt;<br>
&gt; &gt; s/clk_disable/clk_disable_unprepare/<br>
&gt;<br>
&gt;<br>
&gt; Also looks good to me. But what if power domain was disabled without p=
m<br>
&gt; runtime? In this case, you must enable the power domain at machine cod=
e or<br>
&gt; bootloader somewhere. This way would not only need some hard codes to =
turn<br>
&gt; the power domain on but also not manage power management fully. This i=
s same<br>
&gt; as only the use of pm runtime interface(needing some hard codes withou=
t pm<br>
&gt; runtime) so I don&#39;t prefer to add clk_enable/disable to fimd probe=
(). I quite<br>
&gt; tend to force only the use of pm runtime as possible. So please add th=
e hard<br>
&gt; codes to machine code or bootloader like you did for power domain if y=
ou<br>
&gt; want to use drm fimd without pm runtime.<br>
<br>
</div></div>That&#39;s not how the runtime PM, clock subsystems work:<br>
<br>
1) When CONFIG_PM_RUNTIME is disabled, all the used hardware must be kept<b=
r>
powered on all the time.<br>
<br>
2) Common Clock Framework will always gate all clocks that have zero<br>
enable_count. Note that CCF support for Exynos is already merged for 3.10 a=
nd<br>
it will be the only available clock support method for Exynos.<br>
<br>
AFAIK, drivers must work correctly in both cases, with CONFIG_PM_RUNTIME<br=
>
enabled and disabled.<br>
<br></blockquote><div><br></div><div>Then is the driver worked correctly if=
 the power domain to this device was disabled at bootloader without CONFIG_=
PM_RUNTIME and with clk_enable()?=A0 I think, in this case, the device woul=
dn&#39;t be worked correctly because the power of the device remains off. S=
o you must enable the power domain somewhere. What is the difference betwee=
n these two cases?<br>
</div><div><br>=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0=
 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
Best regards,<br>
Tomasz<br>
<br>
</blockquote></div><br></div></div>

--047d7b3a84362c294804daf02f58--

--===============0735816078==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
http://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0735816078==--
