From: Inki Dae <inki.dae@samsung.com>
Subject: Re: [PATCH v4] drm/exynos: prepare FIMD clocks
Date: Mon, 22 Apr 2013 20:52:11 +0900
Message-ID: <CAAQKjZOcqcPaDShDUYd7VfNn0zQNbt9QeigR8hy2VNow_xUT7w@mail.gmail.com>
References: <1365419265-21238-1-git-send-email-vikas.sajjan@linaro.org>
	<CAAQKjZPT8pMQtY4ud=mMwgw7MYGf-JdqXePCt=yvcNcM1XgxoA@mail.gmail.com>
	<51750E43.1050602@samsung.com> <2218256.k8DNv9nCJl@amdc1227>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0987933675=="
Return-path: <dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org>
In-Reply-To: <2218256.k8DNv9nCJl@amdc1227>
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
Cc: Kukjin Kim <kgene.kim@samsung.com>, "patches@linaro.org" <patches@linaro.org>, Kevin Hilman <khilman@deeprootsystems.com>, Viresh Kumar <viresh.kumar@linaro.org>, Tomasz Figa <tomasz.figa@gmail.com>, DRI mailing list <dri-devel@lists.freedesktop.org>, rjw@sisk.pl, linux-samsung-soc@vger.kernel.org, myungjoo.ham@samsung.com, Sylwester Nawrocki <s.nawrocki@samsung.com>, Vikas Sajjan <vikas.sajjan@linaro.org>, linaro-kernel@lists.linaro.org, "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
List-Id: linux-samsung-soc@vger.kernel.org

--===============0987933675==
Content-Type: multipart/alternative; boundary=089e0115fe5cf5230904daf1b205

--089e0115fe5cf5230904daf1b205
Content-Type: text/plain; charset=ISO-8859-1

2013/4/22 Tomasz Figa <t.figa@samsung.com>

> On Monday 22 of April 2013 12:17:39 Sylwester Nawrocki wrote:
> > On 04/22/2013 12:03 PM, Inki Dae wrote:
> > >     > Also looks good to me. But what if power domain was disabled
> without
> > >     > pm
> > >     > runtime? In this case, you must enable the power domain at
> machine
> > >     > code or
> > >     > bootloader somewhere. This way would not only need some hard
> codes
> > >     > to turn
> > >     > the power domain on but also not manage power management fully.
> This
> > >     > is same as only the use of pm runtime interface(needing some hard
> > >     > codes without pm runtime) so I don't prefer to add
> > >     > clk_enable/disable to fimd probe(). I quite tend to force only
> the
> > >     > use of pm runtime as possible. So please add the hard codes to
> > >     > machine code or bootloader like you did for power domain if you
> > >     > want to use drm fimd without pm runtime.
> > >
> > >     That's not how the runtime PM, clock subsystems work:
> > >
> > >     1) When CONFIG_PM_RUNTIME is disabled, all the used hardware must
> be
> > >     kept
> > >     powered on all the time.
> > >
> > >     2) Common Clock Framework will always gate all clocks that have
> zero
> > >     enable_count. Note that CCF support for Exynos is already merged
> for
> > >     3.10 and it will be the only available clock support method for
> > >     Exynos.
> > >
> > >     AFAIK, drivers must work correctly in both cases, with
> > >     CONFIG_PM_RUNTIME
> > >     enabled and disabled.
> > >
> > > Then is the driver worked correctly if the power domain to this device
> was
> > > disabled at bootloader without CONFIG_PM_RUNTIME and with
> clk_enable()?  I
> > > think, in this case, the device wouldn't be worked correctly because
> the
> > > power of the device remains off. So you must enable the power domain
> > > somewhere. What is the difference between these two cases?
> >
> > How about making the driver dependant on PM_RUNTIME and making it always
> > use pm_runtime_* API, regardless if the platform actually implements
> runtime
> > PM or not ? Is there any issue in using the Runtime PM core always,
> rather
> > than coding any workarounds in drivers when PM_RUNTIME is disabled ?
>
> I don't think this is a good idea. This would mean that any user that from
> some reasons don't want to use PM_RUNTIME, would not be able to use the
> driver
> anymore.
>
>
Again. There is any case that the driver isn't worked correctly without
CONFIG_PM_RUNTIME and with clk_enable(). Could you guarantee the driver to
be worked correctly only adding clk_enable() to probe() without
CONFIG_PM_RUNTIME? as I said before, what if the power domain to the device
was disabled?


> Rafael, Kevin, do you have any opinion on this?
>
> Best regards,
> --
> Tomasz Figa
> Samsung Poland R&D Center
> SW Solution Development, Kernel and System Framework
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> http://lists.freedesktop.org/mailman/listinfo/dri-devel
>

--089e0115fe5cf5230904daf1b205
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><br><div class=3D"gmail=
_quote">2013/4/22 Tomasz Figa <span dir=3D"ltr">&lt;<a href=3D"mailto:t.fig=
a@samsung.com" target=3D"_blank">t.figa@samsung.com</a>&gt;</span><br><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #cc=
c solid;padding-left:1ex">
<div class=3D"HOEnZb"><div class=3D"h5">On Monday 22 of April 2013 12:17:39=
 Sylwester Nawrocki wrote:<br>
