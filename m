From: Lukasz Luba <l.luba@partner.samsung.com>
Subject: Re: [PATCH v1 03/50] clk: samsung: change parent of
 dout_aclk400_wcore in Exynos5420
Date: Thu, 18 Jul 2019 07:19:29 +0200
Message-ID: <9fa48351-80ae-7046-6795-c19d66c18810@partner.samsung.com>
References: <20190715124417.4787-1-l.luba@partner.samsung.com>
        <CGME20190715124436eucas1p28a581bc25f6dae52a5b9b1af26d26368@eucas1p2.samsung.com>
        <20190715124417.4787-4-l.luba@partner.samsung.com>
        <6d3361b5-9e1f-eb1a-aaa9-3ca15ed5ad1d@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <6d3361b5-9e1f-eb1a-aaa9-3ca15ed5ad1d@samsung.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Chanwoo Choi <cw00.choi@samsung.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org
Cc: mturquette@baylibre.com, sboyd@kernel.org, b.zolnierkie@samsung.com, krzk@kernel.org, kgene@kernel.org, mark.rutland@arm.com, robh+dt@kernel.org, kyungmin.park@samsung.com, a.hajda@samsung.com, m.szyprowski@samsung.com, s.nawrocki@samsung.com, myungjoo.ham@samsung.com
List-Id: linux-samsung-soc@vger.kernel.org

Hi Chanwoo,

On 7/16/19 11:13 AM, Chanwoo Choi wrote:
> On 19. 7. 15. 오후 9:43, Lukasz Luba wrote:
>> Change parent of dout_aclk400_wcore to mout_aclk400_wcore which reflects
>> topology described in the RM.
>>
>> Signed-off-by: Lukasz Luba <l.luba@partner.samsung.com>
>> ---
>>   drivers/clk/samsung/clk-exynos5420.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/clk/samsung/clk-exynos5420.c b/drivers/clk/samsung/clk-exynos5420.c
>> index d353870e7fda..361ee53fc9fc 100644
>> --- a/drivers/clk/samsung/clk-exynos5420.c
>> +++ b/drivers/clk/samsung/clk-exynos5420.c
>> @@ -577,7 +577,7 @@ static const struct samsung_mux_clock exynos5420_mux_clks[] __initconst = {
>>   
>>   static const struct samsung_div_clock exynos5420_div_clks[] __initconst = {
>>   	DIV(CLK_DOUT_ACLK400_WCORE, "dout_aclk400_wcore",
>> -			"mout_aclk400_wcore_bpll", DIV_TOP0, 16, 3),
>> +			"mout_aclk400_wcore", DIV_TOP0, 16, 3),
>>   };
>>   
>>   static const struct samsung_gate_clock exynos5420_gate_clks[] __initconst = {
>>
> 
> Acked-by: Chanwoo Choi <cw00.choi@samsung.com>
> 
> If possible, you better to send it to stable mailing list
> with Fixes information.
Thank you, I will do it when finish the v2.

Regards,
Lukasz
