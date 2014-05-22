From: Tomasz Figa <t.figa@samsung.com>
Subject: Re: [PATCH 3/4] clk: samsung: Add driver to control CLKOUT line on
 Exynos SoCs
Date: Thu, 22 May 2014 14:32:33 +0200
Message-ID: <537DEE61.2050606@samsung.com>
References: <1400604211-9447-1-git-send-email-t.figa@samsung.com>
 <1400604211-9447-4-git-send-email-t.figa@samsung.com>
 <537D8788.8030904@linaro.org> <537DD2C0.4060802@samsung.com>
 <CAHbNUh2gkpV-rt6S+-bUmFvYAuK_HNoXfyOStwYe29sZMJonUw@mail.gmail.com>
 <537DE714.1090407@samsung.com> <537DECCE.8000301@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <537DECCE.8000301@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Sylwester Nawrocki <s.nawrocki@samsung.com>, Tushar Behera <tushar.behera@linaro.org>
Cc: linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, lkml <linux-kernel@vger.kernel.org>, devicetree <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Mike Turquette <mturquette@linaro.org>, Kukjin Kim <kgene.kim@samsung.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Pankaj Dubey <pankaj.dubey@samsung.com>, Rahul Sharma <rahul.sharma@samsung.com>, Mark Brown <broonie@kernel.org>, Tomasz Figa <tomasz.figa@gmail.com>
List-Id: linux-samsung-soc@vger.kernel.org



On 22.05.2014 14:25, Sylwester Nawrocki wrote:
> On 22/05/14 14:01, Tomasz Figa wrote:
>>>>>>>> [ ... ]
>>>>>>>>
>>>>>>>>>> +    clkout->clk_table[0] = clk_register_composite(NULL, "clkout",
>>>>>>>>>> +                            parent_names, parent_count, &clkout->mux.hw,
>>>>>>>>>> +                            &clk_mux_ops, NULL, NULL, &clkout->gate.hw,
>>>>>>>>>> +                            &clk_gate_ops, CLK_SET_RATE_PARENT
>>>>>>>>>> +                            | CLK_SET_RATE_NO_REPARENT);
>>>>>>>>
>>>>>>>> Would you please remove CLK_SET_RATE_NO_REPARENT flag from here? Let me
>>>>>>>> know if you have reservations against this.
>>>>>>
>>>>>> The problem with clock reparenting is that there are certain parent
>>>>>> clocks of CLKOUT, rate of which changes at runtime, e.g. clocks derived
>>>>>> from APLL or bus clocks, which can be reconfigured by cpufreq or devfreq.
>>>>>>
>>>>
>>>> +CC: Sylwester Nawrocki
>>>>
>>>> Okay. But in cases where there is only 1 valid parent clock provided
>>>> through DT (at the moment for Exynos5250/Exynos5420), would it be safe
>>>> to set that clock as the parent of CLKOUT?
>>
>> This is not something to rely on. I have simply omitted remaining CLKOUT
>> parents on Exynos 5 SoCs, as I don't have any board with them on which I
>> could test this. Eventually they will be added.
>>
>>>> Otherwise, this clock is
>>>> not usable ATM.
>>
>> On many boards it is already configured properly by the bootloader.
>> Although I don't see any reason why you couldn't reparent it in
>> (board-specific) sound card driver right now.
> 
> This would require passing the parent's clock specifier in 'clocks'
> property of the sound card device node, which I assume is not something
> we're generally expected to do in mainline. Although some drivers
> happen to be doing it already I think that's a bad example. It sounds
> like an abuse of the current clock bindings.

Well, an already board-specific driver might have some knowledge of the
SoC, so it might not be a huge problem, but I agree that this is not an
optimal solution.

Best regards,
Tomasz
