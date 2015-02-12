From: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Subject: Re: [PATCH 1/2] clk: Don't dereference parent clock if is NULL
Date: Thu, 12 Feb 2015 14:35:55 +0100
Message-ID: <54DCAC3B.8080309@collabora.co.uk>
References: <1423649612-31746-1-git-send-email-javier.martinez@collabora.co.uk> <1423649612-31746-2-git-send-email-javier.martinez@collabora.co.uk> <20150211185435.GD11190@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from bhuna.collabora.co.uk ([93.93.135.160]:48758 "EHLO
	bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755182AbbBLNgC (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 12 Feb 2015 08:36:02 -0500
In-Reply-To: <20150211185435.GD11190@codeaurora.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: Mike Turquette <mturquette@linaro.org>, Tomeu Vizoso <tomeu.vizoso@collabora.com>, Emilio L??pez <emilio@elopez.com.ar>, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org

Hello Stephen,

Thanks a lot for your feedback.

On 02/11/2015 07:54 PM, Stephen Boyd wrote:
> On 02/11, Javier Martinez Canillas wrote:
>> --- a/drivers/clk/clk.c
>> +++ b/drivers/clk/clk.c
>> @@ -799,7 +799,7 @@ clk_mux_determine_rate_flags(struct clk_hw *hw, unsigned long rate,
>>  	/* if NO_REPARENT flag set, pass through to current parent */
>>  	if (core->flags & CLK_SET_RATE_NO_REPARENT) {
>>  		parent = core->parent;
>> -		if (core->flags & CLK_SET_RATE_PARENT)
>> +		if (core->flags & CLK_SET_RATE_PARENT && parent)
>>  			best = __clk_determine_rate(parent->hw, rate,
>>  						    min_rate, max_rate);
>>  		else if (parent)
> 
> Sorry this doesn't look right. Before all the recent changes to
> this file we would call __clk_round_rate() which would return 0
> if the first argument was NULL. Now we're going to take the else
> if path and do something different. So we need a parent ?
> parent->hw : NULL here.
>

Right, I'm not that familiar with the common clock framework so I
didn't realize I was changing the behavior, sorry about that...
 
> Of course, I wonder why a clock has the CLK_SET_RATE_PARENT flag
> set if it doesn't actually have a parent. That also seems wrong.
>

Yes, I did not face this issue and only patch #2 was enough to
fix my problem but the theoretical NULL pointer dereference
was found when reading the code.

I agree that a clock with that flag set should have at least one
parent but afaict there is no sanity check on clock registration.

And even if that was the case, I believe that the core should be
robust enough to check for NULL before trying to dereference it.

I'll post a v2 passing NULL as an argument and parent->hw if
parent is not NULL as you suggested.

Best regards,
Javier
