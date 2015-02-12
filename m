From: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Subject: Re: [PATCH 2/2] clk: composite: Set clk_core to composite rate and
 mux components
Date: Thu, 12 Feb 2015 14:27:25 +0100
Message-ID: <54DCAA3D.6040805@collabora.co.uk>
References: <1423649612-31746-1-git-send-email-javier.martinez@collabora.co.uk> <1423649612-31746-3-git-send-email-javier.martinez@collabora.co.uk> <20150211185025.GC11190@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from bhuna.collabora.co.uk ([93.93.135.160]:48731 "EHLO
	bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755736AbbBLN1b (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 12 Feb 2015 08:27:31 -0500
In-Reply-To: <20150211185025.GC11190@codeaurora.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: Mike Turquette <mturquette@linaro.org>, Tomeu Vizoso <tomeu.vizoso@collabora.com>, Emilio L??pez <emilio@elopez.com.ar>, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org

Hello Stephen,

On 02/11/2015 07:50 PM, Stephen Boyd wrote:
>> ---
> 
> Thanks for the patch.
>

Thanks a lot for your feedback.
 
>> 
>> Hello,
>> 
>> I set the rate and mux components' .core in clk_composite_determine_rate()
>> because that is the least intrusive change and where the .clk field is set
>> too but I wonder if there is a reason to change the state of those clocks
>> in that function (which shouldn't have this side effect afaict) instead of
>> doing it in clk_register_composite().
> 
> The reason we have to do it in the ops instead of during the
> registration phase is because some of these ops are called inside
> the clk_register() function.
> 

Got it.

>> 
>>  drivers/clk/clk-composite.c | 2 ++
>>  1 file changed, 2 insertions(+)
>> 
>> diff --git a/drivers/clk/clk-composite.c b/drivers/clk/clk-composite.c
>> index dee81b83c4b3..2a53b9580ff7 100644
>> --- a/drivers/clk/clk-composite.c
>> +++ b/drivers/clk/clk-composite.c
>> @@ -75,6 +75,7 @@ static long clk_composite_determine_rate(struct clk_hw *hw, unsigned long rate,
>>  
>>  	if (rate_hw && rate_ops && rate_ops->determine_rate) {
>>  		rate_hw->clk = hw->clk;
>> +		rate_hw->core = hw->core;
>>  		return rate_ops->determine_rate(rate_hw, rate, min_rate,
>>  						max_rate,
>>  						best_parent_rate,
>> @@ -121,6 +122,7 @@ static long clk_composite_determine_rate(struct clk_hw *hw, unsigned long rate,
>>  		return best_rate;
>>  	} else if (mux_hw && mux_ops && mux_ops->determine_rate) {
>>  		mux_hw->clk = hw->clk;
>> +		mux_hw->core = hw->core;
>>  		return mux_ops->determine_rate(mux_hw, rate, min_rate,
>>  					       max_rate, best_parent_rate,
>>  					       best_parent_p);
> 
> We need to assign the core pointer wherever we assign the clk
> pointer. That seems to be quite a few more places than two.
> 

Yes, I found more places in other drivers so I wrote a small coccinelle
script to replace those using a semantic patch. Also I created a inline
function to wrap the assignments since we will have to change it again
once the clk_core is dropped.

Best regards,
Javier