&gt; On 04/22/2013 12:03 PM, Inki Dae wrote:<br>
&gt; &gt; =A0 =A0 &gt; Also looks good to me. But what if power domain was =
disabled without<br>
&gt; &gt; =A0 =A0 &gt; pm<br>
&gt; &gt; =A0 =A0 &gt; runtime? In this case, you must enable the power dom=
ain at machine<br>
&gt; &gt; =A0 =A0 &gt; code or<br>
&gt; &gt; =A0 =A0 &gt; bootloader somewhere. This way would not only need s=
ome hard codes<br>
&gt; &gt; =A0 =A0 &gt; to turn<br>
&gt; &gt; =A0 =A0 &gt; the power domain on but also not manage power manage=
ment fully. This<br>
&gt; &gt; =A0 =A0 &gt; is same as only the use of pm runtime interface(need=
ing some hard<br>
&gt; &gt; =A0 =A0 &gt; codes without pm runtime) so I don&#39;t prefer to a=
dd<br>
&gt; &gt; =A0 =A0 &gt; clk_enable/disable to fimd probe(). I quite tend to =
force only the<br>
&gt; &gt; =A0 =A0 &gt; use of pm runtime as possible. So please add the har=
d codes to<br>
&gt; &gt; =A0 =A0 &gt; machine code or bootloader like you did for power do=
main if you<br>
&gt; &gt; =A0 =A0 &gt; want to use drm fimd without pm runtime.<br>
&gt; &gt;<br>
&gt; &gt; =A0 =A0 That&#39;s not how the runtime PM, clock subsystems work:=
<br>
&gt; &gt;<br>
&gt; &gt; =A0 =A0 1) When CONFIG_PM_RUNTIME is disabled, all the used hardw=
are must be<br>
&gt; &gt; =A0 =A0 kept<br>
&gt; &gt; =A0 =A0 powered on all the time.<br>
&gt; &gt;<br>
&gt; &gt; =A0 =A0 2) Common Clock Framework will always gate all clocks tha=
t have zero<br>
&gt; &gt; =A0 =A0 enable_count. Note that CCF support for Exynos is already=
 merged for<br>
&gt; &gt; =A0 =A0 3.10 and it will be the only available clock support meth=
od for<br>
&gt; &gt; =A0 =A0 Exynos.<br>
&gt; &gt;<br>
&gt; &gt; =A0 =A0 AFAIK, drivers must work correctly in both cases, with<br=
>
&gt; &gt; =A0 =A0 CONFIG_PM_RUNTIME<br>
&gt; &gt; =A0 =A0 enabled and disabled.<br>
&gt; &gt;<br>
&gt; &gt; Then is the driver worked correctly if the power domain to this d=
evice was<br>
&gt; &gt; disabled at bootloader without CONFIG_PM_RUNTIME and with clk_ena=
ble()? =A0I<br>
&gt; &gt; think, in this case, the device wouldn&#39;t be worked correctly =
because the<br>
&gt; &gt; power of the device remains off. So you must enable the power dom=
ain<br>
&gt; &gt; somewhere. What is the difference between these two cases?<br>
&gt;<br>
&gt; How about making the driver dependant on PM_RUNTIME and making it alwa=
ys<br>
&gt; use pm_runtime_* API, regardless if the platform actually implements r=
untime<br>
&gt; PM or not ? Is there any issue in using the Runtime PM core always, ra=
ther<br>
&gt; than coding any workarounds in drivers when PM_RUNTIME is disabled ?<b=
r>
<br>
</div></div>I don&#39;t think this is a good idea. This would mean that any=
 user that from<br>
some reasons don&#39;t want to use PM_RUNTIME, would not be able to use the=
 driver<br>
anymore.<br>
<br></blockquote><div><br></div><div>Again. There is any case that the driv=
er isn&#39;t worked correctly without CONFIG_PM_RUNTIME and with clk_enable=
(). Could you guarantee the driver to be worked correctly only adding clk_e=
nable() to probe() without CONFIG_PM_RUNTIME? as I said before, what if the=
 power domain to the device was disabled?<br>
</div><div>=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0=
 .8ex;border-left:1px #ccc solid;padding-left:1ex">
Rafael, Kevin, do you have any opinion on this?<br>
<div class=3D"im HOEnZb"><br>
Best regards,<br>
--<br>
Tomasz Figa<br>
Samsung Poland R&amp;D Center<br>
SW Solution Development, Kernel and System Framework<br>
<br>
</div><div class=3D"HOEnZb"><div class=3D"h5">_____________________________=
__________________<br>
dri-devel mailing list<br>
<a href=3D"mailto:dri-devel@lists.freedesktop.org">dri-devel@lists.freedesk=
top.org</a><br>
<a href=3D"http://lists.freedesktop.org/mailman/listinfo/dri-devel" target=
=3D"_blank">http://lists.freedesktop.org/mailman/listinfo/dri-devel</a><br>
</div></div></blockquote></div><br></div></div>

--089e0115fe5cf5230904daf1b205--

--===============0987933675==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
http://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0987933675==--
