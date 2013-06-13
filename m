From: Rahul Sharma <r.sh.open@gmail.com>
Subject: Re: [RFC 0/2] exynos5250/hdmi: replace dummy hdmiphy clock with pmu
 reg control
Date: Thu, 13 Jun 2013 09:56:42 +0530
Message-ID: <CAPdUM4Nis0uwyZf1hNDOMmdqFm0K7beVPoyAWRjMBwq0jcwwCQ@mail.gmail.com>
References: <1370935073-7475-1-git-send-email-rahul.sharma@samsung.com>
	<CAAQKjZMuSQhbYtOyni-RdHhXu0fv3U2Dm_2iqRLe0smSt_jjjQ@mail.gmail.com>
	<CAAQKjZOZCtLnE_OPs60NU+Z4pkHiSCqZcBOi1Dv+PC=01HKqyg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wg0-f44.google.com ([74.125.82.44]:64754 "EHLO
	mail-wg0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750762Ab3FME0n (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 13 Jun 2013 00:26:43 -0400
Received: by mail-wg0-f44.google.com with SMTP id m15so6545098wgh.35
        for <linux-samsung-soc@vger.kernel.org>; Wed, 12 Jun 2013 21:26:42 -0700 (PDT)
In-Reply-To: <CAAQKjZOZCtLnE_OPs60NU+Z4pkHiSCqZcBOi1Dv+PC=01HKqyg@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Inki Dae <inki.dae@samsung.com>
Cc: Rahul Sharma <rahul.sharma@samsung.com>, linux-samsung-soc@vger.kernel.org, "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>, DRI mailing list <dri-devel@lists.freedesktop.org>, Kukjin Kim <kgene.kim@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Sean Paul <seanpaul@chromium.org>, sunil joshi <joshi@samsung.com>

Mr. Dae,

Thanks for your valuable inputs.

I posted it as RFC because, I also have received comments to register
hdmiphy as a clock controller. As we always configure it for specific
frequency, hdmi-phy looks similar to a PLL. But it really doesn't
belong to that class. Secondly prior to exynos5420, it was a i2c
device. I am not sure we can register a I2C device as a clock
controller. I wanted to discuss and explore this option here.

As you said, in parallel, I will align these changes and along with
"drm/exynos: hdmi: move hdmiphy related code to hdmiphy driver"
series and post them.

I hope we should be able to close on one of the above approaches for
hdmiphy.

regards,
Rahul Sharma.

On Wed, Jun 12, 2013 at 9:57 AM, Inki Dae <inki.dae@samsung.com> wrote:
>
>
>
> 2013/6/12 Inki Dae <inki.dae@samsung.com>
>>
>> Hi Rahul,
>>
>> This patch is important to us. Actually, previous hdmi driver had
>> controlled hdmiphy HDMI_PHY_CONTROL as if that were a clock but now that
>> doesn't exist anymore. So we need to discuss how hdmiphy should be handled.
>> I konw that you had already posted hdmiphy relevant patch set, [PATCH 0/4]
>> drm/exynos: hdmi: move hdmiphy related code to hdmiphy driver.
>>
>> I think we can couple pmu register controlling codes with that patch set
>> without RFC. Could you update and post them again? like below,
>> [PATCH 0/4] drm/exynos: hdmi: move hdmiphy related code to hdmiphy driver
>> + [RFC 0/2] exynos5250/hdmi: replace dummy hdmiphy clock with pmu reg
>> control
>>
>> And then let's start review :)
>
>
> And I think It would be better to move the pmu register controlling codes
> into hdmiphy driver like drivers/usb/phy/phy-samsung-usb2.c driver does.
>
>>
>>
>> Thanks,
>> Inki Dae
>>
>>
>>
>> 2013/6/11 Rahul Sharma <rahul.sharma@samsung.com>
>>>
>>> Previously, hdmiphy is added as a dummy clock in clock file for
>>> exynos SoCs. Enable/Disable to this clock, actually toggles the power
>>> control bit in PMU, instead of controlling the clock gate.
>>>
>>> This RFC adds the support to parse hdmiphy control node which is a child
>>> node to hdmi, and map the pmu register to toggle the power control bit.
>>>
>>> This is based on drm-next branch in Inki Dae's tree.
>>>
>>> Rahul Sharma (2):
>>>   drm/exynos: replace dummy hdmiphy clock with pmu register control
>>>   ARM/dts: add hdmiphy power control pmu register to hdmi dt node
>>>
>>>  arch/arm/boot/dts/exynos5250.dtsi    |    6 +++
>>>  drivers/gpu/drm/exynos/exynos_hdmi.c |   69
>>> ++++++++++++++++++++++++++++++----
>>>  drivers/gpu/drm/exynos/regs-hdmi.h   |    4 ++
>>>  3 files changed, 71 insertions(+), 8 deletions(-)
>>>
>>> --
>>> 1.7.10.4
>>>
>>> --
>>> To unsubscribe from this list: send the line "unsubscribe
>>> linux-samsung-soc" in
>>> the body of a message to majordomo@vger.kernel.org
>>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>>
>>
>
