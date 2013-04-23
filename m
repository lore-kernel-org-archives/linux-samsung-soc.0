From: Inki Dae <inki.dae@samsung.com>
Subject: Re: [PATCH v4] drm/exynos: prepare FIMD clocks
Date: Tue, 23 Apr 2013 21:09:55 +0900
Message-ID: <CAAQKjZN5QurcMg67OFGHj1POEZfM82H510iHrQ4ghRgeBQ2mAQ@mail.gmail.com>
References: <1365419265-21238-1-git-send-email-vikas.sajjan@linaro.org>
	<51750E43.1050602@samsung.com> <2218256.k8DNv9nCJl@amdc1227>
	<1789889.I0NQprXLsB@vostro.rjw.lan>
	<CAAQKjZOpuPw6XZJj198uwJ-WsBHwK6oSKHfYz5zoNivVcbwQng@mail.gmail.com>
	<00b401ce4018$f620a390$e261eab0$@samsung.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1703852589=="
Return-path: <dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org>
In-Reply-To: <00b401ce4018$f620a390$e261eab0$@samsung.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Sender: dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org
Errors-To: dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org
To: "myungjoo.ham" <myungjoo.ham@samsung.com>
Cc: Kukjin Kim <kgene.kim@samsung.com>, "patches@linaro.org" <patches@linaro.org>, Kevin Hilman <khilman@deeprootsystems.com>, Viresh Kumar <viresh.kumar@linaro.org>, Tomasz Figa <tomasz.figa@gmail.com>, DRI mailing list <dri-devel@lists.freedesktop.org>, "Rafael J. Wysocki" <rjw@sisk.pl>, linux-samsung-soc@vger.kernel.org, Sylwester Nawrocki <s.nawrocki@samsung.com>, Vikas Sajjan <vikas.sajjan@linaro.org>, linaro-kernel@lists.linaro.org, "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
List-Id: linux-samsung-soc@vger.kernel.org

--===============1703852589==
Content-Type: multipart/alternative; boundary=089e01182dd440c06c04db061049

--089e01182dd440c06c04db061049
Content-Type: text/plain; charset=ISO-8859-1

2013/4/23 myungjoo.ham <myungjoo.ham@samsung.com>

