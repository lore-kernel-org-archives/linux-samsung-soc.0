From: Kukjin Kim <kgene.kim@samsung.com>
Subject: Re: [RESEND][PATCH 1/2] ARM: DTS: Add PMU DT node for exynos5260
 SoC
Date: Tue, 29 Jul 2014 06:25:58 +0900
Message-ID: <53D6BFE6.10303@samsung.com>
References: <1406551080-14821-1-git-send-email-vikas.sajjan@samsung.com>	<1406551080-14821-2-git-send-email-vikas.sajjan@samsung.com> <CAK5sBcHdsDF60JTv7ugC4m=A-5Lmr2rDwizhkCLEyYGRio-2-Q@mail.gmail.com> <53D6B2AD.7070404@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pd0-f175.google.com ([209.85.192.175]:37516 "EHLO
	mail-pd0-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751509AbaG1V0H (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 28 Jul 2014 17:26:07 -0400
Received: by mail-pd0-f175.google.com with SMTP id r10so10535178pdi.20
        for <linux-samsung-soc@vger.kernel.org>; Mon, 28 Jul 2014 14:26:07 -0700 (PDT)
In-Reply-To: <53D6B2AD.7070404@suse.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: =?UTF-8?B?QW5kcmVhcyBGw6RyYmVy?= <afaerber@suse.de>
Cc: Sachin Kamat <spk.linux@gmail.com>, Vikas Sajjan <vikas.sajjan@samsung.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Kukjin Kim <kgene.kim@samsung.com>, Tomasz Figa <tomasz.figa@gmail.com>, sunil joshi <joshi@samsung.com>, sajjan.linux@gmail.com, Doug Anderson <dianders@chromium.org>

On 07/29/14 05:29, Andreas F=C3=A4rber wrote:
> Hi Vikas and Sachin,
>
> Am 28.07.2014 17:26, schrieb Sachin Kamat:
>> On Mon, Jul 28, 2014 at 6:07 PM, Vikas Sajjan<vikas.sajjan@samsung.c=
om>  wrote:
>>> Adds PMU DT node for exynos5260 SoC.
>>>
>>> Signed-off-by: Vikas Sajjan<vikas.sajjan@samsung.com>
>>> ---
>>>   .../devicetree/bindings/arm/samsung/pmu.txt        |    1 +
>>>   arch/arm/boot/dts/exynos5260.dtsi                  |    5 +++++
>>>   2 files changed, 6 insertions(+)
>>>
>>> diff --git a/Documentation/devicetree/bindings/arm/samsung/pmu.txt =
b/Documentation/devicetree/bindings/arm/samsung/pmu.txt
>>> index 2a4ab04..c038628 100644
>>> --- a/Documentation/devicetree/bindings/arm/samsung/pmu.txt
>>> +++ b/Documentation/devicetree/bindings/arm/samsung/pmu.txt
>>> @@ -8,6 +8,7 @@ Properties:
>>>                     - "samsung,exynos4412-pmu" - for Exynos4412 SoC=
,
>>>                     - "samsung,exynos5250-pmu" - for Exynos5250 SoC=
,
>>>                     - "samsung,exynos5420-pmu" - for Exynos5420 SoC=
=2E
>>> +                  - "samsung,exynos5260-pmu" - for Exynos5260 SoC.
>>
>> nit: This line should come after 5250 entry to preserve the order.
>>
>> Otherwise, looks good.
>
> Earlier today, Kukjin indicated he would apply my corresponding 5410
> series [*], but he hasn't pushed yet. It adds a 5410 entry before 542=
0,
> which will conflict with adding 5260 in the same place.
>
> Regards,
> Andreas
>
> [*]
> http://www.mail-archive.com/linux-samsung-soc@vger.kernel.org/msg3468=
6.html
>
Thanks for you guys' comments, and I've applied this whole series with=20
some handy modification ;)

- Kukjin
