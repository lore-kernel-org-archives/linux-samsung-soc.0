From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: [PATCH v3 5/5] clk: samsung: exynos5433: add imem clocks
Date: Wed, 05 Dec 2018 18:25:29 +0100
Message-ID: <1952090c-5454-5802-23b1-0f8d618948ec@samsung.com>
References: <20181204165248.17572-1-k.konieczny@partner.samsung.com>
        <CGME20181204165318eucas1p2dccd5382ee8b9f4da8c3076fb56607ee@eucas1p2.samsung.com>
        <20181204165248.17572-6-k.konieczny@partner.samsung.com>
        <154394884525.88331.3007383362383800806@swboyd.mtv.corp.google.com>
        <3bb9f4b5-e069-79fe-6ab3-2750c6191e57@samsung.com>
        <154402608077.88331.684195407604647728@swboyd.mtv.corp.google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <154402608077.88331.684195407604647728@swboyd.mtv.corp.google.com>
Content-language: en-GB
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Boyd <sboyd@kernel.org>, k.konieczny@partner.samsung.com
Cc: linux-samsung-soc@vger.kernel.org, Chanwoo Choi <cw00.choi@samsung.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

On 12/5/18 17:08, Stephen Boyd wrote:
> Quoting Sylwester Nawrocki (2018-12-05 02:57:32)
>> On 12/4/18 19:40, Stephen Boyd wrote:
>>> Quoting Kamil Konieczny (2018-12-04 08:52:48)
>>>> +
>>>> +static const unsigned long imem_clk_regs[] __initconst = {
[...]
>>>> +};
>>>> +
>>>> +static const struct samsung_gate_clock imem_gate_clks[] __initconst = {
>>>> +       /* ENABLE_ACLK_IMEM */
>>>> +       GATE(CLK_ACLK_AXI2AHB_IMEMH, "aclk_axi2ahb_imemh", "aclk_imem_200",
>>>> +                       ENABLE_ACLK_IMEM, 24, 0, 0),
>>
>> I don't think that clock will ever need to be disabled/enabled, so I would
>> drop this definition. The clock will remain in its default state after reset
>> (enabled).
>>
>>>> +       GATE(CLK_ACLK_AXIDS_SROMC, "aclk_axids_sromc", "aclk_imem_200",
>>>> +                       ENABLE_ACLK_IMEM, 23, CLK_IGNORE_UNUSED, 0),
>>>
>>> Why is there so much use of CLK_IGNORE_UNUSED in this file?
>>
>> I suppose CLK_IGNORE_UNUSED is needed because there is no drivers that
>> would enable required clocks. For some clocks the flag could probably
>> indeed just be omitted, e.g. SLIMSSS clocks. 
>>
>> I'm inclined to just define clocks that we are confident about and which
>> are needed now. i.e. the SSS IP block clocks. So in include/dt-bindings/
>> clock/exynos5433.h we would have something like:
> 
> Agreed, it doesn't make much sense to add clk support for clks that
> you'll never need to modify one way or the other.
> 
>>  
>> +/* CMU_IMEM */
>> +#define CLK_ACLK_SSS                   1
>> +#define CLK_PCLK_SSS                   40
>>
>> +#define IMEM_NR_CLK                    41
>>
>> The other clocks could be added later as needed by someone who has 
>> detailed knowledge about respective peripheral blocks.
>>
> 
> The slow addition of new clks to the binding header file makes for an
> integration problem, so can we try to expose any clks that we know about
> now as defines and make them not work if the driver isn't implementing
> support for those clks? That way the binding is not changing but the
> implementation can decide to support or not support certain clks.

That makes a lot of sense to me. Then all we have to do now is to drop
some of the entries in the imem_gate_clks array above.

-- 
Regards,
Sylwester