> 2013/4/22 Inki Dae
> > 2013/4/22 Rafael J. Wysocki <rjw@sisk.pl>
> > > On Monday, April 22, 2013 12:37:36 PM Tomasz Figa wrote:
> > > > On Monday 22 of April 2013 12:17:39 Sylwester Nawrocki wrote:
> > > > > On 04/22/2013 12:03 PM, Inki Dae wrote:
> > > > > >     > Also looks good to me. But what if power domain was
> disabled
> without
> > > > > >     > pm
> > > > > >     > runtime? In this case, you must enable the power domain at
> machine
> > > > > >     > code or
> > > > > >     > bootloader somewhere. This way would not only need some
> hard
> codes
> > > > > >     > to turn
> > > > > >     > the power domain on but also not manage power management
> fully. This
> > > > > >     > is same as only the use of pm runtime interface(needing
> some
> hard
> > > > > >     > codes without pm runtime) so I don't prefer to add
> > > > > >     > clk_enable/disable to fimd probe(). I quite tend to force
> only the
> > > > > >     > use of pm runtime as possible. So please add the hard codes
> to
> > > > > >     > machine code or bootloader like you did for power domain if
> you
> > > > > >     > want to use drm fimd without pm runtime.
> > > > > >
> > > > > >     That's not how the runtime PM, clock subsystems work:
> > > > > >
> > > > > >     1) When CONFIG_PM_RUNTIME is disabled, all the used hardware
> must be
> > > > > >     kept
> > > > > >     powered on all the time.
> > > > > >
> > > > > >     2) Common Clock Framework will always gate all clocks that
> have zero
> > > > > >     enable_count. Note that CCF support for Exynos is already
> merged for
> > > > > >     3.10 and it will be the only available clock support method
> for
> > > > > >     Exynos.
> > > > > >
> > > > > >     AFAIK, drivers must work correctly in both cases, with
> > > > > >     CONFIG_PM_RUNTIME
> > > > > >     enabled and disabled.
> > > > > >
> > > > > > Then is the driver worked correctly if the power domain to this
> device was
> > > > > > disabled at bootloader without CONFIG_PM_RUNTIME and with
> clk_enable()?  I
> > > > > > think, in this case, the device wouldn't be worked correctly
> because the
> > > > > > power of the device remains off. So you must enable the power
> domain
> > > > > > somewhere. What is the difference between these two cases?
> > > > >
> > > > > How about making the driver dependant on PM_RUNTIME and making it
> always
> > > > > use pm_runtime_* API, regardless if the platform actually
> implements
> runtime
> > > > > PM or not ? Is there any issue in using the Runtime PM core always,
> rather
> > > > > than coding any workarounds in drivers when PM_RUNTIME is disabled
> ?
> > > >
> > > > I don't think this is a good idea. This would mean that any user that
> from
> > > > some reasons don't want to use PM_RUNTIME, would not be able to use
> the driver
> > > > anymore.
> > > >
> > > > Rafael, Kevin, do you have any opinion on this?
> > > I agree.
> > >
> > > Drivers should work for CONFIG_PM_RUNTIME unset too and static inline
> stubs for
> > > all runtime PM helpers are available in that case.
> > >
> > Hi Rafael,
> > The embedded system, at least Exynos SoC case, has the power domain
> device
> and this device could be enabled only by pm runtime interface. So the
> device
> couldn't be worked correctly without turning the power domain on only
> calling clk_enable(). In this case, the power domain must be enabled at
> machine code or bootloader. And the machine without CONFIG_PM_RUNTIME would
> assume that their own drivers always are enabled so the devices would be
> worked correctly. Is there any my missing point?
>
>
> - Power domain: not controlled if !CONFIG_PM_RUNTIME. Thus, we may
> assume that every power domain is kept ON from boot time if
> !CONFIG_PM_RUNTIME.
> If power domain is kept OFF from boot time (machine init code or
> bootloader)
> with !CONFIG_PM_RUNTIME, then it's simple a mistake at BSP writer.
>
> - Yes, the clock is still controlled while !CONFIG_PM_RUNTIME.
>
> My opinion is also to let probe do clk-enables though I don't want it
> to have #ifdef or "clk_enable()" in the probe function.
> Thus, implementing "power_on()"-like function in the driver and let probe()
> and
> runtime_pm_get callback call it seems appropriate to me.
> (that "fimd_active(ctx, true)" is "power-on" to itself, right?)
>
>
I thought that it should assume the power domain and relevant clocks are
enabled without CONFIG_PM_RUNTIME. So could anyone please tell me about
that? If only the power domain , I think Tomasz's proposal is good solution.

Thanks,
Inki Dae


>
> Cheers,
> MyungJoo
>
>
> --
> To unsubscribe from this list: send the line "unsubscribe
> linux-samsung-soc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>

