From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: Re: [PATCH 1/5] clk: exynos4: Add additional G2D clocks
Date: Mon, 27 May 2013 17:30:43 +0530
Message-ID: <CAK9yfHyDg52QMXv7LZMdJHz9idCTV6bGOntgdfN2e6JFBWca7w@mail.gmail.com>
References: <1366283719-9615-1-git-send-email-sachin.kamat@linaro.org>
	<20130418165945.22729.42434@quantum>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-oa0-f48.google.com ([209.85.219.48]:34928 "EHLO
	mail-oa0-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755498Ab3E0MAo (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 27 May 2013 08:00:44 -0400
Received: by mail-oa0-f48.google.com with SMTP id i4so8492031oah.7
        for <linux-samsung-soc@vger.kernel.org>; Mon, 27 May 2013 05:00:43 -0700 (PDT)
In-Reply-To: <20130418165945.22729.42434@quantum>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org

Hi Kukjin,

Can you please apply this series pending since a long time.


On 18 April 2013 22:29, Mike Turquette <mturquette@linaro.org> wrote:
> Quoting Sachin Kamat (2013-04-18 04:15:15)
>> Add G2D clocks for Exynos4x12 SoC and sclk_fimg2d required by G2D
>> IP.
>>
>> Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
>> Cc: Thomas Abraham <thomas.abraham@linaro.org>
>> Cc: Mike Turquette <mturquette@linaro.org>
>
> Acked-by: Mike Turquette <mturquette@linaro.org>
>
>> ---
>>  .../devicetree/bindings/clock/exynos4-clock.txt    |    3 ++-
>>  drivers/clk/samsung/clk-exynos4.c                  |    9 +++++++--
>>  2 files changed, 9 insertions(+), 3 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/clock/exynos4-clock.txt b/Documentation/devicetree/bindings/clock/exynos4-clock.txt
>> index ea5e26f..14d5c2a 100644
>> --- a/Documentation/devicetree/bindings/clock/exynos4-clock.txt
>> +++ b/Documentation/devicetree/bindings/clock/exynos4-clock.txt
>> @@ -102,6 +102,7 @@ Exynos4 SoC and this is specified where applicable.
>>    sclk_spi0_isp       174     Exynos4x12
>>    sclk_spi1_isp       175     Exynos4x12
>>    sclk_uart_isp       176     Exynos4x12
>> +  sclk_fimg2d         177
>>
>>               [Peripheral Clock Gates]
>>
>> @@ -129,7 +130,7 @@ Exynos4 SoC and this is specified where applicable.
>>    smmu_mfcl           274
>>    smmu_mfcr           275
>>    g3d                 276
>> -  g2d                 277     Exynos4210
>> +  g2d                 277
>>    rotator             278     Exynos4210
>>    mdma                279     Exynos4210
>>    smmu_g2d            280     Exynos4210
>> diff --git a/drivers/clk/samsung/clk-exynos4.c b/drivers/clk/samsung/clk-exynos4.c
>> index 26f2a85..09cf161 100644
>> --- a/drivers/clk/samsung/clk-exynos4.c
>> +++ b/drivers/clk/samsung/clk-exynos4.c
>> @@ -152,7 +152,7 @@ enum exynos4_clks {
>>         sclk_audio1, sclk_audio2, sclk_spdif, sclk_spi0, sclk_spi1, sclk_spi2,
>>         sclk_slimbus, sclk_fimd1, sclk_mipi1, sclk_pcm1, sclk_pcm2, sclk_i2s1,
>>         sclk_i2s2, sclk_mipihsi, sclk_mfc, sclk_pcm0, sclk_g3d, sclk_pwm_isp,
>> -       sclk_spi0_isp, sclk_spi1_isp, sclk_uart_isp,
>> +       sclk_spi0_isp, sclk_spi1_isp, sclk_uart_isp, sclk_fimg2d,
>>
>>         /* gate clocks */
>>         fimc0 = 256, fimc1, fimc2, fimc3, csis0, csis1, jpeg, smmu_fimc0,
>> @@ -487,6 +487,9 @@ static struct samsung_mux_clock exynos4x12_mux_clks[] __initdata = {
>>         MUX(none, "mout_spi0_isp", group1_p4x12, E4X12_SRC_ISP, 4, 4),
>>         MUX(none, "mout_spi1_isp", group1_p4x12, E4X12_SRC_ISP, 8, 4),
>>         MUX(none, "mout_uart_isp", group1_p4x12, E4X12_SRC_ISP, 12, 4),
>> +       MUX(none, "mout_g2d0", sclk_ampll_p4210, SRC_DMC, 20, 1),
>> +       MUX(none, "mout_g2d1", sclk_evpll_p, SRC_DMC, 24, 1),
>> +       MUX(none, "mout_g2d", mout_g2d_p, SRC_DMC, 28, 1),
>>  };
>>
>>  /* list of divider clocks supported in all exynos4 soc's */
>> @@ -555,7 +558,7 @@ static struct samsung_div_clock exynos4_div_clks[] __initdata = {
>>  /* list of divider clocks supported in exynos4210 soc */
>>  static struct samsung_div_clock exynos4210_div_clks[] __initdata = {
>>         DIV(aclk200, "aclk200", "mout_aclk200", DIV_TOP, 0, 3),
>> -       DIV(none, "div_g2d", "mout_g2d", DIV_IMAGE, 0, 4),
>> +       DIV(sclk_fimg2d, "sclk_fimg2d", "mout_g2d", DIV_IMAGE, 0, 4),
>>         DIV(none, "div_fimd1", "mout_fimd1", E4210_DIV_LCD1, 0, 4),
>>         DIV(none, "div_mipi1", "mout_mipi1", E4210_DIV_LCD1, 16, 4),
>>         DIV(none, "div_sata", "mout_sata", DIV_FSYS0, 20, 4),
>> @@ -585,6 +588,7 @@ static struct samsung_div_clock exynos4x12_div_clks[] __initdata = {
>>         DIV(none, "div_mpwm", "div_isp1", E4X12_DIV_ISP1, 0, 3),
>>         DIV(div_mcuisp0, "div_mcuisp0", "aclk400_mcuisp", E4X12_DIV_ISP1, 4, 3),
>>         DIV(div_mcuisp1, "div_mcuisp1", "div_mcuisp0", E4X12_DIV_ISP1, 8, 3),
>> +       DIV(sclk_fimg2d, "sclk_fimg2d", "mout_g2d", DIV_DMC1, 0, 4),
>>  };
>>
>>  /* list of gate clocks supported in all exynos4 soc's */
>> @@ -910,6 +914,7 @@ static struct samsung_gate_clock exynos4x12_gate_clks[] __initdata = {
>>                         CLK_IGNORE_UNUSED, 0),
>>         GATE(spi1_isp, "spi1_isp", "aclk200", E4X12_GATE_ISP1, 13,
>>                         CLK_IGNORE_UNUSED, 0),
>> +       GATE(g2d, "g2d", "aclk200", GATE_IP_DMC, 23, 0, 0),
>>  };
>>
>>  #ifdef CONFIG_OF
>> --
>> 1.7.9.5



-- 
With warm regards,
Sachin
