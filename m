From: Tomasz Figa <t.figa@samsung.com>
Subject: Re: Arndale Timer Interrupt Question
Date: Fri, 24 Jan 2014 14:46:38 +0100
Message-ID: <52E26EBE.8080905@samsung.com>
References: <CAPUj1OM=Zn2nd98aXRCRUJrLknkS0o44V1BfuJhz5i19w+M5Ow@mail.gmail.com>
 <1437466.9hkS4zH5MN@amdc1032> <52D02693.1040003@samsung.com>
 <CAPUj1OOvphUhLRO6jDRD4RRUFbYO_my=BZZ1gMJ6d_G9WUN4_w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:46721 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752481AbaAXNqz (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 24 Jan 2014 08:46:55 -0500
In-reply-to: <CAPUj1OOvphUhLRO6jDRD4RRUFbYO_my=BZZ1gMJ6d_G9WUN4_w@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Mj Embd <mj.embd@gmail.com>
Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, linaro-kernel <linaro-kernel@lists.linaro.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, linux-samsung-soc@vger.kernel.org



On 23.01.2014 07:10, Mj Embd wrote:
> On 1/10/14, Tomasz Figa <t.figa@samsung.com> wrote:
>> Hi,
>>
>> On 09.01.2014 13:52, Bartlomiej Zolnierkiewicz wrote:
>>>
>>> added linux-samsung-soc to cc:,
>>> it is a better suited list for this question
>>>
>>> On Thursday, January 09, 2014 10:30:56 AM Mj Embd wrote:
>>>> I am a bit confused on the interrupt number for CNTVIRQ..CNTHPIRQ. Can
>>>> you please help here.
>>>>
>>>> As per the exynos5 public manual
>>>> What is the difference between  CPU_nCNTHPIRQ[0] and CNTHPIRQ.
>>
>> I'm not sure if this is really what I think it is, but looking at the
>> manual, CPU_nCNTHPIRQ[0] and [1] SPI ports and CNTHPIRQ PPI port seem to
>> be the same signals, with the difference that the first two are shared
>> interrupts connected through the combiner, while the last one is a
>> per-processor interrupt, directly connected to GIC PPI port, allowing
>> each CPU to get its own CNTHPIRQ signal ([0] for CPU 0 and [1] for CPU 1).
>
> So while registering the IRQ which one has to be used Core0:26/33 Core1:26/54 ?

Well, it depends on your driver. If it supports per-CPU interrupts then 
you use CNTHPIRQ PPI port, othwerise nCNTHPIRQ[0] and [1] SPI ports.

Best regards,
Tomasz
