From: Alim Akhtar <alim.akhtar@gmail.com>
Subject: Re: [PATCH 4/4] clk: samsung: exynos7: correct nr_clk_ids for fsys1
Date: Tue, 25 Aug 2015 21:32:58 +0530
Message-ID: <CAGOxZ53L-nJvtjjorueYgAVz_sNC4-b6vPSQciPnTSvxK553Zw@mail.gmail.com>
References: <1440414356-1805-1-git-send-email-alim.akhtar@samsung.com>
 <1440414356-1805-5-git-send-email-alim.akhtar@samsung.com> <55DC16AA.9030900@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-io0-f179.google.com ([209.85.223.179]:33778 "EHLO
	mail-io0-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751816AbbHYQDi (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 25 Aug 2015 12:03:38 -0400
Received: by iods203 with SMTP id s203so192152164iod.0
        for <linux-samsung-soc@vger.kernel.org>; Tue, 25 Aug 2015 09:03:37 -0700 (PDT)
In-Reply-To: <55DC16AA.9030900@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Cc: Alim Akhtar <alim.akhtar@samsung.com>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Tomasz Figa <tomasz.figa@gmail.com>, kgene <kgene@kernel.org>, mturquette@baylibre.com, "amit.daniel@samsung.com" <amit.daniel@samsung.com>

Hello Krzysztof,

On Tue, Aug 25, 2015 at 12:48 PM, Krzysztof Kozlowski
<k.kozlowski@samsung.com> wrote:
> On 24.08.2015 20:05, Alim Akhtar wrote:
>> nr_clk_ids for FSYS1 block is wrongly set as TOP1 block,
>> this patch correct the same.
> s/correct the same/corrects it/
>
will update
> Reviewed-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
>
Thanks!
> Best regards,
> Krzysztof
>
>
>>
>> Signed-off-by: Alim Akhtar <alim.akhtar@samsung.com>
>> ---
>>  drivers/clk/samsung/clk-exynos7.c |    2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/clk/samsung/clk-exynos7.c b/drivers/clk/samsung/clk-exynos7.c
>> index 2799568..0d7bb7c 100644
>> --- a/drivers/clk/samsung/clk-exynos7.c
>> +++ b/drivers/clk/samsung/clk-exynos7.c
>> @@ -938,7 +938,7 @@ static struct samsung_cmu_info fsys1_cmu_info __initdata = {
>>       .nr_mux_clks            = ARRAY_SIZE(fsys1_mux_clks),
>>       .gate_clks              = fsys1_gate_clks,
>>       .nr_gate_clks           = ARRAY_SIZE(fsys1_gate_clks),
>> -     .nr_clk_ids             = TOP1_NR_CLK,
>> +     .nr_clk_ids             = FSYS1_NR_CLK,
>>       .clk_regs               = fsys1_clk_regs,
>>       .nr_clk_regs            = ARRAY_SIZE(fsys1_clk_regs),
>>  };
>>
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsung-soc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html



-- 
Regards,
Alim
