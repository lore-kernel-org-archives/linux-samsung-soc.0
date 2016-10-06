From: Markus Reichl <m.reichl@fivetechno.de>
Subject: Re: Problem: "clk: max77686: Migrate to clk_hw based OF and
 registration APIs" breaks s3c-rtc on Odroid U3
Date: Thu, 6 Oct 2016 15:59:48 +0200
Message-ID: <ebf78227-c0d2-d268-298b-1c952c434023@fivetechno.de>
References: <29925ac0-3c97-df1d-0700-de25f1191082@fivetechno.de>
 <57F63554.1050703@math.uni-bielefeld.de>
 <48b59954-02c6-424f-c485-02edd637ef6d@osg.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from wp126.webpack.hosteurope.de ([80.237.132.133]:41176 "EHLO
        wp126.webpack.hosteurope.de" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1751549AbcJFN7z (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 6 Oct 2016 09:59:55 -0400
In-Reply-To: <48b59954-02c6-424f-c485-02edd637ef6d@osg.samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Javier Martinez Canillas <javier@osg.samsung.com>, Tobias Jakobi <tjakobi@math.uni-bielefeld.de>, linux-samsung-soc@vger.kernel.org, stephen.boyd@linaro.org, krzk@kernel.org
Cc: ldewangan@nvidia.com

Hi Javier,

Am 06.10.2016 um 15:44 schrieb Javier Martinez Canillas:
> Hello,
> 
> On 10/06/2016 08:28 AM, Tobias Jakobi wrote:
>> Hello,
>>
>> I quickly went over the commit, and I don't see the 'num_clks' fields
>> being initialized anywhere. So that's probably the reason why it's
>> always zero and the check in of_clk_max77686_get() fails.
>>
> 
> Tobias is correct, that's the issue. I wonder why it worked for me when
> I tested the patch, probably because the bootloader enables the clocks
> so I didn't see the difference...
> 
> Anyways, following is a patch [0] as suggested by Tobias. I don't have
> access to my platform now to test but if it fixes the issue I can post
> it as a proper patch.

Thanks, this fixes the issue on Odroid U3.

Tested-by: Markus Reichl <m.reichl@fivetechno.de>

> 
> [0]:
>>From 93402366eb4b2e39f2885cb11066d90b70f0c1b8 Mon Sep 17 00:00:00 2001
> From: Javier Martinez Canillas <javier@osg.samsung.com>
> Date: Thu, 6 Oct 2016 10:20:02 -0300
> Subject: [RFT PATCH] clk: max77686: fix number of clocks setup for clk_hw
>  based registration
> 
> The commit 9b4cac33adc7 ("clk: max77686: Migrate to clk_hw based OF and
> registration APIs") converted the driver to use the new provider API to
> register clocks using clk_hw.
> 
> But unfortunately, in the conversion it missed to set the num_clks value
> which lead to the following error when trying to register a clk provider:
> 
> [    1.963782] of_clk_max77686_get: invalid index 0
> [    1.967460] ERROR: could not get clock /rtc@10070000:rtc_src(1)
> [    1.973638] s3c-rtc 10070000.rtc: failed to find rtc source clock
> 
> Fix it by correctly set the max77686_clk_driver_data .num_clks member.
> 
> Fixes: 9b4cac33adc7 ("clk: max77686: Migrate to clk_hw based OF and registration APIs")
> Reported-by: Markus Reichl <m.reichl@fivetechno.de>
> Suggested-by: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
> Signed-off-by: Javier Martinez Canillas <javier@osg.samsung.com>
> ---
>  drivers/clk/clk-max77686.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/clk/clk-max77686.c b/drivers/clk/clk-max77686.c
> index b637f5979023..eb953d3b0b69 100644
> --- a/drivers/clk/clk-max77686.c
> +++ b/drivers/clk/clk-max77686.c
> @@ -216,6 +216,7 @@ static int max77686_clk_probe(struct platform_device *pdev)
>  		return -EINVAL;
>  	}
>  
> +	drv_data->num_clks = num_clks;
>  	drv_data->max_clk_data = devm_kcalloc(dev, num_clks,
>  					      sizeof(*drv_data->max_clk_data),
>  					      GFP_KERNEL);
> 


--
Markus Reichl
