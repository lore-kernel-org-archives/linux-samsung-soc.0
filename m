From: Inki Dae <inki.dae@samsung.com>
Subject: Re: [PATCH v4] drm/exynos: prepare FIMD clocks
Date: Mon, 22 Apr 2013 19:20:02 +0900
Message-ID: <CAAQKjZOQr-NSgmwC3qGMqfQUu3QSgVsXfZkxwzpYE-onyVhOZw@mail.gmail.com>
References: <1365419265-21238-1-git-send-email-vikas.sajjan@linaro.org>
	<3109033.iP2qIPD33v@flatron>
	<CAAQKjZPrk6L=RmpywPgmiah+gtBgKOfsFdJLt7cfefyU76A80A@mail.gmail.com>
	<1830339.IiQ8P4gtV3@amdc1227>
	<CAAQKjZPT8pMQtY4ud=mMwgw7MYGf-JdqXePCt=yvcNcM1XgxoA@mail.gmail.com>
	<51750E43.1050602@samsung.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1650103067=="
Return-path: <dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org>
In-Reply-To: <51750E43.1050602@samsung.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Sender: dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org
Errors-To: dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org
To: Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, "patches@linaro.org" <patches@linaro.org>, Viresh Kumar <viresh.kumar@linaro.org>, Tomasz Figa <tomasz.figa@gmail.com>, DRI mailing list <dri-devel@lists.freedesktop.org>, Kukjin Kim <kgene.kim@samsung.com>, myungjoo.ham@samsung.com, Vikas Sajjan <vikas.sajjan@linaro.org>, linaro-kernel@lists.linaro.org, "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
List-Id: linux-samsung-soc@vger.kernel.org

--===============1650103067==
Content-Type: multipart/alternative; boundary=089e0122883e73e54e04daf069af

--089e0122883e73e54e04daf069af
Content-Type: text/plain; charset=ISO-8859-1

2013/4/22 Sylwester Nawrocki <s.nawrocki@samsung.com>

> On 04/22/2013 12:03 PM, Inki Dae wrote:
> >     > Also looks good to me. But what if power domain was disabled
> without pm
> >     > runtime? In this case, you must enable the power domain at machine
> code or
> >     > bootloader somewhere. This way would not only need some hard codes
> to turn
> >     > the power domain on but also not manage power management fully.
> This is same
> >     > as only the use of pm runtime interface(needing some hard codes
> without pm
> >     > runtime) so I don't prefer to add clk_enable/disable to fimd
> probe(). I quite
> >     > tend to force only the use of pm runtime as possible. So please
> add the hard
> >     > codes to machine code or bootloader like you did for power domain
> if you
> >     > want to use drm fimd without pm runtime.
> >
> >     That's not how the runtime PM, clock subsystems work:
> >
> >     1) When CONFIG_PM_RUNTIME is disabled, all the used hardware must be
> kept
> >     powered on all the time.
> >
> >     2) Common Clock Framework will always gate all clocks that have zero
> >     enable_count. Note that CCF support for Exynos is already merged for
> 3.10 and
> >     it will be the only available clock support method for Exynos.
> >
> >     AFAIK, drivers must work correctly in both cases, with
> CONFIG_PM_RUNTIME
> >     enabled and disabled.
> >
> >
> > Then is the driver worked correctly if the power domain to this device
> was
> > disabled at bootloader without CONFIG_PM_RUNTIME and with clk_enable()?
>  I
> > think, in this case, the device wouldn't be worked correctly because the
> power
> > of the device remains off. So you must enable the power domain
> somewhere. What
> > is the difference between these two cases?
>
> How about making the driver dependant on PM_RUNTIME and making it always
> use pm_runtime_* API, regardless if the platform actually implements
> runtime
> PM or not ? Is there any issue in using the Runtime PM core always, rather
> than coding any workarounds in drivers when PM_RUNTIME is disabled ?
>
>
That's what I want~~ :)




