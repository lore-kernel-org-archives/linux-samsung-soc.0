From: Inki Dae <inki.dae@samsung.com>
Subject: Re: [PATCH v4] drm/exynos: prepare FIMD clocks
Date: Mon, 22 Apr 2013 21:04:52 +0900
Message-ID: <CAAQKjZOpuPw6XZJj198uwJ-WsBHwK6oSKHfYz5zoNivVcbwQng@mail.gmail.com>
References: <1365419265-21238-1-git-send-email-vikas.sajjan@linaro.org>
	<51750E43.1050602@samsung.com> <2218256.k8DNv9nCJl@amdc1227>
	<1789889.I0NQprXLsB@vostro.rjw.lan>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2100900873=="
Return-path: <dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org>
In-Reply-To: <1789889.I0NQprXLsB@vostro.rjw.lan>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Sender: dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org
Errors-To: dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org
To: "Rafael J. Wysocki" <rjw@sisk.pl>
Cc: Kukjin Kim <kgene.kim@samsung.com>, "patches@linaro.org" <patches@linaro.org>, Kevin Hilman <khilman@deeprootsystems.com>, Viresh Kumar <viresh.kumar@linaro.org>, Tomasz Figa <tomasz.figa@gmail.com>, DRI mailing list <dri-devel@lists.freedesktop.org>, linux-samsung-soc@vger.kernel.org, myungjoo.ham@samsung.com, Sylwester Nawrocki <s.nawrocki@samsung.com>, Vikas Sajjan <vikas.sajjan@linaro.org>, linaro-kernel@lists.linaro.org, "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
List-Id: linux-samsung-soc@vger.kernel.org

--===============2100900873==
Content-Type: multipart/alternative; boundary=089e0115fe5c52d74404daf1e091

--089e0115fe5c52d74404daf1e091
Content-Type: text/plain; charset=ISO-8859-1

2013/4/22 Rafael J. Wysocki <rjw@sisk.pl>

> On Monday, April 22, 2013 12:37:36 PM Tomasz Figa wrote:
> > On Monday 22 of April 2013 12:17:39 Sylwester Nawrocki wrote:
> > > On 04/22/2013 12:03 PM, Inki Dae wrote:
> > > >     > Also looks good to me. But what if power domain was disabled
> without
> > > >     > pm
> > > >     > runtime? In this case, you must enable the power domain at
> machine
> > > >     > code or
> > > >     > bootloader somewhere. This way would not only need some hard
> codes
> > > >     > to turn
> > > >     > the power domain on but also not manage power management
> fully. This
> > > >     > is same as only the use of pm runtime interface(needing some
> hard
> > > >     > codes without pm runtime) so I don't prefer to add
> > > >     > clk_enable/disable to fimd probe(). I quite tend to force only
> the
> > > >     > use of pm runtime as possible. So please add the hard codes to
> > > >     > machine code or bootloader like you did for power domain if you
> > > >     > want to use drm fimd without pm runtime.
> > > >
> > > >     That's not how the runtime PM, clock subsystems work:
> > > >
> > > >     1) When CONFIG_PM_RUNTIME is disabled, all the used hardware
> must be
> > > >     kept
> > > >     powered on all the time.
> > > >
> > > >     2) Common Clock Framework will always gate all clocks that have
> zero
> > > >     enable_count. Note that CCF support for Exynos is already merged
> for
> > > >     3.10 and it will be the only available clock support method for
> > > >     Exynos.
> > > >
> > > >     AFAIK, drivers must work correctly in both cases, with
> > > >     CONFIG_PM_RUNTIME
> > > >     enabled and disabled.
> > > >
> > > > Then is the driver worked correctly if the power domain to this
> device was
> > > > disabled at bootloader without CONFIG_PM_RUNTIME and with
> clk_enable()?  I
> > > > think, in this case, the device wouldn't be worked correctly because
> the
> > > > power of the device remains off. So you must enable the power domain
> > > > somewhere. What is the difference between these two cases?
> > >
> > > How about making the driver dependant on PM_RUNTIME and making it
> always
> > > use pm_runtime_* API, regardless if the platform actually implements
> runtime
> > > PM or not ? Is there any issue in using the Runtime PM core always,
> rather
> > > than coding any workarounds in drivers when PM_RUNTIME is disabled ?
> >
> > I don't think this is a good idea. This would mean that any user that
> from
> > some reasons don't want to use PM_RUNTIME, would not be able to use the
> driver
> > anymore.
> >
> > Rafael, Kevin, do you have any opinion on this?
>
> I agree.
>
> Drivers should work for CONFIG_PM_RUNTIME unset too and static inline
> stubs for
> all runtime PM helpers are available in that case.
>
>
Hi Rafael,

