From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: Re: [PATCH 1/1] ARM: Exynos: Add generic compatible string
Date: Tue, 25 Feb 2014 08:33:04 +0530
Message-ID: <CAK9yfHxXTbNmgTYqFH1Mm-X_sN2GpfLPp0MKixU=g2bKxz8e=g@mail.gmail.com>
References: <1392809645-631-1-git-send-email-sachin.kamat@linaro.org>
	<CAK9yfHyWG1ac6isTRSB3VWfxER9cSuDJHwY3b7svyEk9EozpWQ@mail.gmail.com>
	<53075239.4010603@samsung.com>
	<2200834.G3JJLYQl5i@wuerfel>
	<53076F00.7000001@samsung.com>
	<53077160.5030202@samsung.com>
	<CAK9yfHxiHkrf1xmSFbfoKqFFSCU6w4QqwPnQNdv1m1PGtrwsLQ@mail.gmail.com>
	<530BE557.20106@samsung.com>
	<530BE93F.2070904@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-oa0-f42.google.com ([209.85.219.42]:51923 "EHLO
	mail-oa0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752054AbaBYDDF (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 24 Feb 2014 22:03:05 -0500
Received: by mail-oa0-f42.google.com with SMTP id j17so6111081oag.15
        for <linux-samsung-soc@vger.kernel.org>; Mon, 24 Feb 2014 19:03:05 -0800 (PST)
In-Reply-To: <530BE93F.2070904@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <tomasz.figa@gmail.com>
Cc: Kukjin Kim <kgene.kim@samsung.com>, Tomasz Figa <t.figa@samsung.com>, Arnd Bergmann <arnd@arndb.de>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, Mark Rutland <Mark.Rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Rob Herring <robh+dt@kernel.org>, Grant Likely <grant.likely@secretlab.ca>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Olof Johansson <olof@lixom.net>

On 25 February 2014 06:22, Tomasz Figa <tomasz.figa@gmail.com> wrote:
> On 25.02.2014 01:35, Kukjin Kim wrote:
>>
>> On 02/24/14 21:03, Sachin Kamat wrote:
>>>
>>> On 21 February 2014 21:01, Tomasz Figa<t.figa@samsung.com>  wrote:
>>>>
>>>> On 21.02.2014 16:21, Tomasz Figa wrote:
>>>>>
>>>>>
>>>>> On 21.02.2014 15:48, Arnd Bergmann wrote:
>>>>>>
>>>>>>
>>>>>> On Friday 21 February 2014 14:18:49 Tomasz Figa wrote:
>>>>>>>
>>>>>>>
>>>>>>>
>>>>>>>> Now that we have a broader agreement on this, I think we can go
>>>>>>>> ahead with the
>>>>>>>> following steps as an initial approach:
>>>>>>>> 1. Have a common machine file for both exynos4 and 5 files,
>>>>>>>> mach-exynos-dt.c.
>>>>>>>> 2. Introduce a generic compatible string "samsung,exynos".
>>
>>
>> Well, I think, we need to consider to use compatible string
>> "samsung,exynos" again because "exynos" name can be used on ARMv8 as
>> well and I don't want to say that generic/common something is always
>> good. So IMHO still using exynos4 and exynos5 would be better.
>
>
> You can create a new compatible string (e.g. "samsung,exynos-armv8") for
> ARMv8 Exynos if support for one in mainline shows up and/or simply use
> another name for ARMv7 Exynos (e.g. "samsung,exynos-armv7").

I think "samsung,exynos-armv7" would be better in case we need to
distinguish between
v7 and v8.

-- 
With warm regards,
Sachin
