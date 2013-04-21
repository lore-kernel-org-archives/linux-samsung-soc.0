From: Vikas Sajjan <vikas.sajjan@linaro.org>
Subject: Re: [PATCH v4] drm/exynos: prepare FIMD clocks
Date: Sun, 21 Apr 2013 12:54:29 +0530
Message-ID: <CAD025yQyN8g++GDkpdvf1y-P3FT2DYfK8uhkYA+0a7VaU+vi5g@mail.gmail.com>
References: <1365419265-21238-1-git-send-email-vikas.sajjan@linaro.org>
	<CAKohpokPKzHHML1WhhUNYMz1Q-mJmqbp49K4Jp5Na0kjtuivEQ@mail.gmail.com>
	<CAD025yRg0egPfPqzrneGrPiT6OwR2HHYDezM8p3Tf-WRT0uVtQ@mail.gmail.com>
	<CAAQKjZMoXj-YFYQhkQOwL-VJgKP0hgMxQ-vqiBCfuinBSCgmHg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2067684858=="
Return-path: <dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org>
In-Reply-To: <CAAQKjZMoXj-YFYQhkQOwL-VJgKP0hgMxQ-vqiBCfuinBSCgmHg@mail.gmail.com>
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
Cc: linux-samsung-soc@vger.kernel.org, Sachin Kamat <sachin.kamat@linaro.org>, Viresh Kumar <viresh.kumar@linaro.org>, sunil joshi <joshi@samsung.com>, DRI mailing list <dri-devel@lists.freedesktop.org>, "kgene.kim" <kgene.kim@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

--===============2067684858==
Content-Type: multipart/alternative; boundary=047d7b3a85a8c3014c04dad9d7ac

--047d7b3a85a8c3014c04dad9d7ac
Content-Type: text/plain; charset=ISO-8859-1

On Apr 20, 2013 8:56 PM, "Inki Dae" <inki.dae@samsung.com> wrote:
>
>
>
>
> 2013/4/19 Vikas Sajjan <vikas.sajjan@linaro.org>
>>
>> Hi Inki Dae and Viresh,
>>
>> On 8 April 2013 16:41, Viresh Kumar <viresh.kumar@linaro.org> wrote:
>>>
>>> On 8 April 2013 16:37, Vikas Sajjan <vikas.sajjan@linaro.org> wrote:
>>> > While migrating to common clock framework (CCF), I found that the
FIMD clocks
>>> > were pulled down by the CCF.
>>> > If CCF finds any clock(s) which has NOT been claimed by any of the
>>> > drivers, then such clock(s) are PULLed low by CCF.
>>> >
>>> > Calling clk_prepare() for FIMD clocks fixes the issue.
>>> >
>>> > This patch also replaces clk_disable() with clk_unprepare() during
exit, since
>>> > clk_prepare() is called in fimd_probe().
>>>
>>> I asked you about fixing your commit log too.. It still looks incorrect
to me.
>>>
>>> This patch doesn't have anything to do with CCF pulling clocks down, but
>>> calling clk_prepare() before clk_enable() is must now.. that's it..
>>> nothing more.
>>>
>>   what I noticed is the fimd_clock() which in turn calls clk_enable(),
will only be called if the RUNTIME PM is enabled. So the current patch
breaks and display won't appear, if we don't enable the RUNTIME PM. So it
becomes mandatory to enable  RUNTIME PM, to FIMD to work.
>
>
> Right, this is our intention.
>
>> I am NOT sure whether it is a good idea make FIMD work if and only if
RUMTIME PM is enabled.
>
>
> Actually, fimd driver had used not only runtime pm interface but also
clk_enable() at fimd_probe(). But this had induced the reference count pair
issue to clock. The issue was that the clock takes two references with
runtime pm. One is by clk_enable and another is by pm_runtime_get_sync().
So we are forcing only using runtime pm interface.
>
>>
>> I guess Mr. Inki Dae can throw more light on this.
>> Or else make it like the earlier V1 version where clk_prepare_enable()
was called in fimd_probe() itself.
>>
>>> > Signed-off-by: Vikas Sajjan <vikas.sajjan@linaro.org>
>>> > ---
>>> > Changes since v3:
>>> >         - added clk_prepare() in fimd_probe() and clk_unprepare() in
fimd_remove()
>>> >          as suggested by Viresh Kumar <viresh.kumar@linaro.org>
>>> > Changes since v2:
>>> >         - moved clk_prepare_enable() and clk_disable_unprepare() from
>>> >         fimd_probe() to fimd_clock() as suggested by Inki Dae <
inki.dae@samsung.com>
>>> > Changes since v1:
>>> >         - added error checking for clk_prepare_enable() and also
replaced
>>> >         clk_disable() with clk_disable_unprepare() during exit.
>>> > ---
>>> >  drivers/gpu/drm/exynos/exynos_drm_fimd.c |   14 ++++++++++++--
>>> >  1 file changed, 12 insertions(+), 2 deletions(-)
>>> >
>>> > diff --git a/drivers/gpu/drm/exynos/exynos_drm_fimd.c
b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
>>> > index 9537761..aa22370 100644
>>> > --- a/drivers/gpu/drm/exynos/exynos_drm_fimd.c
>>> > +++ b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
>>> > @@ -934,6 +934,16 @@ static int fimd_probe(struct platform_device
*pdev)
>>> >                 return ret;
>>> >         }
>>> >
>>> > +       ret = clk_prepare(ctx->bus_clk);
>>> > +       if (ret < 0)
>>> > +               return ret;
>>> > +
>>> > +       ret = clk_prepare(ctx->lcd_clk);
>>> > +       if  (ret < 0) {
>>> > +               clk_unprepare(ctx->bus_clk);
>>> > +               return ret;
>>> > +       }
>>> > +
>>> >         ctx->vidcon0 = pdata->vidcon0;
>>> >         ctx->vidcon1 = pdata->vidcon1;
>>> >         ctx->default_win = pdata->default_win;
>>> > @@ -981,8 +991,8 @@ static int fimd_remove(struct platform_device
*pdev)
>>> >         if (ctx->suspended)
>>> >                 goto out;
>>> >
>>> > -       clk_disable(ctx->lcd_clk);
>>> > -       clk_disable(ctx->bus_clk);
>>> > +       clk_unprepare(ctx->lcd_clk);
>>> > +       clk_unprepare(ctx->bus_clk);
>>>
>>> This looks wrong again.. You still need to call clk_disable() to make
>>> clk enabled
>>> count zero...
>>
>>
>>     Viresh had an suggestion, that the original code had a call
clk_disable() in fimd_remove(), which is really NOT required as there is NO
clk_enable() in fimd_probe() and we can right away delete clk_disable()
from fimd_remove().
>>
>> And also i think i should be breaking this patch into 2, 1st patch for
adding clk_prepare_enable() ( if we want remove dependency on RUNTIME PM )
in fimd_probe() for CCF migration another one for idea of replacing
clk_disable() with adding clk_disable_unprepare() (since we will be adding
clk_prepare_enable() in probe ) in fimd_remove() .
>>
>> Mr. Inki Dae any thoughts on this.
>>
>
> Sorry for being late. I think clk_prepare/unprepare are nothing to do yet
in case of Exynos but those might be used for in the future so your patch
looks good to me as is.
>
> Applied. :)

