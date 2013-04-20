From: Inki Dae <inki.dae@samsung.com>
Subject: Re: [PATCH v4] drm/exynos: prepare FIMD clocks
Date: Sun, 21 Apr 2013 00:26:54 +0900
Message-ID: <CAAQKjZMoXj-YFYQhkQOwL-VJgKP0hgMxQ-vqiBCfuinBSCgmHg@mail.gmail.com>
References: <1365419265-21238-1-git-send-email-vikas.sajjan@linaro.org>
	<CAKohpokPKzHHML1WhhUNYMz1Q-mJmqbp49K4Jp5Na0kjtuivEQ@mail.gmail.com>
	<CAD025yRg0egPfPqzrneGrPiT6OwR2HHYDezM8p3Tf-WRT0uVtQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1193455647=="
Return-path: <dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org>
In-Reply-To: <CAD025yRg0egPfPqzrneGrPiT6OwR2HHYDezM8p3Tf-WRT0uVtQ@mail.gmail.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Sender: dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org
Errors-To: dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org
To: Vikas Sajjan <vikas.sajjan@linaro.org>
Cc: linux-samsung-soc@vger.kernel.org, Sachin Kamat <sachin.kamat@linaro.org>, Viresh Kumar <viresh.kumar@linaro.org>, sunil joshi <joshi@samsung.com>, DRI mailing list <dri-devel@lists.freedesktop.org>, "kgene.kim" <kgene.kim@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

--===============1193455647==
Content-Type: multipart/alternative; boundary=001a11c33caa34362b04dacc77f2

--001a11c33caa34362b04dacc77f2
Content-Type: text/plain; charset=ISO-8859-1

2013/4/19 Vikas Sajjan <vikas.sajjan@linaro.org>

> Hi Inki Dae and Viresh,
>
> On 8 April 2013 16:41, Viresh Kumar <viresh.kumar@linaro.org> wrote:
>
>> On 8 April 2013 16:37, Vikas Sajjan <vikas.sajjan@linaro.org> wrote:
>> > While migrating to common clock framework (CCF), I found that the FIMD
>> clocks
>> > were pulled down by the CCF.
>> > If CCF finds any clock(s) which has NOT been claimed by any of the
>> > drivers, then such clock(s) are PULLed low by CCF.
>> >
>> > Calling clk_prepare() for FIMD clocks fixes the issue.
>> >
>> > This patch also replaces clk_disable() with clk_unprepare() during
>> exit, since
>> > clk_prepare() is called in fimd_probe().
>>
>> I asked you about fixing your commit log too.. It still looks incorrect
>> to me.
>>
>> This patch doesn't have anything to do with CCF pulling clocks down, but
>> calling clk_prepare() before clk_enable() is must now.. that's it..
>> nothing more.
>>
>>   what I noticed is the fimd_clock() which in turn calls clk_enable(),
> will only be called if the RUNTIME PM is enabled. So the current patch
> breaks and display won't appear, if we don't enable the RUNTIME PM. So it
> becomes mandatory to enable  RUNTIME PM, to FIMD to work.
>

Right, this is our intention.

I am NOT sure whether it is a good idea make FIMD work if and only if
> RUMTIME PM is enabled.
>

Actually, fimd driver had used not only runtime pm interface but also
clk_enable() at fimd_probe(). But this had induced the reference count pair
issue to clock. The issue was that the clock takes two references with
runtime pm. One is by clk_enable and another is by pm_runtime_get_sync().
So we are forcing only using runtime pm interface.


