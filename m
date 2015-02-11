From: Stephen Boyd <sboyd@codeaurora.org>
Subject: Re: [PATCH 1/2] clk: Don't dereference parent clock if is NULL
Date: Wed, 11 Feb 2015 10:54:35 -0800
Message-ID: <20150211185435.GD11190@codeaurora.org>
References: <1423649612-31746-1-git-send-email-javier.martinez@collabora.co.uk>
 <1423649612-31746-2-git-send-email-javier.martinez@collabora.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1423649612-31746-2-git-send-email-javier.martinez@collabora.co.uk>
Sender: linux-kernel-owner@vger.kernel.org
To: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Cc: Mike Turquette <mturquette@linaro.org>, Tomeu Vizoso <tomeu.vizoso@collabora.com>, Emilio L??pez <emilio@elopez.com.ar>, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

On 02/11, Javier Martinez Canillas wrote:
> The clock passed as an argument to clk_mux_determine_rate_flags() can
> not have a parent clock if is either a root clock or an orphan.
> 
> In those cases parent is NULL so parent->hw shouldn't be dereferenced.
> 
> Fixes: 035a61c314eb3 ("clk: Make clk API return per-user struct clk instances")
> Signed-off-by: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
> ---
>  drivers/clk/clk.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
> index 7f53166af5e6..7bd8893c94d6 100644
> --- a/drivers/clk/clk.c
> +++ b/drivers/clk/clk.c
> @@ -799,7 +799,7 @@ clk_mux_determine_rate_flags(struct clk_hw *hw, unsigned long rate,
>  	/* if NO_REPARENT flag set, pass through to current parent */
>  	if (core->flags & CLK_SET_RATE_NO_REPARENT) {
>  		parent = core->parent;
> -		if (core->flags & CLK_SET_RATE_PARENT)
> +		if (core->flags & CLK_SET_RATE_PARENT && parent)
>  			best = __clk_determine_rate(parent->hw, rate,
>  						    min_rate, max_rate);
>  		else if (parent)

Sorry this doesn't look right. Before all the recent changes to
this file we would call __clk_round_rate() which would return 0
if the first argument was NULL. Now we're going to take the else
if path and do something different. So we need a parent ?
parent->hw : NULL here.

Of course, I wonder why a clock has the CLK_SET_RATE_PARENT flag
set if it doesn't actually have a parent. That also seems wrong.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
