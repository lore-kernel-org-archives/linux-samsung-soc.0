From: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: Re: Arndale Timer Interrupt Question
Date: Thu, 09 Jan 2014 13:52:46 +0100
Message-ID: <1437466.9hkS4zH5MN@amdc1032>
References: <CAPUj1OM=Zn2nd98aXRCRUJrLknkS0o44V1BfuJhz5i19w+M5Ow@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <CAPUj1OM=Zn2nd98aXRCRUJrLknkS0o44V1BfuJhz5i19w+M5Ow@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Mj Embd <mj.embd@gmail.com>
Cc: linaro-kernel <linaro-kernel@lists.linaro.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, linux-samsung-soc@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org


added linux-samsung-soc to cc:,
it is a better suited list for this question

On Thursday, January 09, 2014 10:30:56 AM Mj Embd wrote:
> I am a bit confused on the interrupt number for CNTVIRQ..CNTHPIRQ. Can
> you please help here.
> 
> As per the exynos5 public manual
> What is the difference between  CPU_nCNTHPIRQ[0] and CNTHPIRQ.
> 
> While the later has an interrupt ID 26, the former is part of a group
> with combined interrupt id as 33 for core 0 and 54 for core 1.
> 
> For a timer interrupt which goes to PL2, which id should be used 26 or
> 33 for core 0 ?
> 
> Please clear this confusion.
> 
> Many Thanks
