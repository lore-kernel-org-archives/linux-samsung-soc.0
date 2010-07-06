From: Darius Augulis <augulis.darius@gmail.com>
Subject: Re: S3C2416 fixes (gpiolib, SDHCI, compilation without FB device)
Date: Tue, 06 Jul 2010 20:02:52 +0300
Message-ID: <4C3361BC.2040204@gmail.com>
References: <1277212585-25605-1-git-send-email-jekhor@gmail.com> <4C248B23.7060905@gmail.com> <000001cb1687$638b2310$2aa16930$%szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ew0-f46.google.com ([209.85.215.46]:56260 "EHLO
	mail-ew0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752766Ab0GFRC6 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 6 Jul 2010 13:02:58 -0400
Received: by ewy23 with SMTP id 23so1890619ewy.19
        for <linux-samsung-soc@vger.kernel.org>; Tue, 06 Jul 2010 10:02:57 -0700 (PDT)
In-Reply-To: <000001cb1687$638b2310$2aa16930$%szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: 'Yauhen Kharuzhy' <jekhor@gmail.com>, 'Vasily Khoruzhick' <anarsoul@gmail.com>, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 'Ben Dooks' <ben-linux@fluff.org>

Hi,


On 06/28/2010 09:01 AM, Marek Szyprowski wrote:
> Hello,
>
> On Friday, June 25, 2010 12:56 PM Darius Augulis wrote:
>
>> On 06/22/2010 04:16 PM, Yauhen Kharuzhy wrote:
>>> This patch series fixes SDHCI on S3C2416. I got SD card working with this
>> patches
>>> and with patches for GPIO card detection support by Marek Szyprowski.
>>>
>>
>> Unfortunately I did not get SD card working with these patches. I'm
>> using custom board, not SMDK2416, but SD slot connection and schematics
>> are the same like in SMDK2416. I've tried to debug a bit this problem
>> and this is what I got: kernel do detection of card insert/remove,
>> driver prints messages:
>>
>> s3c-sdhci s3c-sdhci.1: card inserted.
>> s3c-sdhci s3c-sdhci.1: card removed.
>>
>> Then I put some printk in s3c-sdhci driver and MMC core and found that
>> mmc_rescan() is called only once at startup and no more when
>> inserting/removing SD card. Also mmc_rescan() stops at that point where
>> mmc_power_up() is called and does not return. And mmc_power_up() stops
>> where mmc_delay(10) is called and does not return too.
>> Every time when inserting/removing SD card only functions
>> sdhci_tasklet_card() and mmc_detect_change() are called, and nothing
>> happens. Kernel doesn't detect the card inserted.
>> Maybe this info could help to debug where the problem is - in my custom
>> board or in your patches?
>
> Have you tried with polled card detection method (SDHCI_CD_NONE)? If it
> doesn't work I suspect something with the hardware. Checking with mmc debug
> enabled might also help figuring this issue out.

yes, I've tried that, but didn't get sd card working. I got schematics 
from China manufacturer, SD card connection is the same like in 
smdk2416. with mmc debug enabled I found that SD card is detected when 
inserted or removed, but after detection card initialisation is not 
performed.

Darius.


>
> Best regards
> --
> Marek Szyprowski
> Samsung Poland R&D Center
>
>