> I guess Mr. Inki Dae can throw more light on this.
> Or else make it like the earlier V1 version where clk_prepare_enable() was
> called in fimd_probe() itself.
>
> > Signed-off-by: Vikas Sajjan <vikas.sajjan@linaro.org>
>> > ---
>> > Changes since v3:
>> >         - added clk_prepare() in fimd_probe() and clk_unprepare() in
>> fimd_remove()
>> >          as suggested by Viresh Kumar <viresh.kumar@linaro.org>
>> > Changes since v2:
>> >         - moved clk_prepare_enable() and clk_disable_unprepare() from
>> >         fimd_probe() to fimd_clock() as suggested by Inki Dae <
>> inki.dae@samsung.com>
>> > Changes since v1:
>> >         - added error checking for clk_prepare_enable() and also
>> replaced
>> >         clk_disable() with clk_disable_unprepare() during exit.
>> > ---
>> >  drivers/gpu/drm/exynos/exynos_drm_fimd.c |   14 ++++++++++++--
>> >  1 file changed, 12 insertions(+), 2 deletions(-)
>> >
>> > diff --git a/drivers/gpu/drm/exynos/exynos_drm_fimd.c
>> b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
>> > index 9537761..aa22370 100644
>> > --- a/drivers/gpu/drm/exynos/exynos_drm_fimd.c
>> > +++ b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
>> > @@ -934,6 +934,16 @@ static int fimd_probe(struct platform_device *pdev)
>> >                 return ret;
>> >         }
>> >
>> > +       ret = clk_prepare(ctx->bus_clk);
>> > +       if (ret < 0)
>> > +               return ret;
>> > +
>> > +       ret = clk_prepare(ctx->lcd_clk);
>> > +       if  (ret < 0) {
>> > +               clk_unprepare(ctx->bus_clk);
>> > +               return ret;
>> > +       }
>> > +
>> >         ctx->vidcon0 = pdata->vidcon0;
>> >         ctx->vidcon1 = pdata->vidcon1;
>> >         ctx->default_win = pdata->default_win;
>> > @@ -981,8 +991,8 @@ static int fimd_remove(struct platform_device *pdev)
>> >         if (ctx->suspended)
>> >                 goto out;
>> >
>> > -       clk_disable(ctx->lcd_clk);
>> > -       clk_disable(ctx->bus_clk);
>> > +       clk_unprepare(ctx->lcd_clk);
>> > +       clk_unprepare(ctx->bus_clk);
>>
>> This looks wrong again.. You still need to call clk_disable() to make
>> clk enabled
>> count zero...
>>
>
>     Viresh had an suggestion, that the original code had a call
> clk_disable() in fimd_remove(), which is really NOT required as there is NO
> clk_enable() in fimd_probe() and we can right away delete clk_disable()
> from fimd_remove().
>
> And also i think i should be breaking this patch into 2, 1st patch for
> adding clk_prepare_enable() ( if we want remove dependency on RUNTIME PM )
> in fimd_probe() for CCF migration another one for idea of replacing
> clk_disable() with adding clk_disable_unprepare() (since we will be adding
> clk_prepare_enable() in probe ) in fimd_remove() .
>
> Mr. Inki Dae any thoughts on this.
>
>
Sorry for being late. I think clk_prepare/unprepare are nothing to do yet
in case of Exynos but those might be used for in the future so your patch
looks good to me as is.

Applied. :)

Thanks,
Inki Dae



> --
> Thanks and Regards
>  Vikas Sajjan
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> http://lists.freedesktop.org/mailman/listinfo/dri-devel
>
>

--001a11c33caa34362b04dacc77f2
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><br><div class=3D"gmail=
_quote">2013/4/19 Vikas Sajjan <span dir=3D"ltr">&lt;<a href=3D"mailto:vika=
s.sajjan@linaro.org" target=3D"_blank">vikas.sajjan@linaro.org</a>&gt;</spa=
n><br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-l=
eft:1px #ccc solid;padding-left:1ex">
<div dir=3D"ltr">Hi Inki Dae and Viresh,<br><div class=3D"gmail_extra"><br>=
<div class=3D"gmail_quote"><div class=3D"im">On 8 April 2013 16:41, Viresh =
Kumar <span dir=3D"ltr">&lt;<a href=3D"mailto:viresh.kumar@linaro.org" targ=
et=3D"_blank">viresh.kumar@linaro.org</a>&gt;</span> wrote:<br>




<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left:1px solid rgb(204,204,204);padding-left:1ex"><div>On 8 April 2013 16:3=
7, Vikas Sajjan &lt;<a href=3D"mailto:vikas.sajjan@linaro.org" target=3D"_b=
lank">vikas.sajjan@linaro.org</a>&gt; wrote:<br>





&gt; While migrating to common clock framework (CCF), I found that the FIMD=
 clocks<br>
