From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH] rtc: s5m: fix to update ctrl register
Date: Fri, 21 Aug 2015 18:22:33 +0900
Message-ID: <55D6EDD9.3090702@samsung.com>
References: <1439455764-23526-1-git-send-email-jy0922.shim@samsung.com>
 <20150820231551.GE3769@piout.net> <55D67487.3040503@samsung.com>
 <55D67838.6080902@samsung.com> <55D67D14.9060809@samsung.com>
 <55D6CC1C.9040402@samsung.com> <55D6D24C.3010109@samsung.com>
 <55D6E627.8060908@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:11650 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753150AbbHUJWe (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 21 Aug 2015 05:22:34 -0400
In-reply-to: <55D6E627.8060908@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Joonyoung Shim <jy0922.shim@samsung.com>, Alexandre Belloni <alexandre.belloni@free-electrons.com>
Cc: rtc-linux@googlegroups.com, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org, a.zummo@towertech.it, sbkim73@samsung.com

On 21.08.2015 17:49, Joonyoung Shim wrote:
> On 08/21/2015 04:25 PM, Krzysztof Kozlowski wrote:
>> On 21.08.2015 15:58, Joonyoung Shim wrote:
>>> On 08/21/2015 10:21 AM, Krzysztof Kozlowski wrote:
>>>> On 21.08.2015 10:00, Joonyoung Shim wrote:
>>>>> On 08/21/2015 09:44 AM, Krzysztof Kozlowski wrote:
>>>>>> On 21.08.2015 08:15, Alexandre Belloni wrote:
>>>>>>> Hi,
>>>>>>>
>>>>>>> On 13/08/2015 at 17:49:24 +0900, Joonyoung Shim wrote :
>>>>>>>> According to datasheet, the S2MPS13X and S2MPS14X should update write
>>>>>>>> buffer via setting WUDR bit to high after ctrl register is updated.
>>>>>>>>
>>>>>>>> If not, ALARM interrupt of rtc-s5m doesn't happen first time when i use
>>>>>>>> tools/testing/selftests/timers/rtctest.c test program and hour format is
>>>>>>>> used to 12 hour mode in Odroid-XU3 board.
>>>>>>>>
>>>>>>>
>>>>>>> >From what I understood, I should expect a v2 of tihat patch also setting
>>>>>>> RUDR, is that right? OR would you prefer that I apply that one and then
>>>>>>> fix RUDR in a following patch?
>>>>>>
>>>>>> Right, I would expect that as well... or a comment if this is not needed.
>>>>>>
>>>>>
>>>>> Hmm, the driver only writes control register now, so i don't feel the
>>>>> need of patch setting RUDR for control register.
>>>>
>>>> Yes, you're right. There is only regmap_write() (not
>>>> remap_update_bits()) so your patch is completely fine. Thanks for
>>>> explanation.
>>>>
>>>> Reviewed-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
>>>>
>>>
>>> Thanks for review.
>>>
>>> I found one more issue, the RTC doesn't keep time on Odroid-XU3 board
>>> when i turn on board after power off even if RTC battery is connected.
>>>
>>> A difference with RTC driver of hardkernel kernel is that it sets
>>> not only WUDR bit but also RUDR bit to high at the same time after
>>> RTC_CTRL register is written. It's same with condition of only writing
>>> ALARM registers like below description.
>>
>> It seems that setting RUDR to high is needed...  but it shouldn't. For
>> example in SM-G900H with S2MPS11 it is set before reading RTC_CTRL
>> register. Mainline driver does not perform read.
>>
>> Maybe RUDR is not set high properly before some next time read and your
>> code is a coincidence, a work-around?
> 
> As you know, the driver sets RUDR bit to high always before reads time.
> I'm not sure whether any delay time needs to guarantee that RUDR bit is
> set properly, but it fails keeping time.
> 
> I tried setting RUDR bit to high after or before setting WUDR bit to
> high for writing of RTC_CTRL register but it also fails keeping time.
> If achieve keeping time, i should set WUDR & RUDR bits to high at the
> same time.
> 
> I'm referring also rtc-sec driver source of SM-N910U_SEA(Samsung Note4)
> from SM-N910U_SEA_KK_Opensource.zip file[1]. It also does the same
> operation setting WUDR & RUDR bits to high for writing of RTC_CTRL
> register.
> 
> [1] http://opensource.samsung.com/reception/receptionSub.do?method=sub&sub=F&searchValue=N910U
> 

Indeed, vendor code sets both WUDR and RUDR for S2MPS11 and S2MPS13 even
though datasheet says something different. Probably datasheet we have is
not correct or up to date.

Can you send updated patch with a comment next to
s5m8767_rtc_set_alarm_reg() call why it is needed?

I'll give it later a try on Rinato board (S2MPS14) and my Odroid at home.

Best regards,
Krzysztof
