From: Kishon Vijay Abraham I <kishon@ti.com>
Subject: Re: [RFC 0/2] exynos5250/hdmi: replace dummy hdmiphy clock with pmu
 reg control
Date: Tue, 18 Jun 2013 17:07:44 +0530
Message-ID: <51C04688.3090205@ti.com>
References: <1370935073-7475-1-git-send-email-rahul.sharma@samsung.com> <CAAQKjZMuSQhbYtOyni-RdHhXu0fv3U2Dm_2iqRLe0smSt_jjjQ@mail.gmail.com> <CAAQKjZOZCtLnE_OPs60NU+Z4pkHiSCqZcBOi1Dv+PC=01HKqyg@mail.gmail.com> <CAPdUM4Nis0uwyZf1hNDOMmdqFm0K7beVPoyAWRjMBwq0jcwwCQ@mail.gmail.com> <51B98908.8050403@samsung.com> <02c101ce6828$29ab0f20$7d012d60$%dae@samsung.com> <51B9C0ED.2040605@ti.com> <51BAB398.8090409@samsung.com> <CAPdUM4PK7K+Vw6umnehDubLD37jiWdcd4iXX2DJvHS8990LQGQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=EUC-KR
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from arroyo.ext.ti.com ([192.94.94.40]:34349 "EHLO arroyo.ext.ti.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752209Ab3FRLh7 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 18 Jun 2013 07:37:59 -0400
In-Reply-To: <CAPdUM4PK7K+Vw6umnehDubLD37jiWdcd4iXX2DJvHS8990LQGQ@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Rahul Sharma <r.sh.open@gmail.com>
Cc: sw0312.kim@samsung.com, Inki Dae <inki.dae@samsung.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Rahul Sharma <rahul.sharma@samsung.com>, linux-samsung-soc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, DRI mailing list <dri-devel@lists.freedesktop.org>, Kukjin Kim <kgene.kim@samsung.com>, Sean Paul <seanpaul@chromium.org>, sunil joshi <joshi@samsung.com>, Stephen Warren <swarren@wwwdotorg.org>, grant.likely@linaro.org

Hi,

On Tuesday 18 June 2013 03:33 PM, Rahul Sharma wrote:
> Thanks all,
>=20
> On Fri, Jun 14, 2013 at 11:39 AM, =B1=E8=BD=C2=BF=EC <sw0312.kim@sams=
ung.com> wrote:
>> Hello Kishon,
>>
>> On 2013=B3=E2 06=BF=F9 13=C0=CF 21:54, Kishon Vijay Abraham I wrote:
>>> Hi,
>>>
>>> On Thursday 13 June 2013 04:51 PM, Inki Dae wrote:
>>>>
>>>>
>>>>> -----Original Message-----
>>>>> From: Sylwester Nawrocki [mailto:s.nawrocki@samsung.com]
>>>>> Sent: Thursday, June 13, 2013 5:56 PM
>>>>> To: Rahul Sharma
>>>>> Cc: Rahul Sharma; Inki Dae; linux-samsung-soc@vger.kernel.org;
>>>>> devicetree-
>>>>> discuss@lists.ozlabs.org; DRI mailing list; Kukjin Kim; Seung-Woo=
 Kim;
>>>>> Sean Paul; sunil joshi; Kishon Vijay Abraham I; Stephen Warren;
>>>>> grant.likely@linaro.org
>>>>> Subject: Re: [RFC 0/2] exynos5250/hdmi: replace dummy hdmiphy clo=
ck with
>>>>> pmu reg control
>>>>>
>>>>> Hi,
>>>>>
>>>>> On 06/13/2013 06:26 AM, Rahul Sharma wrote:
>>>>>> Mr. Dae,
>>>>>>
>>>>>> Thanks for your valuable inputs.
>>>>>>
>>>>>> I posted it as RFC because, I also have received comments to reg=
ister
>>>>>> hdmiphy as a clock controller. As we always configure it for spe=
cific
>>>>>> frequency, hdmi-phy looks similar to a PLL. But it really doesn'=
t
>>>>>> belong to that class. Secondly prior to exynos5420, it was a i2c
>>>>>> device. I am not sure we can register a I2C device as a clock
>>>>>> controller. I wanted to discuss and explore this option here.
>>>>>
>>>>> Have you considered using the generic PHY framework for those HDM=
I
>>>>> PHY devices [1] ? I guess we could add a dedicated group of ops f=
or
>>>>> video PHYs, similarly as is is done with struct v4l2_subdev_ops. =
=46or
>>>>> configuring things like the carrier/pixel clock frequency or anyt=
hing
>>>>> what's common across the video PHYs.
>>>>>
>>>>> Perhaps you could have a look and see if this framework would be
>>>>> useful for HDMI and possibly point out anything what might be mis=
sing ?
>>>>>
>>>>> I'm not sure it it really solves the issues specific to the Exyno=
s
>>>>> HDMI but at least with a generic PHY driver the PHY module would =
be
>>>>> separate from the PHY controller, as often same HDMI DPHY can be =
used
>>>>> with various types of a HDMI controller. So this would allow to n=
ot
>>>>> duplicate the HDMI PHY drivers in the long-term perspective.
>>>>
>>>> Yeah, at least, it seems that we could use PHY module to control P=
MU
>>>> register, HDMI_PHY_CONTROL. However, PHY module provides only init=
/on/off
>>>> callbacks. As you may know, HDMIPHY needs i2c interfaces to contro=
l
>>>> HDMIPHY
>>>> clock. So with PHY module, HDMIPHY driver could enable PMU more
>>>> generically,
>>>> but also has to use existing i2c stuff to control HDMIPHY clock. I=
 had a
>>>> quick review to Generic PHY Framework[v6] but I didn't see that th=
e PHY
>>>> module could generically support more features such as i2c stuff.
>>>
>>> I don't think PHY framework needs to provide i2c interfaces to prog=
ram
>>> certain configurations. Instead in one of the callbacks (init/on/of=
f)
>>> PHY driver can program whatever it wants using any of the interface=
s it
>>> needs. IMO PHY framework should work independent of the interfaces.
>>
>> In exnoys hdmi case, i2c interface is not the exact issue. In exynos
>> hdmi, hdmiphy should send i2c configuration about video clock
>> information as the video mode information including resolution, bit =
per
>> pixel, refresh rate passed from drm subsystem. So init/on/off callba=
cks
>> of phy framework are not enough for exynos hdmiphy and it should hav=
e a
>> callback to set video mode.
>>
>> Do you have plan to add driver specific extend callback pointers to =
phy
>> framework?
>>
>> Currently, hdmi directly calls phy operations, but Rahul's another p=
atch
>> set, mentioned by Inki, divides hdmi and hdmiphy and hdmi and hdmiph=
y is
>> connected with exynos hdmi own sub driver callback operations.
>>
>> IMHO, if phy framework can support extend callback feature, then thi=
s
>> own sub driver callbacks can be replaced with phy framework at long =
term
>> view.
>=20
> Extended callbacks are always welcome. I can also use phy device
> private data to pass on private ops like get_pixelclk and set_pixelcl=
k.

I would recommend creating a wrapper to the existing PHY framework
for HDMI PHY. That way, we can have other HDMI phys added
easily. We need to figure out all the ops that might be needed by the
HDMI PHY to be added to the wrapper.
IMO extended callbacks can lead to abuse of the system and should be
used only when absolutely necessary.

Thanks
Kishon