thanks Mr. Dae

> Thanks,
> Inki Dae
>
>
>>
>> --
>> Thanks and Regards
>>  Vikas Sajjan
>>
>> _______________________________________________
>> dri-devel mailing list
>> dri-devel@lists.freedesktop.org
>> http://lists.freedesktop.org/mailman/listinfo/dri-devel
>>
>

--047d7b3a85a8c3014c04dad9d7ac
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<p><br>
On Apr 20, 2013 8:56 PM, &quot;Inki Dae&quot; &lt;<a href=3D"mailto:inki.da=
e@samsung.com">inki.dae@samsung.com</a>&gt; wrote:<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt; 2013/4/19 Vikas Sajjan &lt;<a href=3D"mailto:vikas.sajjan@linaro.org">=
vikas.sajjan@linaro.org</a>&gt;<br>
&gt;&gt;<br>
&gt;&gt; Hi Inki Dae and Viresh,<br>
&gt;&gt;<br>
&gt;&gt; On 8 April 2013 16:41, Viresh Kumar &lt;<a href=3D"mailto:viresh.k=
umar@linaro.org">viresh.kumar@linaro.org</a>&gt; wrote:<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; On 8 April 2013 16:37, Vikas Sajjan &lt;<a href=3D"mailto:vika=
s.sajjan@linaro.org">vikas.sajjan@linaro.org</a>&gt; wrote:<br>
&gt;&gt;&gt; &gt; While migrating to common clock framework (CCF), I found =
that the FIMD clocks<br>
&gt;&gt;&gt; &gt; were pulled down by the CCF.<br>
&gt;&gt;&gt; &gt; If CCF finds any clock(s) which has NOT been claimed by a=
ny of the<br>
&gt;&gt;&gt; &gt; drivers, then such clock(s) are PULLed low by CCF.<br>
&gt;&gt;&gt; &gt;<br>
&gt;&gt;&gt; &gt; Calling clk_prepare() for FIMD clocks fixes the issue.<br=
>
&gt;&gt;&gt; &gt;<br>
&gt;&gt;&gt; &gt; This patch also replaces clk_disable() with clk_unprepare=
() during exit, since<br>
&gt;&gt;&gt; &gt; clk_prepare() is called in fimd_probe().<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; I asked you about fixing your commit log too.. It still looks =
incorrect to me.<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; This patch doesn&#39;t have anything to do with CCF pulling cl=
ocks down, but<br>
&gt;&gt;&gt; calling clk_prepare() before clk_enable() is must now.. that&#=
39;s it..<br>
&gt;&gt;&gt; nothing more.<br>
&gt;&gt;&gt;<br>
&gt;&gt; =A0 what I noticed is the fimd_clock() which in turn calls clk_ena=
ble(), will only be called if the RUNTIME PM is enabled. So the current pat=
ch breaks and display won&#39;t appear, if we don&#39;t enable the RUNTIME =
PM. So it becomes mandatory to enable=A0 RUNTIME PM, to FIMD to work.<br>

