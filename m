From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: exynos4412: Audio dies after one day on kernel 4.0
Date: Sat, 13 Jun 2015 17:15:09 +0900
Message-ID: <CAJKOXPcqgcKiZ_4=H9wEgpzoMy5LKUsgtaw82gp4DCbY6e=JFg@mail.gmail.com>
References: <5569F435.5040708@unseen.is>
	<CAJKOXPfV2HRMeVhT5uRO5An3pqALWBLBxX2wzP=WxN+eu4dr2A@mail.gmail.com>
	<556E0931.9030703@unseen.is>
	<556E44B7.10303@samsung.com>
	<5576CD40.8060301@unseen.is>
	<CAJKOXPeehj++Ojt2Zo4sgNjVASzZ8r_6OROM6FK_BRRQqVzcGg@mail.gmail.com>
	<557B53C6.8070600@unseen.is>
	<557BC3DB.1030906@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-vn0-f44.google.com ([209.85.216.44]:33187 "EHLO
	mail-vn0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751127AbbFMIPK (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 13 Jun 2015 04:15:10 -0400
In-Reply-To: <557BC3DB.1030906@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Vinod Koul <vinod.koul@intel.com>, gabriel@unseen.is
Cc: linux-samsung-soc@vger.kernel.org, dmaengine@vger.kernel.org, sylvester.nawrocki@gmail.com, Robert Baldyga <r.baldyga@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>

2015-06-13 14:47 GMT+09:00 Krzysztof Kozlowski <k.kozlowski@samsung.com>:
> W dniu 13.06.2015 o 06:48, gabriel@unseen.is pisze:
>> On 06/10/2015 10:22 AM, Krzysztof Kozlowski wrote:
>>>
>>> Gabriel,
>>>
>>> I sent a patch which should fix the issue. Could you give it a try? Of
>>> course don't revert the other patches and don't use other workarounds.
>>> Just apply the patch on clean (vanilla would be the best) kernel.
>>> [RFT PATCH] dmaengine: Fix choppy sound because of unimplemented resume
>>>
>>
>> hi krzysztof,
>>
>> thanks a lot for your work. having only that patch applied unfortunately
>> brought back the problem after something more than one day. the sound
>> became choppy/noisy again. I will now compile the -next kernel and give
>> it a try.
>
> Thanks, I'll try to reproduce the issue on my Odroid. Can you share more
> details how to reproduce it? The audio must play continuously or just
> from time to time but the board must be turned on for more than one day?

I bought some audio cables and successfully reproduced similar issue
(choppy sound) on Odroid XU3-Lite. On current linux-next
(next-20150612) the sound is awful (choppy) after few seconds of play.
For example first four of:
$ aplay /usr/share/sounds/alsa/Front_Right.wav
work fine. But then it just gets worse and underruns are reported:
$ Playing WAVE '/usr/share/sounds/alsa/Front_Right.wav' : Signed 16
bit Little Endian, Rate 48000 Hz, Mono
$ underrun!!! (at least 0.095 ms long)

Reverting the commit aee4d1fac887 ("dmaengine: pl330: improve
pl330_tx_status() function") fixes this issue so this is not related
to missing "resume" function. At least this particular issue on my
Odroid is not related to missing resume but I did not try to play
sound for 24 hours.
My fix does not solve this. Probably "cc-stable" and "fixes" tags
should be dropped.

Anyway I'll try to investigate it more. If anyone has any ideas, please share.

Best regards,
Krzysztof
