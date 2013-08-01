From: Rahul Sharma <r.sh.open@gmail.com>
Subject: Re: [RFC 0/2] exynos5250/hdmi: replace dummy hdmiphy clock with pmu
 reg control
Date: Thu, 1 Aug 2013 12:25:44 +0530
Message-ID: <CAPdUM4OtmOdNmyUPjODTgGk4zWOqz+8pihRg2YGoppArR3PO+A@mail.gmail.com>
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
	<CAPdUM4OgJo9TLFeRUND+s2vF-ShsvQp=uo99FEnd-7UrBfCV-g@mail.gmail.com>
	<51F8FEF9.9020107@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-we0-f173.google.com ([74.125.82.173]:57199 "EHLO
	mail-we0-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751287Ab3HAGzp (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 1 Aug 2013 02:55:45 -0400
Received: by mail-we0-f173.google.com with SMTP id x55so1360195wes.18
        for <linux-samsung-soc@vger.kernel.org>; Wed, 31 Jul 2013 23:55:44 -0700 (PDT)
In-Reply-To: <51F8FEF9.9020107@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc: sw0312.kim@samsung.com, Kishon Vijay Abraham I <kishon@ti.com>, linux-samsung-soc@vger.kernel.org, Stephen Warren <swarren@wwwdotorg.org>, sunil joshi <joshi@samsung.com>, DRI mailing list <dri-devel@lists.freedesktop.org>, Kukjin Kim <kgene.kim@samsung.com>, grant.likely@linaro.org, Rahul Sharma <rahul.sharma@samsung.com>, Inki Dae <inki.dae@samsung.com>

Thanks Sylwester,

On Wed, Jul 31, 2013 at 5:41 PM, Sylwester Nawrocki
<s.nawrocki@samsung.com> wrote:
> Hi Rahul,
>
> On 07/31/2013 01:23 PM, Rahul Sharma wrote:
>>>> I think your hdmiphy pmu patch is good enough just if dt binding for pmu
>>>> >> is in hdmiphy binding instead of hdmi binding. So I recommended to make
>>>> >> pmu patch set on the top of independent hdmiphy patch set because with
>>>> >> independent hdmiphy patch set hdmiphy pmu code is moved to hdmiphy driver.
>>>> >>
>>>> >> Is it possible that hdmi driver references pmu information from hdmiphy
>>>> >> binding? If that, it seems one possible solution to fix current exynos
>>>> >> hdmi broken.
>>>> >>
>>>> >> Thanks and Regards,
>>>> >> - Seung-Woo Kim
>>>> >>
>>> >
>>> > I can surely do that but, I am worried about hdmiphy control bus.
>>> > change In 5420. It is changed to platform bus from i2c. Isolating
>>> > hdmiphy from hdmi driver seems the only clean method to handle
>>> > control bus change, changed phy configurations and power control
>>> > through PMU bit.
>>> >
>>> > To fix broken hdmi for 5420, I can again post the "hdmiphy
>>> > separation patches" to place hdmiphy driver in DRM. Later we can
>>> > migrate to Generic Phy Framework.
>>> >
>>
>> Hi Seung Woo, Mr. Dae, Sylwester,
>>
>> What you say on this? Shall I separate hdmiphy in following manner:
>>
>> 1) Move all phy related code to hdmiphy driver i.e. exynos_hdmiphy.c
>> 2) hdmiphy driver exposes power_on/off and set_pixel callbacks for
>> hdmi driver.
>> 3) let hdmi driver behave as phy controller for hdmiphy.
>> 4) move PMU bit control to hdmiphy driver, instead of hdmi driver.
>>
>> This way we will be very close to generic phy framework implementation
>> and migration to generic phy framework will be just a cakewalk.
>
> This all sound good to me, it seem natural to put the HDMI PHY
> functionality into a separate module. Hardware-wise the PHY is quite
> separate and as experience shows different PHYs can be attached to
> same controller. Well, we have well known that before...
>
> I'm not sure what the problem is with adding subsystem specific
> classes of operations (set of callback) to the generic PHY API, until
> that gets sorted out your approach looks good to me.
>
> As a side note, originally the V4L2 driver exposed the HDMI PHY
> as struct v4l2_subdev object, have a look at drivers/media/platform/
> s5p-tv/hdmiphy_drv.c. And in case of exynos5 we would just have
> created a platform driver for the HDMI PHY which would expose same
> subdev interface. So something similar as you proposed above.
>

Yea, it is very similar to s5p-tv/hdmiphy_drv.c. On top of this, I want
to make hdmiphy platform device as Clock provider for hdmiphy clock,
as you have done for cam_clkout*. Hdmi driver will call set_rate on this
clock.

I will post patches for the above separation and move hdmiphy to Generic
Phy framework after we get clarity on how to add additional callbacks.

Thanks for your reply.

Regards,
Rahul Sharma

>
> Regards,
> Sylwester
>