&gt;<br>
&gt;<br>
&gt; Right, this is our intention.<br>
&gt;<br>
&gt;&gt; I am NOT sure whether it is a good idea make FIMD work if and only=
 if RUMTIME PM is enabled.<br>
&gt;<br>
&gt;<br>
&gt; Actually, fimd driver had used not only runtime pm interface but also =
clk_enable() at fimd_probe(). But this had induced the reference count pair=
 issue to clock. The issue was that the clock takes two references with run=
time pm. One is by clk_enable and another is by pm_runtime_get_sync(). So w=
e are forcing only using runtime pm interface.<br>

&gt; =A0<br>
&gt;&gt;<br>
&gt;&gt; I guess Mr. Inki Dae can throw more light on this.<br>
&gt;&gt; Or else make it like the earlier V1 version where clk_prepare_enab=
le() was called in fimd_probe() itself.<br>
&gt;&gt;<br>
&gt;&gt;&gt; &gt; Signed-off-by: Vikas Sajjan &lt;<a href=3D"mailto:vikas.s=
ajjan@linaro.org">vikas.sajjan@linaro.org</a>&gt;<br>
&gt;&gt;&gt; &gt; ---<br>
&gt;&gt;&gt; &gt; Changes since v3:<br>
&gt;&gt;&gt; &gt; =A0 =A0 =A0 =A0 - added clk_prepare() in fimd_probe() and=
 clk_unprepare() in fimd_remove()<br>
&gt;&gt;&gt; &gt; =A0 =A0 =A0 =A0 =A0as suggested by Viresh Kumar &lt;<a hr=
ef=3D"mailto:viresh.kumar@linaro.org">viresh.kumar@linaro.org</a>&gt;<br>
&gt;&gt;&gt; &gt; Changes since v2:<br>
&gt;&gt;&gt; &gt; =A0 =A0 =A0 =A0 - moved clk_prepare_enable() and clk_disa=
ble_unprepare() from<br>
&gt;&gt;&gt; &gt; =A0 =A0 =A0 =A0 fimd_probe() to fimd_clock() as suggested=
 by Inki Dae &lt;<a href=3D"mailto:inki.dae@samsung.com">inki.dae@samsung.c=
