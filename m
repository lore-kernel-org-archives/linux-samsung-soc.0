From: Chanwoo Choi <cwchoi00@gmail.com>
Subject: Re: [PATCH v3 10/10] clk: samsung: exynos5433: Add CLK_IGNORE_UNUSED
 flag to prevent the hang for suspend-to-ram
Date: Tue, 28 Apr 2015 18:28:38 +0900
Message-ID: <CAGTfZH3JPLeBgxoOmXU0OckcvFFPKiU_+PD5waQ_Ba_3G3L5bQ@mail.gmail.com>
References: <1430134597-14668-1-git-send-email-cw00.choi@samsung.com>
	<1430134597-14668-11-git-send-email-cw00.choi@samsung.com>
	<553F4FB2.9030201@samsung.com>
Reply-To: cw00.choi@samsung.com
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ie0-f172.google.com ([209.85.223.172]:35055 "EHLO
	mail-ie0-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S964803AbbD1J2j (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 28 Apr 2015 05:28:39 -0400
In-Reply-To: <553F4FB2.9030201@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc: Tomasz Figa <tomasz.figa@gmail.com>, Mike Turquette <mturquette@linaro.org>, Kukjin Kim <kgene@kernel.org>, "inki.dae@samsung.com" <inki.dae@samsung.com>, "chanho61.park@samsung.com" <chanho61.park@samsung.com>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, devicetree <devicetree@vger.kernel.org>, Jonghwa Lee <jonghwa3.lee@samsung.com>

Hi Sylwester,

On Tue, Apr 28, 2015 at 6:15 PM, Sylwester Nawrocki
<s.nawrocki@samsung.com> wrote:
> Hi Chanwoo,
>
> On 27/04/15 13:36, Chanwoo Choi wrote:
>> From: Jonghwa Lee <jonghwa3.lee@samsung.com>
>>
>> Some clocks are required being unmasked for suspend-to-ram. Otherwise,
>> PMU (Power Management Unit) will stick and power line never down.
>>
>> Signed-off-by: Jonghwa Lee <jonghwa3.lee@samsung.com>
>> Signed-off-by: Chanwoo Choi <cw00.choi@samsung.com>
>> ---
>
>> @@ -1718,11 +1722,14 @@ static struct samsung_gate_clock peric_gate_clks[] __initdata = {
>>       GATE(CLK_SCLK_SPI0, "sclk_spi0", "sclk_spi0_peric", ENABLE_SCLK_PERIC,
>>                       3, CLK_SET_RATE_PARENT, 0),
>>       GATE(CLK_SCLK_UART2, "sclk_uart2", "sclk_uart2_peric",
>> -                     ENABLE_SCLK_PERIC, 2, CLK_SET_RATE_PARENT, 0),
>> +                     ENABLE_SCLK_PERIC, 2,
>> +                     CLK_SET_RATE_PARENT | CLK_IGNORE_UNUSED, 0),
>>       GATE(CLK_SCLK_UART1, "sclk_uart1", "sclk_uart1_peric",
>> -                     ENABLE_SCLK_PERIC, 1, CLK_SET_RATE_PARENT, 0),
>> +                     ENABLE_SCLK_PERIC, 1,
>> +                     CLK_SET_RATE_PARENT | CLK_IGNORE_UNUSED, 0),
>>       GATE(CLK_SCLK_UART0, "sclk_uart0", "sclk_uart0_peric",
>> -                     ENABLE_SCLK_PERIC, 0, CLK_SET_RATE_PARENT, 0),
>> +                     ENABLE_SCLK_PERIC, 0,
>> +                     CLK_SET_RATE_PARENT | CLK_IGNORE_UNUSED, 0),
>>  };
>>
>>  static struct samsung_cmu_info peric_cmu_info __initdata = {
>> @@ -3025,7 +3032,7 @@ static struct samsung_gate_clock aud_gate_clks[] __initdata = {
>>
>>       /* ENABLE_SCLK_AUD0 */
>>       GATE(CLK_ATCLK_AUD, "atclk_aud", "div_atclk_aud", ENABLE_SCLK_AUD0,
>> -                     2, 0, 0),
>> +                     2, CLK_IGNORE_UNUSED, 0),
>>       GATE(CLK_PCLK_DBG_AUD, "pclk_dbg_aud", "div_pclk_dbg_aud",
>>                       ENABLE_SCLK_AUD0, 1, 0, 0),
>>       GATE(CLK_SCLK_AUD_CA5, "sclk_aud_ca5", "div_aud_ca5", ENABLE_SCLK_AUD0,
>> @@ -3425,9 +3432,11 @@ static struct samsung_gate_clock gscl_gate_clks[] __initdata = {
>>       GATE(CLK_ACLK_GSCLNP_111, "aclk_gsclnp_111", "mout_aclk_gscl_111_user",
>>                       ENABLE_ACLK_GSCL, 6, CLK_IGNORE_UNUSED, 0),
>>       GATE(CLK_ACLK_GSCLRTND_333, "aclk_gsclrtnd_333",
>> -                     "mout_aclk_gscl_333_user", ENABLE_ACLK_GSCL, 5, 0, 0),
>> +                     "mout_aclk_gscl_333_user", ENABLE_ACLK_GSCL, 5,
>> +                     CLK_IGNORE_UNUSED, 0),
>>       GATE(CLK_ACLK_GSCLBEND_333, "aclk_gsclbend_333",
>> -                     "mout_aclk_gscl_333_user", ENABLE_ACLK_GSCL, 4, 0, 0),
>> +                     "mout_aclk_gscl_333_user", ENABLE_ACLK_GSCL, 4,
>> +                     CLK_IGNORE_UNUSED, 0),
>
> Some of the clocks you are adding CLK_IGNORE_UNUSED flag for here are
> or will be handled be the related IP drivers, thus can be gated regardless
> of the changes done in this patch. I would suggest to register suspend/
> resume syscore ops like exynos5420_clk_syscore_ops and enable some of
> clocks you're touching in this patch explicitly in the suspend() callback
> and restore the registers state from before suspend() call in resume().

OK, I'll rework and send it.

>
> I've picked up patches 01/10...09/10.

Thanks.

> In future please also copy linux-clk@vger.kernel.org on clk related patches.

OK. I'll send clock patches to linux-clk@vger.kernel.org.

Best Regards,
Chanwoo Choi
