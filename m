From: Inki Dae <inki.dae@samsung.com>
Subject: Re: [RFC 0/2] exynos5250/hdmi: replace dummy hdmiphy clock with pmu
	reg control
Date: Wed, 28 Aug 2013 17:36:20 +0900
Message-ID: <CAAQKjZMse0ZAw04H9ydwj9Joy7TSsfpUqfrr-DnAt+1f3hNdCQ@mail.gmail.com>
References: <1370935073-7475-1-git-send-email-rahul.sharma@samsung.com>
	<CAAQKjZMuSQhbYtOyni-RdHhXu0fv3U2Dm_2iqRLe0smSt_jjjQ@mail.gmail.com>
	<CAAQKjZOZCtLnE_OPs60NU+Z4pkHiSCqZcBOi1Dv+PC=01HKqyg@mail.gmail.com>
	<CAPdUM4Nis0uwyZf1hNDOMmdqFm0K7beVPoyAWRjMBwq0jcwwCQ@mail.gmail.com>
	<51B98908.8050403@samsung.com>
	<02c101ce6828$29ab0f20$7d012d60$%dae@samsung.com>
	<51B9C0ED.2040605@ti.com> <51BAB398.8090409@samsung.com>
	<CAPdUM4PK7K+Vw6umnehDubLD37jiWdcd4iXX2DJvHS8990LQGQ@mail.gmail.com>
	<51C04688.3090205@ti.com>
	<CAPdUM4O7cbBEEc4VdmcyryqFxpek6SsEcG-g-KyxwVypdwJnaw@mail.gmail.com>
	<51F75802.90305@samsung.com>
	<CAPdUM4Pjapebtrh7+c7ZHNvg26MGB_byUXrasPfjA38bkvBR7g@mail.gmail.com>
	<CAPdUM4OgJo9TLFeRUND+s2vF-ShsvQp=uo99FEnd-7UrBfCV-g@mail.gmail.com>
	<51F8FEF9.9020107@samsung.com>
	<CAPdUM4OtmOdNmyUPjODTgGk4zWOqz+8pihRg2YGoppArR3PO+A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1707581386=="
Return-path: <dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org>
In-Reply-To: <CAPdUM4OtmOdNmyUPjODTgGk4zWOqz+8pihRg2YGoppArR3PO+A@mail.gmail.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Sender: dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org
Errors-To: dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org
To: Rahul Sharma <r.sh.open@gmail.com>
Cc: "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Stephen Warren <swarren@wwwdotorg.org>, Seung-Woo Kim <sw0312.kim@samsung.com>, sunil joshi <joshi@samsung.com>, DRI mailing list <dri-devel@lists.freedesktop.org>, Kishon Vijay Abraham I <kishon@ti.com>, Kukjin Kim <kgene.kim@samsung.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Grant Likely <grant.likely@linaro.org>, Rahul Sharma <rahul.sharma@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

--===============1707581386==
Content-Type: multipart/alternative; boundary=f46d042c65a74347ee04e4fde205

--f46d042c65a74347ee04e4fde205
Content-Type: text/plain; charset=ISO-8859-1

Rahul, ping~~~


2013/8/1 Rahul Sharma <r.sh.open@gmail.com>

