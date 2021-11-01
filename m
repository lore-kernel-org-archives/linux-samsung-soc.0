Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4C95C433F5
	for <linux-samsung-soc@archiver.kernel.org>; Mon,  1 Nov 2021 20:39:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A994161051
	for <linux-samsung-soc@archiver.kernel.org>; Mon,  1 Nov 2021 20:39:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229712AbhKAUlz (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 1 Nov 2021 16:41:55 -0400
Received: from mxout03.lancloud.ru ([45.84.86.113]:50146 "EHLO
        mxout03.lancloud.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230246AbhKAUlu (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 1 Nov 2021 16:41:50 -0400
Received: from LanCloud
DKIM-Filter: OpenDKIM Filter v2.11.0 mxout03.lancloud.ru A0A0320A6A22
Received: from LanCloud
Received: from LanCloud
Received: from LanCloud
Subject: Re: [PATCH v2 01/22] usb: host: ehci-exynos: deny IRQ0
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC:     <linux-usb@vger.kernel.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-samsung-soc@vger.kernel.org>
References: <20211026173943.6829-1-s.shtylyov@omp.ru>
 <20211026173943.6829-2-s.shtylyov@omp.ru> <YX0IQ/boUgVseZvS@kroah.com>
From:   Sergey Shtylyov <s.shtylyov@omp.ru>
Organization: Open Mobile Platform
Message-ID: <46d41d2b-4701-fb7f-9a0b-f4a35e59c3d3@omp.ru>
Date:   Mon, 1 Nov 2021 23:39:13 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <YX0IQ/boUgVseZvS@kroah.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [192.168.11.198]
X-ClientProxiedBy: LFEXT02.lancloud.ru (fd00:f066::142) To
 LFEX1907.lancloud.ru (fd00:f066::207)
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Hello!

On 10/30/21 11:54 AM, Greg Kroah-Hartman wrote:

>> If platform_get_irq() returns IRQ0 (considered invalid according to Linus)
>> the driver blithely passes it to usb_add_hcd() that treats IRQ0 as no IRQ
>> at all. Deny IRQ0 right away, returning -EINVAL from the probe() method...
>>
>> Fixes: 44ed240d6273 ("usb: host: ehci-exynos: Fix error check in exynos_ehci_probe()")
>> Signed-off-by: Sergey Shtylyov <s.shtylyov@omp.ru>
>> Acked-by: Alan Stern <stern@rowland.harvard.edu>
>> ---
>> Changes in version 2:
>> - added Alan's ACK.
>>
>>  drivers/usb/host/ehci-exynos.c | 4 ++++
>>  1 file changed, 4 insertions(+)
>>
>> diff --git a/drivers/usb/host/ehci-exynos.c b/drivers/usb/host/ehci-exynos.c
>> index 1a9b7572e17f..ff4e1261801a 100644
>> --- a/drivers/usb/host/ehci-exynos.c
>> +++ b/drivers/usb/host/ehci-exynos.c
>> @@ -207,6 +207,10 @@ static int exynos_ehci_probe(struct platform_device *pdev)
>>  		err = irq;
>>  		goto fail_io;
>>  	}
>> +	if (!irq) {
>> +		err = -EINVAL;
>> +		goto fail_io;
>> +	}
> 
> This is a huge sign that the api being used here is broken.

   And you're telling me that after I've wasted  time on v2? :-( Well, at least the series had
couple blunders, so it couldn't merged for 5.16-rc1 anyway (not sure why these weren't detected
in v1).

> Please fix the root cause here, if returning a 0 is an error, then have
> the function you called to get this irq return an error.

   Well, technically not, although that doesn't match the kernel-doc for the function now.
I only don't understand why returning IRQ0 hasn't been replaced still...

> Otherwise you
> will have to fix ALL callers, and people will always get it wrong.
> Fix the root cause here, don't paper it over.

   As I have already told you, I won't have to do it as filtering out is only needed iff 0 is
used as an indication for something special. IRQ0 is still perfectly valid for request_irq()
and is even called by arch/{aplha|mips|x86}...

> thanks,
> 
> greg k-h

MBR, Sergey
