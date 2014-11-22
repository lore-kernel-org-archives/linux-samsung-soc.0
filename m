From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: Peach Pi/Pit boot failures in linux-next  (was Re: [RFC PATCH
 1/1] drm/exynos: Move platform drivers registration to module init)
Date: Sat, 22 Nov 2014 11:21:56 +0100
Message-ID: <547063C4.9030607@samsung.com>
References: <1416318821-7925-1-git-send-email-javier.martinez@collabora.co.uk>	<7hh9xwxsev.fsf@deeprootsystems.com>	<546CCAB8.9050402@collabora.co.uk>	<CAFp+6iFbxWoh4h0ZpY=JQO4rjLss2kpj-nZM7KGiJ_F4AZ2W=g@mail.gmail.com>	<7hppchsu29.fsf@deeprootsystems.com>	<546E293D.9000300@collabora.co.uk>	<7hbno1spdt.fsf@deeprootsystems.com>	<546F3837.5020706@collabora.co.uk> <7hzjbko6eb.fsf@deeprootsystems.com> <546FA53D.2060807@collabora.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wg0-f52.google.com ([74.125.82.52]:59775 "EHLO
	mail-wg0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751019AbaKVKWH (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 22 Nov 2014 05:22:07 -0500
Received: by mail-wg0-f52.google.com with SMTP id a1so8493019wgh.39
        for <linux-samsung-soc@vger.kernel.org>; Sat, 22 Nov 2014 02:22:06 -0800 (PST)
In-Reply-To: <546FA53D.2060807@collabora.co.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Javier Martinez Canillas <javier.martinez@collabora.co.uk>, Kevin Hilman <khilman@kernel.org>
Cc: Kukjin Kim <kgene@kernel.org>, Vivek Gautam <gautamvivek1987@gmail.com>, Inki Dae <inki.dae@samsung.com>, Andrzej Hajda <a.hajda@samsung.com>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Paolo Pisati <p.pisati@gmail.com>, Vivek Gautam <gautam.vivek@samsung.com>

W dniu 21.11.2014 o 21:49, Javier Martinez Canillas pisze:
> Hello Kevin,
>
> On 11/21/2014 05:38 PM, Kevin Hilman wrote:
>>> So, I see two different boot failures on the Peach Pi[t] Chromebooks:
>>>
>>> 1) next20141121 boot fails due snd-soc-snow
>>>
>>> Disabling CONFIG_SND_SOC_SNOW makes the boot to got a little further
>>> but still fails with the second issue:
>>>
>>> 2) next20141121 boot hangs if unused clocks are disabled.
>>>
>>> I tried to root cause these two issues but didn't see anything evident
>>> so I'll find a last known good commit and bisect. If anyone has an
>>> idea of the possible causes for these issues that would be appreciated.
>>
>> FWIW, in addition to the failures on 5800/peach-pi, I'm also seeing boot
>> failures in next-20141121 on the exynos5420-arndale-octa[1].  Adding
>> clk_ignore_unused gets things booting there as well.
>>
>> What's interesting is that my exynos5422-odroid-xu3 is booting fine as
>> well as the exynos5420-arndale and the exynos5410-odroid-xu (shown as
>> exynos5410-smdk5410)
>>
>> Whatever the issue, it definietly seems like a problem that was came
>> through a driver/subsystem tree because that these boards are all
>> booting fine with Kukjin's for-next, arm-soc/for-next and
>> mainline/v3.18-rc5 (all with just plain exynos_defconfig, and without
>> clk_ignore_unused.)  For example, just looking at peach-pi across all
>> these trees[2], you can see that it's only failing in linux-next.
>>
>
> By bisecting I found that the commit introducing both regressions is:
>
> ae43b32 ("ARM: 8202/1: dmaengine: pl330: Add runtime Power Management support v12")
>
> By reverting ae43b32, next-20141121 boots with both CONFIG_SND_SOC_SNOW=y
> and *without* clk_ignore_unused.
>
> Krzysztof,
>
> I see you are the author of the patch, maybe you can take a look why this
> is causing regressions in some Exynos boards?

Oh crap... I'll look at it on Monday. However I don't have Peach Pi so any 
information would be useful. Can you post dmesg and your config? (is it 
exynos_defconfig?)

Additionally can you boot the board with DMATEST enabled (without reverting 
my commit so probably with clk_ignore_unsed and with SND_SNOW disabled) and 
run dmatest on all channels? Something like:
   echo 2000 > /sys/module/dmatest/parameters/timeout
   echo 2 > /sys/module/dmatest/parameters/iterations
   for i in `ls /sys/class/dma/`
   do
     echo $i > /sys/module/dmatest/parameters/channel
     echo 1 > /sys/module/dmatest/parameters/run
   done

... and post these results also.

I will test it on Arndale Octa, maybe the cause is the same. Unfortunately 
it seems Arndale Octa does not have any sound enabled in DTS so it may be 
hard to test I2S bus (which is used by audio).

Best regards,
Krzysztof
