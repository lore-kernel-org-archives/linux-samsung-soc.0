From: Pankaj Dubey <pankaj.dubey@samsung.com>
Subject: Re: [PATCH] clk: samsung: fixed compiler warning
 [-Wpointer-to-int-cast]
Date: Mon, 17 Mar 2014 10:22:41 +0900
Message-ID: <53264E61.2010502@samsung.com>
References: <1393382561-5388-1-git-send-email-pankaj.dubey@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:47941 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755812AbaCQBFx (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 16 Mar 2014 21:05:53 -0400
In-reply-to: <1393382561-5388-1-git-send-email-pankaj.dubey@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Pankaj Dubey <pankaj.dubey@samsung.com>
Cc: t.figa@samsung.com, mturquette@linaro.org, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org

On 02/26/2014 11:42 AM, Pankaj Dubey wrote:
> When compiled using ARM64 cross compiler, gcc complains as
>
> drivers/clk/samsung/clk.c:293:18:
> warning: cast from pointer to integer of different size
> [-Wpointer-to-int-cast]
>
> Signed-off-by: Pankaj Dubey <pankaj.dubey@samsung.com>
> ---
>   drivers/clk/samsung/clk.c |    2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/clk/samsung/clk.c b/drivers/clk/samsung/clk.c
> index 91bec3e..59142ba 100644
> --- a/drivers/clk/samsung/clk.c
> +++ b/drivers/clk/samsung/clk.c
> @@ -278,7 +278,7 @@ void __init samsung_clk_of_register_fixed_ext(
>   	for_each_matching_node_and_match(np, clk_matches, &match) {
>   		if (of_property_read_u32(np, "clock-frequency", &freq))
>   			continue;
> -		fixed_rate_clk[(u32)match->data].fixed_rate = freq;
> +		fixed_rate_clk[(unsigned long)match->data].fixed_rate = freq;
>   	}
>   	samsung_clk_register_fixed_rate(fixed_rate_clk, nr_fixed_rate_clk);
>   }

Gentle Ping.

-- 
Best Regards,
Pankaj Dubey
