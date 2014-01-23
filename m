From: Mj Embd <mj.embd@gmail.com>
Subject: Re: Arndale Timer Interrupt Question
Date: Thu, 23 Jan 2014 11:40:23 +0530
Message-ID: <CAPUj1OOvphUhLRO6jDRD4RRUFbYO_my=BZZ1gMJ6d_G9WUN4_w@mail.gmail.com>
References: <CAPUj1OM=Zn2nd98aXRCRUJrLknkS0o44V1BfuJhz5i19w+M5Ow@mail.gmail.com>
	<1437466.9hkS4zH5MN@amdc1032>
	<52D02693.1040003@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <52D02693.1040003@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Tomasz Figa <t.figa@samsung.com>
Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, linaro-kernel <linaro-kernel@lists.linaro.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, linux-samsung-soc@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

On 1/10/14, Tomasz Figa <t.figa@samsung.com> wrote:
> Hi,
>
> On 09.01.2014 13:52, Bartlomiej Zolnierkiewicz wrote:
>>
>> added linux-samsung-soc to cc:,
>> it is a better suited list for this question
>>
>> On Thursday, January 09, 2014 10:30:56 AM Mj Embd wrote:
>>> I am a bit confused on the interrupt number for CNTVIRQ..CNTHPIRQ. Can
>>> you please help here.
>>>
>>> As per the exynos5 public manual
>>> What is the difference between  CPU_nCNTHPIRQ[0] and CNTHPIRQ.
>
> I'm not sure if this is really what I think it is, but looking at the
> manual, CPU_nCNTHPIRQ[0] and [1] SPI ports and CNTHPIRQ PPI port seem to
> be the same signals, with the difference that the first two are shared
> interrupts connected through the combiner, while the last one is a
> per-processor interrupt, directly connected to GIC PPI port, allowing
> each CPU to get its own CNTHPIRQ signal ([0] for CPU 0 and [1] for CPU 1).

So while registering the IRQ which one has to be used Core0:26/33 Core1:26/54 ?

> Best regards,
> Tomasz
>
>>>
>>> While the later has an interrupt ID 26, the former is part of a group
>>> with combined interrupt id as 33 for core 0 and 54 for core 1.
>>>
>>> For a timer interrupt which goes to PL2, which id should be used 26 or
>>> 33 for core 0 ?
>>>
>>> Please clear this confusion.
>>>
>>> Many Thanks
>>
>> --
>> To unsubscribe from this list: send the line "unsubscribe
>> linux-samsung-soc" in
>> the body of a message to majordomo@vger.kernel.org
>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>>
>


-- 
-mj