--089e01182dd440c06c04db061049
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><br><div class=3D"gmail=
_quote">2013/4/23 myungjoo.ham <span dir=3D"ltr">&lt;<a href=3D"mailto:myun=
gjoo.ham@samsung.com" target=3D"_blank">myungjoo.ham@samsung.com</a>&gt;</s=
pan><br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border=
-left:1px #ccc solid;padding-left:1ex">
2013/4/22 Inki Dae<br>
<div><div class=3D"h5">&gt; 2013/4/22 Rafael J. Wysocki &lt;<a href=3D"mail=
to:rjw@sisk.pl">rjw@sisk.pl</a>&gt;<br>
&gt; &gt; On Monday, April 22, 2013 12:37:36 PM Tomasz Figa wrote:<br>
&gt; &gt; &gt; On Monday 22 of April 2013 12:17:39 Sylwester Nawrocki wrote=
:<br>
&gt; &gt; &gt; &gt; On 04/22/2013 12:03 PM, Inki Dae wrote:<br>
&gt; &gt; &gt; &gt; &gt; =A0 =A0 &gt; Also looks good to me. But what if po=
wer domain was disabled<br>
without<br>
&gt; &gt; &gt; &gt; &gt; =A0 =A0 &gt; pm<br>
&gt; &gt; &gt; &gt; &gt; =A0 =A0 &gt; runtime? In this case, you must enabl=
e the power domain at<br>
machine<br>
&gt; &gt; &gt; &gt; &gt; =A0 =A0 &gt; code or<br>
&gt; &gt; &gt; &gt; &gt; =A0 =A0 &gt; bootloader somewhere. This way would =
not only need some hard<br>
codes<br>
&gt; &gt; &gt; &gt; &gt; =A0 =A0 &gt; to turn<br>
&gt; &gt; &gt; &gt; &gt; =A0 =A0 &gt; the power domain on but also not mana=
ge power management<br>
fully. This<br>
&gt; &gt; &gt; &gt; &gt; =A0 =A0 &gt; is same as only the use of pm runtime=
 interface(needing some<br>
hard<br>
&gt; &gt; &gt; &gt; &gt; =A0 =A0 &gt; codes without pm runtime) so I don&#3=
9;t prefer to add<br>
&gt; &gt; &gt; &gt; &gt; =A0 =A0 &gt; clk_enable/disable to fimd probe(). I=
 quite tend to force<br>
only the<br>
&gt; &gt; &gt; &gt; &gt; =A0 =A0 &gt; use of pm runtime as possible. So ple=
ase add the hard codes<br>
to<br>
&gt; &gt; &gt; &gt; &gt; =A0 =A0 &gt; machine code or bootloader like you d=
id for power domain if<br>
you<br>
&gt; &gt; &gt; &gt; &gt; =A0 =A0 &gt; want to use drm fimd without pm runti=
me.<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; =A0 =A0 That&#39;s not how the runtime PM, clock s=
ubsystems work:<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; =A0 =A0 1) When CONFIG_PM_RUNTIME is disabled, all=
 the used hardware<br>
must be<br>
&gt; &gt; &gt; &gt; &gt; =A0 =A0 kept<br>
&gt; &gt; &gt; &gt; &gt; =A0 =A0 powered on all the time.<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; =A0 =A0 2) Common Clock Framework will always gate=
 all clocks that<br>
have zero<br>
&gt; &gt; &gt; &gt; &gt; =A0 =A0 enable_count. Note that CCF support for Ex=
ynos is already<br>
merged for<br>
&gt; &gt; &gt; &gt; &gt; =A0 =A0 3.10 and it will be the only available clo=
ck support method<br>
for<br>
&gt; &gt; &gt; &gt; &gt; =A0 =A0 Exynos.<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; =A0 =A0 AFAIK, drivers must work correctly in both=
 cases, with<br>
&gt; &gt; &gt; &gt; &gt; =A0 =A0 CONFIG_PM_RUNTIME<br>
&gt; &gt; &gt; &gt; &gt; =A0 =A0 enabled and disabled.<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; Then is the driver worked correctly if the power d=
omain to this<br>
device was<br>
&gt; &gt; &gt; &gt; &gt; disabled at bootloader without CONFIG_PM_RUNTIME a=
nd with<br>
clk_enable()? =A0I<br>
&gt; &gt; &gt; &gt; &gt; think, in this case, the device wouldn&#39;t be wo=
rked correctly<br>
because the<br>
&gt; &gt; &gt; &gt; &gt; power of the device remains off. So you must enabl=
e the power<br>
domain<br>
&gt; &gt; &gt; &gt; &gt; somewhere. What is the difference between these tw=
o cases?<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; How about making the driver dependant on PM_RUNTIME and=
 making it<br>
