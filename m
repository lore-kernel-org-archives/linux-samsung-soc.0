From: Tomasz Figa <t.figa@samsung.com>
Subject: Re: Arndale Timer Interrupt Question
Date: Fri, 10 Jan 2014 17:57:55 +0100
Message-ID: <52D02693.1040003@samsung.com>
References: <CAPUj1OM=Zn2nd98aXRCRUJrLknkS0o44V1BfuJhz5i19w+M5Ow@mail.gmail.com>
 <1437466.9hkS4zH5MN@amdc1032>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:43301 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751311AbaAJQ6E (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 10 Jan 2014 11:58:04 -0500
In-reply-to: <1437466.9hkS4zH5MN@amdc1032>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Mj Embd <mj.embd@gmail.com>
Cc: linaro-kernel <linaro-kernel@lists.linaro.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, linux-samsung-soc@vger.kernel.org

Hi,

On 09.01.2014 13:52, Bartlomiej Zolnierkiewicz wrote:
>
> added linux-samsung-soc to cc:,
> it is a better suited list for this question
>
> On Thursday, January 09, 2014 10:30:56 AM Mj Embd wrote:
>> I am a bit confused on the interrupt number for CNTVIRQ..CNTHPIRQ. Can
>> you please help here.
>>
>> As per the exynos5 public manual
>> What is the difference between  CPU_nCNTHPIRQ[0] and CNTHPIRQ.

I'm not sure if this is really what I think it is, but looking at the 
manual, CPU_nCNTHPIRQ[0] and [1] SPI ports and CNTHPIRQ PPI port seem to 
be the same signals, with the difference that the first two are shared 
interrupts connected through the combiner, while the last one is a 
per-processor interrupt, directly connected to GIC PPI port, allowing 
each CPU to get its own CNTHPIRQ signal ([0] for CPU 0 and [1] for CPU 1).

Best regards,
Tomasz

>>
>> While the later has an interrupt ID 26, the former is part of a group
>> with combined interrupt id as 33 for core 0 and 54 for core 1.
>>
>> For a timer interrupt which goes to PL2, which id should be used 26 or
>> 33 for core 0 ?
>>
>> Please clear this confusion.
>>
>> Many Thanks
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsung-soc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