The embedded system, at least Exynos SoC case, has the power domain device
and this device could be enabled only by pm runtime interface. So the
device couldn't be worked correctly without turning the power domain on
only calling clk_enable(). In this case, the power domain must be enabled
at machine code or bootloader. And the machine without CONFIG_PM_RUNTIME
would assume that their own drivers always are enabled so the devices would
be worked correctly. Is there any my missing point?

Thanks,
Inki Dae

Thanks,
> Rafael
>
>
> --
> I speak only for myself.
> Rafael J. Wysocki, Intel Open Source Technology Center.
> --
> To unsubscribe from this list: send the line "unsubscribe
> linux-samsung-soc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>

--089e0115fe5c52d74404daf1e091
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><br><div class=3D"gmail=
_quote">2013/4/22 Rafael J. Wysocki <span dir=3D"ltr">&lt;<a href=3D"mailto=
:rjw@sisk.pl" target=3D"_blank">rjw@sisk.pl</a>&gt;</span><br><blockquote c=
lass=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;=
padding-left:1ex">
<div class=3D"HOEnZb"><div class=3D"h5">On Monday, April 22, 2013 12:37:36 =
PM Tomasz Figa wrote:<br>
&gt; On Monday 22 of April 2013 12:17:39 Sylwester Nawrocki wrote:<br>
&gt; &gt; On 04/22/2013 12:03 PM, Inki Dae wrote:<br>
&gt; &gt; &gt; =A0 =A0 &gt; Also looks good to me. But what if power domain=
 was disabled without<br>
&gt; &gt; &gt; =A0 =A0 &gt; pm<br>
&gt; &gt; &gt; =A0 =A0 &gt; runtime? In this case, you must enable the powe=
r domain at machine<br>
&gt; &gt; &gt; =A0 =A0 &gt; code or<br>
&gt; &gt; &gt; =A0 =A0 &gt; bootloader somewhere. This way would not only n=
eed some hard codes<br>
&gt; &gt; &gt; =A0 =A0 &gt; to turn<br>
&gt; &gt; &gt; =A0 =A0 &gt; the power domain on but also not manage power m=
anagement fully. This<br>
&gt; &gt; &gt; =A0 =A0 &gt; is same as only the use of pm runtime interface=
(needing some hard<br>
&gt; &gt; &gt; =A0 =A0 &gt; codes without pm runtime) so I don&#39;t prefer=
 to add<br>
&gt; &gt; &gt; =A0 =A0 &gt; clk_enable/disable to fimd probe(). I quite ten=
d to force only the<br>
&gt; &gt; &gt; =A0 =A0 &gt; use of pm runtime as possible. So please add th=
e hard codes to<br>
&gt; &gt; &gt; =A0 =A0 &gt; machine code or bootloader like you did for pow=
er domain if you<br>
&gt; &gt; &gt; =A0 =A0 &gt; want to use drm fimd without pm runtime.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; =A0 =A0 That&#39;s not how the runtime PM, clock subsystems =
work:<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; =A0 =A0 1) When CONFIG_PM_RUNTIME is disabled, all the used =
hardware must be<br>
&gt; &gt; &gt; =A0 =A0 kept<br>
&gt; &gt; &gt; =A0 =A0 powered on all the time.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; =A0 =A0 2) Common Clock Framework will always gate all clock=
s that have zero<br>
&gt; &gt; &gt; =A0 =A0 enable_count. Note that CCF support for Exynos is al=
ready merged for<br>
&gt; &gt; &gt; =A0 =A0 3.10 and it will be the only available clock support=
 method for<br>
