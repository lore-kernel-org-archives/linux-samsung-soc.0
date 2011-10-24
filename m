From: Kukjin Kim <kgene.kim@samsung.com>
Subject: Re: [PATCH V3 0/4]: ARM: SAMSUNG: Add SPI clkdev support
Date: Mon, 24 Oct 2011 17:19:12 +0200
Message-ID: <4EA581F0.6000605@samsung.com>
References: <1318233789-19882-1-git-send-email-padma.v@samsung.com> <039c01cc8730$fb130750$f13915f0$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-bw0-f46.google.com ([209.85.214.46]:50222 "EHLO
	mail-bw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932873Ab1JXPTQ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 24 Oct 2011 11:19:16 -0400
Received: by bkbzt19 with SMTP id zt19so8318995bkb.19
        for <linux-samsung-soc@vger.kernel.org>; Mon, 24 Oct 2011 08:19:15 -0700 (PDT)
In-Reply-To: <039c01cc8730$fb130750$f13915f0$%kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: 'Padmavathi Venna' <padma.v@samsung.com>, padma.kvr@gmail.com, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, ben-linux@fluff.org, linux@arm.linux.org.uk

On 10/10/11 11:42, Kukjin Kim wrote:
> Padmavathi Venna wrote:
>>
>> This patchset modifies the existing clkdev to make SPI driver
>> independent of the clock names send from platform data. This
>> patches enables the SPI driver to request SPI bus clocks
>> using generic connection ID.
>>
>> V1 patch series are:
>> 	http://www.spinics.net/lists/arm-kernel/msg141671.html
>>
>> Changes since V1:
>> 	-Add newly introduced CLKDEV_INIT macro for creating clk_lookup
>> 	structure as suggested by Russell King
>> 	V2 patches series are:
>> 	http://www.spinics.net/lists/arm-kernel/msg142733.html
>>
>> Changes since V2:
>> 	-Reworked the patches as per the following link. Patch series in
>> 	the following link removed&  and , from the macro declaration and
> added
>> 	in the macro defination.
>> 	http://www.spinics.net/lists/arm-kernel/msg143663.html
>>
>> Padmavathi Venna (4):
>>    ARM: S3C64XX: Add SPI clkdev support
>>    ARM: S5PC100: Add SPI clkdev support
>>    ARM: S5P64X0: Add SPI clkdev support
>>    ARM: S5PV210: Add SPI clkdev support
>>
>>   arch/arm/mach-s3c64xx/clock.c         |   98 ++++++++++++++++--------
>>   arch/arm/mach-s5p64x0/clock-s5p6440.c |   57 +++++++++-----
>>   arch/arm/mach-s5p64x0/clock-s5p6450.c |   57 +++++++++-----
>>   arch/arm/mach-s5pc100/clock.c         |  132 ++++++++++++++++++++--------
>> -----
>>   arch/arm/mach-s5pv210/clock.c         |   58 ++++++++++-----
>>   5 files changed, 259 insertions(+), 143 deletions(-)
>>
>> --
>> 1.7.4.4
> Looks ok but this needs 'CLKDEV_INIT' patch. Please wait until it can be
> sent to upstream for this patch.
>
Padmavathi,

As I said, this looks ok and can be applied now.

Could you please rework this based on my next-samsung-dt branch which 
includes device tree patches so that I can apply this easily for v3.2?

If any problems, please let me know.

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