&gt; were pulled down by the CCF.<br>
&gt; If CCF finds any clock(s) which has NOT been claimed by any of the<br>
&gt; drivers, then such clock(s) are PULLed low by CCF.<br>
&gt;<br>
&gt; Calling clk_prepare() for FIMD clocks fixes the issue.<br>
&gt;<br>
&gt; This patch also replaces clk_disable() with clk_unprepare() during exi=
t, since<br>
&gt; clk_prepare() is called in fimd_probe().<br>
<br>
</div>I asked you about fixing your commit log too.. It still looks incorre=
ct to me.<br>
<br>
This patch doesn&#39;t have anything to do with CCF pulling clocks down, bu=
t<br>
calling clk_prepare() before clk_enable() is must now.. that&#39;s it..<br>
nothing more.<br>
<div><div><br></div></div></blockquote></div><div>=A0 what I noticed is the=
  fimd_clock() which in turn calls clk_enable(), will only be called if the=
 RUNTIME PM is enabled. So the current patch breaks and display won&#39;t a=
ppear, if we don&#39;t enable the RUNTIME PM. So it becomes mandatory to en=
able=A0 RUNTIME PM, to FIMD to work.<br>
</div></div></div></div></blockquote><div><br></div><div>Right, this is our=
 intention.<br> <br></div><blockquote class=3D"gmail_quote" style=3D"margin=
:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div dir=3D"ltr"><=
div class=3D"gmail_extra">
<div class=3D"gmail_quote"><div>



I am NOT sure whether it is a good idea make FIMD work if and only if RUMTI=
ME PM is enabled.<br></div></div></div></div></blockquote><div><br></div><d=
iv>Actually, fimd driver had used not only runtime pm interface but also cl=
k_enable() at fimd_probe(). But this had induced the reference count pair i=
ssue to clock. The issue was that the clock takes two references with runti=
me pm. One is by clk_enable and another is by pm_runtime_get_sync(). So we =
are forcing only using runtime pm interface.<br>
</div><div>=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0=
 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div dir=3D"ltr"><div cl=
ass=3D"gmail_extra"><div class=3D"gmail_quote"><div>I guess Mr. Inki Dae ca=
n throw more light on this.<br>
Or else make it like the earlier V1 version where clk_prepare_enable() was =
called in fimd_probe() itself.<br>