> Thanks Sylwester,
>
> On Wed, Jul 31, 2013 at 5:41 PM, Sylwester Nawrocki
> <s.nawrocki@samsung.com> wrote:
> > Hi Rahul,
> >
> > On 07/31/2013 01:23 PM, Rahul Sharma wrote:
> >>>> I think your hdmiphy pmu patch is good enough just if dt binding for
> pmu
> >>>> >> is in hdmiphy binding instead of hdmi binding. So I recommended to
> make
> >>>> >> pmu patch set on the top of independent hdmiphy patch set because
> with
> >>>> >> independent hdmiphy patch set hdmiphy pmu code is moved to hdmiphy
> driver.
> >>>> >>
> >>>> >> Is it possible that hdmi driver references pmu information from
> hdmiphy
> >>>> >> binding? If that, it seems one possible solution to fix current
> exynos
> >>>> >> hdmi broken.
> >>>> >>
> >>>> >> Thanks and Regards,
> >>>> >> - Seung-Woo Kim
> >>>> >>
> >>> >
> >>> > I can surely do that but, I am worried about hdmiphy control bus.
> >>> > change In 5420. It is changed to platform bus from i2c. Isolating
> >>> > hdmiphy from hdmi driver seems the only clean method to handle
> >>> > control bus change, changed phy configurations and power control
> >>> > through PMU bit.
> >>> >
> >>> > To fix broken hdmi for 5420, I can again post the "hdmiphy
> >>> > separation patches" to place hdmiphy driver in DRM. Later we can
> >>> > migrate to Generic Phy Framework.
> >>> >
> >>
> >> Hi Seung Woo, Mr. Dae, Sylwester,
> >>
> >> What you say on this? Shall I separate hdmiphy in following manner:
> >>
> >> 1) Move all phy related code to hdmiphy driver i.e. exynos_hdmiphy.c
> >> 2) hdmiphy driver exposes power_on/off and set_pixel callbacks for
> >> hdmi driver.
> >> 3) let hdmi driver behave as phy controller for hdmiphy.
> >> 4) move PMU bit control to hdmiphy driver, instead of hdmi driver.
> >>
> >> This way we will be very close to generic phy framework implementation
> >> and migration to generic phy framework will be just a cakewalk.
> >
> > This all sound good to me, it seem natural to put the HDMI PHY
> > functionality into a separate module. Hardware-wise the PHY is quite
> > separate and as experience shows different PHYs can be attached to
> > same controller. Well, we have well known that before...
> >
> > I'm not sure what the problem is with adding subsystem specific
> > classes of operations (set of callback) to the generic PHY API, until
> > that gets sorted out your approach looks good to me.
> >
> > As a side note, originally the V4L2 driver exposed the HDMI PHY
> > as struct v4l2_subdev object, have a look at drivers/media/platform/
> > s5p-tv/hdmiphy_drv.c. And in case of exynos5 we would just have
> > created a platform driver for the HDMI PHY which would expose same
> > subdev interface. So something similar as you proposed above.
> >
>
> Yea, it is very similar to s5p-tv/hdmiphy_drv.c. On top of this, I want
> to make hdmiphy platform device as Clock provider for hdmiphy clock,
> as you have done for cam_clkout*. Hdmi driver will call set_rate on this
> clock.
>
> I will post patches for the above separation and move hdmiphy to Generic
> Phy framework after we get clarity on how to add additional callbacks.
>
> Thanks for your reply.
>
> Regards,
> Rahul Sharma
>
> >
> > Regards,
> > Sylwester
> >
> --
> To unsubscribe from this list: send the line "unsubscribe
> linux-samsung-soc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>

--f46d042c65a74347ee04e4fde205
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Rahul, ping~~~<br></div><div class=3D"gmail_extra"><br><br=
><div class=3D"gmail_quote">2013/8/1 Rahul Sharma <span dir=3D"ltr">&lt;<a =
href=3D"mailto:r.sh.open@gmail.com" target=3D"_blank">r.sh.open@gmail.com</=
a>&gt;</span><br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">Thanks Sylwester,<br>
<div><div class=3D"h5"><br>
On Wed, Jul 31, 2013 at 5:41 PM, Sylwester Nawrocki<br>
&lt;<a href=3D"mailto:s.nawrocki@samsung.com">s.nawrocki@samsung.com</a>&gt=
; wrote:<br>
&gt; Hi Rahul,<br>
&gt;<br>
&gt; On 07/31/2013 01:23 PM, Rahul Sharma wrote:<br>
&gt;&gt;&gt;&gt; I think your hdmiphy pmu patch is good enough just if dt b=
inding for pmu<br>
&gt;&gt;&gt;&gt; &gt;&gt; is in hdmiphy binding instead of hdmi binding. So=
 I recommended to make<br>
&gt;&gt;&gt;&gt; &gt;&gt; pmu patch set on the top of independent hdmiphy p=
atch set because with<br>
&gt;&gt;&gt;&gt; &gt;&gt; independent hdmiphy patch set hdmiphy pmu code is=
 moved to hdmiphy driver.<br>
