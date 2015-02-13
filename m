From: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Subject: Re: [PATCH v2 3/3] clk: Replace explicit clk assignment with __clk_hw_set_clk
Date: Fri, 13 Feb 2015 08:23:03 +0100
Message-ID: <54DDA657.7030407@collabora.co.uk>
References: <1423749510-14525-1-git-send-email-javier.martinez@collabora.co.uk> <1423749510-14525-4-git-send-email-javier.martinez@collabora.co.uk> <54DD051D.8020701@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from bhuna.collabora.co.uk ([93.93.135.160]:50973 "EHLO
	bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751625AbbBMHXJ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 13 Feb 2015 02:23:09 -0500
In-Reply-To: <54DD051D.8020701@codeaurora.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Stephen Boyd <sboyd@codeaurora.org>, Mike Turquette <mturquette@linaro.org>
Cc: Tomeu Vizoso <tomeu.vizoso@collabora.com>, =?windows-1252?Q?Emilio_?= =?windows-1252?Q?L=F3pez?= <emilio@elopez.com.ar>, Peter De Schrijver <pdeschrijver@nvidia.com>, Robert Jarzmik <robert.jarzmik@free.fr>, Giuseppe Cavallaro <peppe.cavallaro@st.com>, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org

Hello Stephen,

On 02/12/2015 08:55 PM, Stephen Boyd wrote:
> On 02/12/15 05:58, Javier Martinez Canillas wrote:
>>
>> The changes were made using the following cocinelle semantic patch:
>>
>> @i@
>> @@
>>
>> @depends on i@
>> identifier dst;
>> @@
>>
>> - dst->clk = hw->clk;
>> + __clk_hw_set_clk(dst, hw);
>>
>> @depends on i@
>> identifier dst;
>> @@
>>
>> - dst->hw.clk = hw->clk;
>> + __clk_hw_set_clk(&dst->hw, hw);
>>
>> Fixes: 035a61c314eb3 ("clk: Make clk API return per-user struct clk instances")
>> Signed-off-by: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
> 
> Reviewed-by: Stephen Boyd <sboyd@codeaurora.org>
> 

Thanks a lot for your review.

> Did you run this on all files that include clk-provider.h? I hope there
> aren't similar situations in arch/arm/ for example.
> 

Yes, I did run spatch against all the files that include clk-provider.h
but only were matches in the drivers/clk files changed by $subject.

Best regards,
Javier
