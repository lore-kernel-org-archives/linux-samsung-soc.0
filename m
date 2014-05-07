From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: Re: [PATCH v2 1/2] ARM: EXYNOS: Map SYSRAM through generic SRAM bindings
Date: Wed, 7 May 2014 09:35:20 +0530
Message-ID: <CAK9yfHwXC1rc71-GiP3JxF2hpQGkA-GVv-1=MT9+GsA+Vq3o4w@mail.gmail.com>
References: <1399363824-23543-1-git-send-email-sachin.kamat@linaro.org>
	<53691187.80101@gmail.com>
	<CAK9yfHz6PVT2C-TZkFHqtdj4rT-R8w+aU=jTTnLMF5k4JOXGxg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ob0-f176.google.com ([209.85.214.176]:32814 "EHLO
	mail-ob0-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750900AbaEGEFV (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 7 May 2014 00:05:21 -0400
Received: by mail-ob0-f176.google.com with SMTP id wo20so512796obc.21
        for <linux-samsung-soc@vger.kernel.org>; Tue, 06 May 2014 21:05:20 -0700 (PDT)
In-Reply-To: <CAK9yfHz6PVT2C-TZkFHqtdj4rT-R8w+aU=jTTnLMF5k4JOXGxg@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <tomasz.figa@gmail.com>
Cc: linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>, Tomasz Figa <t.figa@samsung.com>, Kukjin Kim <kgene.kim@samsung.com>, Arnd Bergmann <arnd@arndb.de>, =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>

Hi Tomasz,

On 6 May 2014 23:39, Sachin Kamat <sachin.kamat@linaro.org> wrote:
> Hi Tomasz,
>
> On 6 May 2014 22:14, Tomasz Figa <tomasz.figa@gmail.com> wrote:
>> Hi Sachin,
>>
>> Thanks for addressing the comments. I need to verify few things on Universal
>> C210 board first, before I could give my Reviewed-by tag or further
>> comments.
>>
>> I also have some general comments that I missed before, due to limited time
>> for review. Please see inline.
>
> Thanks for your review.
>
>>
>>
>> On 06.05.2014 10:10, Sachin Kamat wrote:
>>>
>>> Instead of hardcoding the SYSRAM details for each SoC,
>>> pass this information through device tree (DT) and make
>>> the code SoC agnostic. Generic SRAM bindings are used
>>> for achieving this.
>>>
>>> Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
>>> Acked-by: Arnd Bergmann <arnd@arndb.de>
>>> Acked-by: Heiko Stuebner <heiko@sntech.de>
>>> ---
[snip]

>>>
>>>   static int exynos_set_cpu_boot_addr(int cpu, unsigned long boot_addr)
>>>   {
>>> -       void __iomem *boot_reg = S5P_VA_SYSRAM_NS + 0x1c + 4*cpu;
>>> +       void __iomem *boot_reg;
>>> +
>>> +       if (!sram_ns_base_addr)
>>> +               return 0;
>>
>>
>> Shouldn't this return an error instead? I'm not sure which one would be
>> appropriate, though, probably one of -ENODEV, -ENXIO or -EFAULT.
>
> IIRC, returning error here causes the system to hang and even primary
> cpu does not boot.
> Since any error or absence of sram nodes should atleast boot the
> primary CPU, I thought
> this is better.

Small correction. The above explanation was for the absence of the check.
Sorry about the confusion. Will add -ENODEV here.

-- 
With warm regards,
Sachin
