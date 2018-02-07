From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: [PATCH 2/3] clk: exynos5433: Allow audio subsystem clock rate
 propagation
Date: Wed, 07 Feb 2018 16:18:32 +0100
Message-ID: <3fcfad37-4c8f-7375-b2c2-5154607aa47a@samsung.com>
References: <20180205142230.9755-1-s.nawrocki@samsung.com>
        <CGME20180205142308epcas2p376f8656f7e421f8474938de788cea8db@epcas2p3.samsung.com>
        <20180205142230.9755-2-s.nawrocki@samsung.com>
        <5A7929C1.8040706@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:51788 "EHLO
        mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754138AbeBGPSk (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 7 Feb 2018 10:18:40 -0500
In-reply-to: <5A7929C1.8040706@samsung.com>
Content-language: en-GB
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Chanwoo Choi <cw00.choi@samsung.com>, linux-clk@vger.kernel.org
Cc: sboyd@codeaurora.org, mturquette@baylibre.com, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, b.zolnierkie@samsung.com, m.szyprowski@samsung.com

Hi Chanwoo,

On 02/06/2018 05:06 AM, Chanwoo Choi wrote:
>>  drivers/clk/samsung/clk-exynos5433.c | 22 +++++++++++-----------
>>  1 file changed, 11 insertions(+), 11 deletions(-)
>>
>> diff --git a/drivers/clk/samsung/clk-exynos5433.c b/drivers/clk/samsung/clk-exynos5433.c
>> index 74b70ddab4d6..d74361736e64 100644
>> --- a/drivers/clk/samsung/clk-exynos5433.c
>> +++ b/drivers/clk/samsung/clk-exynos5433.c
>> @@ -246,14 +246,14 @@ static const struct samsung_fixed_rate_clock top_fixed_clks[] __initconst = {
>>  
>>  static const struct samsung_mux_clock top_mux_clks[] __initconst = {
>>  	/* MUX_SEL_TOP0 */
>> -	MUX(CLK_MOUT_AUD_PLL, "mout_aud_pll", mout_aud_pll_p, MUX_SEL_TOP0,
>> -			4, 1),
>> +	MUX_F(CLK_MOUT_AUD_PLL, "mout_aud_pll", mout_aud_pll_p, MUX_SEL_TOP0,
>> +	      4, 1, CLK_SET_RATE_PARENT, 0),
>
> If you add CLK_SET_RATE_PARENT to 'mout_aud_pll' and mout_aud_pll changes the rate,
> fout_aud_pll's rate will be changed. But, fout_aud_pll is also the parent
> of 'mout_aud_pll_user'. It might change the rate of children of mout_aud_pll_user.
> mout_aud_pll_user would not want to change the parent's clock.
> 
>     fout_aud_pll                          2            2   196608009          0 0  
>        mout_aud_pll_user                  1            1   196608009          0 0  
>        mout_aud_pll                       0            0   196608009          0 0  

I'd say the range of changes is such that the consumers of the affected child 
clocks can cope and could adjust to the changed frequencies. Those consumer 
devices are all components/peripherals of the audio subsystem (LPASS) and, 
for example, in case of TM2 there is no issues at all with varying the AUD PLL
frequency depending on the HDMI audio sample rate. The other audio path uses
the audio CODEC's internal PLL as the root clock source. The AUD PLL frequency
will need to be adjusted somehow anyway, we could also get the PLL clock 
directly and set it's rate, instead of relying on that rate propagation 
algorithm.  I think we could also export a function from the exynos-lpass mfd 
driver for setting the PLL's rate directly, after listing the AUD PLL clock 
in the lpass DT node. That would be more flexible API, easier to adopt for 
various use cases/boards, now we have only TM2. I can't list the PLL clock 
in the sound node, that would not have passed the DT maintainters' review. 

-- 
Regards,
Sylwester
