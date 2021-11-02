Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA633C433F5
	for <linux-samsung-soc@archiver.kernel.org>; Tue,  2 Nov 2021 20:45:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C511D60F24
	for <linux-samsung-soc@archiver.kernel.org>; Tue,  2 Nov 2021 20:45:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230477AbhKBUr4 (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 2 Nov 2021 16:47:56 -0400
Received: from mxout03.lancloud.ru ([45.84.86.113]:43824 "EHLO
        mxout03.lancloud.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229813AbhKBUr4 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 2 Nov 2021 16:47:56 -0400
Received: from LanCloud
DKIM-Filter: OpenDKIM Filter v2.11.0 mxout03.lancloud.ru 464A120A4E8A
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
 <46d41d2b-4701-fb7f-9a0b-f4a35e59c3d3@omp.ru> <YYFDZb35RK+lWdgi@kroah.com>
From:   Sergey Shtylyov <s.shtylyov@omp.ru>
Organization: Open Mobile Platform
Message-ID: <c2b708d6-174b-65d6-7e41-c1d12f606110@omp.ru>
Date:   Tue, 2 Nov 2021 23:45:13 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <YYFDZb35RK+lWdgi@kroah.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [192.168.11.198]
X-ClientProxiedBy: LFEXT01.lancloud.ru (fd00:f066::141) To
 LFEX1907.lancloud.ru (fd00:f066::207)
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

HEllo!

On 11/2/21 4:55 PM, Greg Kroah-Hartman wrote:

[...]
>>>> If platform_get_irq() returns IRQ0 (considered invalid according to Linus)
>>>> the driver blithely passes it to usb_add_hcd() that treats IRQ0 as no IRQ
>>>> at all. Deny IRQ0 right away, returning -EINVAL from the probe() method...
>>>>
>>>> Fixes: 44ed240d6273 ("usb: host: ehci-exynos: Fix error check in exynos_ehci_probe()")
>>>> Signed-off-by: Sergey Shtylyov <s.shtylyov@omp.ru>
>>>> Acked-by: Alan Stern <stern@rowland.harvard.edu>
[...]

>>> Otherwise you
>>> will have to fix ALL callers, and people will always get it wrong.
>>> Fix the root cause here, don't paper it over.
>>
>>    As I have already told you, I won't have to do it as filtering out is only needed iff 0 is
>> used as an indication for something special. IRQ0 is still perfectly valid for request_irq()
>> and is even called by arch/{aplha|mips|x86}...

   "And the latter is called with 0 by", I meant to type... :-/
   The arguments I've heard for this ambiguity to continue were that IRQ0 is requested only with
setup_irq() (no longer true) and that these calls are confined to the arch code (still true).

> If it is valid, then why can it not be a valid irq for all of these
> drivers that you are changing here?  What is preventing them from  
> running on the platforms where 0 is a valid irq value?

   These drivers call usb_add_hcd() that only calls request_irq() (via usb_hcd_request_irqs())
if IRQ # is non-zero -- otherwise the driver is supposed to handle the interrupt itself (if it
needs one?) --thus calling usb_add_hcd() with IRQ0 results in non-working HCD without IRQs...
   (For libata, ata_host_activate() (called in the end of the driver's probe() methods) checks
if the 'irq' parameter is 0 early and in this case warns about the 'irq_handler' parameter being
non-NULL and calls ata_host_register() without registering the IRQ handler and expects the driver
to set the polling flag, thus if IRQ0 is passed from an (unsuspecting) ATA driver, one gets not
fully functional host driver).)

> thanks,
> 
> greg k-h

MBR, Sergey
