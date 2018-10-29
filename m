From: Chanwoo Choi <cw00.choi@samsung.com>
Subject: Re: [PATCH 6/8] clk: s2mps11: constify clk_ops structure
Date: Mon, 29 Oct 2018 09:43:22 +0900
Message-ID: <5BD657AA.1080108@samsung.com>
References: <1540619262-22681-1-git-send-email-Julia.Lawall@lip6.fr>
        <CGME20181027062328epcas3p1aed374207b7d5da30147ceea33585b67@epcas3p1.samsung.com>
        <1540619262-22681-7-git-send-email-Julia.Lawall@lip6.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <1540619262-22681-7-git-send-email-Julia.Lawall@lip6.fr>
Sender: linux-kernel-owner@vger.kernel.org
To: Julia Lawall <Julia.Lawall@lip6.fr>, Sangbeom Kim <sbkim73@samsung.com>
Cc: kernel-janitors@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

On 2018년 10월 27일 14:47, Julia Lawall wrote:
> The clk_ops structure is only stored in the ops fields of
> clk_init_data structures.  This field is const, so the clk_ops
> structure can be const as well.
> 
> Identified and transformed using Coccinelle.
> 
> Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>
> 
> ---
>  drivers/clk/clk-s2mps11.c |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/clk-s2mps11.c b/drivers/clk/clk-s2mps11.c
> index 5b419b82f7ca..2ce370c804aa 100644
> --- a/drivers/clk/clk-s2mps11.c
> +++ b/drivers/clk/clk-s2mps11.c
> @@ -71,7 +71,7 @@ static unsigned long s2mps11_clk_recalc_rate(struct clk_hw *hw,
>  	return 32768;
>  }
>  
> -static struct clk_ops s2mps11_clk_ops = {
> +static const struct clk_ops s2mps11_clk_ops = {
>  	.prepare	= s2mps11_clk_prepare,
>  	.unprepare	= s2mps11_clk_unprepare,
>  	.is_prepared	= s2mps11_clk_is_prepared,
> 
> 
> 

Looks good to me.
Reviewed-by: Chanwoo Choi <cw00.choi@samsung.com>

-- 
Best Regards,
Chanwoo Choi
Samsung Electronics
