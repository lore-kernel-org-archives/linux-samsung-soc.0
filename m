From: gabriel@unseen.is
Subject: Re: exynos4412: Audio dies after one day on kernel 4.0
Date: Fri, 12 Jun 2015 23:48:54 +0200
Message-ID: <557B53C6.8070600@unseen.is>
References: <5569F435.5040708@unseen.is>	<CAJKOXPfV2HRMeVhT5uRO5An3pqALWBLBxX2wzP=WxN+eu4dr2A@mail.gmail.com>	<556E0931.9030703@unseen.is>	<556E44B7.10303@samsung.com>	<5576CD40.8060301@unseen.is> <CAJKOXPeehj++Ojt2Zo4sgNjVASzZ8r_6OROM6FK_BRRQqVzcGg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from outmail04.unseen.is ([82.221.107.91]:43228 "EHLO
	outmail04.unseen.is" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751198AbbFLVtW (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 12 Jun 2015 17:49:22 -0400
In-Reply-To: <CAJKOXPeehj++Ojt2Zo4sgNjVASzZ8r_6OROM6FK_BRRQqVzcGg@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, dmaengine@vger.kernel.org, sylvester.nawrocki@gmail.com, Robert Baldyga <r.baldyga@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Vinod Koul <vinod.koul@intel.com>

On 06/10/2015 10:22 AM, Krzysztof Kozlowski wrote:
> 2015-06-09 20:25 GMT+09:00  <gabriel@unseen.is>:
>> On 06/03/2015 02:05 AM, Krzysztof Kozlowski wrote:
>>> On 03.06.2015 04:51, gabriel@unseen.is wrote:
>>>> On 05/31/2015 08:47 AM, Krzysztof Kozlowski wrote:
>>>>> 2015-05-31 2:32 GMT+09:00  <gabriel@unseen.is>:
>>>>>>
>>>>>> Hello,
>>>>>>
>>>>>> I've been successfully using a self compiled linux kernel until version
>>>>>> 3.19 together with Debian Stretch.
>>>>>>
>>>>>> After upgrading the kernel to version 4.0 I see strange messages in the
>>>>>> logs i.e.
>>>>>>
>>>>>> May 27 22:44:01 pulseaudio[1027]: [alsa-sink-3830000.i2s-HiFi HiFi-0]
>>>>>> alsa-sink.c: ALSA woke us up to write new data to the device, but there
>>>>>> was actually nothing to write!
>>>>>> May 27 22:44:01 pulseaudio[1027]: [alsa-sink-3830000.i2s-HiFi HiFi-0]
>>>>>> alsa-sink.c: Most likely this is a bug in the ALSA driver
>>>>>> 'snd_soc_simple_card'. Please report this issue to the ALSA developers.
>>>>>> May 27 22:44:01 pulseaudio[1027]: [alsa-sink-3830000.i2s-HiFi HiFi-0]
>>>>>> alsa-sink.c: We were woken up with POLLOUT set -- however a subsequent
>>>>>> snd_pcm_avail() returned 0 or another value < min_avail.
>>>>>>
>>>>>>
>>>>>> I can easily play sound in perfect quality for approx the first 24h.
>>>>>> After that time the sound becomes distorted and is choppy/crackling.
>>>>>> After rebooting then the sound is optimal again.
>>>>>>
>>>>>>
>>>>>> I have tried to use kernel 4.0 with almost exactly the same
>>>>>> configuration than for 3.19 to no avail.
>>>>>>
>>>>>> Then somebody on
>>>>>> http://forum.odroid.com/viewtopic.php?f=82&t=13281&p=91186 gave me the
>>>>>> hint that the followin patch might solve the issue:
>>>>>>
>>>>>> https://github.com/prahal/linux/commit/5e60cfc9fa5101a346e29ef5f944fbbad300c72d
>>>>>>
>>>>>>
>>>>>> The patch did help something. I can now still play music after 2 days
>>>>>> but what happens is that each time I turn on music I get a choppy sound
>>>>>> for some time. That means the sound comes clear but every 2 seconds the
>>>>>> sound pauses for a fraction of a second. Which is somewhat comparable to
>>>>>> the issue earlier but without the heavy crackling - and that this goes
>>>>>> away after a couple of minutes.
>>>>>>
>>>>>>
>>>>>> But furthermore the sound has now simple cracklings. One in two second
>>>>>> approx. and they do not disappear.
>>>>>>
>>>>>>
>>>>>> Does anybody have an idea what could be the matter here?
>>>>>>
>>>>>> Thanks in advance.
>>>>>
>>>>> +Cc Robert, dmaengine list.
>>>>>
>>>>> Bisecting would be helpful. You could also try reverting following commits:
>>>>> 88987d2c75
>>>>> aee4d1fac8
>>>>>
>>>>> Other possible test case would be disabling runtime PM for pl330 DMA driver:
>>>>>
>>>>> for i in /sys/bus/amba/drivers/dma-pl330/*.[amp]dma/power ; do
>>>>>   echo "on" > ${i}/control
>>>>> done
>>>>>
>>>>
>>>> Thanks a lot Krzysztof,
>>>>
>>>> I have reverted 88987d2c75 and aee4d1fac8 from 4.0.4 and I have still
>>>> audio working after 1 and 1/2 day. Unluckily the alsa error message
>>>> occured still once but they don't seem to be the issue here.
>>>
>>>
>>> +CC Marek,
>>>
>>> Robert, Marek, do you have any idea for the cause?
>>>
>>
>> I can now say for sure that the commits 88987d2c75 and aee4d1fac8 are
>> the cause for the problem. Audio was working now for 7 days.
> 
> +CC Vinod
> 
> Gabriel,
> 
> I sent a patch which should fix the issue. Could you give it a try? Of
> course don't revert the other patches and don't use other workarounds.
> Just apply the patch on clean (vanilla would be the best) kernel.
> [RFT PATCH] dmaengine: Fix choppy sound because of unimplemented resume
> 

hi krzysztof,

thanks a lot for your work. having only that patch applied unfortunately
brought back the problem after something more than one day. the sound
became choppy/noisy again. I will now compile the -next kernel and give
it a try.

best regards,
gabriel
