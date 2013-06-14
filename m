From: =?UTF-8?B?6rmA7Iq57Jqw?= <sw0312.kim@samsung.com>
Subject: Re: [RFC 0/2] exynos5250/hdmi: replace dummy hdmiphy clock with pmu
 reg control
Date: Fri, 14 Jun 2013 15:09:28 +0900
Message-ID: <51BAB398.8090409@samsung.com>
References: <1370935073-7475-1-git-send-email-rahul.sharma@samsung.com>
 <CAAQKjZMuSQhbYtOyni-RdHhXu0fv3U2Dm_2iqRLe0smSt_jjjQ@mail.gmail.com>
 <CAAQKjZOZCtLnE_OPs60NU+Z4pkHiSCqZcBOi1Dv+PC=01HKqyg@mail.gmail.com>
 <CAPdUM4Nis0uwyZf1hNDOMmdqFm0K7beVPoyAWRjMBwq0jcwwCQ@mail.gmail.com>
 <51B98908.8050403@samsung.com>
 <02c101ce6828$29ab0f20$7d012d60$%dae@samsung.com> <51B9C0ED.2040605@ti.com>
Reply-To: sw0312.kim@samsung.com
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:27776 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751031Ab3FNGJf (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 14 Jun 2013 02:09:35 -0400
Received: from epcpsbgr5.samsung.com
 (u145.gpu120.samsung.co.kr [203.254.230.145])
 by mailout2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0MOD00664D2BAEN0@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 14 Jun 2013 15:09:28 +0900 (KST)
In-reply-to: <51B9C0ED.2040605@ti.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kishon Vijay Abraham I <kishon@ti.com>
Cc: Inki Dae <inki.dae@samsung.com>, 'Sylwester Nawrocki' <s.nawrocki@samsung.com>, 'Rahul Sharma' <rahul.sharma@samsung.com>, 'Rahul Sharma' <r.sh.open@gmail.com>, linux-samsung-soc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, 'DRI mailing list' <dri-devel@lists.freedesktop.org>, 'Kukjin Kim' <kgene.kim@samsung.com>, 'Sean Paul' <seanpaul@chromium.org>, 'sunil joshi' <joshi@samsung.com>, 'Stephen Warren' <swarren@wwwdotorg.org>, grant.likely@linaro.org, Seung-Woo Kim <sw0312.kim@samsung.com>

Hello Kishon,

On 2013=EB=85=84 06=EC=9B=94 13=EC=9D=BC 21:54, Kishon Vijay Abraham I =
wrote:
> Hi,
>=20
> On Thursday 13 June 2013 04:51 PM, Inki Dae wrote:
>>
>>
>>> -----Original Message-----
>>> From: Sylwester Nawrocki [mailto:s.nawrocki@samsung.com]
>>> Sent: Thursday, June 13, 2013 5:56 PM
>>> To: Rahul Sharma
>>> Cc: Rahul Sharma; Inki Dae; linux-samsung-soc@vger.kernel.org;
>>> devicetree-
>>> discuss@lists.ozlabs.org; DRI mailing list; Kukjin Kim; Seung-Woo K=
im;
>>> Sean Paul; sunil joshi; Kishon Vijay Abraham I; Stephen Warren;
>>> grant.likely@linaro.org
>>> Subject: Re: [RFC 0/2] exynos5250/hdmi: replace dummy hdmiphy clock=
 with
>>> pmu reg control
>>>
>>> Hi,
>>>
>>> On 06/13/2013 06:26 AM, Rahul Sharma wrote:
>>>> Mr. Dae,
>>>>
>>>> Thanks for your valuable inputs.
>>>>
>>>> I posted it as RFC because, I also have received comments to regis=
ter
>>>> hdmiphy as a clock controller. As we always configure it for speci=
fic
>>>> frequency, hdmi-phy looks similar to a PLL. But it really doesn't
>>>> belong to that class. Secondly prior to exynos5420, it was a i2c
>>>> device. I am not sure we can register a I2C device as a clock
>>>> controller. I wanted to discuss and explore this option here.
>>>
>>> Have you considered using the generic PHY framework for those HDMI
>>> PHY devices [1] ? I guess we could add a dedicated group of ops for
>>> video PHYs, similarly as is is done with struct v4l2_subdev_ops. Fo=
r
>>> configuring things like the carrier/pixel clock frequency or anythi=
ng
>>> what's common across the video PHYs.
>>>
>>> Perhaps you could have a look and see if this framework would be
>>> useful for HDMI and possibly point out anything what might be missi=
ng ?
>>>
>>> I'm not sure it it really solves the issues specific to the Exynos
>>> HDMI but at least with a generic PHY driver the PHY module would be
>>> separate from the PHY controller, as often same HDMI DPHY can be us=
ed
>>> with various types of a HDMI controller. So this would allow to not
>>> duplicate the HDMI PHY drivers in the long-term perspective.
>>
>> Yeah, at least, it seems that we could use PHY module to control PMU
>> register, HDMI_PHY_CONTROL. However, PHY module provides only init/o=
n/off
>> callbacks. As you may know, HDMIPHY needs i2c interfaces to control
>> HDMIPHY
>> clock. So with PHY module, HDMIPHY driver could enable PMU more
>> generically,
>> but also has to use existing i2c stuff to control HDMIPHY clock. I h=
ad a
>> quick review to Generic PHY Framework[v6] but I didn't see that the =
PHY
>> module could generically support more features such as i2c stuff.
>=20
> I don't think PHY framework needs to provide i2c interfaces to progra=
m
> certain configurations. Instead in one of the callbacks (init/on/off)
> PHY driver can program whatever it wants using any of the interfaces =
it
> needs. IMO PHY framework should work independent of the interfaces.

In exnoys hdmi case, i2c interface is not the exact issue. In exynos
hdmi, hdmiphy should send i2c configuration about video clock
information as the video mode information including resolution, bit per
pixel, refresh rate passed from drm subsystem. So init/on/off callbacks
of phy framework are not enough for exynos hdmiphy and it should have a
callback to set video mode.

Do you have plan to add driver specific extend callback pointers to phy
framework?

Currently, hdmi directly calls phy operations, but Rahul's another patc=
h
set, mentioned by Inki, divides hdmi and hdmiphy and hdmi and hdmiphy i=
s
connected with exynos hdmi own sub driver callback operations.

IMHO, if phy framework can support extend callback feature, then this
own sub driver callbacks can be replaced with phy framework at long ter=
m
view.

Thanks and Regards,
- Seung-Woo Kim

>=20
> For example, twl4030 phy driver actually uses i2c to program its
> registers but still it uses the PHY framework [1].
>=20
> [1] --> http://www.gossamer-threads.com/lists/linux/kernel/1729414
>=20
> Thanks
> Kishon
> --=20
> To unsubscribe from this list: send the line "unsubscribe
> linux-samsung-soc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>=20

--=20
Seung-Woo Kim
Samsung Software R&D Center
--