<br></div><div><div class=3D"h5"><blockquote class=3D"gmail_quote" style=3D=
"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-le=
ft:1ex"><div><div>
&gt; Signed-off-by: Vikas Sajjan &lt;<a href=3D"mailto:vikas.sajjan@linaro.=
org" target=3D"_blank">vikas.sajjan@linaro.org</a>&gt;<br>
&gt; ---<br>
&gt; Changes since v3:<br>
&gt; =A0 =A0 =A0 =A0 - added clk_prepare() in fimd_probe() and clk_unprepar=
e() in fimd_remove()<br>
&gt; =A0 =A0 =A0 =A0 =A0as suggested by Viresh Kumar &lt;<a href=3D"mailto:=
viresh.kumar@linaro.org" target=3D"_blank">viresh.kumar@linaro.org</a>&gt;<=
br>
&gt; Changes since v2:<br>
&gt; =A0 =A0 =A0 =A0 - moved clk_prepare_enable() and clk_disable_unprepare=
() from<br>
&gt; =A0 =A0 =A0 =A0 fimd_probe() to fimd_clock() as suggested by Inki Dae =
&lt;<a href=3D"mailto:inki.dae@samsung.com" target=3D"_blank">inki.dae@sams=
ung.com</a>&gt;<br>
&gt; Changes since v1:<br>
&gt; =A0 =A0 =A0 =A0 - added error checking for clk_prepare_enable() and al=
so replaced<br>
&gt; =A0 =A0 =A0 =A0 clk_disable() with clk_disable_unprepare() during exit=
.<br>
&gt; ---<br>
&gt; =A0drivers/gpu/drm/exynos/exynos_drm_fimd.c | =A0 14 ++++++++++++--<br=
>
&gt; =A01 file changed, 12 insertions(+), 2 deletions(-)<br>
&gt;<br>
&gt; diff --git a/drivers/gpu/drm/exynos/exynos_drm_fimd.c b/drivers/gpu/dr=
m/exynos/exynos_drm_fimd.c<br>
&gt; index 9537761..aa22370 100644<br>
&gt; --- a/drivers/gpu/drm/exynos/exynos_drm_fimd.c<br>
&gt; +++ b/drivers/gpu/drm/exynos/exynos_drm_fimd.c<br>
&gt; @@ -934,6 +934,16 @@ static int fimd_probe(struct platform_device *pde=
v)<br>
&gt; =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 return ret;<br>
&gt; =A0 =A0 =A0 =A0 }<br>
&gt;<br>
&gt; + =A0 =A0 =A0 ret =3D clk_prepare(ctx-&gt;bus_clk);<br>
&gt; + =A0 =A0 =A0 if (ret &lt; 0)<br>
&gt; + =A0 =A0 =A0 =A0 =A0 =A0 =A0 return ret;<br>
&gt; +<br>
&gt; + =A0 =A0 =A0 ret =3D clk_prepare(ctx-&gt;lcd_clk);<br>
&gt; + =A0 =A0 =A0 if =A0(ret &lt; 0) {<br>
&gt; + =A0 =A0 =A0 =A0 =A0 =A0 =A0 clk_unprepare(ctx-&gt;bus_clk);<br>
&gt; + =A0 =A0 =A0 =A0 =A0 =A0 =A0 return ret;<br>
&gt; + =A0 =A0 =A0 }<br>
&gt; +<br>
&gt; =A0 =A0 =A0 =A0 ctx-&gt;vidcon0 =3D pdata-&gt;vidcon0;<br>
&gt; =A0 =A0 =A0 =A0 ctx-&gt;vidcon1 =3D pdata-&gt;vidcon1;<br>
&gt; =A0 =A0 =A0 =A0 ctx-&gt;default_win =3D pdata-&gt;default_win;<br>
&gt; @@ -981,8 +991,8 @@ static int fimd_remove(struct platform_device *pde=
v)<br>
&gt; =A0 =A0 =A0 =A0 if (ctx-&gt;suspended)<br>
&gt; =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 goto out;<br>
&gt;<br>
&gt; - =A0 =A0 =A0 clk_disable(ctx-&gt;lcd_clk);<br>
&gt; - =A0 =A0 =A0 clk_disable(ctx-&gt;bus_clk);<br>
&gt; + =A0 =A0 =A0 clk_unprepare(ctx-&gt;lcd_clk);<br>
&gt; + =A0 =A0 =A0 clk_unprepare(ctx-&gt;bus_clk);<br>
<br>
</div></div>This looks wrong again.. You still need to call clk_disable() t=
o make<br>
clk enabled<br>
count zero...<br>
</blockquote></div></div></div><br></div><div class=3D"gmail_extra">=A0=A0=
=A0 Viresh had an suggestion, that the original code had a call clk_disable=
() in fimd_remove(), which is really NOT required as there is NO clk_enable=
() in fimd_probe() and we can right away delete clk_disable() from fimd_rem=
ove().<br>


<br>And also i think i should be breaking this patch into 2, 1st patch for =
adding  clk_prepare_enable() ( if we want remove dependency on RUNTIME PM )=
 in fimd_probe() for CCF migration another one for idea of replacing clk_di=
sable() with adding clk_disable_unprepare() (since we will be adding clk_pr=
epare_enable() in probe ) in fimd_remove() .<br>


</div><div class=3D"gmail_extra"><br>
Mr. Inki Dae any thoughts on this.<span class=3D"HOEnZb"><font color=3D"#88=
8888"><br clear=3D"all"></font></span></div><span class=3D"HOEnZb"><font co=
lor=3D"#888888"><div class=3D"gmail_extra"><br></div></font></span></div></=
blockquote>
<div><br></div><div>Sorry for being late. I think clk_prepare/unprepare are=
 nothing to do yet in case of Exynos but those might be used for in the fut=
ure so your patch looks good to me as is.<br><br>Applied. :)<br><br>Thanks,=
<br>
Inki Dae<br></div><div><br>=A0</div><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div dir=
=3D"ltr"><span class=3D"HOEnZb"><font color=3D"#888888"><div class=3D"gmail=
_extra">-- <br>
Thanks and Regards<div>=A0Vikas Sajjan</div>
</div></font></span></div>
<br>_______________________________________________<br>
dri-devel mailing list<br>
<a href=3D"mailto:dri-devel@lists.freedesktop.org">dri-devel@lists.freedesk=
top.org</a><br>
<a href=3D"http://lists.freedesktop.org/mailman/listinfo/dri-devel" target=
=3D"_blank">http://lists.freedesktop.org/mailman/listinfo/dri-devel</a><br>
<br></blockquote></div><br></div></div>

--001a11c33caa34362b04dacc77f2--

--===============1193455647==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
http://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1193455647==--
