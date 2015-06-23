From: Anand Moon <linux.amoon@gmail.com>
Subject: Re: exynos4412: Audio dies after one day on kernel 4.0
Date: Tue, 23 Jun 2015 08:05:54 +0530
Message-ID: <CANAwSgTK+7xxvE2RNCTn7TuhfD7ZE7o4cj2pX5i6XEhRNufvPw@mail.gmail.com>
References: <5569F435.5040708@unseen.is> <CAJKOXPfV2HRMeVhT5uRO5An3pqALWBLBxX2wzP=WxN+eu4dr2A@mail.gmail.com>
 <556E0931.9030703@unseen.is> <556E44B7.10303@samsung.com> <5576CD40.8060301@unseen.is>
 <CAJKOXPeehj++Ojt2Zo4sgNjVASzZ8r_6OROM6FK_BRRQqVzcGg@mail.gmail.com>
 <557B53C6.8070600@unseen.is> <557BC3DB.1030906@samsung.com>
 <CAJKOXPcqgcKiZ_4=H9wEgpzoMy5LKUsgtaw82gp4DCbY6e=JFg@mail.gmail.com>
 <CANAwSgQKFTG+ts=kVrZ1fR1EBcZL+7dgXqH1WhoJ7kZzz8hS3Q@mail.gmail.com> <5588A0CF.6000807@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wi0-f182.google.com ([209.85.212.182]:33521 "EHLO
	mail-wi0-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932213AbbFWCgQ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 22 Jun 2015 22:36:16 -0400
In-Reply-To: <5588A0CF.6000807@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Cc: Vinod Koul <vinod.koul@intel.com>, gabriel@unseen.is, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, dmaengine@vger.kernel.org, Sylwester Nawrocki <sylvester.nawrocki@gmail.com>, Robert Baldyga <r.baldyga@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>

Hi Krzysztof

On 23 June 2015 at 05:27, Krzysztof Kozlowski <k.kozlowski@samsung.com> wrote:
> On 23.06.2015 01:00, Anand Moon wrote:
>> Hi Krzysztof
>>
>> On 13 June 2015 at 13:45, Krzysztof Kozlowski <k.kozlowski@samsung.com
>> <mailto:k.kozlowski@samsung.com>> wrote:
>>
>>     2015-06-13 14:47 GMT+09:00 Krzysztof Kozlowski
>>     <k.kozlowski@samsung.com <mailto:k.kozlowski@samsung.com>>:
>>     > W dniu 13.06.2015 o 06:48, gabriel@unseen.is
>>     <mailto:gabriel@unseen.is> pisze:
>>     >> On 06/10/2015 10:22 AM, Krzysztof Kozlowski wrote:
>>     >>>
>>     >>> Gabriel,
>>     >>>
>>     >>> I sent a patch which should fix the issue. Could you give it a
>>     try? Of
>>     >>> course don't revert the other patches and don't use other
>>     workarounds.
>>     >>> Just apply the patch on clean (vanilla would be the best) kernel.
>>     >>> [RFT PATCH] dmaengine: Fix choppy sound because of unimplemented
>>     resume
>>     >>>
>>     >>
>>     >> hi krzysztof,
>>     >>
>>     >> thanks a lot for your work. having only that patch applied
>>     unfortunately
>>     >> brought back the problem after something more than one day. the sound
>>     >> became choppy/noisy again. I will now compile the -next kernel
>>     and give
>>     >> it a try.
>>     >
>>     > Thanks, I'll try to reproduce the issue on my Odroid. Can you
>>     share more
>>     > details how to reproduce it? The audio must play continuously or just
>>     > from time to time but the board must be turned on for more than
>>     one day?
>>
>>     I bought some audio cables and successfully reproduced similar issue
>>     (choppy sound) on Odroid XU3-Lite. On current linux-next
>>     (next-20150612) the sound is awful (choppy) after few seconds of play.
>>     For example first four of:
>>     $ aplay /usr/share/sounds/alsa/Front_Right.wav
>>     work fine. But then it just gets worse and underruns are reported:
>>     $ Playing WAVE '/usr/share/sounds/alsa/Front_Right.wav' : Signed 16
>>     bit Little Endian, Rate 48000 Hz, Mono
>>     $ underrun!!! (at least 0.095 ms long)
>>
>>     Reverting the commit aee4d1fac887 ("dmaengine: pl330: improve
>>     pl330_tx_status() function") fixes this issue so this is not related
>>     to missing "resume" function. At least this particular issue on my
>>     Odroid is not related to missing resume but I did not try to play
>>     sound for 24 hours.
>>     My fix does not solve this. Probably "cc-stable" and "fixes" tags
>>     should be dropped.
>>
>>     Anyway I'll try to investigate it more. If anyone has any ideas,
>>     please share.
>>
>>     Best regards,
>>     Krzysztof
>>     --
>>     To unsubscribe from this list: send the line "unsubscribe
>>     linux-samsung-soc" in
>>     the body of a message to majordomo@vger.kernel.org
>>     <mailto:majordomo@vger.kernel.org>
>>     More majordomo info at  http://vger.kernel.org/majordomo-info.html
>>
>>
>> I gave it a try by enabling following config flags.
>>
>> CONFIG_SND_SEQUENCER=m
>> CONFIG_SND_SEQ_DUMMY=m
>> CONFIG_SND_USB_AUDIO=m
>>
>> I am able to play mp3 songs on Odroid-XU3 boards on vlc.
>> Could you give it a try.
>
> What do you mean? Which patch are you talking about? Are you aware that
> I tried to fix this two times?
>
> I already tested the latest fix on Odroid XU3 - which I mentioned in
> commit. However it would be nice to get confirmation for fixing original
> bug report (that specific conditions on that board which Gabriel reported).
>
> Best regards,
> Krzysztof

Looks like I missed the fix. Or I overlooked it.

sorry for the noise.

-Anand Moon
