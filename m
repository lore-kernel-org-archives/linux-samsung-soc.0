From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: [PATCH v3 5/5] clk: samsung: exynos5433: add imem clocks
Date: Wed, 05 Dec 2018 11:57:32 +0100
Message-ID: <3bb9f4b5-e069-79fe-6ab3-2750c6191e57@samsung.com>
References: <20181204165248.17572-1-k.konieczny@partner.samsung.com>
        <CGME20181204165318eucas1p2dccd5382ee8b9f4da8c3076fb56607ee@eucas1p2.samsung.com>
        <20181204165248.17572-6-k.konieczny@partner.samsung.com>
        <154394884525.88331.3007383362383800806@swboyd.mtv.corp.google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <154394884525.88331.3007383362383800806@swboyd.mtv.corp.google.com>
Content-language: en-GB
Sender: linux-kernel-owner@vger.kernel.org
Cc: Stephen Boyd <sboyd@kernel.org>, k.konieczny@partner.samsung.com, linux-samsung-soc@vger.kernel.org, Chanwoo Choi <cw00.choi@samsung.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

On 12/4/18 19:40, Stephen Boyd wrote:
> Quoting Kamil Konieczny (2018-12-04 08:52:48)
>> +
>> +static const unsigned long imem_clk_regs[] __initconst = {
>> +       ENABLE_ACLK_IMEM,
>> +       ENABLE_ACLK_IMEM_INT_MEM,
>> +       ENABLE_ACLK_IMEM_SSS,
>> +       ENABLE_ACLK_IMEM_SLIMSSS,
>> +       ENABLE_ACLK_IMEM_RTIC,
>> +       ENABLE_ACLK_IMEM_SMMU_SSS,
>> +       ENABLE_ACLK_IMEM_SMMU_SLIMSSS,
>> +       ENABLE_ACLK_IMEM_SMMU_RTIC,
>> +       ENABLE_ACLK_IMEM_ARBG_TX,
>> +       ENABLE_ACLK_IMEM_SMMU_ARBG_TX,
>> +       ENABLE_PCLK_IMEM,
>> +       ENABLE_PCLK_IMEM_SSS,
>> +       ENABLE_PCLK_IMEM_SLIMSSS,
>> +       ENABLE_PCLK_IMEM_RTIC,
>> +       ENABLE_PCLK_IMEM_SMMU_SSS,
>> +       ENABLE_PCLK_IMEM_SMMU_SLIMSSS,
>> +       ENABLE_PCLK_IMEM_SMMU_RTIC,
>> +       ENABLE_PCLK_IMEM_SMMU_ARGB_TX,
>> +};
>> +
>> +static const struct samsung_gate_clock imem_gate_clks[] __initconst = {
>> +       /* ENABLE_ACLK_IMEM */
>> +       GATE(CLK_ACLK_AXI2AHB_IMEMH, "aclk_axi2ahb_imemh", "aclk_imem_200",
>> +                       ENABLE_ACLK_IMEM, 24, 0, 0),

I don't think that clock will ever need to be disabled/enabled, so I would
drop this definition. The clock will remain in its default state after reset
(enabled).

>> +       GATE(CLK_ACLK_AXIDS_SROMC, "aclk_axids_sromc", "aclk_imem_200",
>> +                       ENABLE_ACLK_IMEM, 23, CLK_IGNORE_UNUSED, 0),
> 
> Why is there so much use of CLK_IGNORE_UNUSED in this file?

I suppose CLK_IGNORE_UNUSED is needed because there is no drivers that
would enable required clocks. For some clocks the flag could probably
indeed just be omitted, e.g. SLIMSSS clocks. 

I'm inclined to just define clocks that we are confident about and which
are needed now. i.e. the SSS IP block clocks. So in include/dt-bindings/
clock/exynos5433.h we would have something like:
 
+/* CMU_IMEM */
+#define CLK_ACLK_SSS			1
+#define CLK_PCLK_SSS			40

+#define IMEM_NR_CLK			41

The other clocks could be added later as needed by someone who has 
detailed knowledge about respective peripheral blocks.

-- 
Regards,
Sylwester
