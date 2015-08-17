From: Joonyoung Shim <jy0922.shim@samsung.com>
Subject: Re: [rtc-linux] [PATCH] rtc: s5m: fix to update ctrl register
Date: Mon, 17 Aug 2015 10:48:03 +0900
Message-ID: <55D13D53.3060902@samsung.com>
References: <1439455764-23526-1-git-send-email-jy0922.shim@samsung.com>
 <55CC6B28.5010707@samsung.com> <55CC7479.6080902@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:54163 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751440AbbHQBsG (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 16 Aug 2015 21:48:06 -0400
In-reply-to: <55CC7479.6080902@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>, rtc-linux@googlegroups.com
Cc: linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org, a.zummo@towertech.it, alexandre.belloni@free-electrons.com, sbkim73@samsung.com

On 08/13/2015 07:42 PM, Krzysztof Kozlowski wrote:
> W dniu 13.08.2015 o 19:02, Krzysztof Kozlowski pisze:
>> W dniu 13.08.2015 o 17:49, Joonyoung Shim pisze:
>>> According to datasheet, the S2MPS13X and S2MPS14X should update write
>>> buffer via setting WUDR bit to high after ctrl register is updated.
>>
>> Hi,
>>
>> I cannot find this information in S2MPS14 datasheet. On which page is it?
>>
>>
>>>
>>> If not, ALARM interrupt of rtc-s5m doesn't happen first time when i use
>>> tools/testing/selftests/timers/rtctest.c test program and hour format is
>>> used to 12 hour mode in Odroid-XU3 board.
>>
>> Two questions here:
>> 1. Earlier you mentioned S2MPS1[34], now Odroid XU3 which has S2MPS11.
>> Are you sure that this applies to all of them (S2MPS11, S2MPS13 and
>> S2MP14)? There are some minor differences between them so I would not be
>> surprised if only some of them required this action.
>>
>> 2. The driver operates in 24-hour omode. Actually it sets the 24-hour
>> mode just before your new regmap_update_bits() call. What do you mean by
>> 12-hour mode?
>>
>>> Signed-off-by: Joonyoung Shim <jy0922.shim@samsung.com>
>>> Cc: <stable@vger.kernel.org>
>>
>> Thanks for putting a cc-stable tag. How far this should be ported? If
>> this is needed only for S2MPS11 then v4.1. If all of them then probably
>> for earlier version?
>>
>> Best regards,
>> Krzysztof
> 
> One more doubt. On my Odroid XU3 first and consecutive executions
> (including first) of rtctest run fine. They pass. Can you describe
> exactly observable issue and how to reproduce it? This is also important
> as a reason for stable backport.

I just tested it on next-20150810 with Odroid-XU3 board. First rtctest
execution is blocked,

# ./rtctest 

                        RTC Driver Test Example.

Counting 5 update (1/sec) interrupts from reading /dev/rtc0:

Any no progress.

> 
> I tested it on next-20150729 on board with Hardkernel bootloader. Maybe
> the bootloader sets 12-hour mode which cannot be switched to 24-hour?
> 

My bootloader doesn't touch any registers of s5m-rtc.

Thanks.
