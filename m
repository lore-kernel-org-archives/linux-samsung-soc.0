From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [rtc-linux] [PATCH] rtc: s5m: fix to update ctrl register
Date: Thu, 13 Aug 2015 19:42:01 +0900
Message-ID: <55CC7479.6080902@samsung.com>
References: <1439455764-23526-1-git-send-email-jy0922.shim@samsung.com> <55CC6B28.5010707@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pa0-f44.google.com ([209.85.220.44]:35300 "EHLO
	mail-pa0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750912AbbHMKmI (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 13 Aug 2015 06:42:08 -0400
In-Reply-To: <55CC6B28.5010707@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: rtc-linux@googlegroups.com
Cc: linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org, a.zummo@towertech.it, alexandre.belloni@free-electrons.com, sbkim73@samsung.com, jy0922.shim@samsung.com

W dniu 13.08.2015 o 19:02, Krzysztof Kozlowski pisze:
> W dniu 13.08.2015 o 17:49, Joonyoung Shim pisze:
>> According to datasheet, the S2MPS13X and S2MPS14X should update write
>> buffer via setting WUDR bit to high after ctrl register is updated.
> 
> Hi,
> 
> I cannot find this information in S2MPS14 datasheet. On which page is it?
> 
> 
>>
>> If not, ALARM interrupt of rtc-s5m doesn't happen first time when i use
>> tools/testing/selftests/timers/rtctest.c test program and hour format is
>> used to 12 hour mode in Odroid-XU3 board.
> 
> Two questions here:
> 1. Earlier you mentioned S2MPS1[34], now Odroid XU3 which has S2MPS11.
> Are you sure that this applies to all of them (S2MPS11, S2MPS13 and
> S2MP14)? There are some minor differences between them so I would not be
> surprised if only some of them required this action.
> 
> 2. The driver operates in 24-hour omode. Actually it sets the 24-hour
> mode just before your new regmap_update_bits() call. What do you mean by
> 12-hour mode?
> 
>> Signed-off-by: Joonyoung Shim <jy0922.shim@samsung.com>
>> Cc: <stable@vger.kernel.org>
> 
> Thanks for putting a cc-stable tag. How far this should be ported? If
> this is needed only for S2MPS11 then v4.1. If all of them then probably
> for earlier version?
> 
> Best regards,
> Krzysztof

One more doubt. On my Odroid XU3 first and consecutive executions
(including first) of rtctest run fine. They pass. Can you describe
exactly observable issue and how to reproduce it? This is also important
as a reason for stable backport.

I tested it on next-20150729 on board with Hardkernel bootloader. Maybe
the bootloader sets 12-hour mode which cannot be switched to 24-hour?

Best regards,
Krzysztof