om</a>&gt;<br>
&gt;&gt;&gt; &gt; Changes since v1:<br>
&gt;&gt;&gt; &gt; =A0 =A0 =A0 =A0 - added error checking for clk_prepare_en=
able() and also replaced<br>
&gt;&gt;&gt; &gt; =A0 =A0 =A0 =A0 clk_disable() with clk_disable_unprepare(=
) during exit.<br>
&gt;&gt;&gt; &gt; ---<br>
&gt;&gt;&gt; &gt; =A0drivers/gpu/drm/exynos/exynos_drm_fimd.c | =A0 14 ++++=
++++++++--<br>
&gt;&gt;&gt; &gt; =A01 file changed, 12 insertions(+), 2 deletions(-)<br>
&gt;&gt;&gt; &gt;<br>
&gt;&gt;&gt; &gt; diff --git a/drivers/gpu/drm/exynos/exynos_drm_fimd.c b/d=
rivers/gpu/drm/exynos/exynos_drm_fimd.c<br>
&gt;&gt;&gt; &gt; index 9537761..aa22370 100644<br>
&gt;&gt;&gt; &gt; --- a/drivers/gpu/drm/exynos/exynos_drm_fimd.c<br>
&gt;&gt;&gt; &gt; +++ b/drivers/gpu/drm/exynos/exynos_drm_fimd.c<br>
&gt;&gt;&gt; &gt; @@ -934,6 +934,16 @@ static int fimd_probe(struct platfor=
m_device *pdev)<br>
&gt;&gt;&gt; &gt; =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 return ret;<br>
&gt;&gt;&gt; &gt; =A0 =A0 =A0 =A0 }<br>
&gt;&gt;&gt; &gt;<br>
&gt;&gt;&gt; &gt; + =A0 =A0 =A0 ret =3D clk_prepare(ctx-&gt;bus_clk);<br>
&gt;&gt;&gt; &gt; + =A0 =A0 =A0 if (ret &lt; 0)<br>
&gt;&gt;&gt; &gt; + =A0 =A0 =A0 =A0 =A0 =A0 =A0 return ret;<br>
&gt;&gt;&gt; &gt; +<br>
&gt;&gt;&gt; &gt; + =A0 =A0 =A0 ret =3D clk_prepare(ctx-&gt;lcd_clk);<br>
&gt;&gt;&gt; &gt; + =A0 =A0 =A0 if =A0(ret &lt; 0) {<br>
&gt;&gt;&gt; &gt; + =A0 =A0 =A0 =A0 =A0 =A0 =A0 clk_unprepare(ctx-&gt;bus_c=
lk);<br>
&gt;&gt;&gt; &gt; + =A0 =A0 =A0 =A0 =A0 =A0 =A0 return ret;<br>
&gt;&gt;&gt; &gt; + =A0 =A0 =A0 }<br>
&gt;&gt;&gt; &gt; +<br>
&gt;&gt;&gt; &gt; =A0 =A0 =A0 =A0 ctx-&gt;vidcon0 =3D pdata-&gt;vidcon0;<br=
>
&gt;&gt;&gt; &gt; =A0 =A0 =A0 =A0 ctx-&gt;vidcon1 =3D pdata-&gt;vidcon1;<br=
>
&gt;&gt;&gt; &gt; =A0 =A0 =A0 =A0 ctx-&gt;default_win =3D pdata-&gt;default=
_win;<br>
&gt;&gt;&gt; &gt; @@ -981,8 +991,8 @@ static int fimd_remove(struct platfor=
m_device *pdev)<br>
&gt;&gt;&gt; &gt; =A0 =A0 =A0 =A0 if (ctx-&gt;suspended)<br>
&gt;&gt;&gt; &gt; =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 goto out;<br>
&gt;&gt;&gt; &gt;<br>
&gt;&gt;&gt; &gt; - =A0 =A0 =A0 clk_disable(ctx-&gt;lcd_clk);<br>
&gt;&gt;&gt; &gt; - =A0 =A0 =A0 clk_disable(ctx-&gt;bus_clk);<br>
&gt;&gt;&gt; &gt; + =A0 =A0 =A0 clk_unprepare(ctx-&gt;lcd_clk);<br>
&gt;&gt;&gt; &gt; + =A0 =A0 =A0 clk_unprepare(ctx-&gt;bus_clk);<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; This looks wrong again.. You still need to call clk_disable() =
to make<br>
&gt;&gt;&gt; clk enabled<br>
&gt;&gt;&gt; count zero...<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; =A0=A0=A0 Viresh had an suggestion, that the original code had a c=
all clk_disable() in fimd_remove(), which is really NOT required as there i=
s NO clk_enable() in fimd_probe() and we can right away delete clk_disable(=
) from fimd_remove().<br>

&gt;&gt;<br>
&gt;&gt; And also i think i should be breaking this patch into 2, 1st patch=
 for adding clk_prepare_enable() ( if we want remove dependency on RUNTIME =
PM ) in fimd_probe() for CCF migration another one for idea of replacing cl=
k_disable() with adding clk_disable_unprepare() (since we will be adding cl=
k_prepare_enable() in probe ) in fimd_remove() .<br>

&gt;&gt;<br>
&gt;&gt; Mr. Inki Dae any thoughts on this.<br>
&gt;&gt;<br>
&gt;<br>
&gt; Sorry for being late. I think clk_prepare/unprepare are nothing to do =
yet in case of Exynos but those might be used for in the future so your pat=
ch looks good to me as is.<br>
&gt;<br>
&gt; Applied. :)</p>
<p>thanks Mr. Dae</p>
<p>&gt; Thanks,<br>
&gt; Inki Dae<br>
&gt;<br>
&gt; =A0<br>
&gt;&gt;<br>
&gt;&gt; -- <br>
&gt;&gt; Thanks and Regards<br>
&gt;&gt; =A0Vikas Sajjan<br>
&gt;&gt;<br>
&gt;&gt; _______________________________________________<br>
&gt;&gt; dri-devel mailing list<br>
&gt;&gt; <a href=3D"mailto:dri-devel@lists.freedesktop.org">dri-devel@lists=
.freedesktop.org</a><br>
&gt;&gt; <a href=3D"http://lists.freedesktop.org/mailman/listinfo/dri-devel=
">http://lists.freedesktop.org/mailman/listinfo/dri-devel</a><br>
&gt;&gt;<br>
&gt;<br>
</p>

--047d7b3a85a8c3014c04dad9d7ac--

--===============2067684858==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
http://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============2067684858==--
