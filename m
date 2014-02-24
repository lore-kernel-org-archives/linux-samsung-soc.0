From: Kukjin Kim <kgene.kim@samsung.com>
Subject: Re: [PATCH 1/1] ARM: dts: Re-organize RTC status for 5420
Date: Mon, 24 Feb 2014 09:19:11 +0900
Message-ID: <530A8FFF.4060108@samsung.com>
References: <1387450673-331-1-git-send-email-sachin.kamat@linaro.org>	<1941342.TJqfbb7DVG@flatron> <CAK9yfHwNkAJO71_uy38C7i=DeAxMmKxTTqP=oJ4THKp7dojaqg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pa0-f46.google.com ([209.85.220.46]:65040 "EHLO
	mail-pa0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750976AbaBXATT (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 23 Feb 2014 19:19:19 -0500
Received: by mail-pa0-f46.google.com with SMTP id rd3so5761345pab.19
        for <linux-samsung-soc@vger.kernel.org>; Sun, 23 Feb 2014 16:19:18 -0800 (PST)
In-Reply-To: <CAK9yfHwNkAJO71_uy38C7i=DeAxMmKxTTqP=oJ4THKp7dojaqg@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sachin Kamat <sachin.kamat@linaro.org>
Cc: Kukjin Kim <kgene@kernel.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Kukjin Kim <kgene.kim@samsung.com>

On 01/03/14 19:08, Sachin Kamat wrote:
> On 21 December 2013 02:42, Tomasz Figa<tomasz.figa@gmail.com>  wrote:
>> Hi Sachin,
>>
>> On Thursday 19 of December 2013 16:27:53 Sachin Kamat wrote:
>>> Some boards might not have RTC xtal, so RTC shouldn't really be
>>> enabled by default. Enable it in the required board files.
>>>
>>> Signed-off-by: Sachin Kamat<sachin.kamat@linaro.org>
>>> ---
>>>   arch/arm/boot/dts/exynos5420-arndale-octa.dts |    4 ++++
>>>   arch/arm/boot/dts/exynos5420-smdk5420.dts     |    4 ++++
>>>   arch/arm/boot/dts/exynos5420.dtsi             |    2 +-
>>>   3 files changed, 9 insertions(+), 1 deletion(-)
>>
>> Reviewed-by: Tomasz Figa<t.figa@samsung.com>
>
> Ping Kukjin. Also the other patch for 5250.
>
Applied with 5250 related patch, thanks.

- Kukjin