&gt; &gt; &gt; =A0 =A0 Exynos.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; =A0 =A0 AFAIK, drivers must work correctly in both cases, wi=
th<br>
&gt; &gt; &gt; =A0 =A0 CONFIG_PM_RUNTIME<br>
&gt; &gt; &gt; =A0 =A0 enabled and disabled.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Then is the driver worked correctly if the power domain to t=
his device was<br>
&gt; &gt; &gt; disabled at bootloader without CONFIG_PM_RUNTIME and with cl=
k_enable()? =A0I<br>
&gt; &gt; &gt; think, in this case, the device wouldn&#39;t be worked corre=
ctly because the<br>
&gt; &gt; &gt; power of the device remains off. So you must enable the powe=
r domain<br>
&gt; &gt; &gt; somewhere. What is the difference between these two cases?<b=
r>
&gt; &gt;<br>
&gt; &gt; How about making the driver dependant on PM_RUNTIME and making it=
 always<br>
&gt; &gt; use pm_runtime_* API, regardless if the platform actually impleme=
nts runtime<br>
&gt; &gt; PM or not ? Is there any issue in using the Runtime PM core alway=
s, rather<br>
&gt; &gt; than coding any workarounds in drivers when PM_RUNTIME is disable=
d ?<br>
&gt;<br>
&gt; I don&#39;t think this is a good idea. This would mean that any user t=
hat from<br>
&gt; some reasons don&#39;t want to use PM_RUNTIME, would not be able to us=
e the driver<br>
&gt; anymore.<br>
&gt;<br>
&gt; Rafael, Kevin, do you have any opinion on this?<br>
<br>
</div></div>I agree.<br>
<br>
Drivers should work for CONFIG_PM_RUNTIME unset too and static inline stubs=
 for<br>
all runtime PM helpers are available in that case.<br>
<br></blockquote><div><br></div><div>Hi Rafael,<br><br></div><div>The embed=
ded system, at least Exynos SoC case, has the power domain device and this =
device could be enabled only by pm runtime interface. So the device couldn&=
#39;t be worked correctly without turning the power domain on only calling =
clk_enable(). In this case, the power domain must be enabled at machine cod=
e or bootloader. And the machine without CONFIG_PM_RUNTIME would assume tha=
t their own drivers always are enabled so the devices would be worked corre=
ctly. Is there any my missing point?<br>
</div><div>=A0<br></div><div>Thanks,<br>Inki Dae<br><br></div><blockquote c=
lass=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;=
padding-left:1ex">
Thanks,<br>
Rafael<br>
<span class=3D"HOEnZb"><font color=3D"#888888"><br>
<br>
--<br>
I speak only for myself.<br>
Rafael J. Wysocki, Intel Open Source Technology Center.<br>
</font></span><div class=3D"HOEnZb"><div class=3D"h5">--<br>
To unsubscribe from this list: send the line &quot;unsubscribe linux-samsun=
g-soc&quot; in<br>
the body of a message to <a href=3D"mailto:majordomo@vger.kernel.org">major=
domo@vger.kernel.org</a><br>
More majordomo info at =A0<a href=3D"http://vger.kernel.org/majordomo-info.=
html" target=3D"_blank">http://vger.kernel.org/majordomo-info.html</a><br>
</div></div></blockquote></div><br></div></div>

--089e0115fe5c52d74404daf1e091--

--===============2100900873==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
http://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============2100900873==--
