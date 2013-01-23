From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: [PATCH 0/2] usb: exynos: Fix compatible strings used for device
Date: Wed, 23 Jan 2013 13:40:11 +0100
Message-ID: <50FFDA2B.4010506@samsung.com>
References: <CAFp+6iHaYpinaq8K7rf1GxOJoap6Rd8kGcJn4UmHU28BjTCAsA@mail.gmail.com>
 <CAFp+6iFVSi_pg39YyeEbAgwDsU4kun7u0g8z3u3dVMP4oLpavQ@mail.gmail.com>
 <CAD=FV=WtsfDr=W7TB5BYW087FqXyxXCb0xVfGha6_F65cPCE9A@mail.gmail.com>
 <016901cde163$6be034c0$43a09e40$@samsung.com>
 <CAFp+6iGq32UV3mZ=QYVizJGQEark0Qztu7m4jy3DvG431ajV1w@mail.gmail.com>
 <50DB811A.8010408@gmail.com> <054601cdf862$534a8ad0$f9dfa070$@samsung.com>
 <CAFp+6iGrp8b+T3n+xNha7jMFMgDsFR8E9zCijoUANZgmN4QL_A@mail.gmail.com>
 <20130122084817.GC16143@arwen.pp.htv.fi>
 <063e01cdf8ec$85e637c0$91b2a740$@samsung.com>
 <20130123095021.GB22054@arwen.pp.htv.fi>
 <CAFp+6iH2_18s=HwsLhekyUZW=yNCjZzskiA5s-ofrCbzDBGL4Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:64967 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755825Ab3AWMkP (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 23 Jan 2013 07:40:15 -0500
In-reply-to: <CAFp+6iH2_18s=HwsLhekyUZW=yNCjZzskiA5s-ofrCbzDBGL4Q@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Vivek Gautam <gautamvivek1987@gmail.com>
Cc: balbi@ti.com, Kukjin Kim <kgene.kim@samsung.com>, Doug Anderson <dianders@chromium.org>, Thomas Abraham <thomas.abraham@linaro.org>, linux-usb@vger.kernel.org, linux-samsung-soc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, gregkh@linuxfoundation.org, Alan Stern <stern@rowland.harvard.edu>, Grant Likely <grant.likely@secretlab.ca>, Rob Herring <rob.herring@calxeda.com>, jg1.han@samsung.com, Vivek Gautam <gautam.vivek@samsung.com>, cpgs@samsung.com

Hi,

On 01/23/2013 01:20 PM, Vivek Gautam wrote:
>>>>> -     { .compatible = "samsung,exynos-dwc3" },
>>>>> +     { .compatible = "samsung,synopsis-dwc3" }
>>>>
>>>> You're both missing a point here. The synopsys IP driver is called
>>>> dwc3.ko and that's compatible with synopsys,dwc3. Your glue layer driver
>>>> (dwc3-exynos.ko) is compatible with your platform, so
>>>> samsung,exynos-dwc3 sounds correct to me.
>>>>
>>> Hmm...yeah, you're right and agreed.
>>>
>>> However, we need to use more clear name there like "samsung,exynos-dwusb3"
>>> in compatible, because you know there are lots of other IPs in Synopsis
>>> Design Ware brand. So we have to include usb in compatible for that.
>>
>> fair enough.
>>
> 
> Thanks for your suggestions. This definitely make things clear.
> I shall then keep "samsung,exynos-dwusb3" as the compatible string or,
> should i be including '5250' string as well, something like
> "samsung,exynos5250-dwusb3"
> as pointed out by Grant earlier ?  :-O

IMHO this needs to be "samsung,exynos5250-dwusb3", rather than 
"samsung,exynos-dwusb3". :)

--

Thanks,
Sylwester
