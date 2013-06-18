From: Rahul Sharma <r.sh.open@gmail.com>
Subject: Re: [RFC 0/2] exynos5250/hdmi: replace dummy hdmiphy clock with pmu
 reg control
Date: Tue, 18 Jun 2013 15:33:38 +0530
Message-ID: <CAPdUM4PK7K+Vw6umnehDubLD37jiWdcd4iXX2DJvHS8990LQGQ@mail.gmail.com>
References: <1370935073-7475-1-git-send-email-rahul.sharma@samsung.com>
	<CAAQKjZMuSQhbYtOyni-RdHhXu0fv3U2Dm_2iqRLe0smSt_jjjQ@mail.gmail.com>
	<CAAQKjZOZCtLnE_OPs60NU+Z4pkHiSCqZcBOi1Dv+PC=01HKqyg@mail.gmail.com>
	<CAPdUM4Nis0uwyZf1hNDOMmdqFm0K7beVPoyAWRjMBwq0jcwwCQ@mail.gmail.com>
	<51B98908.8050403@samsung.com>
	<02c101ce6828$29ab0f20$7d012d60$%dae@samsung.com>
	<51B9C0ED.2040605@ti.com>
	<51BAB398.8090409@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=EUC-KR
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wg0-f43.google.com ([74.125.82.43]:37906 "EHLO
	mail-wg0-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754479Ab3FRKDj convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 18 Jun 2013 06:03:39 -0400
Received: by mail-wg0-f43.google.com with SMTP id z11so3202508wgg.34
        for <linux-samsung-soc@vger.kernel.org>; Tue, 18 Jun 2013 03:03:38 -0700 (PDT)
In-Reply-To: <51BAB398.8090409@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: sw0312.kim@samsung.com
Cc: Kishon Vijay Abraham I <kishon@ti.com>, Inki Dae <inki.dae@samsung.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Rahul Sharma <rahul.sharma@samsung.com>, linux-samsung-soc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, DRI mailing list <dri-devel@lists.freedesktop.org>, Kukjin Kim <kgene.kim@samsung.com>, Sean Paul <seanpaul@chromium.org>, sunil joshi <joshi@samsung.com>, Stephen Warren <swarren@wwwdotorg.org>, grant.likely@linaro.org

Thanks all,

On Fri, Jun 14, 2013 at 11:39 AM, =B1=E8=BD=C2=BF=EC <sw0312.kim@samsun=
g.com> wrote:
> Hello Kishon,
>
> On 2013=B3=E2 06=BF=F9 13=C0=CF 21:54, Kishon Vijay Abraham I wrote:
>> Hi,
>>
>> On Thursday 13 June 2013 04:51 PM, Inki Dae wrote:
>>>
>>>
>>>> -----Original Message-----
>>>> From: Sylwester Nawrocki [mailto:s.nawrocki@samsung.com]
>>>> Sent: Thursday, June 13, 2013 5:56 PM
>>>> To: Rahul Sharma
>>>> Cc: Rahul Sharma; Inki Dae; linux-samsung-soc@vger.kernel.org;
>>>> devicetree-
>>>> discuss@lists.ozlabs.org; DRI mailing list; Kukjin Kim; Seung-Woo =
Kim;
>>>> Sean Paul; sunil joshi; Kishon Vijay Abraham I; Stephen Warren;
>>>> grant.likely@linaro.org
>>>> Subject: Re: [RFC 0/2] exynos5250/hdmi: replace dummy hdmiphy cloc=
k with
>>>> pmu reg control
>>>>
>>>> Hi,
>>>>
>>>> On 06/13/2013 06:26 AM, Rahul Sharma wrote:
>>>>> Mr. Dae,
>>>>>
>>>>> Thanks for your valuable inputs.
>>>>>
>>>>> I posted it as RFC because, I also have received comments to regi=
ster
>>>>> hdmiphy as a clock controller. As we always configure it for spec=
ific
>>>>> frequency, hdmi-phy looks similar to a PLL. But it really doesn't
>>>>> belong to that class. Secondly prior to exynos5420, it was a i2c
>>>>> device. I am not sure we can register a I2C device as a clock
>>>>> controller. I wanted to discuss and explore this option here.
>>>>
>>>> Have you considered using the generic PHY framework for those HDMI
>>>> PHY devices [1] ? I guess we could add a dedicated group of ops fo=
r
>>>> video PHYs, similarly as is is done with struct v4l2_subdev_ops. F=
or
>>>> configuring things like the carrier/pixel clock frequency or anyth=
ing
>>>> what's common across the video PHYs.
>>>>
>>>> Perhaps you could have a look and see if this framework would be
>>>> useful for HDMI and possibly point out anything what might be miss=
ing ?
>>>>
>>>> I'm not sure it it really solves the issues specific to the Exynos
>>>> HDMI but at least with a generic PHY driver the PHY module would b=
e
>>>> separate from the PHY controller, as often same HDMI DPHY can be u=
sed
>>>> with various types of a HDMI controller. So this would allow to no=
t
>>>> duplicate the HDMI PHY drivers in the long-term perspective.
>>>
>>> Yeah, at least, it seems that we could use PHY module to control PM=
U
>>> register, HDMI_PHY_CONTROL. However, PHY module provides only init/=
on/off
>>> callbacks. As you may know, HDMIPHY needs i2c interfaces to control
>>> HDMIPHY
>>> clock. So with PHY module, HDMIPHY driver could enable PMU more
>>> generically,
>>> but also has to use existing i2c stuff to control HDMIPHY clock. I =
had a
>>> quick review to Generic PHY Framework[v6] but I didn't see that the=
 PHY
>>> module could generically support more features such as i2c stuff.
>>
>> I don't think PHY framework needs to provide i2c interfaces to progr=
am
>> certain configurations. Instead in one of the callbacks (init/on/off=
)
>> PHY driver can program whatever it wants using any of the interfaces=
 it
>> needs. IMO PHY framework should work independent of the interfaces.
>
> In exnoys hdmi case, i2c interface is not the exact issue. In exynos
> hdmi, hdmiphy should send i2c configuration about video clock
> information as the video mode information including resolution, bit p=
er
> pixel, refresh rate passed from drm subsystem. So init/on/off callbac=
ks
> of phy framework are not enough for exynos hdmiphy and it should have=
 a
> callback to set video mode.
>
> Do you have plan to add driver specific extend callback pointers to p=
hy
> framework?
>
> Currently, hdmi directly calls phy operations, but Rahul's another pa=
tch
> set, mentioned by Inki, divides hdmi and hdmiphy and hdmi and hdmiphy=
 is
> connected with exynos hdmi own sub driver callback operations.
>
> IMHO, if phy framework can support extend callback feature, then this
> own sub driver callbacks can be replaced with phy framework at long t=
erm
> view.

Extended callbacks are always welcome. I can also use phy device
private data to pass on private ops like get_pixelclk and set_pixelclk.
Similar logic has been used to pass struct omap_usb to usb phy
controller. I can add these changes for migration of hdmiphy to
generic phy framwork to my hdmiphy separation patch set.

regards,
Rahul Sharma.

>
> Thanks and Regards,
> - Seung-Woo Kim
>
>>
>> For example, twl4030 phy driver actually uses i2c to program its
>> registers but still it uses the PHY framework [1].
>>
>> [1] --> http://www.gossamer-threads.com/lists/linux/kernel/1729414
>>
>> Thanks
>> Kishon
>> --
>> To unsubscribe from this list: send the line "unsubscribe
>> linux-samsung-soc" in
>> the body of a message to majordomo@vger.kernel.org
>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>>
>
> --
> Seung-Woo Kim
> Samsung Software R&D Center
> --
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsu=
ng-soc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
