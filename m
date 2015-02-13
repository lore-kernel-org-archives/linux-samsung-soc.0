From: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Subject: Re: [PATCH v2 2/3] clk: Add __clk_hw_set_clk helper function
Date: Fri, 13 Feb 2015 08:28:19 +0100
Message-ID: <54DDA793.9080909@collabora.co.uk>
References: <1423749510-14525-1-git-send-email-javier.martinez@collabora.co.uk> <1423749510-14525-3-git-send-email-javier.martinez@collabora.co.uk> <54DD0524.4060503@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from bhuna.collabora.co.uk ([93.93.135.160]:50989 "EHLO
	bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751679AbbBMH2Y (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 13 Feb 2015 02:28:24 -0500
In-Reply-To: <54DD0524.4060503@codeaurora.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Stephen Boyd <sboyd@codeaurora.org>, Mike Turquette <mturquette@linaro.org>
Cc: Tomeu Vizoso <tomeu.vizoso@collabora.com>, =?windows-1252?Q?Emilio_?= =?windows-1252?Q?L=F3pez?= <emilio@elopez.com.ar>, Peter De Schrijver <pdeschrijver@nvidia.com>, Robert Jarzmik <robert.jarzmik@free.fr>, Giuseppe Cavallaro <peppe.cavallaro@st.com>, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org

Hello Stephen,

On 02/12/2015 08:55 PM, Stephen Boyd wrote:
> On 02/12/15 05:58, Javier Martinez Canillas wrote:
>> After the clk API change to return a per-user clock instance, both the
>> struct clk_core and struct clk pointers from the hw clock needs to be
>> assigned to clock that share the same state.
>>
>> In the future the struct clk_core will be removed and this is going to
> 
> s/clk_core/clk/?
>

hrmm, I thought that the plan was to eventually merge clk_core into clk_hw.

In any case, if I got it backwards then I guess that the commit message
could be fixed up by Mike when the patches are applied?

>> change again so to avoid having to change the assignments twice in all
>> the drivers, add a helper function to have an indirection level.
>>
>> Signed-off-by: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
>> ---
> 
> Reviewed-by: Stephen Boyd <sboyd@codeaurora.org>
> 

Thanks a lot for your review.

Best regards,
Javier