&gt;&gt;&gt;&gt; &gt;&gt;<br>
&gt;&gt;&gt;&gt; &gt;&gt; Is it possible that hdmi driver references pmu in=
formation from hdmiphy<br>
&gt;&gt;&gt;&gt; &gt;&gt; binding? If that, it seems one possible solution =
to fix current exynos<br>
&gt;&gt;&gt;&gt; &gt;&gt; hdmi broken.<br>
&gt;&gt;&gt;&gt; &gt;&gt;<br>
&gt;&gt;&gt;&gt; &gt;&gt; Thanks and Regards,<br>
&gt;&gt;&gt;&gt; &gt;&gt; - Seung-Woo Kim<br>
&gt;&gt;&gt;&gt; &gt;&gt;<br>
&gt;&gt;&gt; &gt;<br>
&gt;&gt;&gt; &gt; I can surely do that but, I am worried about hdmiphy cont=
rol bus.<br>
&gt;&gt;&gt; &gt; change In 5420. It is changed to platform bus from i2c. I=
solating<br>
&gt;&gt;&gt; &gt; hdmiphy from hdmi driver seems the only clean method to h=
andle<br>
&gt;&gt;&gt; &gt; control bus change, changed phy configurations and power =
control<br>
&gt;&gt;&gt; &gt; through PMU bit.<br>
&gt;&gt;&gt; &gt;<br>
&gt;&gt;&gt; &gt; To fix broken hdmi for 5420, I can again post the &quot;h=
dmiphy<br>
&gt;&gt;&gt; &gt; separation patches&quot; to place hdmiphy driver in DRM. =
Later we can<br>
&gt;&gt;&gt; &gt; migrate to Generic Phy Framework.<br>
&gt;&gt;&gt; &gt;<br>
&gt;&gt;<br>
&gt;&gt; Hi Seung Woo, Mr. Dae, Sylwester,<br>
&gt;&gt;<br>
&gt;&gt; What you say on this? Shall I separate hdmiphy in following manner=
:<br>
&gt;&gt;<br>
&gt;&gt; 1) Move all phy related code to hdmiphy driver i.e. exynos_hdmiphy=
.c<br>
&gt;&gt; 2) hdmiphy driver exposes power_on/off and set_pixel callbacks for=
<br>
&gt;&gt; hdmi driver.<br>
&gt;&gt; 3) let hdmi driver behave as phy controller for hdmiphy.<br>
&gt;&gt; 4) move PMU bit control to hdmiphy driver, instead of hdmi driver.=
<br>
&gt;&gt;<br>
&gt;&gt; This way we will be very close to generic phy framework implementa=
tion<br>
&gt;&gt; and migration to generic phy framework will be just a cakewalk.<br=
>
&gt;<br>
&gt; This all sound good to me, it seem natural to put the HDMI PHY<br>
&gt; functionality into a separate module. Hardware-wise the PHY is quite<b=
r>
&gt; separate and as experience shows different PHYs can be attached to<br>
&gt; same controller. Well, we have well known that before...<br>
&gt;<br>
&gt; I&#39;m not sure what the problem is with adding subsystem specific<br=
>
&gt; classes of operations (set of callback) to the generic PHY API, until<=
br>
&gt; that gets sorted out your approach looks good to me.<br>
&gt;<br>
&gt; As a side note, originally the V4L2 driver exposed the HDMI PHY<br>
&gt; as struct v4l2_subdev object, have a look at drivers/media/platform/<b=
r>
&gt; s5p-tv/hdmiphy_drv.c. And in case of exynos5 we would just have<br>
&gt; created a platform driver for the HDMI PHY which would expose same<br>
&gt; subdev interface. So something similar as you proposed above.<br>
&gt;<br>
<br>
</div></div>Yea, it is very similar to s5p-tv/hdmiphy_drv.c. On top of this=
, I want<br>
to make hdmiphy platform device as Clock provider for hdmiphy clock,<br>
as you have done for cam_clkout*. Hdmi driver will call set_rate on this<br=
>
clock.<br>
<br>
I will post patches for the above separation and move hdmiphy to Generic<br=
>
Phy framework after we get clarity on how to add additional callbacks.<br>
<br>
Thanks for your reply.<br>
<br>
Regards,<br>
Rahul Sharma<br>
<div class=3D"HOEnZb"><div class=3D"h5"><br>
&gt;<br>
&gt; Regards,<br>
&gt; Sylwester<br>
&gt;<br>
--<br>
To unsubscribe from this list: send the line &quot;unsubscribe linux-samsun=
g-soc&quot; in<br>
the body of a message to <a href=3D"mailto:majordomo@vger.kernel.org">major=
domo@vger.kernel.org</a><br>
More majordomo info at =A0<a href=3D"http://vger.kernel.org/majordomo-info.=
html" target=3D"_blank">http://vger.kernel.org/majordomo-info.html</a><br>
</div></div></blockquote></div><br></div>

--f46d042c65a74347ee04e4fde205--

--===============1707581386==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
http://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1707581386==--