always<br>
&gt; &gt; &gt; &gt; use pm_runtime_* API, regardless if the platform actual=
ly implements<br>
runtime<br>
&gt; &gt; &gt; &gt; PM or not ? Is there any issue in using the Runtime PM =
core always,<br>
rather<br>
&gt; &gt; &gt; &gt; than coding any workarounds in drivers when PM_RUNTIME =
is disabled ?<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; I don&#39;t think this is a good idea. This would mean that =
any user that<br>
from<br>
&gt; &gt; &gt; some reasons don&#39;t want to use PM_RUNTIME, would not be =
able to use<br>
the driver<br>
&gt; &gt; &gt; anymore.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Rafael, Kevin, do you have any opinion on this?<br>
&gt; &gt; I agree.<br>
&gt; &gt;<br>
&gt; &gt; Drivers should work for CONFIG_PM_RUNTIME unset too and static in=
line<br>
stubs for<br>
&gt; &gt; all runtime PM helpers are available in that case.<br>
&gt; &gt;<br>
&gt; Hi Rafael,<br>
&gt; The embedded system, at least Exynos SoC case, has the power domain de=
vice<br>
and this device could be enabled only by pm runtime interface. So the devic=
e<br>
couldn&#39;t be worked correctly without turning the power domain on only<b=
r>
calling clk_enable(). In this case, the power domain must be enabled at<br>
machine code or bootloader. And the machine without CONFIG_PM_RUNTIME would=
<br>
assume that their own drivers always are enabled so the devices would be<br=
>
worked correctly. Is there any my missing point?<br>
<br>
<br>
</div></div>- Power domain: not controlled if !CONFIG_PM_RUNTIME. Thus, we =
may<br>
assume that every power domain is kept ON from boot time if<br>
!CONFIG_PM_RUNTIME.<br>
If power domain is kept OFF from boot time (machine init code or bootloader=
)<br>
with !CONFIG_PM_RUNTIME, then it&#39;s simple a mistake at BSP writer.<br>
<br>
- Yes, the clock is still controlled while !CONFIG_PM_RUNTIME.<br>
<br>
My opinion is also to let probe do clk-enables though I don&#39;t want it<b=
r>
to have #ifdef or &quot;clk_enable()&quot; in the probe function.<br>
Thus, implementing &quot;power_on()&quot;-like function in the driver and l=
et probe()<br>
and<br>
runtime_pm_get callback call it seems appropriate to me.<br>
(that &quot;fimd_active(ctx, true)&quot; is &quot;power-on&quot; to itself,=
 right?)<br>
<br></blockquote><div><br></div><div>I thought that it should assume the po=
wer domain and relevant clocks are enabled without CONFIG_PM_RUNTIME. So co=
uld anyone please tell me about that? If only the power domain , I think To=
masz&#39;s proposal is good solution.<br>
<br></div><div>Thanks,<br>Inki Dae<br></div><div>=A0</div><blockquote class=
=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padd=
ing-left:1ex">
<br>
Cheers,<br>
MyungJoo<br>
<div class=3D"HOEnZb"><div class=3D"h5"><br>
<br>
--<br>
To unsubscribe from this list: send the line &quot;unsubscribe linux-samsun=
g-soc&quot; in<br>
the body of a message to <a href=3D"mailto:majordomo@vger.kernel.org">major=
domo@vger.kernel.org</a><br>
More majordomo info at =A0<a href=3D"http://vger.kernel.org/majordomo-info.=
html" target=3D"_blank">http://vger.kernel.org/majordomo-info.html</a><br>
</div></div></blockquote></div><br></div></div>

--089e01182dd440c06c04db061049--

--===============1703852589==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
http://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1703852589==--
