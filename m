From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH] ARM: multi_v7_defconfig: Enable fan, sensors and audio
 for Odroid XU3
Date: Thu, 17 Dec 2015 20:50:24 +0900
Message-ID: <CAJKOXPdLG7bcaMOtuc-XwG7f7mrhMS1W0psXOtb+Uhm1YW-M_A@mail.gmail.com>
References: <1449449994-10110-1-git-send-email-k.kozlowski@samsung.com>
	<3286190.bAhobgE2la@wuerfel>
	<566553A4.6080106@samsung.com>
	<1670608.3mJKnXpbtb@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-io0-f181.google.com ([209.85.223.181]:33765 "EHLO
	mail-io0-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750799AbbLQLuY (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 17 Dec 2015 06:50:24 -0500
In-Reply-To: <1670608.3mJKnXpbtb@wuerfel>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: Javier Martinez Canillas <javier@osg.samsung.com>, Kukjin Kim <kgene@kernel.org>, Olof Johansson <olof@lixom.net>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, Kevin Hilman <khilman@linaro.org>, arm@kernel.org

2015-12-07 18:43 GMT+09:00 Arnd Bergmann <arnd@arndb.de>:
> On Monday 07 December 2015 18:38:44 Krzysztof Kozlowski wrote:
>> On 07.12.2015 18:14, Arnd Bergmann wrote:
>> > On Monday 07 December 2015 09:59:54 Krzysztof Kozlowski wrote:
>> >> For Odroid XU3-family enable the:
>> >>  - PWM fan (to control the CPU fan using thermal subsystem),
>> >>  - TI INA231 sensors (provide power measurements of big.LITTLE cores,
>> >>    DRAM and GPU),
>> >>  - Samsung sound (for Odroid XU3 and Snow as well).
>> >>
>> >> Signed-off-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
>> >>
>> >
>> > Looks good. Do you have a samsung/defconfig branch already that you
>> > can put this into, or should be pick it up into arm-soc directly?
>> >
>> > My preference is the former, but it would be a bit silly if that
>> > is the only samsung defconfig change we need.
>>
>> I had a couple of defconfig patches in my queue but I sent them last
>> week to Kukjin in pull request. He didn't pull it yet. Maybe he could
>> apply this patch after pulling?
>>
>> Anyway we can wait for a few days to sort it out. If I don't have
>> another defconfig patches then I will remind myself with applying it to
>> arm-soc.
>>
>
> Ok, sounds good.

+Cc arm@kernel.org,

I don't have any other defconfig changes in my queue, except of course
stuff which I sent in pull request. I mean the request sent initially
to Kukjin but now redirected with his ack to you guys.

If you don't mind, please apply this patch directly (with Javier's reviewed-by).

Best regards,
Krzysztof
