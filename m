From: Vivek Gautam <gautam.vivek@samsung.com>
Subject: Re: [PATCH 1/2] usb: host: Kconfig: Select PHY drivers for Exynos EHCI/OHCI
Date: Thu, 26 Jun 2014 14:37:50 +0530
Message-ID: <CAFp+6iEzNJUE7n2GLPPz9ye=+6y3sT5s5bvWOooprMtQfaLk3A@mail.gmail.com>
References: <1403761178-5371-1-git-send-email-sachin.kamat@samsung.com>
	<CAFp+6iGOHu2pOcQu+BxVY7yAcchau92GQF7zPiDhRXZyh73YoA@mail.gmail.com>
	<CAK5sBcHL0f+UVFoyQT3O8m+NAv3rNjiq=aEH4xh9BV3tFbYcSg@mail.gmail.com>
	<CAK5sBcG1cQNKd5=qSXM9D2Dde3ejmbYOX4BKaLwOETJOJx5+sA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pa0-f48.google.com ([209.85.220.48]:38842 "EHLO
	mail-pa0-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753050AbaFZJHv (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 26 Jun 2014 05:07:51 -0400
In-Reply-To: <CAK5sBcG1cQNKd5=qSXM9D2Dde3ejmbYOX4BKaLwOETJOJx5+sA@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sachin Kamat <sachin.kamat@samsung.com>
Cc: Linux USB Mailing List <linux-usb@vger.kernel.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Kukjin Kim <kgene.kim@samsung.com>, Felipe Balbi <balbi@ti.com>, Greg KH <gregkh@linuxfoundation.org>, Doug Anderson <dianders@chromium.org>, Kishon Vijay Abraham I <kishon@ti.com>

Hi Sachin,


On Thu, Jun 26, 2014 at 2:23 PM, Sachin Kamat <sachin.kamat@samsung.com> wrote:
> Hi Vivek,
>
> On Thu, Jun 26, 2014 at 1:55 PM, Sachin Kamat <sachin.kamat@samsung.com> wrote:
>> Hi Vivek,
>>
>> On Thu, Jun 26, 2014 at 1:39 PM, Vivek Gautam <gautam.vivek@samsung.com> wrote:
>>> Hi Sachin,
>>>
>>>
>>> On Thu, Jun 26, 2014 at 11:09 AM, Sachin Kamat <sachin.kamat@samsung.com> wrote:
>>>> EHCI and OHCI drivers on Exynos platforms do not work without their
>>>> corresponding SoC specific phy drivers. Hence it makes no sense to
>>>> keep these phy drivers as user selectable. Instead select them from
>>>> the respective USB configs to make things easier for the end user.
>>>> While at it enable 5250 phy for Exynos 5420 SoC too.
>>
>> <snip>
>>
>>>> +       select PHY_EXYNOS4210_USB2 if CPU_EXYNOS4210
>>>> +       select PHY_EXYNOS4X12_USB2 if (SOC_EXYNOS4212 || SOC_EXYNOS4412)
>>>> +       select PHY_EXYNOS5250_USB2 if (SOC_EXYNOS5250 || SOC_EXYNOS5420)
>>>
>>> also || SOC_EXYNOS5800
>>> same controller present on Exynos5800 too.
>
> Just checked that SOC_EXYNOS5800 is dependent on SOC_EXYNOS5420. Hence
> explicit option for SOC_EXYNOS5800 is redundant here. Will keep it as is.

Aah ! right, it's fine then. Sorry for the noise.


-- 
Best Regards
Vivek Gautam
Samsung R&D Institute, Bangalore
India
