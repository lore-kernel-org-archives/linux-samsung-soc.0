From: Chanwoo Choi <cw00.choi@samsung.com>
Subject: Re: [PATCH 2/3] clk: exynos5433: Allow audio subsystem clock rate
 propagation
Date: Tue, 13 Feb 2018 06:44:58 +0900
Message-ID: <5A820ADA.8000403@samsung.com>
References: <20180205142230.9755-1-s.nawrocki@samsung.com>
        <CGME20180205142308epcas2p376f8656f7e421f8474938de788cea8db@epcas2p3.samsung.com>
        <20180205142230.9755-2-s.nawrocki@samsung.com>
        <5A7929C1.8040706@samsung.com>
        <3fcfad37-4c8f-7375-b2c2-5154607aa47a@samsung.com>
        <5A7D4F92.100@samsung.com>
        <e0d88ac2-439b-8e6e-af32-310b53ca0693@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:27440 "EHLO
        mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932204AbeBLVo7 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 12 Feb 2018 16:44:59 -0500
In-reply-to: <e0d88ac2-439b-8e6e-af32-310b53ca0693@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sylwester Nawrocki <s.nawrocki@samsung.com>, linux-clk@vger.kernel.org
Cc: sboyd@codeaurora.org, mturquette@baylibre.com, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, b.zolnierkie@samsung.com, m.szyprowski@samsung.com

Hi Sylwester,

On 2018년 02월 12일 20:45, Sylwester Nawrocki wrote:
> Hi Chanwoo,
> 
> On 02/09/2018 08:36 AM, Chanwoo Choi wrote:
>> On 2018년 02월 08일 00:18, Sylwester Nawrocki wrote:
>>> On 02/06/2018 05:06 AM, Chanwoo Choi wrote:
>>>>>  drivers/clk/samsung/clk-exynos5433.c | 22 +++++++++++-----------
>>>>>  1 file changed, 11 insertions(+), 11 deletions(-)
>>>>>
>>>>> diff --git a/drivers/clk/samsung/clk-exynos5433.c b/drivers/clk/samsung/clk-exynos5433.c
>>>>> index 74b70ddab4d6..d74361736e64 100644
>>>>> --- a/drivers/clk/samsung/clk-exynos5433.c
>>>>> +++ b/drivers/clk/samsung/clk-exynos5433.c
>>>>> @@ -246,14 +246,14 @@ static const struct samsung_fixed_rate_clock top_fixed_clks[] __initconst = {
>>>>>  
>>>>>  static const struct samsung_mux_clock top_mux_clks[] __initconst = {
>>>>>  	/* MUX_SEL_TOP0 */
>>>>> -	MUX(CLK_MOUT_AUD_PLL, "mout_aud_pll", mout_aud_pll_p, MUX_SEL_TOP0,
>>>>> -			4, 1),
>>>>> +	MUX_F(CLK_MOUT_AUD_PLL, "mout_aud_pll", mout_aud_pll_p, MUX_SEL_TOP0,
>>>>> +	      4, 1, CLK_SET_RATE_PARENT, 0),
>>>> If you add CLK_SET_RATE_PARENT to 'mout_aud_pll' and mout_aud_pll changes the rate,
>>>> fout_aud_pll's rate will be changed. But, fout_aud_pll is also the parent
>>>> of 'mout_aud_pll_user'. It might change the rate of children of mout_aud_pll_user.
>>>> mout_aud_pll_user would not want to change the parent's clock.
>>>>
>>>>     fout_aud_pll                          2            2   196608009          0 0  
>>>>        mout_aud_pll_user                  1            1   196608009          0 0  
>>>>        mout_aud_pll                       0            0   196608009          0 0  
>>> I'd say the range of changes is such that the consumers of the affected child 
>>> clocks can cope and could adjust to the changed frequencies. Those consumer 
>>> devices are all components/peripherals of the audio subsystem (LPASS) and, 
>>
>> The mout_aud_pll_user has the child clock of serial_3.
>> serial_3 was used for bluetooth on TM2. If you change the aud_pll
>> with CLK_SET_RATE_PARENT, it might affect the bluetooth operation.
>> The bluetooth is only used for transfering the data.
>>
>> Actually, I'm not sure that this patch might affect bluetooth operation or not.
> 
> You are right, the AUD PLL frequency adjustments would break the bluetooth's 
> operation. I double checked and in the downstream kernel only one AUD PLL 
> frequency can be set - 196608009. So I will drop this patch and add just
> a single PLL_36XX_RATE() entry for that frequency, the PMS values have been
> confirmed by the HW team. Only 48000/9600/192000 sample rates will then be 
> supported natively and others could be through software rate conversion.
> 

OK. Thanks for your check.

-- 
Best Regards,
Chanwoo Choi
Samsung Electronics
