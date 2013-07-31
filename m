From: Rahul Sharma <r.sh.open@gmail.com>
Subject: Re: [RFC 0/2] exynos5250/hdmi: replace dummy hdmiphy clock with pmu
 reg control
Date: Wed, 31 Jul 2013 16:53:26 +0530
Message-ID: <CAPdUM4OgJo9TLFeRUND+s2vF-ShsvQp=uo99FEnd-7UrBfCV-g@mail.gmail.com>
References: <1370935073-7475-1-git-send-email-rahul.sharma@samsung.com>
	<CAAQKjZMuSQhbYtOyni-RdHhXu0fv3U2Dm_2iqRLe0smSt_jjjQ@mail.gmail.com>
	<CAAQKjZOZCtLnE_OPs60NU+Z4pkHiSCqZcBOi1Dv+PC=01HKqyg@mail.gmail.com>
	<CAPdUM4Nis0uwyZf1hNDOMmdqFm0K7beVPoyAWRjMBwq0jcwwCQ@mail.gmail.com>
	<51B98908.8050403@samsung.com>
	<02c101ce6828$29ab0f20$7d012d60$%dae@samsung.com>
	<51B9C0ED.2040605@ti.com>
	<51BAB398.8090409@samsung.com>
	<CAPdUM4PK7K+Vw6umnehDubLD37jiWdcd4iXX2DJvHS8990LQGQ@mail.gmail.com>
	<51C04688.3090205@ti.com>
	<CAPdUM4O7cbBEEc4VdmcyryqFxpek6SsEcG-g-KyxwVypdwJnaw@mail.gmail.com>
	<51F75802.90305@samsung.com>
	<CAPdUM4Pjapebtrh7+c7ZHNvg26MGB_byUXrasPfjA38bkvBR7g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-we0-f169.google.com ([74.125.82.169]:51656 "EHLO
	mail-we0-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1759564Ab3GaLX1 convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 31 Jul 2013 07:23:27 -0400
Received: by mail-we0-f169.google.com with SMTP id n5so489832wev.0
        for <linux-samsung-soc@vger.kernel.org>; Wed, 31 Jul 2013 04:23:26 -0700 (PDT)
In-Reply-To: <CAPdUM4Pjapebtrh7+c7ZHNvg26MGB_byUXrasPfjA38bkvBR7g@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: sw0312.kim@samsung.com
Cc: Kishon Vijay Abraham I <kishon@ti.com>, linux-samsung-soc@vger.kernel.org, Stephen Warren <swarren@wwwdotorg.org>, sunil joshi <joshi@samsung.com>, DRI mailing list <dri-devel@lists.freedesktop.org>, Kukjin Kim <kgene.kim@samsung.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, grant.likely@linaro.org, Rahul Sharma <rahul.sharma@samsung.com>, Inki Dae <inki.dae@samsung.com>

On Tue, Jul 30, 2013 at 2:21 PM, Rahul Sharma <r.sh.open@gmail.com> wro=
te:
> Thanks Seung-Woo,
>
> On Tue, Jul 30, 2013 at 11:36 AM, Seung-Woo Kim <sw0312.kim@samsung.c=
om> wrote:
>> Hi Rahul,
>>
>> On 2013=EB=85=84 07=EC=9B=94 30=EC=9D=BC 12:42, Rahul Sharma wrote:
>>>
>>>
>>> On Tue, Jun 18, 2013 at 5:07 PM, Kishon Vijay Abraham I <kishon@ti.=
com
>>> <mailto:kishon@ti.com>> wrote:
>>>
>>>     Hi,
>>>
>>>     On Tuesday 18 June 2013 03:33 PM, Rahul Sharma wrote:
>>>     > Thanks all,
>>>     >
>>>     > On Fri, Jun 14, 2013 at 11:39 AM, =EA=B9=80=EC=8A=B9=EC=9A=B0=
 <sw0312.kim@samsung.com
>>>     <mailto:sw0312.kim@samsung.com>> wrote:
>>>     >> Hello Kishon,
>>>     >>
>>>     >> On 2013=EB=85=84 06=EC=9B=94 13=EC=9D=BC 21:54, Kishon Vijay=
 Abraham I wrote:
>>>     >>> Hi,
>>>     >>>
>>>     >>> On Thursday 13 June 2013 04:51 PM, Inki Dae wrote:
>>>     >>>>
>>>     >>>>
>>>     >>>>> -----Original Message-----
>>>     >>>>> From: Sylwester Nawrocki [mailto:s.nawrocki@samsung.com
>>>     <mailto:s.nawrocki@samsung.com>]
>>>     >>>>> Sent: Thursday, June 13, 2013 5:56 PM
>>>     >>>>> To: Rahul Sharma
>>>     >>>>> Cc: Rahul Sharma; Inki Dae; linux-samsung-soc@vger.kernel=
=2Eorg
>>>     <mailto:linux-samsung-soc@vger.kernel.org>;
>>>     >>>>> devicetree-
>>>     >>>>> discuss@lists.ozlabs.org <mailto:discuss@lists.ozlabs.org=
>;
>>>     DRI mailing list; Kukjin Kim; Seung-Woo Kim;
>>>     >>>>> Sean Paul; sunil joshi; Kishon Vijay Abraham I; Stephen W=
arren;
>>>     >>>>> grant.likely@linaro.org <mailto:grant.likely@linaro.org>
>>>     >>>>> Subject: Re: [RFC 0/2] exynos5250/hdmi: replace dummy hdm=
iphy
>>>     clock with
>>>     >>>>> pmu reg control
>>>     >>>>>
>>>     >>>>> Hi,
>>>     >>>>>
>>>     >>>>> On 06/13/2013 06:26 AM, Rahul Sharma wrote:
>>>     >>>>>> Mr. Dae,
>>>     >>>>>>
>>>     >>>>>> Thanks for your valuable inputs.
>>>     >>>>>>
>>>     >>>>>> I posted it as RFC because, I also have received comment=
s to
>>>     register
>>>     >>>>>> hdmiphy as a clock controller. As we always configure it=
 for
>>>     specific
>>>     >>>>>> frequency, hdmi-phy looks similar to a PLL. But it reall=
y doesn't
>>>     >>>>>> belong to that class. Secondly prior to exynos5420, it w=
as a i2c
>>>     >>>>>> device. I am not sure we can register a I2C device as a =
clock
>>>     >>>>>> controller. I wanted to discuss and explore this option =
here.
>>>     >>>>>
>>>     >>>>> Have you considered using the generic PHY framework for t=
hose HDMI
>>>     >>>>> PHY devices [1] ? I guess we could add a dedicated group =
of
>>>     ops for
>>>     >>>>> video PHYs, similarly as is is done with struct
>>>     v4l2_subdev_ops. For
>>>     >>>>> configuring things like the carrier/pixel clock frequency=
 or
>>>     anything
>>>     >>>>> what's common across the video PHYs.
>>>     >>>>>
>>>     >>>>> Perhaps you could have a look and see if this framework w=
ould be
>>>     >>>>> useful for HDMI and possibly point out anything what migh=
t be
>>>     missing ?
>>>     >>>>>
>>>     >>>>> I'm not sure it it really solves the issues specific to t=
he Exynos
>>>     >>>>> HDMI but at least with a generic PHY driver the PHY modul=
e
>>>     would be
>>>     >>>>> separate from the PHY controller, as often same HDMI DPHY=
 can
>>>     be used
>>>     >>>>> with various types of a HDMI controller. So this would al=
low
>>>     to not
>>>     >>>>> duplicate the HDMI PHY drivers in the long-term perspecti=
ve.
>>>     >>>>
>>>     >>>> Yeah, at least, it seems that we could use PHY module to
>>>     control PMU
>>>     >>>> register, HDMI_PHY_CONTROL. However, PHY module provides o=
nly
>>>     init/on/off
>>>     >>>> callbacks. As you may know, HDMIPHY needs i2c interfaces t=
o control
>>>     >>>> HDMIPHY
>>>     >>>> clock. So with PHY module, HDMIPHY driver could enable PMU=
 more
>>>     >>>> generically,
>>>     >>>> but also has to use existing i2c stuff to control HDMIPHY
>>>     clock. I had a
>>>     >>>> quick review to Generic PHY Framework[v6] but I didn't see=
 that
>>>     the PHY
>>>     >>>> module could generically support more features such as i2c=
 stuff.
>>>     >>>
>>>     >>> I don't think PHY framework needs to provide i2c interfaces=
 to
>>>     program
>>>     >>> certain configurations. Instead in one of the callbacks
>>>     (init/on/off)
>>>     >>> PHY driver can program whatever it wants using any of the
>>>     interfaces it
>>>     >>> needs. IMO PHY framework should work independent of the int=
erfaces.
>>>     >>
>>>     >> In exnoys hdmi case, i2c interface is not the exact issue. I=
n exynos
>>>     >> hdmi, hdmiphy should send i2c configuration about video cloc=
k
>>>     >> information as the video mode information including resoluti=
on,
>>>     bit per
>>>     >> pixel, refresh rate passed from drm subsystem. So init/on/of=
f
>>>     callbacks
>>>     >> of phy framework are not enough for exynos hdmiphy and it sh=
ould
>>>     have a
>>>     >> callback to set video mode.
>>>     >>
>>>     >> Do you have plan to add driver specific extend callback poin=
ters
>>>     to phy
>>>     >> framework?
>>>     >>
>>>     >> Currently, hdmi directly calls phy operations, but Rahul's
>>>     another patch
>>>     >> set, mentioned by Inki, divides hdmi and hdmiphy and hdmi an=
d
>>>     hdmiphy is
>>>     >> connected with exynos hdmi own sub driver callback operation=
s.
>>>     >>
>>>     >> IMHO, if phy framework can support extend callback feature, =
then this
>>>     >> own sub driver callbacks can be replaced with phy framework =
at
>>>     long term
>>>     >> view.
>>>     >
>>>     > Extended callbacks are always welcome. I can also use phy dev=
ice
>>>     > private data to pass on private ops like get_pixelclk and
>>>     set_pixelclk.
>>>
>>>     I would recommend creating a wrapper to the existing PHY framew=
ork
>>>     for HDMI PHY. That way, we can have other HDMI phys added
>>>     easily. We need to figure out all the ops that might be needed =
by the
>>>     HDMI PHY to be added to the wrapper.
>>>     IMO extended callbacks can lead to abuse of the system and shou=
ld be
>>>     used only when absolutely necessary.
>>>
>>>     Thanks
>>>     Kishon
>>>
>>>
>>> Thanks Kishon,
>>>
>>> I have started working on this wrapper layer which is customized fo=
r
>>> video phys.
>>> As if now, adding set_dv_timing, get_dv_timing as the only addition=
al
>>> callbacks.
>>> I will post the RFC patches.
>>
>> I think your hdmiphy pmu patch is good enough just if dt binding for=
 pmu
>> is in hdmiphy binding instead of hdmi binding. So I recommended to m=
ake
>> pmu patch set on the top of independent hdmiphy patch set because wi=
th
>> independent hdmiphy patch set hdmiphy pmu code is moved to hdmiphy d=
river.
>>
>> Is it possible that hdmi driver references pmu information from hdmi=
phy
>> binding? If that, it seems one possible solution to fix current exyn=
os
>> hdmi broken.
>>
>> Thanks and Regards,
>> - Seung-Woo Kim
>>
>
> I can surely do that but, I am worried about hdmiphy control bus.
> change In 5420. It is changed to platform bus from i2c. Isolating
> hdmiphy from hdmi driver seems the only clean method to handle
> control bus change, changed phy configurations and power control
> through PMU bit.
>
> To fix broken hdmi for 5420, I can again post the "hdmiphy
> separation patches" to place hdmiphy driver in DRM. Later we can
> migrate to Generic Phy Framework.
>

Hi Seung Woo, Mr. Dae, Sylwester,

What you say on this? Shall I separate hdmiphy in following manner:
1) Move all phy related code to hdmiphy driver i.e. exynos_hdmiphy.c
2) hdmiphy driver exposes power_on/off and set_pixel callbacks for
hdmi driver.
3) let hdmi driver behave as phy controller for hdmiphy.
4) move PMU bit control to hdmiphy driver, instead of hdmi driver.

This way we will be very close to generic phy framework implementation
and migration to generic phy framework will be just a cakewalk.

regards,
Rahul Sharma.

> regards,
> Rahul Sharma.
>
>>>
>>> regards,
>>> Rahul Sharma.
>>>
>>>
>>>
>>> _______________________________________________
>>> dri-devel mailing list
>>> dri-devel@lists.freedesktop.org
>>> http://lists.freedesktop.org/mailman/listinfo/dri-devel
>>>
>>
>> --
>> Seung-Woo Kim
>> Samsung Software R&D Center
>> --
>>