> Thanks,
> Sylwester
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> http://lists.freedesktop.org/mailman/listinfo/dri-devel
>

--089e0122883e73e54e04daf069af
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><br><div class=3D"gmail=
_quote">2013/4/22 Sylwester Nawrocki <span dir=3D"ltr">&lt;<a href=3D"mailt=
o:s.nawrocki@samsung.com" target=3D"_blank">s.nawrocki@samsung.com</a>&gt;<=
/span><br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div class=3D"im">On 04/22/2013 12:03 PM, In=
ki Dae wrote:<br>
&gt; =A0 =A0 &gt; Also looks good to me. But what if power domain was disab=
led without pm<br>
&gt; =A0 =A0 &gt; runtime? In this case, you must enable the power domain a=
t machine code or<br>
&gt; =A0 =A0 &gt; bootloader somewhere. This way would not only need some h=
ard codes to turn<br>
&gt; =A0 =A0 &gt; the power domain on but also not manage power management =
fully. This is same<br>
&gt; =A0 =A0 &gt; as only the use of pm runtime interface(needing some hard=
 codes without pm<br>
&gt; =A0 =A0 &gt; runtime) so I don&#39;t prefer to add clk_enable/disable =
to fimd probe(). I quite<br>
&gt; =A0 =A0 &gt; tend to force only the use of pm runtime as possible. So =
please add the hard<br>
&gt; =A0 =A0 &gt; codes to machine code or bootloader like you did for powe=
r domain if you<br>
&gt; =A0 =A0 &gt; want to use drm fimd without pm runtime.<br>
&gt;<br>
&gt; =A0 =A0 That&#39;s not how the runtime PM, clock subsystems work:<br>
&gt;<br>
&gt; =A0 =A0 1) When CONFIG_PM_RUNTIME is disabled, all the used hardware m=
ust be kept<br>
&gt; =A0 =A0 powered on all the time.<br>
&gt;<br>
&gt; =A0 =A0 2) Common Clock Framework will always gate all clocks that hav=
e zero<br>
&gt; =A0 =A0 enable_count. Note that CCF support for Exynos is already merg=
ed for 3.10 and<br>
&gt; =A0 =A0 it will be the only available clock support method for Exynos.=
<br>
&gt;<br>
&gt; =A0 =A0 AFAIK, drivers must work correctly in both cases, with CONFIG_=
PM_RUNTIME<br>
&gt; =A0 =A0 enabled and disabled.<br>
&gt;<br>
&gt;<br>
&gt; Then is the driver worked correctly if the power domain to this device=
 was<br>
&gt; disabled at bootloader without CONFIG_PM_RUNTIME and with clk_enable()=
? =A0I<br>
&gt; think, in this case, the device wouldn&#39;t be worked correctly becau=
se the power<br>
&gt; of the device remains off. So you must enable the power domain somewhe=
re. What<br>
&gt; is the difference between these two cases?<br>
<br>
</div>How about making the driver dependant on PM_RUNTIME and making it alw=
ays<br>
use pm_runtime_* API, regardless if the platform actually implements runtim=
e<br>
PM or not ? Is there any issue in using the Runtime PM core always, rather<=
br>
than coding any workarounds in drivers when PM_RUNTIME is disabled ?<br>
<br></blockquote><div><br></div><div>That&#39;s what I want~~ :)<br><br></d=
iv><div><br>=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 =
0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
Thanks,<br>
Sylwester<br>
<div class=3D"HOEnZb"><div class=3D"h5">___________________________________=
____________<br>
dri-devel mailing list<br>
<a href=3D"mailto:dri-devel@lists.freedesktop.org">dri-devel@lists.freedesk=
top.org</a><br>
<a href=3D"http://lists.freedesktop.org/mailman/listinfo/dri-devel" target=
=3D"_blank">http://lists.freedesktop.org/mailman/listinfo/dri-devel</a><br>
</div></div></blockquote></div><br></div></div>

--089e0122883e73e54e04daf069af--

--===============1650103067==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
http://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1650103067==--
