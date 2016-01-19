From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH v2 2/3] clk: s2mps11: merge two for loop in one
Date: Wed, 20 Jan 2016 08:38:53 +0900
Message-ID: <569EC90D.9040409@samsung.com>
References: <1453193552-4761-1-git-send-email-andi.shyti@samsung.com>
 <1453193552-4761-3-git-send-email-andi.shyti@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-clk-owner@vger.kernel.org>
In-reply-to: <1453193552-4761-3-git-send-email-andi.shyti@samsung.com>
Sender: linux-clk-owner@vger.kernel.org
To: Andi Shyti <andi.shyti@samsung.com>, linux-samsung-soc@vger.kernel.org
Cc: Sangbeom Kim <sbkim73@samsung.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, Andi Shyti <andi@etezian.org>, Yadwinder Singh Brar <yadi.brar01@gmail.com>
List-Id: linux-samsung-soc@vger.kernel.org

On 19.01.2016 17:52, Andi Shyti wrote:
> the driver already loops once, there is no reason to loop again

/s/the/The/

> for a different purpose. Merge the second loop into the first.
> 
> Signed-off-by: Andi Shyti <andi.shyti@samsung.com>
> ---
>  drivers/clk/clk-s2mps11.c | 6 ------
>  1 file changed, 6 deletions(-)
> 
> diff --git a/drivers/clk/clk-s2mps11.c b/drivers/clk/clk-s2mps11.c
> index 22d4df2..cae92fc 100644
> --- a/drivers/clk/clk-s2mps11.c
> +++ b/drivers/clk/clk-s2mps11.c
> @@ -202,12 +202,6 @@ static int s2mps11_clk_probe(struct platform_device *pdev)
>  			ret = -ENOMEM;
>  			goto err_reg;
>  		}
> -	}
> -
> -	for (i = 0; i < S2MPS11_CLKS_NUM; i++) {
> -		/* Skip clocks not present on S2MPS14 */
> -		if (i == S2MPS11_CLK_CP && hwid == S2MPS14X)

You changed this line in patch 1/3 - meaningless. This is a indication
that this patch should go before 1st.

BR,
Krzysztof

> -			continue;
>  		clk_table[i] = s2mps11_clks[i].clk;
>  	}
>  
> 

