From: Kishon Vijay Abraham I <kishon@ti.com>
Subject: Re: [RFC 0/2] exynos5250/hdmi: replace dummy hdmiphy clock with pmu
 reg control
Date: Tue, 30 Jul 2013 10:37:38 +0530
Message-ID: <51F74A1A.7000608@ti.com>
References: <1370935073-7475-1-git-send-email-rahul.sharma@samsung.com> <CAAQKjZMuSQhbYtOyni-RdHhXu0fv3U2Dm_2iqRLe0smSt_jjjQ@mail.gmail.com> <CAAQKjZOZCtLnE_OPs60NU+Z4pkHiSCqZcBOi1Dv+PC=01HKqyg@mail.gmail.com> <CAPdUM4Nis0uwyZf1hNDOMmdqFm0K7beVPoyAWRjMBwq0jcwwCQ@mail.gmail.com> <51B98908.8050403@samsung.com> <02c101ce6828$29ab0f20$7d012d60$%dae@samsung.com> <51B9C0ED.2040605@ti.com> <51BAB398.8090409@samsung.com> <CAPdUM4PK7K+Vw6umnehDubLD37jiWdcd4iXX2DJvHS8990LQGQ@mail.gmail.com> <51C04688.3090205@ti.com> <CAPdUM4O7cbBEEc4VdmcyryqFxpek6SsEcG-g-KyxwVypdwJnaw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=EUC-KR
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from comal.ext.ti.com ([198.47.26.152]:53398 "EHLO comal.ext.ti.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755429Ab3G3FHy (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 30 Jul 2013 01:07:54 -0400
In-Reply-To: <CAPdUM4O7cbBEEc4VdmcyryqFxpek6SsEcG-g-KyxwVypdwJnaw@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Rahul Sharma <r.sh.open@gmail.com>
Cc: sw0312.kim@samsung.com, Inki Dae <inki.dae@samsung.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Rahul Sharma <rahul.sharma@samsung.com>, linux-samsung-soc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, DRI mailing list <dri-devel@lists.freedesktop.org>, Kukjin Kim <kgene.kim@samsung.com>, Sean Paul <seanpaul@chromium.org>, sunil joshi <joshi@samsung.com>, Stephen Warren <swarren@wwwdotorg.org>, grant.likely@linaro.org

Hi,

On Tuesday 30 July 2013 09:12 AM, Rahul Sharma wrote:
>=20
>=20
> On Tue, Jun 18, 2013 at 5:07 PM, Kishon Vijay Abraham I <kishon@ti.co=
m
> <mailto:kishon@ti.com>> wrote:
>=20
>     Hi,
>=20
>     On Tuesday 18 June 2013 03:33 PM, Rahul Sharma wrote:
>     > Thanks all,
>     >
>     > On Fri, Jun 14, 2013 at 11:39 AM, =B1=E8=BD=C2=BF=EC <sw0312.ki=
m@samsung.com
>     <mailto:sw0312.kim@samsung.com>> wrote:
>     >> Hello Kishon,
>     >>
>     >> On 2013=B3=E2 06=BF=F9 13=C0=CF 21:54, Kishon Vijay Abraham I =
wrote:
>     >>> Hi,
>     >>>
>     >>> On Thursday 13 June 2013 04:51 PM, Inki Dae wrote:
>     >>>>
>     >>>>
>     >>>>> -----Original Message-----
>     >>>>> From: Sylwester Nawrocki [mailto:s.nawrocki@samsung.com
>     <mailto:s.nawrocki@samsung.com>]
>     >>>>> Sent: Thursday, June 13, 2013 5:56 PM
>     >>>>> To: Rahul Sharma
>     >>>>> Cc: Rahul Sharma; Inki Dae; linux-samsung-soc@vger.kernel.o=
rg
>     <mailto:linux-samsung-soc@vger.kernel.org>;
>     >>>>> devicetree-
>     >>>>> discuss@lists.ozlabs.org <mailto:discuss@lists.ozlabs.org>;=
 DRI
>     mailing list; Kukjin Kim; Seung-Woo Kim;
>     >>>>> Sean Paul; sunil joshi; Kishon Vijay Abraham I; Stephen War=
ren;
>     >>>>> grant.likely@linaro.org <mailto:grant.likely@linaro.org>
>     >>>>> Subject: Re: [RFC 0/2] exynos5250/hdmi: replace dummy hdmip=
hy clock with
>     >>>>> pmu reg control
>     >>>>>
>     >>>>> Hi,
>     >>>>>
>     >>>>> On 06/13/2013 06:26 AM, Rahul Sharma wrote:
>     >>>>>> Mr. Dae,
>     >>>>>>
>     >>>>>> Thanks for your valuable inputs.
>     >>>>>>
>     >>>>>> I posted it as RFC because, I also have received comments =
to register
>     >>>>>> hdmiphy as a clock controller. As we always configure it f=
or specific
>     >>>>>> frequency, hdmi-phy looks similar to a PLL. But it really =
doesn't
>     >>>>>> belong to that class. Secondly prior to exynos5420, it was=
 a i2c
>     >>>>>> device. I am not sure we can register a I2C device as a cl=
ock
>     >>>>>> controller. I wanted to discuss and explore this option he=
re.
>     >>>>>
>     >>>>> Have you considered using the generic PHY framework for tho=
se HDMI
>     >>>>> PHY devices [1] ? I guess we could add a dedicated group of=
 ops for
>     >>>>> video PHYs, similarly as is is done with struct v4l2_subdev=
_ops. For
>     >>>>> configuring things like the carrier/pixel clock frequency o=
r anything
>     >>>>> what's common across the video PHYs.
>     >>>>>
>     >>>>> Perhaps you could have a look and see if this framework wou=
ld be
>     >>>>> useful for HDMI and possibly point out anything what might =
be missing ?
>     >>>>>
>     >>>>> I'm not sure it it really solves the issues specific to the=
 Exynos
>     >>>>> HDMI but at least with a generic PHY driver the PHY module =
would be
>     >>>>> separate from the PHY controller, as often same HDMI DPHY c=
an be used
>     >>>>> with various types of a HDMI controller. So this would allo=
w to not
>     >>>>> duplicate the HDMI PHY drivers in the long-term perspective=
=2E
>     >>>>
>     >>>> Yeah, at least, it seems that we could use PHY module to con=
trol PMU
>     >>>> register, HDMI_PHY_CONTROL. However, PHY module provides onl=
y init/on/off
>     >>>> callbacks. As you may know, HDMIPHY needs i2c interfaces to =
control
>     >>>> HDMIPHY
>     >>>> clock. So with PHY module, HDMIPHY driver could enable PMU m=
ore
>     >>>> generically,
>     >>>> but also has to use existing i2c stuff to control HDMIPHY cl=
ock. I had a
>     >>>> quick review to Generic PHY Framework[v6] but I didn't see t=
hat the PHY
>     >>>> module could generically support more features such as i2c s=
tuff.
>     >>>
>     >>> I don't think PHY framework needs to provide i2c interfaces t=
o program
>     >>> certain configurations. Instead in one of the callbacks (init=
/on/off)
>     >>> PHY driver can program whatever it wants using any of the int=
erfaces it
>     >>> needs. IMO PHY framework should work independent of the inter=
faces.
>     >>
>     >> In exnoys hdmi case, i2c interface is not the exact issue. In =
exynos
>     >> hdmi, hdmiphy should send i2c configuration about video clock
>     >> information as the video mode information including resolution=
, bit per
>     >> pixel, refresh rate passed from drm subsystem. So init/on/off =
callbacks
>     >> of phy framework are not enough for exynos hdmiphy and it shou=
ld have a
>     >> callback to set video mode.
>     >>
>     >> Do you have plan to add driver specific extend callback pointe=
rs to phy
>     >> framework?
>     >>
>     >> Currently, hdmi directly calls phy operations, but Rahul's ano=
ther patch
>     >> set, mentioned by Inki, divides hdmi and hdmiphy and hdmi and =
hdmiphy is
>     >> connected with exynos hdmi own sub driver callback operations.
>     >>
>     >> IMHO, if phy framework can support extend callback feature, th=
en this
>     >> own sub driver callbacks can be replaced with phy framework at=
 long term
>     >> view.
>     >
>     > Extended callbacks are always welcome. I can also use phy devic=
e
>     > private data to pass on private ops like get_pixelclk and set_p=
ixelclk.
>=20
>     I would recommend creating a wrapper to the existing PHY framewor=
k
>     for HDMI PHY. That way, we can have other HDMI phys added
>     easily. We need to figure out all the ops that might be needed by=
 the
>     HDMI PHY to be added to the wrapper.
>     IMO extended callbacks can lead to abuse of the system and should=
 be
>     used only when absolutely necessary.
>=20
>     Thanks
>     Kishon
>=20
>=20
> Thanks Kishon,
>=20
> I have started working on this wrapper layer which is customized for =
video phys.
> As if now, adding set_dv_timing, get_dv_timing as the only additional=
 callbacks.
> I will post the RFC patches.

Idea of creating wrapper layer for different types of controller is sho=
t down
in the community [1] :-s

[1] -> http://lists.infradead.org/pipermail/linux-arm-kernel/2013-July/=
181710.html

Thanks
Kishon
